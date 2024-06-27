namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LichKham")]
    public partial class LichKham
    {
        [Key]
        public int IDLichKham { get; set; }

        [StringLength(100)]
        public string ChuDe { get; set; }

        [StringLength(300)]
        public string MoTa { get; set; }

        public DateTime? BatDau { get; set; }

        public DateTime? KetThuc { get; set; }

        [StringLength(10)]
        public string GiaoDien { get; set; }

        public bool? LaCaNgay { get; set; }
    }
}
