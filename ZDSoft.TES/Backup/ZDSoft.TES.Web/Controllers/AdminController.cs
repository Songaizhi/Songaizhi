using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ZDSoft.TES.Web.Apps;
using ZDSoft.TES.Domain;
using ZDSoft.TES.Core;
using ZDSoft.TES.Service;
using NHibernate.Criterion;
using ZDSoft.TES.Manager;

namespace ZDSoft.TES.Web.Controllers
{
    public class AdminController : UcController
    {
        //
        // GET: /Admin/

        #region 管理员界面
        /// <summary>
        /// 管理员界面
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            Users user = AppHelper.LoginedUser;
            IList<Function> functions = user.Roles[0].Functions;
            ViewBag.user = user;
            return View(functions);
        }
        #endregion

        #region 教师统计
        /// <summary>
        /// 教师统计
        /// </summary>
        /// <returns></returns>
        public ActionResult Teacherstatistics()
        {
            IList<ResultPapers> rplist = Container.Instance.Resolve<IResultPapersService>().GetAll();
            double firststu = 0;
            double secondstu = 0;
            double thirdstu = 0;
            double fourthstu = 0;
            foreach (ResultPapers rp in rplist)
            {
                if (rp.Proportion > 0.9m && rp.Proportion <= 1m)
                {
                    firststu++;
                }
                else if (rp.Proportion > 0.8m && rp.Proportion <= 0.9m)
                {
                    secondstu++;
                }
                else if (rp.Proportion > 0.7m && rp.Proportion <= 0.8m)
                {
                    thirdstu++;
                }
                else if (rp.Proportion > 0.6m && rp.Proportion <= 0.7m)
                {
                    fourthstu++;
                }

            }
            double[] fenlie = new double[5];
            fenlie[0] = firststu / Convert.ToDouble(rplist.Count);
            fenlie[1] = secondstu / Convert.ToDouble(rplist.Count);
            fenlie[2] = thirdstu / Convert.ToDouble(rplist.Count);
            fenlie[3] = fourthstu / Convert.ToDouble(rplist.Count);
            ViewBag.fenshu = fenlie;
            return View();
        }
        #endregion

        #region 学生统计
        /// <summary>
        /// 学生统计
        /// </summary>
        /// <returns></returns>
        public ActionResult Studentstatistics()
        {
            IList<Student> stulist = Container.Instance.Resolve<IStudentService>().GetAll();
            double firststu = 0;
            double secondstu = 0;
            double thirdstu = 0;
            foreach (Student stu in stulist)
            {
                IList<Teacher> stu_tea = stu.Classes.Teachers;
                IList<ICriterion> qc = new List<ICriterion>();
                qc.Add(Expression.Eq("CreateUserID", stu.Students.ID));
                IList<ResultPapers> stu_paper = Container.Instance.Resolve<IResultPapersService>().Find(qc);
                if (stu_paper.Count == stu_tea.Count)
                {
                    firststu++;
                }
                else if (stu_paper.Count == 0)
                {
                    thirdstu++;
                }
                else
                {
                    secondstu++;
                }
            }
            double[] fenlie = new double[3];
            fenlie[0] = firststu / Convert.ToDouble(stulist.Count);
            fenlie[1] = secondstu / Convert.ToDouble(stulist.Count);
            fenlie[2] = thirdstu / Convert.ToDouble(stulist.Count);
            ViewBag.fenshu = fenlie;
            return View();
        }
        #endregion

