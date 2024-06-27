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



        [HttpPost]
        public JsonResult CheckTimeSlotAvailability(DateTime selectedDate, string repeatType, int repeatCount)
        {
            List<object> overlaps = new List<object>();
            for (int i = 0; i <= repeatCount; i++)
            {
                DateTime checkDate = selectedDate;
                switch (repeatType)
                {
                    case "day":
                        checkDate = selectedDate.AddDays(i);
                        break;
                    case "week":
                        checkDate = selectedDate.AddDays(7 * i);
                        break;
                    case "month":
                        checkDate = selectedDate.AddMonths(i);
                        break;
                }

                var dayOverlaps = db.LichLamViecs.Where(llv => DbFunctions.TruncateTime(llv.BatDau) == checkDate.Date)
                    .Select(llv => new { llv.BatDau, llv.KetThuc })
                    .ToList();

                foreach (var overlap in dayOverlaps)
                {
                    overlaps.Add(new
                    {
                        date = checkDate.ToString("dd/MM/yyyy"),
                        timeSlot = overlap.BatDau.Value.ToString("HH:mm") + " - " + overlap.KetThuc.Value.ToString("HH:mm")
                    });
                }
            }

            return Json(new { overlaps = overlaps });
        }


        [HttpPost]
        public JsonResult CheckOverlap(DateTime batDau, DateTime ketThuc, int IDQuanTri, string repeatType, int repeatCount)
        {
            bool isOverlap = false;
            for (int i = 0; i < repeatCount; i++)
            {
                DateTime currentStart = batDau;
                DateTime currentEnd = ketThuc;
                switch (repeatType)
                {
                    case "day":
                        currentStart = batDau.AddDays(i);
                        currentEnd = ketThuc.AddDays(i);
                        break;
                    case "week":
                        currentStart = batDau.AddDays(7 * i);
                        currentEnd = ketThuc.AddDays(7 * i);
                        break;
                    case "month":
                        currentStart = batDau.AddMonths(i);
                        currentEnd = ketThuc.AddMonths(i);
                        break;
                }

                isOverlap = db.LichLamViecs.Any(llv =>
                    (llv.BatDau < currentEnd && currentStart < llv.KetThuc) &&
                    llv.IDQuanTri == IDQuanTri);

                if (isOverlap)
                {
                    break;
                }
            }

            return Json(new { isOverlap = isOverlap });
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Route("Admin/LichLamViecs/CreateBatch")]
        public ActionResult CreateBatch(List<EventModel> events, int IDQuanTri, string repeatType, int repeatCount)
        {
            if (events == null || !events.Any())
            {
                return Json(new { success = false, message = "Danh sách sự kiện trống." });
            }

            List<object> overlaps = new List<object>();

            foreach (var eventItem in events)
            {

                LichLamViec lichLamViec = new LichLamViec
                {
                    BatDau = eventItem.BatDau,
                    KetThuc = eventItem.KetThuc,
                    IDQuanTri = IDQuanTri
                };

                db.LichLamViecs.Add(lichLamViec);
            }

            if (overlaps.Any())
            {
                return Json(new { success = false, message = "Có trùng lặp trong các khung giờ đã chọn.", overlaps = overlaps });
            }

            db.SaveChanges();
            return Json(new { success = true });
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