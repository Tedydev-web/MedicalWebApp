namespace Model.EF
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
        public string Quocgia { get; set; }

        public int? Socanhiem { get; set; }

        public int? Dangdieutri { get; set; }

        public int? Khoi { get; set; }

        public int? Tuvong { get; set; }

        [StringLength(10)]
        public string Ghichu { get; set; }
    }
}
