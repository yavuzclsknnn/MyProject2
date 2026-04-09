using MyProject2.Common;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Windows.Media;
using System.Windows.Media.Imaging;

namespace MyProject2.Models
{
    public class Resim
    {


        public int ResimID { get; set; }
        public int UrunID { get; set; }
        public int SiraNo { get; set; }
        public string? ResimAdi { get; set; }
        public string? DosyaYolu { get; set; }
        public bool AnaResimMi { get; set; }
        public bool Silindi { get; set; }
        public bool Aktif { get; set; }


        public string DosyaAdi => Path.GetFileName(DosyaYolu ?? "");


        //   public string? FullPath => string.IsNullOrEmpty(DosyaYolu) ? null : Path.Combine(AppDomain.CurrentDomain.BaseDirectory, DosyaYolu);

   
        public string? FullPath => string.IsNullOrEmpty(DosyaYolu) ? null : Path.Combine(AppPaths.ImagePath, DosyaYolu);


        public ImageSource? ImageSource
        {


            get
            {

                if (string.IsNullOrEmpty(FullPath) || !File.Exists(FullPath))
                    return null;

                var bitmap = new BitmapImage();
                bitmap.BeginInit();
                bitmap.CacheOption = BitmapCacheOption.OnLoad; // 🔑 kilitlemeyi önler
                bitmap.UriSource = new Uri(FullPath);
                bitmap.EndInit();
                bitmap.Freeze();
                return bitmap;
            }


        }



    }
}
