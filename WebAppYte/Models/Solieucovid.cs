namespace WebAppYte.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Solieucovid")]
    public partial class Solieucovid
    {
        [Key]
        public int IDThongkecovid { get; set; }

        [StringLength(50)]
        [Display(Name = "Quốc gia")]
        public string Quocgia { get; set; }
        [Display(Name = "Số ca nhiễm")]
        public int? Socanhiem { get; set; }

        [Display(Name = "Đang điều trị")]
        public int? Dangdieutri { get; set; }
        [Display(Name = "Đã khỏi")]
        public int? Khoi { get; set; }
        [Display(Name = "Tử vong")]
        public int? Tuvong { get; set; }
        [Display(Name = "Ghi chú")]
        [StringLength(10)]
        public string Ghichu { get; set; }
    }
}
