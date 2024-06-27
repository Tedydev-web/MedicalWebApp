namespace WebAppYte.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HoiDap")]
    public partial class HoiDap
    {
        [Key]
        public int IDHoidap { get; set; }
        [Display(Name = "Câu hỏi")]
        public string CauHoi { get; set; }
        [Display(Name = "Câu trả lời")]
        public string TraLoi { get; set; }
        [Display(Name = "Người dùng")]
        public int? IDNguoiDung { get; set; }
        [Display(Name = "Bác sĩ")]
        public int? IDQuanTri { get; set; }
        [Display(Name = "Ngày gửi")]
        [Column(TypeName = "smalldatetime")]
        public DateTime? NgayGui { get; set; }
        [Display(Name = "Ghi chú")]
        public string GhiChu { get; set; }
        [Display(Name = "Trạng thái")]
        public int? TrangThai { get; set; }

        public virtual NguoiDung NguoiDung { get; set; }

        public virtual QuanTri QuanTri { get; set; }
    }
}
