using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ZDSoft.TES.Domain;

namespace ZDSoft.TES.Service
{
    public interface IQManagementService:IBaseService<QManagement>
    {
        /// <summary>
        /// 状态
        /// </summary>
        /// <param name="id"></param>
        void SwitchStatus(int id);
    }
}
