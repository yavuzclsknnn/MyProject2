using Microsoft.Win32;
using MyProject2.Common;
using MyProject2.Models;
using MyProject2.Repositories;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Windows;
using System.Windows.Media.Imaging;

namespace MyProject2.Services
{
    public class ResimService
    {




        #region   

        private readonly ResimRepository _resimRepo = new ResimRepository();



        public List<Resim> GetUrunResimler(int urunID) => _resimRepo.GetUrunResimler(urunID);



        public Resim? GetByID(int id) => _resimRepo.GetByID(id);



        public int Insert(Resim resim) => _resimRepo.Insert(resim);



        public bool Update(Resim resim) => _resimRepo.Update(resim);




        public bool Delete(int resimID) => _resimRepo.Delete(resimID);



        public bool AktifUpdate(int resimID, bool durum) => _resimRepo.AktifUpdate(resimID, durum);




        // 🔥 Fiziksel klasör (disk)
        //private readonly string basePath = Path.Combine(
        //    AppDomain.CurrentDomain.BaseDirectory,
        //    "Images",
        //    "UrunResimleri"
        //);

        private readonly string basePath = Path.Combine(AppPaths.ImagePath);




        // 🔥 DB'de tutulacak path (relative)
        // private readonly string relativeFolder = Path.Combine("Images", "UrunResimleri");

        private readonly string relativeFolder = Path.Combine(AppPaths.ImagePath, "Images", "UrunResimleri");



        #endregion




        #region ResimEkle 

        public List<Resim> ResimEkle(Urun urun)
        {



            OpenFileDialog dlg = new OpenFileDialog
            {
                Multiselect = true,
                Filter = "Image Files|*.jpg;*.png;*.jpeg"
            };

            if (dlg.ShowDialog() != true)
                return new List<Resim>();

            // klasör yoksa oluştur
            if (!Directory.Exists(basePath))
                Directory.CreateDirectory(basePath);

            int mevcutSira = urun.Resimler.Count;

            List<Resim> yeniResimler = new List<Resim>();

            foreach (var file in dlg.FileNames)
            {
                mevcutSira++;

                string extension = Path.GetExtension(file);

                // 🔥 benzersiz isim
                string uniqueName = Guid.NewGuid().ToString() + extension;

                // 🔥 disk yolu
                string fullPath = Path.Combine(basePath, uniqueName);

                // 🔥 DB yolu (relative)
                // string relativePath = Path.Combine(relativeFolder, uniqueName);
                 

                File.Copy(file, fullPath, true);

                var resim = new Resim
                {
                    UrunID = urun.UrunID,
                    /// DosyaYolu = relativePath, // 🔥 ARTIK RELATIVE
                    DosyaYolu = uniqueName,  //SADECE DOSYA ADI
                    SiraNo = mevcutSira,
                    ResimAdi = $"Resim {mevcutSira}",
                    Aktif = true,
                    Silindi = false
                };

                urun.Resimler.Add(resim);
                yeniResimler.Add(resim);
            }

            return yeniResimler;
        }

        #endregion



        #region ResimSil 

        public void ResimSil(Urun urun, Resim resim)
        {
            if (resim == null) return;


            //  string fullPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, resim.DosyaYolu ?? string.Empty);


            string fullPath = Path.Combine(AppPaths.ImagePath, resim.DosyaYolu ?? string.Empty);

            // 🔥 fiziksel silme
            if (File.Exists(fullPath))
            {
                File.Delete(fullPath);
            }

            urun.Resimler.Remove(resim);

            // 🔥 sıraları düzelt
            int sira = 1;
            foreach (var r in urun.Resimler.OrderBy(x => x.SiraNo))
            {
                r.SiraNo = sira;
                r.ResimAdi = $"Resim {sira}";
                sira++;
            }
        }




        #endregion



        #region ResimleriSirala 

        public void ResimleriSirala(Urun urun)
        {
            int i = 1;
            foreach (var r in urun.Resimler.OrderBy(x => x.SiraNo))
            {
                r.SiraNo = i;
                r.ResimAdi = $"Resim {i}";
                i++;
            }
        }


        #endregion




        #region TempResimleriTemizle 

