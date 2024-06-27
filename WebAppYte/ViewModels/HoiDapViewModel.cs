using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAppYte.ViewModels
{
    public class HoiDapViewModel
    {
        public WebAppYte.Models.HoiDap HoiDap { get; set; }
        public string HoTen { get; set; }
        public string SDT { get; set; }
        public WebAppYte.Models.Khoa Khoa { get; set; }
    }
}