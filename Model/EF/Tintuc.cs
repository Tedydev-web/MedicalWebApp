namespace Model.EF
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

        public string Tieude { get; set; }

        public string Noidung { get; set; }

        [StringLength(100)]
        public string Hinhanh { get; set; }

        public string Mota { get; set; }

        [Column(TypeName = "smalldatetime")]
        public DateTime? Ngaydang { get; set; }
    }
}