        // 🔥 TEMP DOSYA TEMİZLEME (EN ÖNEMLİ)
        public void TempResimleriTemizle(List<Resim> list)
        {

            foreach (var r in list)
            {

                if (string.IsNullOrEmpty(r.DosyaYolu))
                    continue;

                //string fullPath = Path.Combine( AppDomain.CurrentDomain.BaseDirectory, r.DosyaYolu);

                string fullPath = Path.Combine(AppPaths.ImagePath, r.DosyaYolu);

                if (File.Exists(fullPath))
                {
                    try
                    {
                        File.Delete(fullPath);
                    }
                    catch
                    {
                        // log atılabilir
                    }
                }
            }

            list.Clear();
        }

        #endregion




        #region CloneResimList 

        // Resimleri clone et
        public List<Resim> CloneResimList(List<Resim> list) =>
            list.Select(x => new Resim
            {
                ResimID = x.ResimID,
                UrunID = x.UrunID,
                SiraNo = x.SiraNo,
                ResimAdi = x.ResimAdi,
                AnaResimMi = x.AnaResimMi,
                Silindi = x.Silindi,
                Aktif = x.Aktif,
                DosyaYolu = x.DosyaYolu
            }).ToList();



        #endregion



        #region GosterResimPreview 


        // Preview göster
        public void GosterResimPreview(Resim resim, System.Windows.Controls.Image imageControl)
        {
            if (resim == null || string.IsNullOrWhiteSpace(resim.DosyaYolu))
            {
                imageControl.Source = null;
                return;
            }

            //string fullPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, resim.DosyaYolu);

            string fullPath = Path.Combine(AppPaths.ImagePath, resim.DosyaYolu);

            if (!File.Exists(fullPath))
            {
                imageControl.Source = null;
                return;
            }

            var bitmap = new BitmapImage();
            bitmap.BeginInit();
            bitmap.CacheOption = BitmapCacheOption.OnLoad;
            bitmap.UriSource = new Uri(fullPath);
            bitmap.EndInit();
            bitmap.Freeze();
            imageControl.Source = bitmap;
        }


        #endregion




        #region KaydetYeniResimler 

        // Yeni eklenen resimleri kaydet
        public void KaydetYeniResimler(int urunID, List<Resim> tempList)
        {
            foreach (var r in tempList)
            {
                r.UrunID = urunID;
                _resimRepo.Insert(r);
            }
            tempList.Clear();
        }


        #endregion



        #region GuncelleResimler 

        // Resimleri güncelle
        public void GuncelleResimler(Urun urun, List<Resim> originalList, List<Resim> tempList, List<Resim> silinenList, Resim? selectedResim, System.Windows.Controls.Image preview)
        {
            // Aktif değişenleri güncelle
            foreach (var r in urun.Resimler)
            {
                var original = originalList.FirstOrDefault(x => x.ResimID == r.ResimID);
                if (original != null && original.Aktif != r.Aktif)
                {
                    _resimRepo.AktifUpdate(r.ResimID, r.Aktif);
                }
            }

            // Silinenleri kaldır
            foreach (var r in silinenList)
            {
                _resimRepo.Delete(r.ResimID);

                if (selectedResim == r)
                    preview.Source = null;

                if (!string.IsNullOrWhiteSpace(r.DosyaYolu))
                {
                    // string fullPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, r.DosyaYolu);

                    string fullPath = Path.Combine(AppPaths.ImagePath, r.DosyaYolu);

                    if (File.Exists(fullPath))
                        File.Delete(fullPath);
                }
            }

            // Yeni eklenenleri DB'ye ekle
            KaydetYeniResimler(urun.UrunID, tempList);

            silinenList.Clear();
        }


        #endregion



        #region SilResim 

        // Resim sil
        public void SilResim(Resim resim, List<Resim> currentList, List<Resim> tempList, List<Resim> silinenList, System.Windows.Controls.Image preview)
        {
            if (resim.ResimID > 0)
            {
                silinenList.Add(resim);
            }
            else
            {
                if (!string.IsNullOrWhiteSpace(resim.DosyaYolu))
                {

                    // string fullPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, resim.DosyaYolu);

                    string fullPath = Path.Combine(AppPaths.ImagePath, resim.DosyaYolu);
                    if (File.Exists(fullPath))
                        File.Delete(fullPath);

                }
                tempList.Remove(resim);
            }

            currentList.Remove(resim);
            preview.Source = null;
        }

        #endregion



        #region GuncelleResimler 


        // Hata mesajı
        public void ShowErrorMessage(Window owner, string message)
        {
            MessageBox.Show(owner, message, "Hata", MessageBoxButton.OK, MessageBoxImage.Error);
        }

        #endregion



    }
}
