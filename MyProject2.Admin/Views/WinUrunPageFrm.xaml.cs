using MyProject2.Admin.Helpers;
using MyProject2.Models;
using MyProject2.Services;
using System;
using System.Collections.Generic;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace MyProject2.Admin.Views
{
    /// <summary>
    /// Interaction logic for WinUrunPageFrm.xaml
    /// </summary>
    public partial class WinUrunPageFrm : Window
    {


        private bool _IsNew;
        private Urun _CurrentUrun;
        public Resim? SelectedResim { get; set; }

        // Servisler
        private readonly ResimService _ResimService = new ResimService();
        private readonly UrunService _UrunService = new UrunService();
        private readonly KategoriService _KategoriService = new KategoriService();
        private readonly MuhafazaKosuluService _MuhafazaService = new MuhafazaKosuluService();

        // Resim listeleri
        private List<Resim> _OriginalResimler = new();
        private List<Resim> _TempEklenenResimler = new();
        private List<Resim> _SilinenResimler = new();



        public Urun CurrentUrun
        {
            get => _CurrentUrun;
            set => _CurrentUrun = value;
        }

        public List<Kategori> KategoriList { get; set; }
        public List<MuhafazaKosulu> MuhafazaList { get; set; }
        public List<Resim>? ResimList { get; set; }



        public WinUrunPageFrm(Urun urun, bool isNew)
        {

            InitializeComponent();

            if (urun == null) throw new ArgumentNullException(nameof(urun));

            _CurrentUrun = urun;
            _IsNew = isNew;



            // Servislerden veri çek
            KategoriList = _KategoriService.GetAll();
            MuhafazaList = _MuhafazaService.GetAll();



            if (_IsNew)
            {
                // "Seçiniz" ekle
                KategoriList.Insert(0, new Kategori { KategoriID = 0, Tanim = "Seçiniz" });
                MuhafazaList.Insert(0, new MuhafazaKosulu { MuhafazaKosuluID = 0, Tanim = "Seçiniz" });

                CurrentUrun.Kategori = KategoriList.First();
                CurrentUrun.MuhafazaKosulu = MuhafazaList.First();
            }
            else
            {
                // EDIT: mevcut ürünü listede bul ve referansı bağla
                var kategoriMatch = KategoriList.FirstOrDefault(k => k.KategoriID == CurrentUrun.Kategori?.KategoriID);
                if (kategoriMatch != null) CurrentUrun.Kategori = kategoriMatch;

                var muhafazaMatch = MuhafazaList.FirstOrDefault(m => m.MuhafazaKosuluID == CurrentUrun.MuhafazaKosulu?.MuhafazaKosuluID);
                if (muhafazaMatch != null) CurrentUrun.MuhafazaKosulu = muhafazaMatch;
            }


            // Ürüne ait resimleri al
            var dbResimler = _ResimService.GetUrunResimler(CurrentUrun.UrunID);
            CurrentUrun.Resimler = dbResimler ?? new List<Resim>();

            // Orijinal listeyi kopyala
            _OriginalResimler = _ResimService.CloneResimList(CurrentUrun.Resimler);

            DataContext = this;

        }



        private void BtnIptal_Click(object sender, RoutedEventArgs e)
        {

            _ResimService.TempResimleriTemizle(_TempEklenenResimler);
            this.Close();

        }



        private void BtnTabBilgi_Click(object sender, RoutedEventArgs e)
        {

            PanelBilgi.Visibility = Visibility.Visible;
            PanelResim.Visibility = Visibility.Collapsed;

        }

        private void BtnTabResim_Click(object sender, RoutedEventArgs e)
        {

            PanelBilgi.Visibility = Visibility.Collapsed;
            PanelResim.Visibility = Visibility.Visible;

        }


        private void MenuUrun_Click(object sender, MouseButtonEventArgs e)
        {

            PanelBilgi.Visibility = Visibility.Visible;
            PanelResim.Visibility = Visibility.Collapsed;

            // AKTİF
            MenuUrun.Background = (Brush)new BrushConverter().ConvertFrom("#6C5CE7")!;

            // PASİF
            MenuResim.Background = (Brush)new BrushConverter().ConvertFrom("#EEF1F7")!;
        }

        private void MenuResim_Click(object sender, MouseButtonEventArgs e)
        {

            PanelBilgi.Visibility = Visibility.Collapsed;
            PanelResim.Visibility = Visibility.Visible;

            // AKTİF
            MenuResim.Background = (Brush)new BrushConverter().ConvertFrom("#6C5CE7")!;

            // PASİF
            MenuUrun.Background = (Brush)new BrushConverter().ConvertFrom("#EEF1F7")!;

        }


        private void BtnKaydet_Click(object sender, RoutedEventArgs e)
        {

            CurrentUrun.ShowErrors = true;

            if (!ValidationHelper.IsValid(PanelBilgi))
            {

                CustomMessageBox2.Show(
                             "Gerekli tüm Alanları Doldurunuz! ",
                             MessageBoxButton.OK,
                             MessageType.Warning);

                return;
            }


            try
            {


                if (_IsNew)
                {



                    // Yeni ürün ekle
                    int yeniUrunID = _UrunService.Ekle(CurrentUrun);

                    if (yeniUrunID <= 0)
                    {


                        CustomMessageBox2.Show(
                                "Kaydedilemedi",
                                MessageBoxButton.OK,
                                MessageType.Warning);

                        return;

                    }

                    CurrentUrun.UrunID = yeniUrunID;

                    // Yeni eklenen resimleri kaydet
                    _ResimService.KaydetYeniResimler(CurrentUrun.UrunID, _TempEklenenResimler);

                }
                else
                {

                    // Mevcut ürünü güncelle
                    bool guncelle = _UrunService.Guncelle(CurrentUrun);

                    if (!guncelle)
                    {

                        CustomMessageBox2.Show(
                              "Güncellenemedi",
                              MessageBoxButton.OK,
                              MessageType.Warning);
                        return;

                    }

                    // Resimleri servis üzerinden güncelle
                    _ResimService.GuncelleResimler(CurrentUrun, _OriginalResimler, _TempEklenenResimler, _SilinenResimler, SelectedResim, SelectedImagePreview);

                }

                this.DialogResult = true;


            }
            catch (Exception)
            {

                CustomMessageBox2.Show(
                        "Kaydetme sırasında hata oluştu!",
                        MessageBoxButton.OK,
                        MessageType.Warning);

            }



        }




        private void btnResimEkle_Click(object sender, RoutedEventArgs e)
        {


            var eklenenler = _ResimService.ResimEkle(CurrentUrun);
            _TempEklenenResimler.AddRange(eklenenler);
            ResimDataGrid.Items.Refresh();


        }



        private void ResimDataGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

            if (ResimDataGrid.SelectedItem is Resim secilen)
            {
                SelectedResim = secilen;
                _ResimService.GosterResimPreview(secilen, SelectedImagePreview);
            }

        }



        private void btnKapat_Click(object sender, RoutedEventArgs e)
        {

            _ResimService.TempResimleriTemizle(_TempEklenenResimler);
            this.Close();

        }



        private void btnSeciliResmiSil_Click(object sender, RoutedEventArgs e)
        {


            if (SelectedResim == null)
            {
                MessageBox.Show("Lütfen bir resim seçin");
                return;
            }

            _ResimService.SilResim(SelectedResim, CurrentUrun.Resimler, _TempEklenenResimler, _SilinenResimler, SelectedImagePreview);
            ResimDataGrid.Items.Refresh();


        }



        private void Window_Closed(object sender, EventArgs e)
        {
            _ResimService.TempResimleriTemizle(_TempEklenenResimler);
        }




    }
}
