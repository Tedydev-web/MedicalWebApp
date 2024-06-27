using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using WebAppYte.Models;

namespace WebAppYte.Areas.Admin.Controllers
{
    public class LichLamViecsController : Controller
    {
        private modelWeb db = new modelWeb();

        // GET: Admin/LichLamViecs
        public ActionResult Index()
        {
            var LichLamViecs = db.LichLamViecs.Include(l => l.QuanTri);
            return View(LichLamViecs.ToList());
        }

        // GET: Admin/LichLamViecs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LichLamViec lichLamViec = db.LichLamViecs.Find(id);
            if (lichLamViec == null)
            {
                return HttpNotFound();
            }
            return View(lichLamViec);
        }

        public ActionResult Create()
        {
            ViewBag.IDNguoiDung = new SelectList(db.NguoiDungs, "IDNguoiDung", "HoTen");
            ViewBag.IDQuanTri = new SelectList(db.QuanTris, "IDQuanTri", "TaiKhoan");
            return View();
        }

        // POST: Admin/LichLamViecs/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(List<EventModel> events, int IDQuanTri)
        {
            if (events == null || !events.Any())
            {
                return Json(new { success = false, message = "Danh sách sự kiện trống." });
            }

            if (ModelState.IsValid)
            {
                foreach (var eventItem in events)
                {
                    if (eventItem != null)
                    {
                        LichLamViec lichLamViec = new LichLamViec
                        {
                            BatDau = eventItem.BatDau,
                            KetThuc = eventItem.KetThuc,
                            IDQuanTri = IDQuanTri
                        };
                        db.LichLamViecs.Add(lichLamViec);
                    }
                }
                db.SaveChanges();
                return Json(new { success = true });
            }

            return Json(new { success = false, message = "Dữ liệu không hợp lệ." });
        }

        // GET: Admin/LichLamViecs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LichLamViec lichLamViec = db.LichLamViecs.Find(id);
            if (lichLamViec == null)
            {
                return HttpNotFound();
            }
            ViewBag.IDQuanTri = new SelectList(db.QuanTris, "IDQuanTri", "TaiKhoan", lichLamViec.IDQuanTri);
            return View(lichLamViec);
        }

        // POST: Admin/LichLamViecs/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDLichLamViec,BatDau,KetThuc,IDQuanTri")] LichLamViec lichLamViec)
        {
            if (ModelState.IsValid)
            {
                db.Entry(lichLamViec).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IDQuanTri = new SelectList(db.QuanTris, "IDQuanTri", "TaiKhoan", lichLamViec.IDQuanTri);
            return View(lichLamViec);
        }

        // GET: Admin/LichLamViecs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LichLamViec lichLamViec = db.LichLamViecs.Find(id);
            if (lichLamViec == null)
            {
                return HttpNotFound();
            }
            return View(lichLamViec);
        }

        // POST: Admin/LichLamViecs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LichLamViec lichLamViec = db.LichLamViecs.Find(id);
            db.LichLamViecs.Remove(lichLamViec);
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
