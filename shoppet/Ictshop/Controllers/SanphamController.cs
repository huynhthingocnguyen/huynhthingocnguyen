using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Ictshop.Models;

namespace Ictshop.Controllers
{
    public class SanphamController : Controller
    {
        Qlbanhang db = new Qlbanhang();

        // GET: Sanpham
        public ActionResult tatcapartial()
        {
            var all = db.Sanphams.Where(n => n.Mahang >=1).Take(16).ToList();
            return PartialView(all);
        }
        public ActionResult xemchitiet(int Masp=0)
        {
            var chitiet = db.Sanphams.SingleOrDefault(n=>n.Masp==Masp);
            if (chitiet == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(chitiet);
        }
        public ActionResult sanphamchitietpartial()
        {
            var sanphamchitiet = db.Sanphams.Where(n => n.Mahang >= 1).Take(4).ToList();
            return PartialView(sanphamchitiet);
        }

    }

}