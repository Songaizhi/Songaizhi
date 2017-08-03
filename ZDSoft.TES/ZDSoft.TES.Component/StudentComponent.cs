using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ZDSoft.TES.Service;
using ZDSoft.TES.Manager;
using ZDSoft.TES.Domain;
using NHibernate.Criterion;

namespace ZDSoft.TES.Component
{
    public class StudentComponent : BaseComponent<Student, StudentManager>, IStudentService
    {
        public Student Stu(string no)
        {
            //ORM查询值方法
            //（1）标准条件查询（不支持关联属性的关系查询）（2）HQL查询（3）原生查询
            IList<NHibernate.Criterion.ICriterion> arrlist = new List<ICriterion>();
            //向条件集合添加条件查询
            arrlist.Add(Expression.Eq("No", no));
            Student users = manager.Get(arrlist);
            return users;

        }

        public Student findstu(string identifier)
        {
            //ORM查询值方法
            //（1）标准条件查询（不支持关联属性的关系查询）（2）HQL查询（3）原生查询
            IList<NHibernate.Criterion.ICriterion> arrlist = new List<ICriterion>();
            //向条件集合添加条件查询
            arrlist.Add(Expression.Eq("No", identifier));
            Student stu = manager.Get(arrlist);
            return stu;
        }
    }
}
