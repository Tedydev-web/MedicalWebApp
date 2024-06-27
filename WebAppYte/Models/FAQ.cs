namespace WebAppYte.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("FAQ")]
    public class FAQ
    {
        public int ID { get; set; }
        public string QuestionKeywords { get; set; }
        public string Answer { get; set; }
    }

}
