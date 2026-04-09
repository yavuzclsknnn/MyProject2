using MyProject2.Admin.Helpers;
using MyProject2.Admin.Views;
using MyProject2.Models;
using System.ComponentModel;
using System.Reflection;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace MyProject2.Admin
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window, INotifyPropertyChanged
    {


        #region AktifKullanıcı


        public string AktifKullaniciAdi => AktifKullanici?.KullaniciAdi ?? "Misafir";


        private Kullanici? _aktifKullanici;

        public Kullanici? AktifKullanici
        {
            get => _aktifKullanici;
            set
            {
                _aktifKullanici = value;
                OnPropertyChanged(nameof(AktifKullanici));
                OnPropertyChanged(nameof(AktifKullaniciAdi));
            }
        }


        public void SetAktifKullanici(Kullanici kullanici)
        {
            AktifKullanici = kullanici;
        }


        public event PropertyChangedEventHandler? PropertyChanged;
        private void OnPropertyChanged(string prop) => PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(prop));

        #endregion



        #region VERSION SYSTEM (PRO)

        private void InitializeVersionSystem()
        {
            try
            {
                string local = VersionManager.GetLocalVersion();
                string db = VersionManager.GetDbVersion();

                lblVersion.Content = $"Ver {local}";

                if (local != db && db != "0.0.0")
                {
                    lblVersion.Content += " (Yeni!)";
                    lblVersion.Foreground = Brushes.Yellow;

                    //MessageBox.Show(
                    //    $"Yeni Versiyon: {db}\n\n{VersionManager.GetDbDescription()}",
                    //    "Güncelleme",
                    //    MessageBoxButton.OK,
                    //    MessageBoxImage.Information);


                    //CustomMessageBox2.Show($"Yeni Versiyon: {db}\n\n{VersionManager.GetDbDescription()}" + "Güncelleme",
                    //        MessageBoxButton.OK,
                    //        MessageType.Info);
                }
            }
            catch
            {

                lblVersion.Content = $"Ver {VersionManager.GetLocalVersion()}";
            }
        }

        private string GetAssemblyVersion()
        {
            return Assembly.GetExecutingAssembly()
                           .GetName()
                           .Version?
                           .ToString() ?? "1.0.0";
        }


        private void ShowVersionPopup(string version, string desc)
        {

            if (string.IsNullOrWhiteSpace(version)) return;

            //MessageBox.Show(
            //    $"Yeni Versiyon: {version}\n\n{desc}",
            //    "Güncelleme",
            //    MessageBoxButton.OK,
            //    MessageBoxImage.Information);

            CustomMessageBox2.Show($"Yeni Versiyon: {version}\n\n{desc}" + "Güncelleme",
                             MessageBoxButton.OK,
                             MessageType.Info);


        }


        #endregion



        private List<Button> MenuButtons;

        public MainWindow()
        {

            InitializeComponent();

            DataContext = this;

            MenuButtons = new List<Button> { BtnAnaSayfa, BtnUrunler, BtnKullanicilar, BtnKategoriler, BtnMuhafazalar, BtnMutfak };

            // Projenin csproj içindeki versiyon no gösterir
            //  görmek için projeye sağ tıkla EDit Project file  ==> <Version>1.0.01</Version>
            var version = Assembly.GetExecutingAssembly().GetName().Version.ToString();

            //MessageBox.Show(version);

        }



        private void Border_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.ChangedButton == MouseButton.Left)
            {
                /// this.DragMove();
            }
        }


        private void Border_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {

            //if (e.ClickCount == 2)
            //{
            //    if (IsMaximized)
            //    {

            //        this.WindowState = WindowState.Normal;
            //        this.Width = 1080;
            //        this.Height = 720;

            //        IsMaximized = false;

            //    }
            //    else
            //    {
            //        this.WindowState = WindowState.Maximized;
            //        IsMaximized = true;

            //    }

            //}
        }



        private void BtnUrunler_Click(object sender, RoutedEventArgs e)
        {
            Ac_Form.UcForm_Ac(Content_Icerik, new UCUrunListesiFrm());
            MenuHelper.SetActiveButton(MenuButtons, BtnUrunler);
        }

        private void BtnAnaSayfa_Click(object sender, RoutedEventArgs e)
        {

            Ac_Form.UcForm_Ac(Content_Icerik, new UCAnaSayfaFrm());
            MenuHelper.SetActiveButton(MenuButtons, BtnAnaSayfa);

        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

            Ac_Form.UcForm_Ac(Content_Icerik, new UCAnaSayfaFrm());
            MenuHelper.SetActiveButton(MenuButtons, BtnAnaSayfa);

            InitializeVersionSystem();

        }

        private void BtnKullanicilar_Click(object sender, RoutedEventArgs e)
        {
            Ac_Form.UcForm_Ac(Content_Icerik, new UCKullanicilarListesiFrm());
            MenuHelper.SetActiveButton(MenuButtons, BtnKullanicilar);
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {

        }

        private void BtnKategoriler_Click(object sender, RoutedEventArgs e)
        {
            Ac_Form.UcForm_Ac(Content_Icerik, new UCKategorilerFrm());
            MenuHelper.SetActiveButton(MenuButtons, BtnKategoriler);
        }

        private void BtnMuhafazalar_Click(object sender, RoutedEventArgs e)
        {
            Ac_Form.UcForm_Ac(Content_Icerik, new UCMuhafazaKosullariFrm());
            MenuHelper.SetActiveButton(MenuButtons, BtnMuhafazalar);

        }



        private void btnKapat_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btnTamEkran_Click(object sender, RoutedEventArgs e)
        {

            if (this.WindowState == WindowState.Normal)
            {
                this.WindowState = WindowState.Maximized;
            }
            else
            {
                this.WindowState = WindowState.Normal;
            }

        }

        private void btnSimgeDurumu_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }


        private void DragArea_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
            {
                try
                {
                    this.DragMove();
                }
                catch
                {
                    // Fare zaten basılıysa hata yut
                }
            }
        }


        private void btnMenuUstButton_Click(object sender, RoutedEventArgs e)
        {

            if (SolMenuBorder.Width != 80)
            {

                SolMenuBorder.Width = 80;
                SolMenuTextUst.Visibility = Visibility.Hidden;
                SolMenuTextUst2.Visibility = Visibility.Hidden;
                SolMenuBorder.Margin = new Thickness(-125, 40, 0, 0);
                SolMenuUstLogo.Visibility = Visibility.Hidden;

                lblVersion.Visibility = Visibility.Hidden;
                LblKullaniciAdi.Visibility = Visibility.Hidden;


                Content_Icerik.Margin = new Thickness(-80, 50, -80, 20);

            }
            else
            {

                SolMenuBorder.Width = 200;
                SolMenuTextUst.Visibility = Visibility.Visible;
                SolMenuTextUst2.Visibility = Visibility.Visible;
                SolMenuBorder.Margin = new Thickness(0, 40, 0, 0);
                SolMenuUstLogo.Visibility = Visibility.Visible;


                Content_Icerik.Margin = new Thickness(5, 50, -80, 20);

                lblVersion.Visibility = Visibility.Visible;
                LblKullaniciAdi.Visibility = Visibility.Visible;

            }


        }

        private void BtnLogin_Click(object sender, RoutedEventArgs e)
        {
            WinLoginFrm frm = new WinLoginFrm();
            frm.Show();

            MenuHelper.SetActiveButton(MenuButtons, BtnKullanicilar);
        }

        private void BtnMutfak_Click(object sender, RoutedEventArgs e)
        {

            //WinMutfakFrm frm = new WinMutfakFrm();
            //frm.Show();

            //MenuHelper.SetActiveButton(MenuButtons, BtnMutfak);

        }
    }
}