using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using NHibernate.Criterion;
using ZDSoft.TES.Domain;
using ZDSoft.TES.Core;
using ZDSoft.TES.Web.Apps;
using ZDSoft.TES.Service;

namespace ZDSoft.TES.Web.Controllers
{
    public class QManagementController : UcController
    {

        #region 问卷管理
        /// <summary>
        /// 问卷管理
        /// </summary>
        /// <returns></returns>
        public ActionResult Index(int pageIndex = 1)
        {
            //1组织查询条件
            List<ICriterion> listConditions = new List<ICriterion>();//实例化一个查询条件集合
            int count = 0;
            //设置一个排序集合，根据ID进行排序，true（升序），false（将序）
            IList<Order> listOrder = new List<Order>() { new Order("ID", true) };

            //3通过容器调用分页方法
            IList<QManagement> list = Container.Instance.Resolve<IQManagementService>().GetPaged(listConditions, listOrder, pageIndex, PagerHelper.PageSize, out count);
            //转换为pageList集合，用于分页控件显示不同的页码
            PageList<QManagement> pageList = list.ToPageList<QManagement>(pageIndex, PagerHelper.PageSize, count);
            //用pageList集合填充页面
            return View(pageList);
        }
        #endregion

        #region 添加
        [HttpGet]
        public ActionResult Create()
        {
            QManagement order = new QManagement();
            return View("Create", order);
        }
        [HttpPost]
        public ActionResult Create(QManagement transportOrder, string DeliveryTypeId)
        {


            transportOrder.Syst = (Sys)int.Parse(DeliveryTypeId);
                Container.Instance.Resolve<IQManagementService>().Create(transportOrder);
                return RedirectToAction("Index");

        }

        #endregion

        #region 编辑
        /// <summary>
        /// 编辑
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ViewResult Edit(int id)
        {
            Domain.QManagement qm = Container.Instance.Resolve<IQManagementService>().Get(id);
            return View("Create", qm);
        }
        [HttpPost]
        public ActionResult Edit(QManagement qm)
        {
            QManagement qms = Container.Instance.Resolve<IQManagementService>().Get(qm.ID);
            qms.Name = qm.Name;
            qms.QSTime = qm.QSTime;
            qms.SDTime = qm.SDTime;
            qms.ISActive = qm.ISActive;
            qms.Tpt.ResultPapers.Name = qm.Tpt.ResultPapers.Name;
            qms.Tpt.Name = qm.Tpt.Name;
            Container.Instance.Resolve<IQManagementService>().Update(qms);
            return RedirectToAction("Index");
        }
        #endregion

        #region 展示详细问卷信息
        /// <summary>
        /// 展示详细问卷信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ViewResult Details(int id)
        {
            Domain.QManagement qm = Container.Instance.Resolve<IQManagementService>().Get(id);
            return View(qm);
        }
        #endregion

        #region 删除问卷
        /// <summary>
        /// 删除问卷
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult Delete(int id)
        {
            Container.Instance.Resolve<IQManagementService>().Get(id);
            return RedirectToAction("Index");
        }
        #endregion

        #region 注销/激活
        /// <summary>
        /// 注销/激活
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult SwitchStatus(int id)
        {
            Container.Instance.Resolve<IQManagementService>().SwitchStatus(id);
            return RedirectToAction("Index");
        }
        #endregion
    }
}
