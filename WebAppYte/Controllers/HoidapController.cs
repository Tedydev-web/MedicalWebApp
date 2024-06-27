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
using WebAppYte.ViewModels;
namespace WebAppYte.Controllers
{
    public class HoidapController : Controller
    {
        private modelWeb db = new modelWeb();

        // GET: Hoidap
        public ActionResult Index(int? id, int? page)
        {
            IQueryable<HoiDap> hoiDaps = null;
            var u = Session["user"] as WebAppYte.Models.NguoiDung;

            if (u != null)
            {
                hoiDaps = db.HoiDaps.Include(h => h.NguoiDung).Include(h => h.QuanTri)
                    .Where(h => h.IDNguoiDung == id && h.TrangThai == 1)
                    .OrderByDescending(x => x.NgayGui).ThenBy(x => x.IDHoidap);
            }
            else if (u == null)
            {
                hoiDaps = db.HoiDaps.Include(h => h.NguoiDung).Include(h => h.QuanTri)
                    .Where(h => h.IDNguoiDung == id && (h.TrangThai == 1 || h.TrangThai == 0))
                    .OrderByDescending(x => x.NgayGui).ThenBy(x => x.IDHoidap);
            }

            int pageSize = 5;
            int pageNumber = (page ?? 1);
            ViewBag.id = id;
            return View(hoiDaps.ToPagedList(pageNumber, pageSize));
        }


        public ActionResult ListAll(int? page)
        {
            if (page == null) page = 1;
            var hoiDaps = db.HoiDaps.Include(h => h.NguoiDung).Include(h => h.QuanTri).Where(n=>n.TrangThai==1)
                .OrderByDescending(x => x.NgayGui).ThenBy(x => x.IDHoidap).ToList();
            int pageSize = 5;
            int pageNumber = (page ?? 1);
            return View(hoiDaps.ToPagedList(pageNumber, pageSize));
        }

        public ActionResult Cauhoichoxuly(int? id, int? page)
        {
            int? idNguoiDung = id;

            // Kiểm tra cookie để lấy IDNguoiDung nếu id là null
            if (!idNguoiDung.HasValue && Request.Cookies["IDNguoiDung"] != null)
            {
                idNguoiDung = int.Parse(Request.Cookies["IDNguoiDung"].Value);
            }
            var hoiDaps = db.HoiDaps.Include(h => h.NguoiDung).Include(h => h.QuanTri).Where(h => h.IDNguoiDung == id && h.TrangThai == 0)
                .OrderByDescending(x => x.NgayGui).ThenBy(x => x.IDHoidap).ToList();
            int pageSize = 5;
            int pageNumber = (page ?? 1);
            ViewBag.id = id;
            return View(hoiDaps.ToPagedList(pageNumber, pageSize));
        }


        // GET: Hoidap/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HoiDap hoiDap = db.HoiDaps.Find(id);
            if (hoiDap == null)
            {
                return HttpNotFound();
            }
            return View(hoiDap);
        }

        public string FindAnswerForKeywords(string question)
        {
            // Tách câu hỏi thành từng từ khoá
            var keywords = question.Split(new char[] { ' ', '.', '?', '!', ',' }, StringSplitOptions.RemoveEmptyEntries);

            // Tìm câu trả lời trong cơ sở dữ liệu dựa trên từ khoá
            foreach (var keyword in keywords)
            {
                var faq = db.FAQs.FirstOrDefault(f => f.QuestionKeywords.Contains(keyword));
                if (faq != null)
                {
                    return faq.Answer;
                }
            }

            return null; 
        }

