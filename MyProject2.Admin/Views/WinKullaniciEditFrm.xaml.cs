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
    /// Interaction logic for WinKullaniciEditFrm.xaml
    /// </summary>
    public partial class WinKullaniciEditFrm : Window
    {


        private bool _IsNew;
        private Kullanici _Current;


        private readonly KullaniciService _Service = new KullaniciService();



        public Kullanici Current
        {
            get => _Current;
            set => _Current = value;
        }



        public WinKullaniciEditFrm(Kullanici Gelen, bool isNew)
        {

            InitializeComponent();

            if (Gelen == null) throw new ArgumentNullException(nameof(Gelen));

            _Current = Gelen;
            _IsNew = isNew;


            if (_IsNew == true)
            {

                _Current.Aktif = true; // default aktif gelsin   

            }

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

                CustomMessageBox2.Show("Gerekli tüm Alanları Doldurunuz! ",
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

                    Current.KullaniciID = yeniID;


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
