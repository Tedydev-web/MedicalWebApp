namespace WebAppYte.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Tintuc")]
    public partial class Tintuc
    {
        [Key]
        public int IDTintuc { get; set; }
        [Display(Name ="Tiêu đề")]
        public string Tieude { get; set; }
        [Display(Name = "Nội dung")]
        public string Noidung { get; set; }
        [Display(Name = "Hình ảnh")]
        [StringLength(100)]
        public string Hinhanh { get; set; }
        [Display(Name = "Mô tả")]
        public string Mota { get; set; }
        [Display(Name = "Thể loại")]
        public string TheLoai { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? Ngaydang { get; set; }
    }
}