        // GET: Hoidap/Create
        public ActionResult CreateGuest(int? id)
        {
            ViewBag.IDNguoiDung = new SelectList(db.NguoiDungs.Where(h => h.IDNguoiDung == id), "IDNguoiDung", "HoTen");
            ViewBag.IDQuanTri = new SelectList(db.QuanTris, "IDQuanTri", "TaiKhoan");
            ViewBag.TenKhoa = new SelectList(db.Khoas, "IDKhoa", "TenKhoa");
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        [Route("/Hoidap/CreateGuest")]
        public ActionResult CreateGuest(HoiDapViewModel viewModel)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    NguoiDung nguoiDungMoi = new NguoiDung
                    {
                        HoTen = viewModel.HoTen,
                        DienThoai = viewModel.SDT,
                    };

                    db.NguoiDungs.Add(nguoiDungMoi);
                    db.SaveChanges();

                    HttpCookie cookie = new HttpCookie("IDNguoiDung", nguoiDungMoi.IDNguoiDung.ToString());
                    cookie.Expires = DateTime.Now.AddHours(0.01);
                    Response.Cookies.Add(cookie);

                    var khoa = db.Khoas.FirstOrDefault(k => k.IDKhoa.ToString() == viewModel.HoiDap.GhiChu);
                    if (khoa != null)
                    {
                        
                        HoiDap hoiDapMoi = new HoiDap
                        {
                            IDNguoiDung = nguoiDungMoi.IDNguoiDung, 
                            CauHoi = viewModel.HoiDap.CauHoi,
                            GhiChu = khoa.TenKhoa, 
                            NgayGui = DateTime.Now,
                            TrangThai = 0 
                        };

                        var answer = FindAnswerForKeywords(hoiDapMoi.CauHoi);
                        if (answer != null)
                        {
                            hoiDapMoi.TraLoi = answer;
                            hoiDapMoi.TrangThai = 1;
                        }

                        db.HoiDaps.Add(hoiDapMoi);
                        db.SaveChanges();

                        return RedirectToAction("Index", "Hoidap", new { id = hoiDapMoi.IDNguoiDung });
                    }
                    else
                    {
                        ModelState.AddModelError(string.Empty, "Không tìm thấy bệnh tương ứng");
                    }
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError(string.Empty, "Đã xảy ra lỗi khi lưu câu hỏi. Vui lòng thử lại sau.");
                }
            }

            ViewBag.TenKhoa = new SelectList(db.Khoas, "TenKhoa", "TenKhoa");
            return View(viewModel);
        }

        public ActionResult SomeAction()
        {
            // Kiểm tra xem cookie "IDNguoiDung" có tồn tại không
            if (Request.Cookies["IDNguoiDung"] != null)
            {
                // Lấy cookie
                HttpCookie cookie = Request.Cookies["IDNguoiDung"];

                // Kiểm tra xem cookie đã hết hạn chưa
                if (cookie.Expires < DateTime.Now)
                {
                    // Cookie đã hết hạn, thông báo cho người dùng
                    ViewBag.Message = "Phiên chat đã hết hạn do quá thời gian phản hồi.";
                    return View("SessionExpired"); // Trả về một View thông báo phiên đã hết hạn
                }
                else
                {
                    // Xử lý logic của bạn ở đây nếu cookie còn hợp lệ
                }
            }
            else
            {
                // Cookie không tồn tại, có thể là người dùng mới hoặc đã xóa cookie
                // Xử lý tương ứng, ví dụ: chuyển hướng đến trang đăng nhập hoặc tạo mới phiên làm việc
            }

            // Tiếp tục xử lý nếu cần
            return View();
        }

        // GET: Hoidap/Create
        public ActionResult Create(int? id)
        {
            ViewBag.IDNguoiDung = new SelectList(db.NguoiDungs.Where(h => h.IDNguoiDung==id), "IDNguoiDung", "HoTen");
            ViewBag.IDQuanTri = new SelectList(db.QuanTris, "IDQuanTri", "TaiKhoan");
            return View();
        }

        // POST: Hoidap/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDHoidap,CauHoi,TraLoi,IDNguoiDung,IDQuanTri,NgayGui,GhiChu,TrangThai")] HoiDap hoiDap)
        {
            if (ModelState.IsValid)
            {
                var d = DateTime.Now;
                hoiDap.NgayGui = d;

                var answer = FindAnswerForKeywords(hoiDap.CauHoi);
                if (answer != null)
                {
                    hoiDap.TraLoi = answer;
                    hoiDap.TrangThai = 1;
                    db.HoiDaps.Add(hoiDap);
                    db.SaveChanges();

                    return RedirectToAction("Index", "Hoidap", new { id = hoiDap.IDNguoiDung });
                }
                else
                {
                    hoiDap.TrangThai = 0;
                    db.HoiDaps.Add(hoiDap);
                    db.SaveChanges();

                    return RedirectToAction("Cauhoichoxuly", "Hoidap", new { id = hoiDap.IDNguoiDung });
                }
            }

            ViewBag.IDNguoiDung = new SelectList(db.NguoiDungs, "IDNguoiDung", "HoTen", hoiDap.IDNguoiDung);
            ViewBag.IDQuanTri = new SelectList(db.QuanTris, "IDQuanTri", "TaiKhoan", hoiDap.IDQuanTri);
            return View(hoiDap);
        }

        // GET: Hoidap/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HoiDap hoiDap = db.HoiDaps.Find(id);
            if (hoiDap == null)
            {
                return HttpNotFound();
            }
            ViewBag.IDNguoiDung = new SelectList(db.NguoiDungs.Where(x => x.IDNguoiDung == hoiDap.IDNguoiDung), "IDNguoiDung", "HoTen", hoiDap.IDNguoiDung);
            ViewBag.IDQuanTri = new SelectList(db.QuanTris.Where(x => x.IDQuanTri == hoiDap.IDQuanTri), "IDQuanTri", "HoTen", hoiDap.IDQuanTri);
            return View(hoiDap);
        }

        // POST: Hoidap/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDHoidap,CauHoi,TraLoi,IDNguoiDung,IDQuanTri,NgayGui,GhiChu,TrangThai")] HoiDap hoiDap)
        {
            if (ModelState.IsValid)
            {
                db.Entry(hoiDap).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IDNguoiDung = new SelectList(db.NguoiDungs, "IDNguoiDung", "HoTen", hoiDap.IDNguoiDung);
            ViewBag.IDQuanTri = new SelectList(db.QuanTris, "IDQuanTri", "TaiKhoan", hoiDap.IDQuanTri);
            return View(hoiDap);
        }

        // GET: Hoidap/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HoiDap hoiDap = db.HoiDaps.Find(id);
            if (hoiDap == null)
            {
                return HttpNotFound();
            }
            return View(hoiDap);
        }

        // POST: Hoidap/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            HoiDap hoiDap = db.HoiDaps.Find(id);
            db.HoiDaps.Remove(hoiDap);
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
