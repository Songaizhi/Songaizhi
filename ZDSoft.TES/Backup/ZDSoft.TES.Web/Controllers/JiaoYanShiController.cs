﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ZDSoft.TES.Domain;
using ZDSoft.TES.Service;
using ZDSoft.TES.Core;
using ZDSoft.TES.Web.Apps;

namespace ZDSoft.TES.Web.Controllers
{
    /// <summary>
    /// 教研室
    /// </summary>
    public class JiaoYanShiController : UcController
    {
        public ActionResult Fun()
        {
            return View();
        }

        #region 查找所有的老师
        /// <summary>
        /// 查找所有的老师
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            IList<Teacher> tea = Container.Instance.Resolve<ITeacherService>().GetAll();
            return View(tea);


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
            TempPaperType ty = Container.Instance.Resolve<ITempPaperTypeService>().Get(8);
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

    }
}
