using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebAppYte.Models;

namespace WebAppYte.Controllers
{
    public class HomeController : Controller
    {
        modelWeb db = new modelWeb();
        public ActionResult Index()
        {
            var solieu = db.Solieucovids.ToList();
            return View(solieu);
        }
        public ActionResult Trangchu()
        {
            return View();

        }
        public ActionResult Tuvan()
        {
            return View();

        }
        public ActionResult Yta()
        {
            return View();

        }
        [HttpGet]
        public ActionResult Dangky()
        {
            ViewBag.IDGioiTinh = new SelectList(db.GioiTinhs, "IDGioiTinh", "GioiTinh1");
            ViewBag.IDTinh = new SelectList(db.TinhThanhs, "IDTinh", "TenTinh");
            return View();
        }

        // POST: Admin/NguoiDungs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Dangky([Bind(Include = "IDNguoiDung,HoTen,Email,DienThoai,TaiKhoan,MatKhau,IDGioiTinh,DiaChiCuThe,SoCMND,IDTinh,NhomMau,ThongTinKhac")] NguoiDung nguoiDung)
        {
            if (ModelState.IsValid)
            {
                db.NguoiDungs.Add(nguoiDung);
                db.SaveChanges();
                Session["nguoidung"] = nguoiDung;
                return RedirectToAction("Dangnhap");
            }

            ViewBag.IDGioiTinh = new SelectList(db.GioiTinhs, "IDGioiTinh", "GioiTinh1", nguoiDung.IDGioiTinh);
            ViewBag.IDTinh = new SelectList(db.TinhThanhs, "IDTinh", "TenTinh", nguoiDung.IDTinh);
            return View(nguoiDung);
        }
        [HttpGet]
        public ActionResult Dangnhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Dangnhap(FormCollection Dangnhap)
        {
            string tk = Dangnhap["TaiKhoan"].ToString();
            string mk = Dangnhap["MatKhau"].ToString();
            var islogin = db.NguoiDungs.SingleOrDefault(x => x.TaiKhoan.Equals(tk) && x.MatKhau.Equals(mk));
            var isloginAdmin = db.QuanTris.SingleOrDefault(x => x.TaiKhoan.Equals(tk) && x.MatKhau.Equals(mk));
            if (islogin != null)
            {
                Session["user"] = islogin;
                return RedirectToAction("Details", "Nguoidung", new { id = @islogin.IDNguoiDung });
            }
            else if (isloginAdmin != null && isloginAdmin.VaiTro == 1)
            {
                Session["userAdmin"] = isloginAdmin;
                return RedirectToAction("QuanTris", "Admin");
            }
            else if (isloginAdmin != null && isloginAdmin.VaiTro == 2)
            {
                Session["userBS"] = isloginAdmin;
                return RedirectToAction("Trangchu", "Home");
            }
            else if (isloginAdmin != null && isloginAdmin.VaiTro == 3)
            {
                Session["userTV"] = isloginAdmin;
                return RedirectToAction("Tuvan", "Home");
            }
            else if (isloginAdmin != null && isloginAdmin.VaiTro == 4)
            {
                Session["userYT"] = isloginAdmin;
                return RedirectToAction("Yta", "Home");
            }
            else
            {
                ViewBag.Fail = "Tài khoản hoặc mật khẩu không chính xác.";
                return View("Dangnhap");
            }
        }

        public ActionResult DangXuat()
        {
            Session["user"] = null;
            return RedirectToAction("Index", "Home");
        }
        public ActionResult DangXuatBs()
        {
            Session["userBS"] = null;
            return RedirectToAction("Index", "Home");
        }
        public ActionResult DangXuatTv()
        {
            Session["userTV"] = null;
            return RedirectToAction("Index", "Home");
        }

        public ActionResult DangXuatYt()
        {
            Session["userYt"] = null;
            return RedirectToAction("Index", "Home");
        }

        public ActionResult TintucNewPartial()
        {
            String n = "new";
            var tintuc = db.Tintucs.Where(x => x.TheLoai.Equals(n));
            return PartialView(tintuc);

        }
        public ActionResult TintucHotPartial()
        {
            String h = "hot";
            var tintuc = db.Tintucs.Where(x => x.TheLoai.Equals(h));
            return PartialView(tintuc);

        }
        public ActionResult Xemchitiet(int IDTintuc = 0)
        {
            var chitiet = db.Tintucs.SingleOrDefault(n => n.IDTintuc == IDTintuc);
            if (chitiet == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(chitiet);
        }
    }
}