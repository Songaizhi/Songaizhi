using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ZDSoft.TES.Web.Apps;

namespace ZDSoft.TES.Web.Controllers
{
    public class UcController : Controller
    {
        //重写OnActionExecuting方法，这个方法在Action执行时执行
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            SetPrivilege();//设置动态属性，用于在母版页上显示菜单
            base.OnActionExecuting(filterContext);
            return;
          
            string controllerName = filterContext.Controller.ToString();//获取控制器名称
            string actionName = filterContext.ActionDescriptor.ActionName;//获取Action的名称
            //如果是用户请求登录页面则不验证权限
            if (controllerName.Equals("ZDSoft.TES.Web.Controllers.UsersController") && (actionName == "Login" || actionName == "UnAuthorized"))
            {
                base.OnActionExecuting(filterContext);//执行mvc3.0默认的行为
            }
            else
            {
                if (AppHelper.LoginedUser == null)//如果登录信息丢失
                {
                    Redirect(filterContext);//跳转到登录页面
                    Response.End();//结束响应
                }
                else
                {
                    if (!IsAuthenticated(controllerName, actionName))//判断登录用户是否有权限访问当前页面，如果没有访问权限
                    {
                        //强行跳转到“未授权页面”
                        filterContext.HttpContext.Response.Redirect("~/Users/UnAuthorized?ReturnUrl=" + Server.UrlEncode(Request.Url.OriginalString), false);
                    }
                    else
                    {
                        SetPrivilege();//设置动态属性，用于在母版页上显示菜单
                        base.OnActionExecuting(filterContext);
                    }
                }
            }
             
        }

        /// <summary>
        /// 设置动态属性，将登录用户的权限数据传递到母模板上
        /// </summary>
        private void SetPrivilege()
        {
            ViewBag.PrivilegeList = AppHelper.Privileges;//设置一个动态属性
        }

        /// <summary>
        /// 根据转入的控制器名称和Action名称判断当前登录用户是否有访问权限
        /// </summary>
        /// <param name="controllerClassName">控制器名称</param>
        /// <param name="actionName">Action名</param>
        /// <returns>true:有访问权限，false:没有访问权限</returns>
        private bool IsAuthenticated(string controllerClassName, string actionName)
        {
            if (AppHelper.Privileges == null)//如果登录用户的权限列表为空则没有访问权限
            {
                return false;
            }
            if (AppHelper.Privileges.Where(o => o.ClassName == controllerClassName).Count() > 0)
            {
                return true;
            }
            return false;
        }

        //页面跳转
        private void Redirect(ActionExecutingContext filterContext)
        {
            filterContext.HttpContext.Response.Redirect("~/Users/Login?ReturnUrl=" + Server.UrlEncode(Request.Url.OriginalString), true);
        }
    }
}