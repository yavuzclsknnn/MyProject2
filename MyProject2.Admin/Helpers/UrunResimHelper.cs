using MyProject2.Common;
using MyProject2.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Windows.Documents;
using System.Windows.Media;
using System.Windows.Media.Imaging;

namespace MyProject2.Admin.Helpers
{
    public static class UrunResimHelper
    {


        #region _Placeholder 


        private static BitmapImage? _Placeholder;

        private static BitmapImage Placeholder
        {
            get
            {
                if (_Placeholder == null)
                {
                    try
                    {
                        //var path = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Images/UrunResimleri/no-image.png");

                        var path = Path.Combine(AppPaths.ImagePath, "no-image.png");

                        if (!File.Exists(path))
                            path = ""; // fallback boş bitmap

                        _Placeholder = new BitmapImage();
                        _Placeholder.BeginInit();
                        _Placeholder.CacheOption = BitmapCacheOption.OnLoad;
                        _Placeholder.UriSource = new Uri(path, UriKind.Absolute);
                        _Placeholder.EndInit();
                        _Placeholder.Freeze();
                    }
                    catch
                    {
                        _Placeholder = new BitmapImage(); // boş fallback
                    }
                }

                return _Placeholder;
            }
        }




        #endregion




        #region LoadBitmap 


        private static BitmapImage LoadBitmap(string path)
        {
            if (!File.Exists(path))
                return null!; // placeholder yoksa null dönecek

            var bmp = new BitmapImage();
            bmp.BeginInit();
            bmp.CacheOption = BitmapCacheOption.OnLoad;
            bmp.UriSource = new Uri(path, UriKind.Absolute);
            bmp.EndInit();
            bmp.Freeze();
            return bmp;
        }

        #endregion



        #region IlkResimGetir


        public static ImageSource? IlkResimGetir(Urun urun)
        {
            if (urun.Resimler == null || urun.Resimler.Count == 0)
                return Placeholder;

            var resim = urun.Resimler
                .Where(x => !x.Silindi && x.Aktif)
                .OrderByDescending(x => x.AnaResimMi)
                .ThenBy(x => x.SiraNo)
                .FirstOrDefault();

            if (resim == null || !File.Exists(resim.FullPath!))
                return Placeholder;

            return resim.ImageSource!;
        }

        #endregion




        #region MuhafazaIconGetir

        // =========================================
        // GÜNCELLENMİŞ MÜHAFAZA İKON METODU
        // =========================================
        public static ImageSource MuhafazaIconGetir(MuhafazaKosulu? muhafaza)
        {
            if (muhafaza == null || string.IsNullOrWhiteSpace(muhafaza.Tanim))
                return Placeholder;

            // Sözlük ile eşleme (küçük/büyük harf farkını ignore ediyor)
            var muhafazaIcons = new Dictionary<string, string>(StringComparer.InvariantCultureIgnoreCase)
            {
                { "buzdolabı", "fridge_icon.png" },
                { "oda sıcaklığı", "roodTemp_Icon.png" },
                { "vakumlu paket", "vacuumPack_icon.png" },
                { "güneş görmeyen yer", "gunesGormeyenYer_Icon.png" },
                { "açıkta", "acikta_icon.png" },
                { "derin dondurucu", "freezer.png" },
                { "Özel Saklama", "OzelSaklama_Icon.png" },
                { "Nemli Ortam", "NemliOrtam_Icon.png" }
            };

            string key = muhafaza.Tanim.Trim();
            muhafazaIcons.TryGetValue(key, out string? fileName);

            if (string.IsNullOrEmpty(fileName))
                return Placeholder;


            // eğer sözlükte yoksa noname.png
            if (string.IsNullOrEmpty(fileName))
                fileName = "no-image.png";


            //   string fullPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Images/UrunResimleri", fileName);

            string fullPath = Path.Combine(AppPaths.ImagePath, fileName);

            if (!File.Exists(fullPath))
                 fullPath = Path.Combine(AppPaths.ImagePath, "noname.png");

          

            return LoadBitmap(fullPath);
        }



        #endregion




    }
}
