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
    /// Interaction logic for UCUrunListesiAllFilterFrm.xaml
    /// </summary>
    public partial class UCUrunListesiAllFilterFrm : UserControl, INotifyPropertyChanged
    {


        private int _currentPage = 1;
        private int _pageSize = 15;
        private int _totalPages = 1;
        private int _totalCount = 0;
        private string _searchText = "";

        public string ToplamText => $"Toplam : {_totalCount}";



        public string SearchText
        {
            get => _searchText;
            set
            {
                _searchText = value;
                OnPropertyChanged();
            }
        }

        private readonly UrunService _urunService = new UrunService();

        private ObservableCollection<Urun> _urunler = new ObservableCollection<Urun>();
        public ObservableCollection<Urun> Urunler
        {
            get => _urunler;
            set { _urunler = value; OnPropertyChanged(); }
        }

        private ObservableCollection<int> _pages = new ObservableCollection<int>();
        public ObservableCollection<int> Pages
        {
            get => _pages;
            set { _pages = value; OnPropertyChanged(); }
        }

        public UCUrunListesiAllFilterFrm()
        {
            InitializeComponent();
            DataContext = this;
            LoadData();
        }


        private void LoadData()
        {

            try
            {


                string? search = string.IsNullOrWhiteSpace(TxtFilter.Text) ? null : TxtFilter.Text.Trim();


                var service = new UrunService();

                var result = service.GetPagedMultiFiltered(
                    _currentPage,
                    _pageSize,
                    search,
                    urunId: TxtID.Text,
                    kategori: TxtKategori.Text,
                    tanim: TxtTanim.Text,
                    barkod: TxtBarkod.Text,
                    skt: TxtSKT.Text,
                    muhafaza: TxtMuhafaza.Text
                );

                Urunler.Clear();

                foreach (var u in result.Items)
                    Urunler.Add(u);

                _totalPages = result.PageCount;
                _totalCount = result.TotalCount;

                OnPropertyChanged(nameof(ToplamText));


                Pages.Clear();



                int maxPageToShow = 10;

                // ortalama odaklı sayfa gösterimi
                int start = Math.Max(1, _currentPage - (maxPageToShow / 2));
                int end = Math.Min(_totalPages, start + maxPageToShow - 1);

                // sona yaklaşınca başı kaydır
                if (end - start < maxPageToShow - 1)
                {
                    start = Math.Max(1, end - maxPageToShow + 1);
                }

                for (int i = start; i <= end; i++)
                {
                    Pages.Add(i);
                }


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



        #region ChangePage

        private void ChangePage(int page)
        {

            if (page < 1 || page > _totalPages) return;

            CurrentPage = page;
            _currentPage = page;

            LoadData();

        }

        #endregion




        private void FilterChanged(object sender, TextChangedEventArgs e)
        {
            _currentPage = 1;
            LoadData();
        }


        #region


        public event PropertyChangedEventHandler? PropertyChanged;
        private void OnPropertyChanged([CallerMemberName] string? name = null) =>
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));



        private void Page_Click(object sender, RoutedEventArgs e)
        {
            if (sender is Button btn && int.TryParse(btn.Content.ToString(), out int page))
            {
                ChangePage(page);
            }
        }

        private void Prev_Click(object sender, RoutedEventArgs e)
        {
            ChangePage(_currentPage - 1);
        }

        private void Next_Click(object sender, RoutedEventArgs e)
        {
            ChangePage(_currentPage + 1);
        }


        public int CurrentPage
        {
            get => _currentPage;
            set
            {
                _currentPage = value;
                OnPropertyChanged();
            }
        }



        #endregion




        MainWindow? gk = Application.Current.Windows
                         .OfType<MainWindow>()
                         .SingleOrDefault(x => x.IsActive);



        private void TxtFilter_TextChanged(object sender, TextChangedEventArgs e)
        {
            _currentPage = 1; // aramada her zaman başa dön
            LoadData();       // DB'den tekrar çek (filter dahil)
        }


        private void BtnEkle_Click(object sender, RoutedEventArgs e)
        {

            var yeniUrun = new Urun();

            WinUrunPageFrm Frm = new WinUrunPageFrm(yeniUrun, true);
            Frm.Owner = gk;
            Frm.ShowDialog();


        }
    }
}