        #region 评教
        /// <summary>
        /// 评教
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="role"></param>
        /// <param name="around"></param>
        /// <returns></returns>
        public ActionResult STlist(int pageIndex = 1, string role = "0", string around = "0")
        {
            if (role == "1")
            {
                decimal diwei = Convert.ToDecimal(around.Substring(0, 2)) / 100;
                decimal gaowei = Convert.ToDecimal(around.Substring(3, around.Length - 4)) / 100;
                Dictionary<int, Student> Createusers = new Dictionary<int, Student>();
                Dictionary<int, Teacher> users = new Dictionary<int, Teacher>();
                Dictionary<int, Teacher> Createtea = new Dictionary<int, Teacher>();
                IList<QueryConditions> queryConditions = new List<QueryConditions>();
                queryConditions.Add(new QueryConditions()
                {
                    Operator = "<=",
                    PropertyName = "Proportion",
                    Value = gaowei
                });
                queryConditions.Add(new QueryConditions()
                {
                    Operator = ">",
                    PropertyName = "Proportion",
                    Value = diwei
                });
                int count = 0;//存放满足条件的记录
                //（3）设置排序表达式（修改）设置一个排序集合new Order("ID", true)  根据ID排序true升序 false 排序
                IList<Order> listOrder = new List<Order>() { new Order("ID", true) };
                //（4）通过容器调用排序方法（修改查询数据类型）
                IList<ResultPapers> list = Container.Instance.Resolve<IResultPapersService>().GetPaged(queryConditions, pageIndex, 5, out count);
                //（5）将LIST 存放到pageList中 分页相关的属性也包含其中
                foreach (ResultPapers rp in list)
                {
                    Users user = null;
                    if (!Createusers.ContainsKey(rp.CreateUserID))
                    {
                        user = Container.Instance.Resolve<IUsersService>().Get(rp.CreateUserID);
                        if (user.Roles[0].Name == "教师")
                        {
                            Createtea.Add(rp.CreateUserID, Container.Instance.Resolve<ITeacherService>().findstu(user.Identifier));
                        }
                        else
                        {
                            Createusers.Add(rp.CreateUserID, Container.Instance.Resolve<IStudentService>().findstu(user.Identifier));
                        }
                    }
                    if (!users.ContainsKey(rp.UserID))
                    {
                        user = Container.Instance.Resolve<IUsersService>().Get(rp.UserID);
                        users.Add(rp.UserID, Container.Instance.Resolve<ITeacherService>().findstu(user.Identifier));
                    }
                }
                PageList<ResultPapers> pageList = list.ToPageList<ResultPapers>(pageIndex, PagerHelper.PageSize, count);
                ViewBag.Createusers = Createusers;
                ViewBag.users = users;
                ViewBag.Createtea = Createtea;
                return View(pageList);
            }
            else if (role == "2")
            {
                return Redirect("notdoSlist?around=" + around);
            }
            else
            {
                Dictionary<int, Student> Createusers = new Dictionary<int, Student>();
                Dictionary<int, Teacher> users = new Dictionary<int, Teacher>();
                Dictionary<int, Teacher> Createtea = new Dictionary<int, Teacher>();
                IList<QueryConditions> queryConditions = new List<QueryConditions>();
                int count = 0;//存放满足条件的记录
                //（3）设置排序表达式（修改）设置一个排序集合new Order("ID", true)  根据ID排序true升序 false 排序
                IList<Order> listOrder = new List<Order>() { new Order("ID", true) };
                //（4）通过容器调用排序方法（修改查询数据类型）
                IList<ResultPapers> list = Container.Instance.Resolve<IResultPapersService>().GetPaged(queryConditions, pageIndex, 5, out count);
                //（5）将LIST 存放到pageList中 分页相关的属性也包含其中
                foreach (ResultPapers rp in list)
                {
                    Users user = null;
                    if (!Createusers.ContainsKey(rp.CreateUserID))
                    {
                        user = Container.Instance.Resolve<IUsersService>().Get(rp.CreateUserID);
                        if (user.Roles[0].Name == "教师") 
                        {
                            Createtea.Add(rp.CreateUserID, Container.Instance.Resolve<ITeacherService>().findstu(user.Identifier));
                        }
                        else
                        {
                            Createusers.Add(rp.CreateUserID, Container.Instance.Resolve<IStudentService>().findstu(user.Identifier));
                        }
                        
                    }
                    if (!users.ContainsKey(rp.UserID))
                    {
                        user = Container.Instance.Resolve<IUsersService>().Get(rp.UserID);
                        users.Add(rp.UserID, Container.Instance.Resolve<ITeacherService>().findstu(user.Identifier));
                    }
                }
                PageList<ResultPapers> pageList = list.ToPageList<ResultPapers>(pageIndex, PagerHelper.PageSize, count);
                ViewBag.Createusers = Createusers;
                ViewBag.users = users;
                ViewBag.Createtea = Createtea;
                //（6）跳转页面
                return View(pageList);
            }
        }
        #endregion

