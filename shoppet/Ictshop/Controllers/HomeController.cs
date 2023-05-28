using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Ictshop.Controllers
{
    public class HomeController : Controller
    {
      
        public ActionResult Index()
        {
       
            return View();

        }

        public ActionResult About()
        {
            ViewBag.Message = "Trang mô tả ứng dụng.";

            return View();
        }
        public ActionResult Product()
        {
            ViewBag.Message = "Trang sản phẩm.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Trang thông tin liên hệ.";

            return View();
        }
        public ActionResult SlidePartial()
        {
            return PartialView();

        }
        public ActionResult OfferPartial()
        {
            return PartialView();

        }
        public ActionResult BannerPartial()
        {
            return PartialView();

        }
        public ActionResult BrandPartial()
        {
            return PartialView();

        }
        public ActionResult ServicePartial()
        {
            return PartialView();

        }
    }
}