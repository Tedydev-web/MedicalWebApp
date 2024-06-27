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
    public class TrungTamGanNhatsController : Controller
    {
        private modelWeb db = new modelWeb();

        // GET: Admin/TrungTamGanNhats
        public ActionResult Index()
        {
            var trungTamGanNhats = db.TrungTamGanNhats.Include(t => t.TinhThanh);
            return View(trungTamGanNhats.ToList());
        }

        // GET: Admin/TrungTamGanNhats/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TrungTamGanNhat trungTamGanNhat = db.TrungTamGanNhats.Find(id);
            if (trungTamGanNhat == null)
            {
                return HttpNotFound();
            }
            return View(trungTamGanNhat);
        }

        // GET: Admin/TrungTamGanNhats/Create
        public ActionResult Create()
        {
            ViewBag.IDTinh = new SelectList(db.TinhThanhs, "IDTinh", "TenTinh");
            return View();
        }

        // POST: Admin/TrungTamGanNhats/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "IDTrungTam,TenTrungTam,Mota,IDTinh")] TrungTamGanNhat trungTamGanNhat)
        {
            if (ModelState.IsValid)
            {
                db.TrungTamGanNhats.Add(trungTamGanNhat);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IDTinh = new SelectList(db.TinhThanhs, "IDTinh", "TenTinh", trungTamGanNhat.IDTinh);
            return View(trungTamGanNhat);
        }

        // GET: Admin/TrungTamGanNhats/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TrungTamGanNhat trungTamGanNhat = db.TrungTamGanNhats.Find(id);
            if (trungTamGanNhat == null)
            {
                return HttpNotFound();
            }
            ViewBag.IDTinh = new SelectList(db.TinhThanhs, "IDTinh", "TenTinh", trungTamGanNhat.IDTinh);
            return View(trungTamGanNhat);
        }

        // POST: Admin/TrungTamGanNhats/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "IDTrungTam,TenTrungTam,Mota,IDTinh")] TrungTamGanNhat trungTamGanNhat)
        {
            if (ModelState.IsValid)
            {
                db.Entry(trungTamGanNhat).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IDTinh = new SelectList(db.TinhThanhs, "IDTinh", "TenTinh", trungTamGanNhat.IDTinh);
            return View(trungTamGanNhat);
        }

        // GET: Admin/TrungTamGanNhats/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TrungTamGanNhat trungTamGanNhat = db.TrungTamGanNhats.Find(id);
            if (trungTamGanNhat == null)
            {
                return HttpNotFound();
            }
            return View(trungTamGanNhat);
        }

        // POST: Admin/TrungTamGanNhats/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TrungTamGanNhat trungTamGanNhat = db.TrungTamGanNhats.Find(id);
            db.TrungTamGanNhats.Remove(trungTamGanNhat);
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
