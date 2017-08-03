using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ZDSoft.TES.Domain;

namespace ZDSoft.TES.Service
{
    public interface IStudentService : IBaseService<Student>
    {

        /// <summary>
        /// 学生
        /// </summary>
        /// <param name="No"></param>
        /// <returns></returns>
        Student Stu(string No);

        /// <summary>
        /// 
        /// </summary>
        /// <param name="identifier"></param>
        /// <returns></returns>
        Student findstu(string identifier);

    }
}
