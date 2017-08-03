using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ZDSoft.TES.Domain;

namespace ZDSoft.TES.Service
{
    public interface ITeacherService : IBaseService<Teacher>
    {
        /// <summary>
        /// 教师
        /// </summary>
        /// <param name="No"></param>
        /// <returns></returns>
        Teacher teacher(string number);

        Teacher findstu(string identifier);
    }
}
