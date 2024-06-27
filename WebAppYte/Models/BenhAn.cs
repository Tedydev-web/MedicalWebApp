namespace WebAppYte.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BenhAn")]
    public partial class BenhAn
    {
        [Key]
        public int IDBenhAn { get; set; }
        [Display(Name = " Kết quả")]
        public string KetQua { get; set; }

        [Display(Name = " Thời gian khám")]
        [Column(TypeName = "smalldatetime")]
        public DateTime? ThoiGian { get; set; }

        [StringLength(50)]
        [Display(Name = " Bác sỹ khám")]
        public string BacSyKham { get; set; }

        [StringLength(200)]
        [Display(Name = " Đơn thuốc")]
        public string DonThuoc { get; set; }
        [Display(Name = " Ghi chú")]
        public string GhiChu { get; set; }

        public int? IDNguoiDung { get; set; }

        public int? IDLichKham { get; set; }

        public virtual LichKham LichKham { get; set; }

        public virtual NguoiDung NguoiDung { get; set; }
    }
}
