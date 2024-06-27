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
    public class QuanTrisController : Controller
    {
        private modelWeb db = new modelWeb();

        // GET: Admin/QuanTris
        public ActionResult Index()
        {
            var quanTris = db.QuanTris.Include(q => q.Khoa);
            return View(quanTris.ToList());
        }

        // GET: Admin/QuanTris/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            QuanTri quanTri = db.QuanTris.Find(id);
            if (quanTri == null)
            {
                return HttpNotFound();
            }
            return View(quanTri);
        }

        // GET: Admin/QuanTris/Create
        public ActionResult Create()
        {
            ViewBag.IDKhoa = new SelectList(db.Khoas, "IDKhoa", "TenKhoa");
            return View();
        }

        // POST: Admin/QuanTris/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDQuanTri,TaiKhoan,MatKhau,VaiTro,ThongTinBacSi,TrinhDo,IDKhoa,HoTen,AnhBia")] QuanTri quanTri)
        {
            if (ModelState.IsValid)
            {
                db.QuanTris.Add(quanTri);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IDKhoa = new SelectList(db.Khoas, "IDKhoa", "TenKhoa", quanTri.IDKhoa);
            return View(quanTri);
        }

        // GET: Admin/QuanTris/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            QuanTri quanTri = db.QuanTris.Find(id);
            if (quanTri == null)
            {
                return HttpNotFound();
            }
            ViewBag.IDKhoa = new SelectList(db.Khoas, "IDKhoa", "TenKhoa", quanTri.IDKhoa);
            return View(quanTri);
        }

        // POST: Admin/QuanTris/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDQuanTri,TaiKhoan,MatKhau,VaiTro,ThongTinBacSi,TrinhDo,IDKhoa,HoTen,AnhBia")] QuanTri quanTri)
        {
            if (ModelState.IsValid)
            {
                db.Entry(quanTri).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IDKhoa = new SelectList(db.Khoas, "IDKhoa", "TenKhoa", quanTri.IDKhoa);
            return View(quanTri);
        }

        // GET: Admin/QuanTris/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            QuanTri quanTri = db.QuanTris.Find(id);
            if (quanTri == null)
            {
                return HttpNotFound();
            }
            return View(quanTri);
        }

        // POST: Admin/QuanTris/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            QuanTri quanTri = db.QuanTris.Find(id);
            db.QuanTris.Remove(quanTri);
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
