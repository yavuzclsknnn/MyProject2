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
    /// Interaction logic for WinKategoriEditFrm.xaml
    /// </summary>
    public partial class WinKategoriEditFrm : Window
    {



        private bool _IsNew;
        private Kategori _Current;


        private readonly KategoriService _Service = new KategoriService();



        public Kategori Current
        {
            get => _Current;
            set => _Current = value;
        }


        public WinKategoriEditFrm(Kategori Gelen, bool isNew)
        {

            InitializeComponent();


            if (Gelen == null) throw new ArgumentNullException(nameof(Gelen));

            _Current = Gelen;
            _IsNew = isNew;


            DataContext = this;

        }

        private void BtnIptal_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }



        private void BtnKaydet_Click(object sender, RoutedEventArgs e)
        {


            Current.ShowErrors = true;

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

                    // Yeni  ekle
                    int yeniID = _Service.Ekle(Current);

                    if (yeniID <= 0)
                    {

                        CustomMessageBox2.Show(
                                "Kaydedilemedi",
                                MessageBoxButton.OK,
                                MessageType.Warning);

                        return;
                    }

                    Current.KategoriID = yeniID;


                }
                else
                {

                    // güncelle
                    bool guncelle = _Service.Guncelle(Current);

                    if (!guncelle)
                    {

                        CustomMessageBox2.Show(
                                "Güncellenemedi",
                                MessageBoxButton.OK,
                                MessageType.Warning);
                        return;
                    }

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
    }
}
