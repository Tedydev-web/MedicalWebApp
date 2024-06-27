using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebAppYte.Models;
using PagedList;
namespace WebAppYte.Controllers
{
    public class LichkhamController : Controller
    {
        private modelWeb db = new modelWeb();

        // GET: Lichkham
        public ActionResult Index(int? id, int? page)
        {
            var lichKhams = db.LichKhams.Include(l => l.NguoiDung).Include(l => l.QuanTri)
                .Where(h => h.IDNguoiDung == id).OrderByDescending(x => x.BatDau).ThenBy(x => x.IDLichKham);
            int pageSize = 3;
            int pageNumber = (page ?? 1);
            ViewBag.id = id;
            return View(lichKhams.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult Dangxuly(int? id, int? page)
        {
            var lichKhams = db.LichKhams.Include(l => l.NguoiDung).Include(l => l.QuanTri)
                .Where(h => h.IDNguoiDung == id && h.TrangThai == 0).OrderByDescending(x => x.BatDau).ThenBy(x => x.IDLichKham);
            int pageSize = 3;
            int pageNumber = (page ?? 1);
            ViewBag.id = id;
            return View(lichKhams.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult Daxacnhan(int? id, int? page)
        {
            var lichKhams = db.LichKhams.Include(l => l.NguoiDung).Include(l => l.QuanTri)
                .Where(h => h.IDNguoiDung == id && h.TrangThai == 1).OrderByDescending(x => x.BatDau).ThenBy(x => x.IDLichKham);
            int pageSize = 3;
            int pageNumber = (page ?? 1);
            ViewBag.id = id;
            return View(lichKhams.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult Datuvanxong(int? id, int? page)
        {
            var lichKhams = db.LichKhams.Include(l => l.NguoiDung).Include(l => l.QuanTri)
                .Where(h => h.IDNguoiDung == id && h.TrangThai == 2).OrderByDescending(x => x.BatDau).ThenBy(x => x.IDLichKham);
            int pageSize = 3;
            int pageNumber = (page ?? 1);
            ViewBag.id = id;
            return View(lichKhams.ToPagedList(pageNumber, pageSize));
        }

        // GET: Lichkham/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LichKham lichKham = db.LichKhams.Find(id);
            if (lichKham == null)
            {
                return HttpNotFound();
            }
            return View(lichKham);
        }

        [HttpPost]
        public JsonResult KiemTraLichKham(int idQuanTri, DateTime ngayBatDau)
        {
            if (ngayBatDau < DateTime.Now)
            {
                return Json(new { success = false, message = "Thời gian bắt đầu không được nhỏ hơn thời gian hiện tại." });
            }

            bool isTimeSlotTaken = db.LichKhams.Any(lk => lk.IDQuanTri == idQuanTri
                && DbFunctions.TruncateTime(lk.BatDau) == DbFunctions.TruncateTime(ngayBatDau)
                && ((DbFunctions.DiffHours(lk.BatDau, ngayBatDau) < 2 && DbFunctions.DiffHours(lk.BatDau, ngayBatDau) >= 0)
                    || (DbFunctions.DiffHours(ngayBatDau, lk.BatDau) < 2 && DbFunctions.DiffHours(ngayBatDau, lk.BatDau) >= 0)));

            if (isTimeSlotTaken)
            {
                return Json(new { success = false, message = "Vui lòng chọn lịch khác, bác sĩ đã có lịch khám trong ngày này. Thời gian đặt lịch phải cách lịch khám của bác sĩ 2 tiếng" });
            }

            var lichLamViec = db.LichLamViecs.FirstOrDefault(llv => llv.IDQuanTri == idQuanTri
                && DbFunctions.TruncateTime(llv.BatDau) <= DbFunctions.TruncateTime(ngayBatDau)
                && DbFunctions.TruncateTime(llv.KetThuc) >= DbFunctions.TruncateTime(ngayBatDau));

            if (lichLamViec == null || ngayBatDau < lichLamViec.BatDau || ngayBatDau > lichLamViec.KetThuc)
            {
                return Json(new { success = false, message = "Thời gian bắt đầu không nằm trong lịch làm việc của bác sĩ." });
            }

            return Json(new { success = true });
        }

        public ActionResult Create()
        {
            var khoaSelectList = new SelectList(db.Khoas, "IDKhoa", "TenKhoa");
            ViewBag.IDKhoa = khoaSelectList;

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDLichKham,ChuDe,MoTa,BatDau,KetThuc,TrangThai,ZoomInfo,KetQuaKham,IDNguoiDung,IDQuanTri,IDKhoa")] LichKham lichKham)
        {
            if (lichKham.BatDau < DateTime.Now)
            {
                ModelState.AddModelError("BatDau", "Thời gian bắt đầu không được nhỏ hơn thời gian hiện tại.");
            }

            bool isTimeSlotTaken = db.LichKhams.Any(lk => lk.IDQuanTri == lichKham.IDQuanTri
                && DbFunctions.TruncateTime(lk.BatDau) == DbFunctions.TruncateTime(lichKham.BatDau)
                && ((DbFunctions.DiffHours(lk.BatDau, lichKham.BatDau) < 2 && DbFunctions.DiffHours(lk.BatDau, lichKham.BatDau) >= 0)
                    || (DbFunctions.DiffHours(lichKham.BatDau, lk.BatDau) < 2 && DbFunctions.DiffHours(lichKham.BatDau, lk.BatDau) >= 0)));

            if (isTimeSlotTaken)
            {
                ModelState.AddModelError("", "Vui lòng chọn lịch khác, bác sĩ đã có lịch khám trong ngày này và thời gian không cách nhau ít nhất 2 tiếng.");
            }

            if (ModelState.IsValid)
            {
                lichKham.TrangThai = 0;
                db.LichKhams.Add(lichKham);
                db.SaveChanges();
                return RedirectToAction("Index", "LichKham", new { id = lichKham.IDNguoiDung });
            }

            var khoaSelectList = new SelectList(db.Khoas, "IDKhoa", "TenKhoa");
            ViewBag.IDKhoa = khoaSelectList;

            return View(lichKham);
        }

        public JsonResult GetDoctorsByDepartment(int idKhoa)
        {
            var doctors = db.QuanTris
                .Where(b => b.IDKhoa == idKhoa && b.VaiTro == 2)
                .Select(b => new { b.IDQuanTri, b.HoTen })
                .ToList();
            return Json(doctors, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetAvailableSlots(int idKhoa, int? idQuanTri)
        {
            var availableSlots = new List<object>();

            var query = idQuanTri.HasValue ?
                        db.LichLamViecs.Where(llv => llv.IDQuanTri == idQuanTri.Value) :
                        db.LichLamViecs.Where(llv => db.QuanTris.Any(qt => qt.IDQuanTri == llv.IDQuanTri && qt.IDKhoa == idKhoa));

            var schedules = query.ToList();

            foreach (var schedule in schedules)
            {
                var appointments = db.LichKhams.Where(lk => lk.IDQuanTri == schedule.IDQuanTri && DbFunctions.TruncateTime(lk.BatDau) == DbFunctions.TruncateTime(schedule.BatDau)).ToList();

                var startTime = schedule.BatDau;
                while (startTime < schedule.KetThuc)
                {
                    var endTime = startTime.Value.AddHours(2);

                    if (endTime > schedule.KetThuc)
                    {
                        endTime = schedule.KetThuc.Value;
                    }

                    if (!appointments.Any(lk => lk.BatDau <= startTime && lk.KetThuc > startTime))
                    {
                        availableSlots.Add(new
                        {
                            title = "Lịch trống",
                            start = startTime.Value.ToString("dd/MM/yyyy - HH:mm:ss tt"),
                            end = endTime.ToString("dd/MM/yyyy - HH:mm:ss tt"),
                            spanText = $"{startTime.Value.ToString("HH:mm")} - {endTime.ToString("HH:mm")} - Lịch Trống",
                            idQuanTri = schedule.IDQuanTri
                        });
                    }


                    startTime = endTime;
                }
            }

            return Json(availableSlots, JsonRequestBehavior.AllowGet);
        }

        public JsonResult Lichdangluoi()
        {
            List<LichKham> l = db.LichKhams.ToList();
            var filteredLichKhams = l.Where(ll => ll.TrangThai != 0 && ll.TrangThai != 1);

            var events = filteredLichKhams.Select(ll => new
            {
                id = ll.IDLichKham,
                title = ll.ChuDe,
                start = ll.BatDau?.ToUniversalTime().AddHours(7).ToString("yyyy-MM-ddTHH:mm:ss") ?? string.Empty,
                end = ll.KetThuc?.ToUniversalTime().AddHours(7).ToString("yyyy-MM-ddTHH:mm:ss") ?? string.Empty,
            }).ToList();

            return new JsonResult { Data = events, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }


        // GET: Lichkham/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LichKham lichKham = db.LichKhams.Find(id);
            if (lichKham == null)
            {
                return HttpNotFound();
            }
            ViewBag.IDNguoiDung = new SelectList(db.NguoiDungs, "IDNguoiDung", "HoTen", lichKham.IDNguoiDung);
            ViewBag.IDQuanTri = new SelectList(db.QuanTris, "IDQuanTri", "TaiKhoan", lichKham.IDQuanTri);
            return View(lichKham);
        }

        // POST: Lichkham/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDLichKham,ChuDe,MoTa,BatDau,KetThuc,TrangThai,ZoomInfo,KetQuaKham,IDNguoiDung,IDQuanTri")] LichKham lichKham)
        {
            if (ModelState.IsValid)
            {
                db.Entry(lichKham).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IDNguoiDung = new SelectList(db.NguoiDungs, "IDNguoiDung", "HoTen", lichKham.IDNguoiDung);
            ViewBag.IDQuanTri = new SelectList(db.QuanTris, "IDQuanTri", "TaiKhoan", lichKham.IDQuanTri);
            return View(lichKham);
        }

        // GET: Lichkham/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LichKham lichKham = db.LichKhams.Find(id);
            if (lichKham == null)
            {
                return HttpNotFound();
            }
            return View(lichKham);
        }

        // POST: Lichkham/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LichKham lichKham = db.LichKhams.Find(id);
            db.LichKhams.Remove(lichKham);
            db.SaveChanges();
            return RedirectToAction("Index");
        }


        private static DateTime ConvertFromUnixTimestamp(double timestamp)
        {
            var origin = new DateTime(1970, 1, 1, 0, 0, 0, 0);
            return origin.AddSeconds(timestamp);
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
