using System;
using System.Collections.Generic;
using System.Text;

namespace MyProject2.Models
{
    public class Etiket
    {

        public int ID { get; set; }

        public int UrunID { get; set; }
        public Urun Urun { get; set; }

        public DateTime UretimTarihi { get; set; }
        public DateTime SonTuketimTarihi { get; set; }

        public int Miktar { get; set; }


    }
}
