using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ZDSoft.TES.Domain;
using ZDSoft.TES.Core;
using ZDSoft.TES.Service;
using ZDSoft.TES.Web.Apps;
using NHibernate.Criterion;

namespace ZDSoft.TES.Web.Controllers
{
    public class UsersController :UcController
    {
        #region 登陆
        /// <summary>
        /// 登陆
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(string account, string password)
        {
            //访问数据库，根据用户名和密码获取用户信息
            Users loginUser = Container.Instance.Resolve<IUsersService>().Login(account, password);
            if (loginUser != null)
            {
                //保存用户登录信息
                AppHelper.LoginedUser = loginUser;
                IList<Role> role = loginUser.Roles;
                //跳转到主页面
                if (AppHelper.LoginedUser.Account == "admin")
                {
                    return RedirectToAction("Index", "Admin");
                }
                else if (AppHelper.LoginedUser.Roles[0].Name == "教师") 
                {
                    return RedirectToAction("Fun", "Teacher");
                }
                else if (AppHelper.LoginedUser.Roles[0].Name == "教研室主任")
                {
                    return RedirectToAction("Fun", "JiaoYanShi");
                }
                else if (AppHelper.LoginedUser.Roles[0].Name == "系主任/领导")
                {
                    return RedirectToAction("Fun", "Headdepartment");
                }
                else
                {
                    return RedirectToAction("Index", "Users");
                }
            }
            else 
            {
                ViewBag.ErrorMsg = "用户名与密码错误"; 
                return View();
            }

        }
        #endregion

        #region 主界面
        /// <summary>
        /// 主界面
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            return View();
        } 
        #endregion

        #region 分页展示user信息，默认为第一页
        /// <summary>
        /// 分页展示user信息，默认为第一页
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <returns></returns>
        public ActionResult Yonghu(int pageIndex = 1, string userName="")
        {
            IList<Student> stu = Container.Instance.Resolve<IStudentService>().GetAll();
            ViewBag.student = stu.Count;
            IList<Teacher> tea = Container.Instance.Resolve<ITeacherService>().GetAll();
            ViewBag.teacher = tea.Count;
            IList<Users> userlist = Container.Instance.Resolve<IUsersService>().GetAll();
            IList<Users> xzrlist = new List<Users>();
            IList<Users> jyszrlist = new List<Users>();
            foreach (Users user in userlist)
            {
                foreach (Role role in user.Roles)
                {
                    if (role.Name == "系主任/领导")
                    {
                        xzrlist.Add(user);
                        break;
                    }
                    if (role.Name == "教研室主任")
                    {
                        jyszrlist.Add(user);
                        break;
                    }
                }
            }
            ViewBag.xzr = xzrlist.Count;
            ViewBag.jyszr = jyszrlist.Count;
            //1组织查询条件
            List<ICriterion> listConditions = new List<ICriterion>();//实例化一个查询条件集合
            //2执行查询操作
            if (!string.IsNullOrEmpty(userName))
            {
                listConditions.Add(new LikeExpression("Name", userName));
            }
            int count = 0;
            //设置一个排序集合，根据ID进行排序，true（升序），false（将序）
            IList<Order> listOrder = new List<Order>() { new Order("ID", true) };

            //3通过容器调用分页方法
            IList<Users> list = Container.Instance.Resolve<IUsersService>().GetPaged(listConditions, listOrder, pageIndex, PagerHelper.PageSize, out count);
            //转换为pageList集合，用于分页控件显示不同的页码
            PageList<Users> pageList = list.ToPageList<Users>(pageIndex, PagerHelper.PageSize, count);
            //用pageList集合填充页面
            return View(pageList);
        }
        #endregion

        #region 实现修改用户功能
        /// <summary>
        /// 实现修改用户功能
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Edit(int id)
        {
            Users user = Container.Instance.Resolve<IUsersService>().Get(id);
            return View(user);
        }

        [HttpPost]
        public ActionResult Edit(Users user)
        {
            //从数据库通过ID获取完整的用户信息
            Users newUser = Container.Instance.Resolve<IUsersService>().Get(user.ID);
            newUser.Name = user.Name;
            newUser.Account = user.Account;
            newUser.PassWord = user.PassWord;
            Container.Instance.Resolve<IUsersService>().Update(newUser);
            return RedirectToAction("Yonghu","Users");
        }
        #endregion

        #region 展示详细用户信息
        /// <summary>
        /// 展示详细用户信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        public ViewResult Details(int id)
        {
            Domain.Users user = Container.Instance.Resolve<IUsersService>().Get(id);
            return View(user);
        }
        #endregion

        #region 配置角色
        /// <summary>
        /// 配置角色
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult AssignRole(int id)
        {
            Users user = Container.Instance.Resolve<IUsersService>().Get(id);
            IList<Role> rolelist = Container.Instance.Resolve<IRoleService>().GetAll().ToList();
            ViewBag.RoleList = rolelist;
            return View(user);
        }
        [HttpPost]
        public ActionResult AssignRole(int userId, string hdSelectedIds)
        {
            Container.Instance.Resolve<IUsersService>().AssignRole(userId, hdSelectedIds.Replace(",,", ","));
            return RedirectToAction("Yonghu","Users");
        }
        #endregion

        #region 修改密码
        /// <summary>
        /// 修改密码
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult ChangePassword()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ChangePassword(string oldPassword, string newPassword, string queryPassword)
        {
            if (AppHelper.LoginedUser.PassWord == oldPassword)
            {
                if (newPassword == queryPassword)
                {
                    Users suser = Container.Instance.Resolve<IUsersService>().Get(AppHelper.LoginedUser.ID);
                    suser.PassWord = newPassword;
                    Container.Instance.Resolve<IUsersService>().Update(suser);
                    return RedirectToAction("Login","Users");
                }
                else
                {
                    return RedirectToAction("ChangePassword","Users");
                }
            }
            else
            {
                return RedirectToAction("ChangePassword","Users");
            }
        }
        #endregion

    }
}
