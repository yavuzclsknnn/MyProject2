using MyProject2.Models;
using MyProject2.Repositories;
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
    /// Interaction logic for WinLoginFrm.xaml
    /// </summary>
    public partial class WinLoginFrm : Window
    {

        private KullaniciRepository repo = new KullaniciRepository();
        bool isShown = false;

        public WinLoginFrm()
        {
            InitializeComponent();
        }


        private void BtnGiris_Click(object sender, RoutedEventArgs e)
        {


            #region

            string kullaniciAdi = txtKullaniciAdi.Text;
            string sifre = pwdSifre.Password;



            if (string.IsNullOrWhiteSpace(kullaniciAdi) || string.IsNullOrWhiteSpace(sifre))
            {


                CustomMessageBox2.Show(
                             "Kullanıcı adı ve şifre boş olamaz!",
                             MessageBoxButton.OK,
                             MessageType.Warning);


                return;

            }

            Kullanici? user = repo.Login(kullaniciAdi, sifre);

            if (user == null)
            {

                CustomMessageBox2.Show(
                               "Kullanıcı adı veya şifre hatalı!",
                               MessageBoxButton.OK,
                               MessageType.Warning);

                return;
            }


            CustomMessageBox2.Show(
                              $"Giriş başarılı! Hoşgeldin {user.KullaniciAdi}",
                              MessageBoxButton.OK,
                              MessageType.Info);


            // Ana pencereye geçmek için:
            // MainWindow main = new MainWindow();

            // Burada opsiyonel: main.DataContext veya public property ile kullanıcıyı geçebilirsin
            // main.SetAktifKullanici(user);
            //main.Show();
            //this.Close();


            Application.Current.MainWindow = new MainWindow();
            Application.Current.MainWindow.DataContext = Application.Current.MainWindow;
            ((MainWindow)Application.Current.MainWindow).AktifKullanici = user;
            Application.Current.MainWindow.Show();
            this.Close();




            #endregion

        }

        private void BtnClose_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }



        private void BtnShowPassword_Click(object sender, RoutedEventArgs e)
        {

            if (!isShown)
            {
                txtSifre.Text = pwdSifre.Password;
                txtSifre.Visibility = Visibility.Visible;
                pwdSifre.Visibility = Visibility.Collapsed;
                isShown = true;
            }
            else
            {
                pwdSifre.Password = txtSifre.Text;
                pwdSifre.Visibility = Visibility.Visible;
                txtSifre.Visibility = Visibility.Collapsed;
                isShown = false;
            }

        }

        // Enter ile login
        private void Window_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                BtnGiris_Click(null, null);
            }
        }

    }
}
