namespace WebAppYte.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NguoiDung")]
    public partial class NguoiDung
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public NguoiDung()
        {
            BenhAns = new HashSet<BenhAn>();
            HoiDaps = new HashSet<HoiDap>();
            LichKhams = new HashSet<LichKham>();
        }

        [Key]
        public int IDNguoiDung { get; set; }

        [StringLength(50)]
        [Display(Name = "Họ và tên")]
        public string HoTen { get; set; }

        [StringLength(100)]
        [Display(Name = "Địa chỉ Email")]
        public string Email { get; set; }

        [StringLength(20)]
        [Display(Name = "Điện thoại")]
        public string DienThoai { get; set; }

        [StringLength(50)]
        [Display(Name = "Tên tài khoản")]
        public string TaiKhoan { get; set; }
        [Display(Name = "Mật khẩu")]
        [StringLength(20)]
        public string MatKhau { get; set; }

        [Display(Name = "Giới tính")]
        public int? IDGioiTinh { get; set; }
        [Display(Name = "Địa chỉ cụ thể")]
        public string DiaChiCuThe { get; set; }
        [Display(Name = "Số chứng minh nhân dân")]
        public int? SoCMND { get; set; }
        [Display(Name = "Tỉnh")]
        public int? IDTinh { get; set; }
        [Display(Name = "Nhóm máu")]
        [StringLength(2)]
        public string NhomMau { get; set; }
        [Display(Name = "Thông tin khác")]
        public string ThongTinKhac { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BenhAn> BenhAns { get; set; }

        public virtual GioiTinh GioiTinh { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HoiDap> HoiDaps { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LichKham> LichKhams { get; set; }

        public virtual TinhThanh TinhThanh { get; set; }

        public virtual ICollection<HoSoSucKhoe> HoSoSucKhoes { get; set; }
    }
}
