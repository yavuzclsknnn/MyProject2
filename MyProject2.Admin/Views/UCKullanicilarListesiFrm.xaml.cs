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
    /// Interaction logic for UCKullanicilarListesiFrm.xaml
    /// </summary>
    public partial class UCKullanicilarListesiFrm : UserControl, INotifyPropertyChanged
    {



        #region 


        private readonly KullaniciService _Service;

        private int _CurrentPage = 1;
        private int _PageSize = 15;
        private int _TotalPages = 1;
        private int _TotalCount = 0;
        private string _SearchText = "";


        public string ToplamText => $"Toplam : {_TotalCount}";



        private ObservableCollection<Kullanici> _Liste = new ObservableCollection<Kullanici>();

        public ObservableCollection<Kullanici> Liste
        {
            get => _Liste;
            set { _Liste = value; OnPropertyChanged(); }
        }


        private ObservableCollection<int> _Pages = new ObservableCollection<int>();


        public ObservableCollection<int> Pages
        {
            get => _Pages;
            set { _Pages = value; OnPropertyChanged(); }
        }



        #endregion


        #region SearchText

        public string SearchText
        {
            get => _SearchText;
            set
            {
                _SearchText = value;
                OnPropertyChanged();
            }
        }

        #endregion



        #region PropertyChanged

        public event PropertyChangedEventHandler? PropertyChanged;
        private void OnPropertyChanged([CallerMemberName] string? Name = null) =>
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(Name));

        #endregion



        #region CurrentPage

        public int CurrentPage
        {
            get => _CurrentPage;
            set
            {
                _CurrentPage = value;
                OnPropertyChanged();
            }
        }

        #endregion


        #region ChangePage

        private void ChangePage(int page)
        {

            if (page < 1 || page > _TotalPages) return;

            CurrentPage = page;
            _CurrentPage = page;

            LoadData();

        }

        #endregion



        #region Page_Click


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




        #region LoadData

        private void LoadData()
        {

            #region


            try
            {

                string? Search = string.IsNullOrWhiteSpace(TxtFilter.Text) ? null : TxtFilter.Text.Trim();


                var (items, totalCount, totalPages, pages) = _Service.LoadPagedData(_CurrentPage, _PageSize, Search);


                // 🔹 Listeyi güncelle
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

            #endregion


        }

        #endregion



        public UCKullanicilarListesiFrm()
        {

            InitializeComponent();

            DataContext = this;

            _Service = new KullaniciService();
            LoadData();


        }






        private void TxtFilter_TextChanged(object sender, TextChangedEventArgs e)
        {
            _CurrentPage = 1; // aramada her zaman başa dön
            LoadData();       // DB'den tekrar çek (filter dahil)
        }


        private void BtnEkle_Click(object sender, RoutedEventArgs e)
        {

            #region 

            var yeni = new Kullanici(); //  boş model

            var frm = new WinKullaniciEditFrm(yeni, true); //  true = insert
            frm.Owner = Window.GetWindow(this);

            if (frm.ShowDialog() == true)
            {
                LoadData();

            }


            #endregion

        }



        private void GridListe_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {

            #region 

            if (GridListe.SelectedItem == null)
                return;

            var secili = GridListe.SelectedItem as Kullanici;

            if (secili == null)
                return;

            var win = new WinKullaniciEditFrm(secili, false);
            win.Owner = Window.GetWindow(this);
            bool? result = win.ShowDialog();


            if (result == true)
            {
                LoadData();

            }



            #endregion


        }


        private void btnSil_Click(object sender, RoutedEventArgs e)
        {

            #region 

            if (GridListe.SelectedItem == null)
            {

                CustomMessageBox2.Show(
                    "Lütfen silmek için satırı seçiniz.",
                    MessageBoxButton.OK,
                    MessageType.Warning
                );
                return;

            }

            var secili = GridListe.SelectedItem as Kullanici;

            if (secili == null)
                return;


            var Service = new KullaniciService();

            //DialogService.ConfirmAndDelete(
            //    secili,
            //    Liste,
            //    item =>
            //    {
            //        if (item != null)
            //        {
            //            bool deleted = Service.Sil(item.KullaniciID);

            //            if (deleted)
            //            {
            //                _TotalCount--;
            //                OnPropertyChanged(nameof(ToplamText));
            //            }
            //        }
            //    },
            //    item => item!.KullaniciAdi!
            //);


            #endregion


        }


    }
}
