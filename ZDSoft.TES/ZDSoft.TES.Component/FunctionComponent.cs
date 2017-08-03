using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ZDSoft.TES.Service;
using ZDSoft.TES.Manager;
using ZDSoft.TES.Domain;

namespace ZDSoft.TES.Component
{
    public class FunctionComponent : BaseComponent<Function, FunctionManager>, IFunctionService
    {
    }
}