        #region 按钮跳转
        /// <summary>
        /// 按钮跳转
        /// </summary>
        /// <param name="xueqi"></param>
        /// <param name="jiaoshi"></param>
        /// <param name="xuesheng"></param>
        /// <param name="pageIndex"></param>
        /// <returns></returns>
        public ActionResult DetailedFind(string xueqi, string jiaoshi, string xuesheng, int pageIndex = 1)
        {
            if (xueqi == "" || jiaoshi == "" || xuesheng == "")
            {
                return Redirect("STlist");
            }
            else
            {
                int count = 0;
                IList<ICriterion> qc = new List<ICriterion>();
                IList<ResultPapers> list = new List<ResultPapers>();
                List<ResultPapers> chunlist = new List<ResultPapers>();
                List<ResultPapers> linshilist = new List<ResultPapers>();
                if (xueqi != null || xueqi != "")
                {
                    qc.Add(Expression.Eq("Semester", xueqi));
                    list = Container.Instance.Resolve<IResultPapersService>().Find(qc);
                    foreach (ResultPapers rp in list)
                    {
                        chunlist.Add(rp);
                    }
                }
                if (xuesheng != null && xuesheng != "")
                {
                    IList<ICriterion> stuqc = new List<ICriterion>();
                    stuqc.Add(Expression.Eq("Name", xuesheng));
                    IList<Student> stulist = Container.Instance.Resolve<IStudentService>().Find(stuqc);
                    foreach (Student stu in stulist)
                    {
                        foreach (ResultPapers rp in chunlist)
                        {
                            if (rp.CreateUserID == stu.Students.ID)
                            {
                                linshilist.Add(rp);
                            }
                        }
                    }
                    chunlist.Clear();
                    foreach (ResultPapers rp in linshilist)
                    {
                        chunlist.Add(rp);
                    }
                    linshilist.Clear();
                }
                if (jiaoshi != null && jiaoshi != "")
                {
                    IList<ICriterion> teaqc = new List<ICriterion>();
                    teaqc.Add(Expression.Eq("Name", jiaoshi));
                    IList<Teacher> tealist = Container.Instance.Resolve<ITeacherService>().Find(teaqc);
                    foreach (Teacher tea in tealist)
                    {
                        foreach (ResultPapers rp in chunlist)
                        {
                            if (rp.UserID == tea.Teachers.ID)
                            {
                                linshilist.Add(rp);
                            }
                        }
                    }
                    chunlist.Clear();
                    foreach (ResultPapers rp in linshilist)
                    {
                        chunlist.Add(rp);
                    }
                    linshilist.Clear();
                }
                Dictionary<int, Student> slist = new Dictionary<int, Student>();
                Dictionary<int, Teacher> tlist = new Dictionary<int, Teacher>();
                Users user = null;
                foreach (ResultPapers rp in chunlist)
                {
                    if (!slist.ContainsKey(rp.CreateUserID))
                    {
                        user = Container.Instance.Resolve<IUsersService>().Get(rp.CreateUserID);
                        slist.Add(rp.CreateUserID, Container.Instance.Resolve<IStudentService>().findstu(user.Identifier));
                    }
                    if (!tlist.ContainsKey(rp.UserID))
                    {
                        user = Container.Instance.Resolve<IUsersService>().Get(rp.UserID);
                        tlist.Add(rp.UserID, Container.Instance.Resolve<ITeacherService>().findstu(user.Identifier));
                    }
                }
                ViewBag.slist = slist;
                ViewBag.tlist = tlist;
                PageList<ResultPapers> pageList = chunlist.ToPageList<ResultPapers>(pageIndex, PagerHelper.PageSize, count);
                return View(pageList);
            }
        }

        #endregion

        #region 学生详细信息
        /// <summary>
        /// 学生详细信息
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="around"></param>
        /// <returns></returns>
        public ActionResult notdoSlist(int pageIndex = 1, string around = "")
        {
            int count = 0;
            IList<Student> stulist = Container.Instance.Resolve<IStudentService>().GetAll();
            IList<Student> notstulist = new List<Student>();
            if (around == "")
            {
                return RedirectToAction("Studentstatistics");
            }
            else if (around == "评价完成")
            {
                foreach (Student stu in stulist)
                {
                    IList<Teacher> stu_tea = stu.Classes.Teachers;
                    IList<ICriterion> qc = new List<ICriterion>();
                    qc.Add(Expression.Eq("CreateUserID", stu.Students.ID));
                    IList<ResultPapers> stu_paper = Container.Instance.Resolve<IResultPapersService>().Find(qc);
                    if (stu_paper.Count == stu_tea.Count)
                    {
                        notstulist.Add(stu);
                    }
                }
            }
            else if (around == "评价未完成")
            {
                foreach (Student stu in stulist)
                {
                    IList<Teacher> stu_tea = stu.Classes.Teachers;
                    IList<ICriterion> qc = new List<ICriterion>();
                    qc.Add(Expression.Eq("CreateUserID", stu.Students.ID));
                    IList<ResultPapers> stu_paper = Container.Instance.Resolve<IResultPapersService>().Find(qc);
                    if (stu_paper.Count != stu_tea.Count && stu_paper.Count != 0)
                    {
                        notstulist.Add(stu);
                    }
                }
            }
            else
            {
                foreach (Student stu in stulist)
                {
                    IList<Teacher> stu_tea = stu.Classes.Teachers;
                    IList<ICriterion> qc = new List<ICriterion>();
                    qc.Add(Expression.Eq("CreateUserID", stu.Students.ID));
                    IList<ResultPapers> stu_paper = Container.Instance.Resolve<IResultPapersService>().Find(qc);
                    if (stu_paper.Count == 0)
                    {
                        notstulist.Add(stu);
                    }
                }
            }
            PageList<Student> pageList = notstulist.ToPageList<Student>(pageIndex, PagerHelper.PageSize, count);
            return View(pageList);
        }
        #endregion

