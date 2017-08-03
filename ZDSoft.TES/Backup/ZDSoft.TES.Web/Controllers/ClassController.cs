using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using NHibernate.Criterion;
using ZDSoft.TES.Core;
using ZDSoft.TES.Domain;
using ZDSoft.TES.Service;
using ZDSoft.TES.Web.Apps;

namespace ZDSoft.TES.Web.Controllers
{
    public class ClassController : UcController
    {
        #region 班级管理
        /// <summary>
        /// 班级管理
        /// </summary>
        /// <returns></returns>
        public ActionResult Management(int pageIndex = 1, string name = "")
        {
            IList<UserClass> c = Container.Instance.Resolve<IUserClassService>().GetAll();
            IList<UserClass> xzrlist = new List<UserClass>();
            IList<UserClass> jyszrlist = new List<UserClass>();
            foreach (UserClass uc in c)
            {
                    if (uc.BeLongCollege.Name == "软件学院")
                    {
                        xzrlist.Add(uc);
                    }
                    if (uc.BeLongCollege.Name == "管理学院")
                    {
                        jyszrlist.Add(uc);
                    }
            }
            ViewBag.xzr = xzrlist.Count;
            ViewBag.jyszr = jyszrlist.Count;
            //1组织查询条件
            List<ICriterion> listConditions = new List<ICriterion>();//实例化一个查询条件集合
            //2执行查询操作
            if (!string.IsNullOrEmpty(name))
            {
                listConditions.Add(new LikeExpression("Name", name));
            }
            int count = 0;
            //设置一个排序集合，根据ID进行排序，true（升序），false（将序）
            IList<Order> listOrder = new List<Order>() { new Order("ID", true) };

            //3通过容器调用分页方法
            IList<UserClass> list = Container.Instance.Resolve<IUserClassService>().GetPaged(listConditions, listOrder, pageIndex, PagerHelper.PageSize, out count);
            //转换为pageList集合，用于分页控件显示不同的页码
            PageList<UserClass> pageList = list.ToPageList<UserClass>(pageIndex, PagerHelper.PageSize, count);
            //用pageList集合填充页面
            return View(pageList);
        }
        #endregion

        #region 展示详细班级信息
        /// <summary>
        /// 展示详细班级信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        public ViewResult Details(int id)
        {
            Domain.UserClass uc = Container.Instance.Resolve<IUserClassService>().Get(id);
            return View(uc);
        }
        #endregion

        #region 实现修改班级功能
        /// <summary>
        /// 实现修改班级功能
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Edit(int id)
        {
            UserClass uc = Container.Instance.Resolve<IUserClassService>().Get(id);
            return View(uc);
        }

        [HttpPost]
        public ActionResult Edit(UserClass uc)
        {
            //从数据库通过ID获取完整的用户信息
            UserClass newUserClass = Container.Instance.Resolve<IUserClassService>().Get(uc.ID);
            newUserClass.Name = uc.Name;
            Container.Instance.Resolve<IUserClassService>().Update(newUserClass);
            return RedirectToAction("Index", "Home");
        }
        #endregion

    }
}
