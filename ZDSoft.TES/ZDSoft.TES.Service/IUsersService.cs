using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ZDSoft.TES.Domain;

namespace ZDSoft.TES.Service
{
    public interface IUsersService : IBaseService<Users>
    {
        /// <summary>
        /// 登陆
        /// </summary>
        /// <param name="account">账号</param>
        /// <param name="password">密码</param>
        /// <returns></returns>
        Users Login(string account, string password);

        /// <summary>
        /// 配置角色
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="rolesId"></param>
        void AssignRole(int userId, string rolesId);

    }
}
