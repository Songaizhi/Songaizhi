using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ZDSoft.TES.Domain;
using ZDSoft.TES.Manager;
using ZDSoft.TES.Service;

namespace ZDSoft.TES.Component
{
    public class QManagementComponent : BaseComponent<QManagement, QManagementManager>, IQManagementService
    {
        public void SwitchStatus(int id)
        {
            QManagement qm = Get(id);
            qm.ISActive = !qm.ISActive;
            Update(qm);
        }
    }
}
