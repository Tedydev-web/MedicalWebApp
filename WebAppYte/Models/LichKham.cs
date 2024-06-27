namespace WebAppYte.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LichKham")]
    public partial class LichKham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public LichKham()
        {
            BenhAns = new HashSet<BenhAn>();
        }

        [Key]
        public int IDLichKham { get; set; }

        [StringLength(100)]
        [Display(Name = "Chủ đề")]
        public string ChuDe { get; set; }

        [StringLength(300)]
        [Display(Name = "Mô tả")]
        public string MoTa { get; set; }

        [Column(TypeName = "datetime")]
        [Display(Name = "Bắt đầu")]
        public DateTime? BatDau { get; set; }

        [Column(TypeName = "smalldatetime")]
        [Display(Name = "Kết thúc")]
        public DateTime? KetThuc { get; set; }
        [Display(Name = "Trạng thái")]
        public int? TrangThai { get; set; }

        [StringLength(100)]
        [Display(Name = "Link Zoom")]
        public string ZoomInfo { get; set; }

        [StringLength(200)]
        [Display(Name = "Kết quả khám")]
        public string KetQuaKham { get; set; }
        [Display(Name = "Người dùng")]
        public int? IDNguoiDung { get; set; }
        [Display(Name = "Bác sĩ")]
        public int? IDQuanTri { get; set; }

        [Display(Name = " Khoa")]
        public int? IDKhoa { get; set; }

        public virtual Khoa Khoa { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BenhAn> BenhAns { get; set; }

        public virtual NguoiDung NguoiDung { get; set; }

        public virtual QuanTri QuanTri { get; set; }
    }
}
