using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ZDSoft.TES.Domain;
using ZDSoft.TES.Core;
using ZDSoft.TES.Web.Apps;
using ZDSoft.TES.Service;
using NHibernate.Criterion;

namespace ZDSoft.TES.Web.Controllers
{
    public class TeacherController : UcController
    {
        //
        // GET: /Teacher/
        public ActionResult Fun() 
        {
            return View();
        }

        #region 查找老师所对应的班级的老师
        /// <summary>
        /// 查找老师所对应的班级的老师
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            Users login = AppHelper.LoginedUser;
            Teacher teacher = Container.Instance.Resolve<ITeacherService>().teacher(login.Identifier);
            IList<Teacher> tea = Container.Instance.Resolve<ITeacherService>().GetAll();
            IList<UserClass> c = Container.Instance.Resolve<IUserClassService>().GetAll();
            IList<Teacher> myTeacher = new List<Teacher>();
            foreach (Teacher teas in tea)
            {
                foreach (UserClass uc in teas.UserClasses)
                {
                    if (uc.Name == teacher.UserClasses[0].Name)
                    {
                        myTeacher.Add(teas);
                        break;
                    }
                }
            }
            return View(myTeacher);

        } 
        #endregion

        #region 对应的卷子
        /// <summary>
        /// 对应的卷子
        /// </summary>
        /// <returns></returns>
        public ActionResult TempPaper(int id)
        {
            Teachers(id);
            TempPaperType ty = Container.Instance.Resolve<ITempPaperTypeService>().Get(6);
            return View(ty);
        }
        #endregion

        #region 扩展方法
        /// <summary>
        /// 扩展方法
        /// </summary>
        public void Teachers(int id)
        {
            ViewBag.ProvinceList = Container.Instance.Resolve<ITeacherService>().Get(id);
        }
        #endregion

        #region 教师管理
        /// <summary>
        /// 教师管理
        /// </summary>
        /// <returns></returns>
        public ActionResult Management(int pageIndex = 1, string name = "")
        {
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
            IList<Teacher> list = Container.Instance.Resolve<ITeacherService>().GetPaged(listConditions, listOrder, pageIndex, PagerHelper.PageSize, out count);
            //转换为pageList集合，用于分页控件显示不同的页码
            PageList<Teacher> pageList = list.ToPageList<Teacher>(pageIndex, PagerHelper.PageSize, count);
            //用pageList集合填充页面
            return View(pageList);
        }
        #endregion

        #region 展示详细教师信息
        /// <summary>
        /// 展示详细教师信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        public ViewResult Details(int id)
        {
            Domain.Teacher tea = Container.Instance.Resolve<ITeacherService>().Get(id);
            return View(tea);

        }

        #endregion

        #region 实现修改教师功能
        /// <summary>
        /// 实现修改教师功能
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Edit(int id)
        {
            Teacher tea = Container.Instance.Resolve<ITeacherService>().Get(id);
            return View(tea);
        }

        [HttpPost]
        public ActionResult Edit(Teacher tea)
        {
            //从数据库通过ID获取完整的用户信息
            Teacher newTeacher = Container.Instance.Resolve<ITeacherService>().Get(tea.ID);
            newTeacher.Name = tea.Name;
            Container.Instance.Resolve<ITeacherService>().Update(newTeacher);
            return RedirectToAction("Index", "Home");
        }
        #endregion

    }
}
