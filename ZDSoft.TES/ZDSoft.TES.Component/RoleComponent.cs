using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ZDSoft.TES.Component;
using ZDSoft.TES.Domain;
using ZDSoft.TES.Service;
using ZDSoft.TES.Manager;

namespace ZDSoft.TES.Component
{
    public class RoleComponent : BaseComponent<Role, RoleManager>, IRoleService
    {
    }
}
