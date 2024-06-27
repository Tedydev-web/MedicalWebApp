using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.WebPages;
using WebAppYte.Models;

namespace WebAppYte.Controllers
{
    public class NguoidungController : Controller
    {
        private modelWeb db = new modelWeb();

        // GET: Nguoidung
        public ActionResult Index()
        {
            var nguoiDungs = db.NguoiDungs.Include(n => n.GioiTinh).Include(n => n.TinhThanh);

            return View(nguoiDungs.ToList());
        }

        public ActionResult XemHoSoSucKhoe(int? id)
        {
            if (!id.HasValue)
            {
                var user = Session["user"] as NguoiDung;
                if (user != null)
                {
                    id = user.IDNguoiDung;
                }
                else
                {
                    return RedirectToAction("Dangnhap", "Home");
                }
            }

            var hoSoSucKhoe = db.HoSoSucKhoes.Where(h => h.IDNguoiDung == id.Value).ToList();
            if (hoSoSucKhoe == null || !hoSoSucKhoe.Any())
            {
                TempData["Message"] = "Bệnh nhân này không có hồ sơ sức khoẻ";
                return RedirectToAction("Details", new { id = id.Value });
            }

            return View(hoSoSucKhoe);
        }


        // GET: Nguoidung/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NguoiDung nguoiDung = db.NguoiDungs.Find(id);
            if (nguoiDung == null)
            {
                return HttpNotFound();
            }
            return View(nguoiDung);
        }
        // GET: Nguoidung/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NguoiDung nguoiDung = db.NguoiDungs.Find(id);
            if (nguoiDung == null)
            {
                return HttpNotFound();
            }
            ViewBag.IDGioiTinh = new SelectList(db.GioiTinhs, "IDGioiTinh", "GioiTinh1", nguoiDung.IDGioiTinh);
            ViewBag.IDTinh = new SelectList(db.TinhThanhs, "IDTinh", "TenTinh", nguoiDung.IDTinh);
            return View(nguoiDung);
        }

        // POST: Nguoidung/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDNguoiDung,HoTen,Email,DienThoai,TaiKhoan,MatKhau,IDGioiTinh,DiaChiCuThe,SoCMND,IDTinh,NhomMau,ThongTinKhac")] NguoiDung nguoiDung)
        {
            if (ModelState.IsValid)
            {
                db.Entry(nguoiDung).State = EntityState.Modified;
                db.SaveChanges();
                ViewBag.capnhat = " Cập nhật thành công ";
            }
            ViewBag.IDGioiTinh = new SelectList(db.GioiTinhs, "IDGioiTinh", "GioiTinh1", nguoiDung.IDGioiTinh);
            ViewBag.IDTinh = new SelectList(db.TinhThanhs, "IDTinh", "TenTinh", nguoiDung.IDTinh);
            return View(nguoiDung);
        }
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
