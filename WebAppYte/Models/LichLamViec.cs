namespace WebAppYte.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("LichLamViec")]
    public partial class LichLamViec
    {
        [Key]
        public int IDLichLamViec { get; set; }

        [Column(TypeName = "smalldatetime")]
        [Display(Name = "Bắt đầu")]
        public DateTime? BatDau { get; set; }

        [Column(TypeName = "smalldatetime")]
        [Display(Name = "Kết thúc")]
        public DateTime? KetThuc { get; set; }

        [Display(Name = "Bác sĩ")]
        public int? IDQuanTri { get; set; }

        [ForeignKey("IDQuanTri")]
        public virtual QuanTri QuanTri { get; set; }
    }
}
