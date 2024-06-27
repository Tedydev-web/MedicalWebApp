using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Core.Common.CommandTrees.ExpressionBuilder;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebAppYte.Models;
using System.Data.Entity.Core.Metadata.Edm;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Diagnostics;


namespace WebAppYte.Areas.Admin.Controllers
{
    public class HoSoSucKhoesController : Controller
    {
        private modelWeb db = new modelWeb();

        // GET: Admin/HoSoSucKhoes
        public ActionResult Index(int? idNguoiDung)
        {
            var hoSoSucKhoes = db.HoSoSucKhoes.Include(h => h.NguoiDung).Include(h => h.QuanTri);

            if (idNguoiDung.HasValue)
            {
                hoSoSucKhoes = hoSoSucKhoes.Where(h => h.IDNguoiDung == idNguoiDung.Value);
            }

            return View(hoSoSucKhoes.ToList());
        }
     
        // GET: Admin/HoSoSucKhoes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HoSoSucKhoe hoSoSucKhoe = db.HoSoSucKhoes.Find(id);
            if (hoSoSucKhoe == null)
            {
                return HttpNotFound();
            }
            return View(hoSoSucKhoe);
        }

        // GET: Admin/HoSoSucKhoes/Create
        public ActionResult Create()
        {
            ViewBag.IDNguoiDung = new SelectList(db.NguoiDungs, "IDNguoiDung", "HoTen");
            ViewBag.IDQuanTri = new SelectList(db.QuanTris, "IDQuanTri", "TaiKhoan");
            return View();
        }

        // POST: "http://127.0.0.1:8800 Predict" Lệnh gọi API để nhận chuẩn đoán từ model AI
        private async Task<string> GetPredictionFromAI(HoSoSucKhoe hoSoSucKhoe)
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("http://127.0.0.1:8800"); // Địa chỉ API
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                var jsonContent = JsonConvert.SerializeObject(hoSoSucKhoe, new JsonSerializerSettings
                {
                    ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                });

                var contentString = new StringContent(jsonContent, System.Text.Encoding.UTF8, "application/json");

                HttpResponseMessage response = await client.PostAsync("/predict", contentString);

