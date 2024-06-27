using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebAppYte.Models;

namespace WebAppYte.Areas.Admin.Controllers
{
    public class NguoiDungsController : Controller
    {
        private modelWeb db = new modelWeb();

        // GET: Admin/NguoiDungs
        public ActionResult Index()
        {
            var nguoiDungs = db.NguoiDungs.Include(n => n.GioiTinh).Include(n => n.TinhThanh);
            return View(nguoiDungs.ToList());
        }

        public ActionResult XemHoSo(int id)
        {
            var hoSoSucKhoe = db.HoSoSucKhoes.Where(h => h.IDNguoiDung == id).ToList();
            return View(hoSoSucKhoe);
        }

        // GET: Admin/NguoiDungs/Details/5
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

        // GET: Admin/NguoiDungs/Create
        public ActionResult Create()
        {
            ViewBag.IDGioiTinh = new SelectList(db.GioiTinhs, "IDGioiTinh", "GioiTinh1");
            ViewBag.IDTinh = new SelectList(db.TinhThanhs, "IDTinh", "TenTinh");
            return View();
        }

        // POST: Admin/NguoiDungs/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDNguoiDung,HoTen,Email,DienThoai,TaiKhoan,MatKhau,IDGioiTinh,DiaChiCuThe,SoCMND,IDTinh,NhomMau,ThongTinKhac")] NguoiDung nguoiDung)
        {
            if (ModelState.IsValid)
            {
                db.NguoiDungs.Add(nguoiDung);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IDGioiTinh = new SelectList(db.GioiTinhs, "IDGioiTinh", "GioiTinh1", nguoiDung.IDGioiTinh);
            ViewBag.IDTinh = new SelectList(db.TinhThanhs, "IDTinh", "TenTinh", nguoiDung.IDTinh);
            return View(nguoiDung);
        }

        // GET: Admin/NguoiDungs/Edit/5
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

        // POST: Admin/NguoiDungs/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDNguoiDung,HoTen,Email,DienThoai,TaiKhoan,MatKhau,IDGioiTinh,DiaChiCuThe,SoCMND,IDTinh,NhomMau,ThongTinKhac")] NguoiDung nguoiDung)
        {
            if (ModelState.IsValid)
            {
                db.Entry(nguoiDung).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IDGioiTinh = new SelectList(db.GioiTinhs, "IDGioiTinh", "GioiTinh1", nguoiDung.IDGioiTinh);
            ViewBag.IDTinh = new SelectList(db.TinhThanhs, "IDTinh", "TenTinh", nguoiDung.IDTinh);
            return View(nguoiDung);
        }

        // GET: Admin/NguoiDungs/Delete/5
        public ActionResult Delete(int? id)
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

        // POST: Admin/NguoiDungs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            NguoiDung nguoiDung = db.NguoiDungs.Find(id);
            db.NguoiDungs.Remove(nguoiDung);
            db.SaveChanges();
            return RedirectToAction("Index");
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
