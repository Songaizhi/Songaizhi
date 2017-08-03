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
using Microsoft.Win32;
using System.IO;
using System.Data.OleDb;
using System.Data;
using System.ComponentModel;

namespace ZDSoft.TES.Web.Controllers
{
    public class StudentController : UcController
    {
        #region 查找学生所对应的老师
        /// <summary>
        /// 查找学生所对应的老师
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            Users login = AppHelper.LoginedUser;
            Student stu = ZDSoft.TES.Core.Container.Instance.Resolve<IStudentService>().Stu(login.Identifier);
            ViewBag.student = stu;
            IList<Teacher> teacher = ZDSoft.TES.Core.Container.Instance.Resolve<ITeacherService>().GetAll();
            IList<Teacher> myClass = new List<Teacher>();
            foreach (Teacher tea in teacher)
            {
                foreach (UserClass uc in tea.UserClasses)
                {
                    if (uc.Name == stu.Classes.Name)
                    {
                        myClass.Add(tea);
                        break;
                    }
                }
            }
            return View(myClass);
        }
        #endregion

        #region 对应的卷子
        /// <summary>
        /// 对应的卷子
        /// </summary>
        /// <returns></returns>
        public ActionResult TempPaper()
        {
            ViewBag.list = ZDSoft.TES.Core.Container.Instance.Resolve<ITempPaperTypeService>().GetAll();
            return View();
        }
        #endregion

        #region 扩展方法
        /// <summary>
        /// 扩展方法
        /// </summary>
        public void Teachers(int id)
        {
            ViewBag.ProvinceList =ZDSoft.TES.Core.Container.Instance.Resolve<ITeacherService>().Get(id);
        }
        #endregion

        #region 学生管理
        /// <summary>
        /// 学生管理
        /// </summary>
        /// <returns></returns>
        public ActionResult Management(int pageIndex=1,string name="")
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
            IList<Student> list = ZDSoft.TES.Core.Container.Instance.Resolve<IStudentService>().GetPaged(listConditions, listOrder, pageIndex, PagerHelper.PageSize, out count);
            //转换为pageList集合，用于分页控件显示不同的页码
            PageList<Student> pageList = list.ToPageList<Student>(pageIndex, PagerHelper.PageSize, count);
            //用pageList集合填充页面
            return View(pageList);
        } 
        #endregion

        #region 展示详细学生信息
        /// <summary>
        /// 展示详细学生信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        public ViewResult Details(int id)
        {
            Domain.Student stu = ZDSoft.TES.Core.Container.Instance.Resolve<IStudentService>().Get(id);
            return View(stu);
        }
        #endregion

        #region 实现修改学生功能
        /// <summary>
        /// 实现修改学生功能
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Edit(int id)
        {
            Student stu = ZDSoft.TES.Core.Container.Instance.Resolve<IStudentService>().Get(id);
            return View(stu);
        }

        [HttpPost]
        public ActionResult Edit(Student  stu)
        {
            //从数据库通过ID获取完整的用户信息
            Student newStudent = ZDSoft.TES.Core.Container.Instance.Resolve<IStudentService>().Get(stu.ID);
            newStudent.Name = stu.Name;
            newStudent.Classes.Name = stu.Classes.Name;
            ZDSoft.TES.Core.Container.Instance.Resolve<IStudentService>().Update(newStudent);
            return RedirectToAction("Index", "Home");
        }
        #endregion

        #region 基于学生导入信息
        public ActionResult UpLoad()
        {
            //Office();
            //设置上传目录
            string path = Server.MapPath("~/Content/upload/");
            if (!Directory.Exists(path))
                Directory.CreateDirectory(path);
            //判断是否已经选择上传文件
            HttpPostedFileBase file = Request.Files["file"];
            if (file != null && file.ContentLength > 0)
            {
                string filenName = file.FileName;
                string fileExt = Path.GetExtension(filenName).ToLower().Substring(1);
                if (fileExt != "xls" && fileExt != "xlsx")
                {
                    ModelState.AddModelError("", "您选择的不是Excel文件");
                    return View();
                }
                else
                {
                    //上传文件
                    string filepath = filenName;
                    file.SaveAs(filepath);
                    //读取excel文件，转换成dataset
                    string strConn;
                    strConn = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filepath + ";Extended properties=\"Excel 12.0;Imex=1;HDR=Yes;\"";
                    OleDbConnection conn = new OleDbConnection(strConn);
                    conn.Open();
                    OleDbDataAdapter oada = new OleDbDataAdapter("select * from [Sheet1$]", conn);
                    DataSet ds = new DataSet();
                    oada.Fill(ds, "College");
                    //循环读取每一行，将数据插入到sql server数据库
                    foreach (DataRow row in ds.Tables[0].Rows)
                    {

                        Student stu = new Student();
                        stu.Name = row[0].ToString();
                        stu.No = row[1].ToString();
                        ZDSoft.TES.Core.Container.Instance.Resolve<IStudentService>().Create(stu);

                        UserClass clas = new UserClass();
                        clas.Name = row[2].ToString();
                        ZDSoft.TES.Core.Container.Instance.Resolve<IUserClassService>().Create(clas);

                        College course = new College();
                        course.Name = row[3].ToString();
                        ZDSoft.TES.Core.Container.Instance.Resolve<ICollegeService>().Create(course);
                    }

                    return Content("导入成功");
                }
            }
            else
            {
                ModelState.AddModelError("", "请选择文件");
                return View();
            }
        }
        #endregion

        #region 导入
        //public int Office()
        //{
        //    int ifused = 0;
        //    RegistryKey rk = Registry.LocalMachine;

        //    //查询Office2003
        //    RegistryKey f03 = rk.OpenSubKey(@"SOFTWARE\Microsoft\Office\11.0\Excel\InstallRoot\");
        //    //string szconnect = "provider=microsoft.jet.oledb.4.0; data source='{0}'; extended properties='excel 8.0;'";

        //    //查询Office2007
        //    RegistryKey f07 = rk.OpenSubKey(@"SOFTWARE\Microsoft\Office\12.0\Excel\InstallRoot\");
        //    //const string szconnect = "provider=microsoft.ace.oledb.12.0; data source={0}; extended properties='excel 12.0 xml;'
        //    ////查询wps
        //    RegistryKey wps = rk.OpenSubKey(@"SOFTWARE\Kingsoft\Office\6.0\common\");

        //    //检查本机是否安装Office2003
        //    if (f03 != null)
        //    {
        //        string file03 = f03.GetValue("Path").ToString();
        //        if (System.IO.File.Exists(file03 + "Excel.exe")) ifused += 1;
        //        ifused = 1;
        //    }

        //    //检查本机是否安装Office2007

        //    if (f07 != null)
        //    {
        //        string file07 = f07.GetValue("Path").ToString();
        //        if (System.IO.File.Exists(file07 + "Excel.exe")) ifused += 2;
        //        ifused = 2;
        //    }

        //    //检查本机是否安装wps
        //    if (wps != null)
        //    {
        //        string filewps = wps.GetValue("InstallRoot").ToString();
        //        if (System.IO.File.Exists(filewps + @"\office6\et.exe")) ifused += 4;
        //        ifused = 3;
        //    }

        //    return ifused;
        //}
        #endregion

    }
}
