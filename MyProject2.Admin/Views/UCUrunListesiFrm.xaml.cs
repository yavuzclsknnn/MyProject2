using MyProject2.Models;
using MyProject2.Services;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;
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

namespace MyProject2.Admin.Views
{
    /// <summary>
    /// Interaction logic for UCUrunListesiFrm.xaml
    /// </summary>
    public partial class UCUrunListesiFrm : UserControl, INotifyPropertyChanged
    {


        private readonly UrunService _urunService;

        private int _CurrentPage = 1;
        private int _PageSize = 15;
        private int _TotalPages = 1;
        private int _TotalCount = 0;
        private string _SearchText = "";

        public string ToplamText => $"Toplam : {_TotalCount}";




        private ObservableCollection<Urun> _Urunler = new ObservableCollection<Urun>();
        public ObservableCollection<Urun> Liste
        {
            get => _Urunler;
            set { _Urunler = value; OnPropertyChanged(); }
        }




        private ObservableCollection<int> _Pages = new ObservableCollection<int>();


        public ObservableCollection<int> Pages
        {
            get => _Pages;
            set { _Pages = value; OnPropertyChanged(); }
        }


        public string SearchText
        {
            get => _SearchText;
            set
            {
                _SearchText = value;
                OnPropertyChanged();
            }
        }



        public event PropertyChangedEventHandler? PropertyChanged;
        private void OnPropertyChanged([CallerMemberName] string? name = null) =>
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));




        private void LoadData()
        {


            try
            {

                string? search = string.IsNullOrWhiteSpace(TxtFilter.Text) ? null : TxtFilter.Text.Trim();

                // Servis çağrısı
                var (items, totalCount, totalPages, pages) = _urunService.LoadPagedData(_CurrentPage, _PageSize, search);

                // Listeyi güncelle
                Liste.Clear();
                foreach (var u in items)
                    Liste.Add(u);

                // Toplam değerler
                _TotalCount = totalCount;
                _TotalPages = totalPages;

                Pages.Clear();
                foreach (var p in pages)
                    Pages.Add(p);

                OnPropertyChanged(nameof(ToplamText));


            }
            catch (Exception ex)
            {

                CustomMessageBox2.Show(
                  "LoadData hatası: " + ex.Message,
                  MessageBoxButton.OK,
                  MessageType.Warning);
                return;

            }
        }




        public UCUrunListesiFrm()
        {

            InitializeComponent();
            DataContext = this;

            _urunService = new UrunService();
            LoadData();

        }



        public int CurrentPage
        {
            get => _CurrentPage;
            set
            {
                _CurrentPage = value;
                OnPropertyChanged();
            }
        }




        #region ChangePage

        private void ChangePage(int page)
        {

            if (page < 1 || page > _TotalPages) return;

            CurrentPage = page;
            _CurrentPage = page;

            LoadData();

        }

        #endregion




        private void FilterChanged(object sender, TextChangedEventArgs e)
        {
            _CurrentPage = 1;
            LoadData();
        }


        #region



        private void Page_Click(object sender, RoutedEventArgs e)
        {
            if (sender is Button btn && int.TryParse(btn.Content.ToString(), out int page))
            {
                ChangePage(page);
            }
        }

        private void Prev_Click(object sender, RoutedEventArgs e)
        {
            ChangePage(_CurrentPage - 1);
        }

        private void Next_Click(object sender, RoutedEventArgs e)
        {
            ChangePage(_CurrentPage + 1);
        }




        #endregion




        private void TxtFilter_TextChanged(object sender, TextChangedEventArgs e)
        {
            _CurrentPage = 1; // aramada her zaman başa dön
            LoadData();       // DB'den tekrar çek (filter dahil)
        }


        private void BtnEkle_Click(object sender, RoutedEventArgs e)
        {

            var yeniUrun = new Urun(); //  boş model

            var frm = new WinUrunPageFrm(yeniUrun, true); //  true = insert
            frm.Owner = Window.GetWindow(this);

            if (frm.ShowDialog() == true)
            {
                LoadData();
            }

        }

        private void Grid_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {


            if (Grid.SelectedItem == null)
                return;

            var seciliUrun = Grid.SelectedItem as Urun;

            if (seciliUrun == null)
                return;

            var win = new WinUrunPageFrm(seciliUrun, false);
            win.Owner = Window.GetWindow(this); // Parent window
            bool? result = win.ShowDialog();   //  ShowDialog olmalı


            if (result == true)
            {
                LoadData();

            }



        }



        // Yardımcı metod: görsel tree'den belirli tipte ilk çocuğu bulur
        private static T? FindVisualChild<T>(DependencyObject parent) where T : DependencyObject
        {
            if (parent == null) return null;
            for (int i = 0; i < VisualTreeHelper.GetChildrenCount(parent); i++)
            {
                var child = VisualTreeHelper.GetChild(parent, i);
                if (child is T typedChild)
                    return typedChild;

                var result = FindVisualChild<T>(child);
                if (result != null)
                    return result;
            }
            return null;
        }


        private void btnSil_Click(object sender, RoutedEventArgs e)
        {


            if (Grid.SelectedItem == null)
            {

                CustomMessageBox2.Show(
                    "Lütfen silmek için satırı seçiniz.",
                    MessageBoxButton.OK,
                    MessageType.Warning
                );
                return;

            }

            var seciliUrun = Grid.SelectedItem as Urun;

            if (seciliUrun == null)
                return;


            var urunService = new UrunService();

            //DialogService.ConfirmAndDelete(
            //    seciliUrun,
            //    Liste,
            //    item =>
            //    {
            //        if (item != null)
            //        {
            //            bool deleted = urunService.Sil(item.UrunID);
            //            if (deleted)
            //            {
            //                _TotalCount--;
            //                OnPropertyChanged(nameof(ToplamText));
            //            }
            //        }
            //    },
            //    item => item!.Tanim!
            //);


        }
    }
}
