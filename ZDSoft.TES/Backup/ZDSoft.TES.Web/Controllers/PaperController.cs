using System;
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
    public class PaperController : UcController
    {
        #region 教师工作评价指标体系（学生用）
        /// <summary>
        /// 教师工作评价指标体系（学生用）
        /// </summary>
        /// <param name="tid"></param>
        /// <param name="sid"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult StudentPaper(int tid, int sid,int uid)
        {
            TempPaperType tpt = Container.Instance.Resolve<ITempPaperTypeService>().Get(5);
            ViewBag.temppaper = tpt;
            ViewBag.teacher = Container.Instance.Resolve<ITeacherService>().Get(tid);
            ViewBag.user = Container.Instance.Resolve<IUsersService>().Get(uid);
            ViewBag.student = Container.Instance.Resolve<IStudentService>().Get(sid);
            List<ResultSelects> rplist = new List<ResultSelects>();
            foreach (TempTopic tt in tpt.TempPaperTypeList)
            {
                if (tt.TempSelectsList.Count != 0)
                {
                    ResultSelects rs = new ResultSelects();
                    rplist.Add(rs);
                }
            }
            return View(rplist);
        }

        [HttpPost]
        public ActionResult StudentPaper(List<ResultSelects> rslist, decimal fenshu,int uid,int sid)
        {
            foreach (ResultSelects rs in rslist)
            {
                rs.CreateUserID = AppHelper.LoginedUser.ID;
                Container.Instance.Resolve<IResultSelectsService>().Create(rs);
            };

            ResultPapers rp = new ResultPapers()
            {
                CreateUserID = AppHelper.LoginedUser.ID,
                Name = "教师工作评价指标体系（学生用）",
                Proportion = fenshu,
                RoleID =1,
                Semester = "第一学期",
                Time = DateTime.Now,
                UserID = uid
            };
            Container.Instance.Resolve<IResultPapersService>().Create(rp);
            return JavaScript("保存成功");
        } 
        #endregion

        #region 教师工作评价指标体系（教研室主任)
        /// <summary>
        /// 教师工作评价指标体系（教研室主任)
        /// </summary>
        /// <param name="tid"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult JiaoYanShiPaper(int teacher,int userid)
        {
            TempPaperType tpt = Container.Instance.Resolve<ITempPaperTypeService>().Get(8);
            ViewBag.temppaper = tpt;
            ViewBag.teacher = Container.Instance.Resolve<ITeacherService>().Get(teacher);
            ViewBag.user = Container.Instance.Resolve<IUsersService>().Get(userid);
            List<ResultSelects> rplist = new List<ResultSelects>();
            foreach (TempTopic tt in tpt.TempPaperTypeList)
            {
                if (tt.TempSelectsList.Count != 0)
                {
                    ResultSelects rs = new ResultSelects();
                    rplist.Add(rs);
                }
            }
            return View(rplist);
        }

        [HttpPost]
        public ActionResult JiaoYanShiPaper(List<ResultSelects> rslist, int fenshu, int teacher, int userid)
        {
            foreach (ResultSelects rs in rslist)
            {
                rs.CreateUserID = AppHelper.LoginedUser.ID;
                Container.Instance.Resolve<IResultSelectsService>().Create(rs);
            };

            ResultPapers rp = new ResultPapers()
            {
                CreateUserID = AppHelper.LoginedUser.ID,
                Name = "教师工作评价指标体系（教研室主任)",
                Proportion = fenshu,
                RoleID = 4,
                Semester = "第一学期",
                Time = DateTime.Now,
                UserID = userid

            };
            Container.Instance.Resolve<IResultPapersService>().Create(rp);
            return JavaScript("保存成功");
        } 
        #endregion

        #region 教师工作评价指标体系（教师用）
        /// <summary>
        /// 教师工作评价指标体系（教师用）
        /// </summary>
        /// <param name="tid"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult TeacherPaper(int td,int ud)
        {
            TempPaperType tpt = Container.Instance.Resolve<ITempPaperTypeService>().Get(6);
            ViewBag.temppaper = tpt;
            ViewBag.teacher = Container.Instance.Resolve<ITeacherService>().Get(td);
            ViewBag.user = Container.Instance.Resolve<IUsersService>().Get(ud);
            List<ResultSelects> rplist = new List<ResultSelects>();
            foreach (TempTopic tt in tpt.TempPaperTypeList)
            {
                if (tt.TempSelectsList.Count != 0)
                {
                    ResultSelects rs = new ResultSelects();
                    rplist.Add(rs);
                }
            }
            return View(rplist);
        }

        [HttpPost]
        public ActionResult TeacherPaper(List<ResultSelects> rslist, decimal fenshu,int td,int ud)
        {
            foreach (ResultSelects rs in rslist)
            {
                rs.CreateUserID = AppHelper.LoginedUser.ID;
                Container.Instance.Resolve<IResultSelectsService>().Create(rs);
            };

            ResultPapers rp = new ResultPapers()
            {
                CreateUserID = AppHelper.LoginedUser.ID,
                Name = "教师工作评价指标体系（教师用）",
                Proportion = fenshu,
                RoleID =2,
                Semester = "第一学期",
                Time = DateTime.Now,
                UserID = ud

            };
            Container.Instance.Resolve<IResultPapersService>().Create(rp);
            return JavaScript("保存成功");
        }

        #endregion

        #region 教师工作评价指标体系（系主任用）
        /// <summary>
        /// 教师工作评价指标体系（系主任用）
        /// </summary>
        /// <param name="teac"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult HeaddepartmentPaper(int teac)
        {
            TempPaperType tpt = Container.Instance.Resolve<ITempPaperTypeService>().Get(7);
            ViewBag.temppaper = tpt;
            ViewBag.teacher = Container.Instance.Resolve<ITeacherService>().Get(teac);
            List<ResultSelects> rplist = new List<ResultSelects>();
            foreach (TempTopic tt in tpt.TempPaperTypeList)
            {
                if (tt.TempSelectsList.Count != 0)
                {
                    ResultSelects rs = new ResultSelects();
                    rplist.Add(rs);
                }
            }
            return View(rplist);
        }

        [HttpPost]
        public ActionResult HeaddepartmentPaper(List<ResultSelects> rslist, decimal fenshu, int teac)
        {
            foreach (ResultSelects rs in rslist)
            {
                rs.CreateUserID = AppHelper.LoginedUser.ID;
                Container.Instance.Resolve<IResultSelectsService>().Create(rs);
            };

            ResultPapers rp = new ResultPapers()
            {
                CreateUserID = AppHelper.LoginedUser.ID,
                Name = "教师工作评价指标体系（系主任用）",
                Proportion = fenshu,
                RoleID = 3,
                Semester = "第一学期",
                Time = DateTime.Now,
                UserID = teac

            };
            Container.Instance.Resolve<IResultPapersService>().Create(rp);
            return JavaScript("保存成功");
        }

        #endregion

       
    }
}
