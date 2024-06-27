namespace WebAppYte.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TrungTamGanNhat")]
    public partial class TrungTamGanNhat
    {
        [Key]
        public int IDTrungTam { get; set; }

        [StringLength(100)]
        public string TenTrungTam { get; set; }

        public string Mota { get; set; }

        public int? IDTinh { get; set; }

        public virtual TinhThanh TinhThanh { get; set; }
    }
}
