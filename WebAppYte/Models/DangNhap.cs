using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace WebAppYte.Models
{
    public class DangNhap
    {
        [Key]
        [Display(Name = "Tài khoản")]
        public string TaiKhoan { get; set; }
        [Display(Name = "Mật khẩu")]
        public string MatKhau { get; set; }
    }
}