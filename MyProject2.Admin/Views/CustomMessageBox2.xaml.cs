using MahApps.Metro.IconPacks;
using System;
using System.Collections.Generic;
using System.ComponentModel;
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
    public enum MessageType
    {
        Info,
        Success,
        Warning,
        Error
    }


    /// <summary>
    /// Interaction logic for CustomMessageBox2.xaml
    /// </summary>
    public partial class CustomMessageBox2 : Window, INotifyPropertyChanged
    {


        public event PropertyChangedEventHandler? PropertyChanged;

        void OnPropertyChanged(string name)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
        }


        public bool Result { get; private set; }



        private Brush _pencereUstColor;
        public Brush PencereUstColor
        {
            get => _pencereUstColor;
            set
            {
                _pencereUstColor = value;
                OnPropertyChanged(nameof(PencereUstColor));
            }
        }


        private Brush _pencereKenarlarColor;
        public Brush PencereKenarlarColor
        {
            get => _pencereKenarlarColor;
            set
            {
                _pencereKenarlarColor = value;
                OnPropertyChanged(nameof(PencereKenarlarColor));
            }
        }


        public Brush? BorderColor { get; set; }

        public Brush? IconBackground { get; set; }
        public PackIconMaterialKind IconKind { get; set; }

        // Yeni property pencerenin üstündeki başlık arkaplanı için
        public Brush HeaderBackground { get; set; }

        public CustomMessageBox2(string message, MessageBoxButton buttons, MessageType type)
        {


            InitializeComponent();

            DataContext = this;
            TxtMessage.Text = message;
            SetStyle(type);

            // Buton ayarları
            //if (buttons == MessageBoxButton.OK)
            //{
            //    BtnYes.Visibility = Visibility.Collapsed;
            //    BtnNo.Visibility = Visibility.Collapsed;
            //}
            //else if (buttons == MessageBoxButton.YesNo)
            //{
            //    BtnOk.Visibility = Visibility.Collapsed;
            //},

            if (buttons == MessageBoxButton.YesNo)
            {
                BtnYes.Visibility = Visibility.Visible;
                BtnNo.Visibility = Visibility.Visible;

                BtnOk.Visibility = Visibility.Collapsed;
                BtnUyariOk.Visibility = Visibility.Collapsed;
            }
            else
            {

                if (type == MessageType.Warning)
                {
                    BtnUyariOk.Visibility = Visibility.Visible;
                    BtnYes.Visibility = Visibility.Collapsed;
                    BtnNo.Visibility = Visibility.Collapsed;
                    BtnOk.Visibility = Visibility.Collapsed;
                }
                else if (type == MessageType.Info)
                {
                    BtnOk.Visibility = Visibility.Collapsed;
                    BtnUyariOk.Visibility = Visibility.Visible;
                    BtnNo.Visibility = Visibility.Collapsed;
                }

            }

        }

        private void SetStyle(MessageType type)
        {


            switch (type)
            {

                case MessageType.Success:
                    //  BorderColor = new SolidColorBrush(Color.FromRgb(46, 204, 113));
                    BorderColor = new SolidColorBrush((Color)ColorConverter.ConvertFromString("#6741D9"));
                    IconBackground = BorderColor;
                    IconKind = PackIconMaterialKind.CheckCircle;
                    break;

                case MessageType.Error:
                    BorderColor = new SolidColorBrush(Color.FromRgb(231, 76, 60));
                    IconBackground = BorderColor;
                    IconKind = PackIconMaterialKind.CloseCircle;

                    PencereUstColor = new SolidColorBrush((Color)ColorConverter.ConvertFromString("#FFFF0000"));
                    PencereKenarlarColor = new SolidColorBrush((Color)ColorConverter.ConvertFromString("#FFFF0000"));
                    break;

                case MessageType.Warning:
                    BorderColor = new SolidColorBrush(Color.FromRgb(241, 196, 15));
                    IconBackground = BorderColor;
                    IconKind = PackIconMaterialKind.Alert;

                    PencereUstColor = new SolidColorBrush((Color)ColorConverter.ConvertFromString("#FFFF0000"));

                    PencereKenarlarColor = new SolidColorBrush((Color)ColorConverter.ConvertFromString("#FFFF0000"));
                    break;

                case MessageType.Info:
                    BorderColor = new SolidColorBrush(Color.FromRgb(241, 196, 15));
                    IconBackground = BorderColor;
                    IconKind = PackIconMaterialKind.Information;
                    break;


                default:
                    BorderColor = new SolidColorBrush(Color.FromRgb(108, 92, 231));
                    BorderColor = new SolidColorBrush((Color)ColorConverter.ConvertFromString("#6741D9"));
                    IconBackground = BorderColor;
                    IconKind = PackIconMaterialKind.Information;

                    PencereUstColor = new SolidColorBrush((Color)ColorConverter.ConvertFromString("#6C5CE7"));

                    PencereKenarlarColor = new SolidColorBrush((Color)ColorConverter.ConvertFromString("#6741d9"));

                    break;
            }

        }

        private void BtnYes_Click(object sender, RoutedEventArgs e)
        {
            Result = true;
            Close();
        }

        private void BtnNo_Click(object sender, RoutedEventArgs e)
        {
            Result = false;
            Close();
        }

        private void BtnOk_Click(object sender, RoutedEventArgs e)
        {
            Result = true;
            Close();
        }

        public static bool Show(string message, MessageBoxButton buttons, MessageType type)
        {

            var win = new CustomMessageBox2(message, buttons, type)
            {
                Owner = Application.Current.MainWindow // Ana formun üzerine aç
            };
            win.ShowDialog();
            return win.Result;

        }



    }
}
