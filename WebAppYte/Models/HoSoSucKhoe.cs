namespace WebAppYte.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HoSoSucKhoe")]
    public partial class HoSoSucKhoe
    {
        [Key]
        public int IDHoSoSucKhoe { get; set; }
        [Required]
        public DateTime CreateOn { get; set; } = DateTime.Now;
        public int age { get; set; }
        public int sex { get; set; }
        public decimal cp { get; set; }
        public decimal trestbps { get; set; }
        public decimal chol { get; set; }
        public decimal fbs { get; set; }
        public decimal restecg { get; set; }
        public decimal thalach { get; set; }
        public decimal exang { get; set; }
        public decimal oldpeak { get; set; }
        public decimal slope { get; set; }
        public decimal ca { get; set; }
        public decimal thal { get; set; }
        public decimal Glucose { get; set; }
        public decimal Total_Bilirubin { get; set; }
        public decimal Direct_Bilirubin { get; set; }
        public decimal Alkaline_Phosphotase { get; set; }
        public decimal Alamine_Aminotransferase { get; set; }
        public decimal Aspartate_Aminotransferase { get; set; }
        public decimal Total_Protiens { get; set; }
        public decimal Albumin { get; set; }
        public decimal Albumin_and_Globulin_Ratio { get; set; }
        public decimal BMI { get; set; }
        public decimal Bt { get; set; }
        public decimal hearingability { get; set; }
        public decimal Eyes { get; set; }
        public decimal skinpig { get; set; }
        public decimal ure { get; set; }
        public decimal creatinine { get; set; }
        public decimal Amylase { get; set; }
        public decimal Lipase { get; set; }
        public decimal Natri { get; set; }
        public decimal Kali { get; set; }
        public decimal triglycerides { get; set; }
        public decimal CRP { get; set; }
        public decimal ESR { get; set; }
        public decimal sp { get; set; }
        public decimal hp { get; set; }
        public decimal bodypain { get; set; }
        public decimal Skin { get; set; }
        public decimal Insulin { get; set; }
        public string KetQua { get; set; }
        [Display(Name = "Người dùng")]
        public int? IDNguoiDung { get; set; }
        [Display(Name = "Bác sĩ")]
        public int? IDQuanTri { get; set; }
        public virtual NguoiDung NguoiDung { get; set; }

        public virtual QuanTri QuanTri { get; set; }
    }
}