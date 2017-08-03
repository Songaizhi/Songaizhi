using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ZDSoft.TES.Component;
using ZDSoft.TES.Service;
using ZDSoft.TES.Manager;
using ZDSoft.TES.Domain;
using NHibernate.Criterion;

namespace ZDSoft.TES.Component
{
    public class UsersComponent : BaseComponent<Users, UsersManager>, IUsersService
    {
        public Users Login(string account, string password)
        {
            //组织查询条件（标准条件查询）
            IList<ICriterion> criter = new List<ICriterion>();
            //向条件集合添加查询条件，每个条件之间默认为and关系
            criter.Add(Expression.Eq("Account", account));
            criter.Add(Expression.Eq("PassWord", password));
            //调用数据访问层的方法执行操作
            Users user = manager.Get(criter);
            return user;
        }

        /// <summary>
        /// 配置角色
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="rolesId"></param>
        public void AssignRole(int userId, string rolesId)
        {
            //查询拥户
            Users user = manager.Get(userId);
            if (user.Roles == null)
                user.Roles = new List<Role>();
            //清空所有角色
            user.Roles.Clear();
            if (!string.IsNullOrEmpty(rolesId))
            {

                string[] ids = rolesId.Split(new char[] { ',', ',', ',' });
                foreach (string tempid in ids)
                {
                    if (string.IsNullOrEmpty(tempid))
                        continue;
                    //user.Roles.Add(new Role() { ID = int.Parse(id) });
                    user.Roles.Add(new RoleComponent().Get(int.Parse(tempid)));
                }
            }
            manager.Update(user);
        }


    }
}