        #region 指标管理页面
        /// <summary>
        /// 指标管理页面
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <returns></returns>
        public ActionResult ZhiBiaoIndex(int pageIndex = 1)
        {
            //1组织查询条件
            List<ICriterion> listConditions = new List<ICriterion>();//实例化一个查询条件集合
            int count = 0;
            //设置一个排序集合，根据ID进行排序，true（升序），false（将序）
            IList<Order> listOrder = new List<Order>() { new Order("ID", true) };

            //3通过容器调用分页方法
            IList<TempPaperType> list = Container.Instance.Resolve<ITempPaperTypeService>().GetPaged(listConditions, listOrder, pageIndex, PagerHelper.PageSize, out count);
            //转换为pageList集合，用于分页控件显示不同的页码
            PageList<TempPaperType> pageList = list.ToPageList<TempPaperType>(pageIndex, PagerHelper.PageSize, count);
            //用pageList集合填充页面
            return View(pageList);

        }
        #endregion

        #region 指标增加
        /// <summary>
        /// 指标增加
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Create()
        {
            TempPaperType temper = new TempPaperType();
            temper.ResultPapers = new Role();
            temper.TempPaperTypeList = new List<TempTopic>();
            temper.TempPaperTypeList.Add(new TempTopic());
            for (int i = 0; i <= temper.TempPaperTypeList.Count - 1; i++)
            {
                temper.TempPaperTypeList[i].TempSelectsList = new List<TempSelects>();
                temper.TempPaperTypeList[i].TempSelectsList.Add(new TempSelects());
            }
            return View("Create", temper);


        }
        [HttpPost]
        public ActionResult Create(TempPaperType tea, string shijuan, string zhibiao, string xuanA, string xuanb, string xuanc, string xuand, decimal quznhong1, decimal quznhong)
        {
            //TempPaperType tyi = Container.Instance.Resolve<ITempPaperTypeService>().Get(tea.ID = 1);

            //for (int i = 0; i < tea.TempPaperTypeList.Count - 1; i++)
            //{
            //    tyi.Name = shijuan;
            //    tea.TempPaperTypeList[0].Name = zhibiao;
            //    tea.TempPaperTypeList[i].Proportion = quznhong;
            //    for (int k = 0; k <= tea.TempPaperTypeList[i].TempSelectsList.Count - 1; k++)
            //    {
            //        tea.TempPaperTypeList[i].TempSelectsList[k].Name = xuanA;
            //        tea.TempPaperTypeList[i].TempSelectsList[k].Name = xuanb;
            //        tea.TempPaperTypeList[i].TempSelectsList[k].Name = xuanc;
            //        tea.TempPaperTypeList[i].TempSelectsList[k].Name = xuand;
            //        tea.TempPaperTypeList[i].TempSelectsList[k].Proportion = quznhong1;
            //    }
            //}
            //Container.Instance.Resolve<ITempPaperTypeService>().Update(tyi);
            return RedirectToAction("Index", "Admin");

        }
        #endregion

        #region 指标修改
        /// <summary>
        /// 指标修改
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Edit(int id)
        {
            TempPaperType tea = Container.Instance.Resolve<ITempPaperTypeService>().Get(id);
            return View(tea);

        }
        [HttpPost]
        public ActionResult Edit(string namet, int IDq, int IDe, decimal quanzhong1, string name, decimal quanzhong, TempPaperType temp, string Name)
        {

            TempPaperType tea = Container.Instance.Resolve<ITempPaperTypeService>().Get(temp.ID);
            for (int i = 0; i < tea.TempPaperTypeList.Count - 1; i++)
            {
                tea.ResultPapers.ID = IDe;
                tea.Name = Name;
                tea.TempPaperTypeList[i].Name = namet;
                tea.TempPaperTypeList[i].Proportion = quanzhong1;
                tea.TempPaperTypeList[i].TempPaperType.ID = IDq;
                for (int k = 0; k <= tea.TempPaperTypeList[i].TempSelectsList.Count - 1; k++)
                {
                    tea.TempPaperTypeList[i].TempSelectsList[k].Name = name;
                    tea.TempPaperTypeList[i].TempSelectsList[k].Proportion = quanzhong;
                }
            }
            Container.Instance.Resolve<ITempPaperTypeService>().Create(temp);
            return RedirectToAction("Index", "Admin");
        }
        #endregion

        #region 指标信息
        /// <summary>
        /// 指标信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Details(int id)
        {
            TempPaperType tea = Container.Instance.Resolve<ITempPaperTypeService>().Get(id);
            return View(tea);
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            Container.Instance.Resolve<ITempPaperTypeService>().Delete(id);
            return RedirectToAction("Index");
        } 
        #endregion


    }
}
