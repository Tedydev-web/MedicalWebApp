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
    public class SolieucovidsController : Controller
    {
        private modelWeb db = new modelWeb();

        // GET: Admin/Solieucovids
        public ActionResult Index()
        {
            return View(db.Solieucovids.ToList());
        }

        // GET: Admin/Solieucovids/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Solieucovid solieucovid = db.Solieucovids.Find(id);
            if (solieucovid == null)
            {
                return HttpNotFound();
            }
            return View(solieucovid);
        }

        // GET: Admin/Solieucovids/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Solieucovids/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IDThongkecovid,Quocgia,Socanhiem,Dangdieutri,Khoi,Tuvong,Ghichu")] Solieucovid solieucovid)
        {
            if (ModelState.IsValid)
            {
                db.Solieucovids.Add(solieucovid);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(solieucovid);
        }

        // GET: Admin/Solieucovids/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Solieucovid solieucovid = db.Solieucovids.Find(id);
            if (solieucovid == null)
            {
                return HttpNotFound();
            }
            return View(solieucovid);
        }

        // POST: Admin/Solieucovids/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDThongkecovid,Quocgia,Socanhiem,Dangdieutri,Khoi,Tuvong,Ghichu")] Solieucovid solieucovid)
        {
            if (ModelState.IsValid)
            {
                db.Entry(solieucovid).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(solieucovid);
        }

        // GET: Admin/Solieucovids/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Solieucovid solieucovid = db.Solieucovids.Find(id);
            if (solieucovid == null)
            {
                return HttpNotFound();
            }
            return View(solieucovid);
        }

        // POST: Admin/Solieucovids/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Solieucovid solieucovid = db.Solieucovids.Find(id);
            db.Solieucovids.Remove(solieucovid);
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
