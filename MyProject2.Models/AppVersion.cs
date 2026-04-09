using System;
using System.Collections.Generic;
using System.Text;

namespace MyProject2.Models
{
    public class AppVersion
    {


        public int ID { get; set; }
        public string? VersionNo { get; set; }
        public string? Description { get; set; }
        public DateTime CreatedDate { get; set; }


    }
}
