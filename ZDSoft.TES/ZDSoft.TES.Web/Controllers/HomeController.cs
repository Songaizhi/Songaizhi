using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ZDSoft.TES.Web.Controllers
{
    public class HomeController : UcController
    {
        //
        // GET: /Home/

        public ActionResult Index()
        {
            return View();
        }

    }
}