                if (response.IsSuccessStatusCode)
                {
                    var resultString = await response.Content.ReadAsStringAsync();
                    Debug.WriteLine($"Phản hồi từ API: {resultString}");
                    try
                    {
                        var resultArray = JArray.Parse(resultString);
                        var result = string.Join("; ", resultArray.Select(r => r.ToString()));
                        return result;
                    }
                    catch (JsonReaderException jex)
                    {
                        Debug.WriteLine($"Lỗi phân tích JSON: {jex.Message}");
                        Debug.WriteLine($"Phản hồi gốc: {resultString}");

                        throw new Exception("Không thể phân tích phản hồi từ model AI");
                    }
                }
                else
                {
                    throw new Exception("Không thể nhận dự đoán từ model AI");
                }
            }
        }


        // POST: Admin/HoSoSucKhoes/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "IDHoSoSucKhoe,age,sex,cp,trestbps,chol,fbs,restecg,thalach,exang,oldpeak,slope,ca,thal,Glucose,Total_Bilirubin,Direct_Bilirubin,Alkaline_Phosphotase,Alamine_Aminotransferase,Aspartate_Aminotransferase,Total_Protiens,Albumin,Albumin_and_Globulin_Ratio,BMI,Bt,hearingability,Eyes,skinpig,ure,creatinine,Amylase,Lipase,Natri,Kali,triglycerides,CRP,ESR,sp,hp,bodypain,Skin,Insulin,IDNguoiDung,IDQuanTri,CreateOn")] HoSoSucKhoe hoSoSucKhoe)
        {
            if (ModelState.IsValid)
            {
                hoSoSucKhoe.KetQua = await GetPredictionFromAI(hoSoSucKhoe); //Call API để chuẩn đoán
                db.HoSoSucKhoes.Add(hoSoSucKhoe);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IDNguoiDung = new SelectList(db.NguoiDungs, "IDNguoiDung", "HoTen", hoSoSucKhoe.IDNguoiDung);
            ViewBag.IDQuanTri = new SelectList(db.QuanTris, "IDQuanTri", "TaiKhoan", hoSoSucKhoe.IDQuanTri);
            return View(hoSoSucKhoe);
        }


        // GET: Admin/HoSoSucKhoes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HoSoSucKhoe hoSoSucKhoe = db.HoSoSucKhoes.Find(id);
            if (hoSoSucKhoe == null)
            {
                return HttpNotFound();
            }
            ViewBag.IDNguoiDung = new SelectList(db.NguoiDungs, "IDNguoiDung", "HoTen", hoSoSucKhoe.IDNguoiDung);
            ViewBag.IDQuanTri = new SelectList(db.QuanTris, "IDQuanTri", "TaiKhoan", hoSoSucKhoe.IDQuanTri);
            return View(hoSoSucKhoe);
        }

        // POST: Admin/HoSoSucKhoes/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IDHoSoSucKhoe,age,cp,trestbps,chol,fbs,restecg,thalach,exang,oldpeak,slope,ca,thal,Glucose,Total_Bilirubin,Direct_Bilirubin,Alkaline_Phosphotase,Alamine_Aminotransferase,Aspartate_Aminotransferase,Total_Protiens,Albumin,Albumin_and_Globulin_Ratio,BMI,Bt,hearingability,Eyes,skinpig,ure,creatinine,Amylase,Lipase,Natri,Kali,triglycerides,CRP,ESR,sp,hp,bodypain,Skin,Insulin,IDNguoiDung,IDQuanTri,CreateOn")] HoSoSucKhoe hoSoSucKhoe)
        {
            if (ModelState.IsValid)
            {
                db.Entry(hoSoSucKhoe).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IDNguoiDung = new SelectList(db.NguoiDungs, "IDNguoiDung", "HoTen", hoSoSucKhoe.IDNguoiDung);
            ViewBag.IDQuanTri = new SelectList(db.QuanTris, "IDQuanTri", "TaiKhoan", hoSoSucKhoe.IDQuanTri);
            return View(hoSoSucKhoe);
        }

        // GET: Admin/HoSoSucKhoes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HoSoSucKhoe hoSoSucKhoe = db.HoSoSucKhoes.Find(id);
            if (hoSoSucKhoe == null)
            {
                return HttpNotFound();
            }
            return View(hoSoSucKhoe);
        }

        // POST: Admin/HoSoSucKhoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            HoSoSucKhoe hoSoSucKhoe = db.HoSoSucKhoes.Find(id);
            db.HoSoSucKhoes.Remove(hoSoSucKhoe);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        // POST: Admin/HoSoSucKhoes/UpdateAsNew
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UpdateAsNew([Bind(Include = "IDHoSoSucKhoe,IDNguoiDung,IDQuanTri,cp,trestbps,chol,fbs,restecg,thalach,exang,oldpeak,slope,ca,thal,Glucose,Total_Bilirubin,ure,creatinine,Amylase,Lipase,Natri,Kali,triglycerides,Direct_Bilirubin,Alkaline_Phosphotase,Alamine_Aminotransferase,Aspartate_Aminotransferase,Total_Protiens,Albumin,Albumin_and_Globulin_Ratio,BMI,Bt,hearingability,Eyes,skinpig,CRP,ESR,sp,hp,bodypain,Skin,Insulin")] HoSoSucKhoe hoSoSucKhoe)
        {
            if (ModelState.IsValid)
            {
                var newHoSoSucKhoe = new HoSoSucKhoe();

                newHoSoSucKhoe = hoSoSucKhoe;
                newHoSoSucKhoe.IDHoSoSucKhoe = 0;

                db.HoSoSucKhoes.Add(newHoSoSucKhoe);
                db.SaveChanges();

                return RedirectToAction("Index");
            }

            return View(hoSoSucKhoe);
        }

        public ActionResult DownloadTemplate()
        {
            using (var package = new ExcelPackage())
            {
                var workSheet = package.Workbook.Worksheets.Add("Template");
                string[] columnHeaders = {
            "IDNguoiDung", "IDQuanTri", "age", "sex", "cp", "trestbps", "chol", "fbs", "restecg", "thalach", "exang", "oldpeak", "slope", "ca", "thal", "Glucose", "Total_Bilirubin", "Direct_Bilirubin", "Alkaline_Phosphotase", "Alamine_Aminotransferase", "Aspartate_Aminotransferase", "Total_Protiens", "Albumin", "Albumin_and_Globulin_Ratio", "BMI", "Bt", "hearingability", "Eyes", "skinpig", "ure", "creatinine", "Amylase", "Lipase", "Natri", "Kali", "triglycerides", "CRP", "ESR", "sp", "hp", "bodypain", "Skin", "Insulin"
        };
                for (int i = 0; i < columnHeaders.Length; i++)
                {
                    workSheet.Cells[1, i + 1].Value = columnHeaders[i];
                }

                var stream = new MemoryStream(package.GetAsByteArray());
                return File(stream, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "HoSoSucKhoeTemplate.xlsx");
            }
        }

        [HttpPost]
        public async Task<ActionResult> Import(HttpPostedFileBase postedFile)
        {
            try
            {
                string filePath = string.Empty;
                if (postedFile != null)
                {
                    string path = Server.MapPath("~/Upload/");
                    if (!Directory.Exists(path))
                    {
                        Directory.CreateDirectory(path);
                    }

                    filePath = path + Path.GetFileName(postedFile.FileName);
                    string extension = Path.GetExtension(postedFile.FileName);
                    postedFile.SaveAs(filePath);

                    string conString = string.Empty;
                    switch (extension)
                    {
                        case ".xls":
                            conString = ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString;
                            break;
                        case ".xlsx":
                            conString = ConfigurationManager.ConnectionStrings["Excel07ConString"].ConnectionString;
                            break;
                    }

                    DataTable dtExcel = new DataTable();
                    conString = string.Format(conString, filePath);
                    using (OleDbConnection connExcel = new OleDbConnection(conString))
                    {
                        using (OleDbCommand cmdExcel = new OleDbCommand())
                        {
                            using (OleDbDataAdapter odaExcel = new OleDbDataAdapter())
                            {
                                cmdExcel.Connection = connExcel;
                                connExcel.Open();
                                DataTable dtExcelSchema = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                                string sheetName = dtExcelSchema.Rows[0]["TABLE_NAME"].ToString();
                                connExcel.Close();

                                connExcel.Open();
                                cmdExcel.CommandText = "SELECT * FROM [" + sheetName + "]";
                                odaExcel.SelectCommand = cmdExcel;
                                odaExcel.Fill(dtExcel);
                                connExcel.Close();
                            }
                        }
                    }

                    conString = ConfigurationManager.ConnectionStrings["modelWeb"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(conString))
                    {
                        using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                        {
                            sqlBulkCopy.DestinationTableName = "dbo.[HoSoSucKhoe]";

                            sqlBulkCopy.ColumnMappings.Add("IDNguoiDung", "IDNguoiDung");
                            sqlBulkCopy.ColumnMappings.Add("IDQuanTri", "IDQuanTri");
                            sqlBulkCopy.ColumnMappings.Add("age", "age");
                            sqlBulkCopy.ColumnMappings.Add("cp", "cp");
                            sqlBulkCopy.ColumnMappings.Add("trestbps", "trestbps");
                            sqlBulkCopy.ColumnMappings.Add("chol", "chol");
                            sqlBulkCopy.ColumnMappings.Add("fbs", "fbs");
                            sqlBulkCopy.ColumnMappings.Add("restecg", "restecg");
                            sqlBulkCopy.ColumnMappings.Add("thalach", "thalach");
                            sqlBulkCopy.ColumnMappings.Add("exang", "exang");
                            sqlBulkCopy.ColumnMappings.Add("oldpeak", "oldpeak");
                            sqlBulkCopy.ColumnMappings.Add("slope", "slope");
                            sqlBulkCopy.ColumnMappings.Add("ca", "ca");
                            sqlBulkCopy.ColumnMappings.Add("thal", "thal");
                            sqlBulkCopy.ColumnMappings.Add("Glucose", "Glucose");
                            sqlBulkCopy.ColumnMappings.Add("Total_Bilirubin", "Total_Bilirubin");
                            sqlBulkCopy.ColumnMappings.Add("Direct_Bilirubin", "Direct_Bilirubin");
                            sqlBulkCopy.ColumnMappings.Add("Alkaline_Phosphotase", "Alkaline_Phosphotase");
                            sqlBulkCopy.ColumnMappings.Add("Alamine_Aminotransferase", "Alamine_Aminotransferase");
                            sqlBulkCopy.ColumnMappings.Add("Aspartate_Aminotransferase", "Aspartate_Aminotransferase");
                            sqlBulkCopy.ColumnMappings.Add("Total_Protiens", "Total_Protiens");
                            sqlBulkCopy.ColumnMappings.Add("Albumin", "Albumin");
                            sqlBulkCopy.ColumnMappings.Add("Albumin_and_Globulin_Ratio", "Albumin_and_Globulin_Ratio");
                            sqlBulkCopy.ColumnMappings.Add("sex", "sex");
                            sqlBulkCopy.ColumnMappings.Add("BMI", "BMI");
                            sqlBulkCopy.ColumnMappings.Add("Bt", "Bt");
                            sqlBulkCopy.ColumnMappings.Add("hearingability", "hearingability");
                            sqlBulkCopy.ColumnMappings.Add("Eyes", "Eyes");
                            sqlBulkCopy.ColumnMappings.Add("skinpig", "skinpig");
                            sqlBulkCopy.ColumnMappings.Add("ure", "ure");
                            sqlBulkCopy.ColumnMappings.Add("creatinine", "creatinine");
                            sqlBulkCopy.ColumnMappings.Add("Amylase", "Amylase");
                            sqlBulkCopy.ColumnMappings.Add("Lipase", "Lipase");
                            sqlBulkCopy.ColumnMappings.Add("Natri", "Natri");
                            sqlBulkCopy.ColumnMappings.Add("Kali", "Kali");
                            sqlBulkCopy.ColumnMappings.Add("triglycerides", "triglycerides");
                            sqlBulkCopy.ColumnMappings.Add("CRP", "CRP");
                            sqlBulkCopy.ColumnMappings.Add("ESR", "ESR");
                            sqlBulkCopy.ColumnMappings.Add("sp", "sp");
                            sqlBulkCopy.ColumnMappings.Add("hp", "hp");
                            sqlBulkCopy.ColumnMappings.Add("bodypain", "bodypain");
                            sqlBulkCopy.ColumnMappings.Add("Skin", "Skin");
                            sqlBulkCopy.ColumnMappings.Add("Insulin", "Insulin");

                            con.Open();
                            sqlBulkCopy.WriteToServer(dtExcel);
                            con.Close();
                        }
                    }
                    var hoSoSucKhoes = db.HoSoSucKhoes.Where(h => h.KetQua == null).ToList();
                    foreach (var hoSoSucKhoe in hoSoSucKhoes)
                    {
                        hoSoSucKhoe.KetQua = await GetPredictionFromAI(hoSoSucKhoe); //Call API để chuẩn đoán
                        db.Entry(hoSoSucKhoe).State = EntityState.Modified;
                    }
                    db.SaveChanges();
                }
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                throw new Exception("Lỗi từ file được Import", ex);
            }
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