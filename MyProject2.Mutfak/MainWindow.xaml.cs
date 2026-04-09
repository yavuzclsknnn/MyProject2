using MyProject2.Admin.Helpers; 
using MyProject2.Repositories;
using MyProject2.Services;
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

namespace MyProject2.Mutfak
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {


        private readonly UrunService _UrunService = new UrunService();
        private readonly KategoriService _KategoriService = new KategoriService();
        private readonly HizliEtiketService _HizliEtiketservice;

        private readonly UrunRepository _UrunRepository = new UrunRepository();



        public MainWindow()
        {

            InitializeComponent();


            var EtiketService = new EtiketService(_UrunRepository);
            _HizliEtiketservice = new HizliEtiketService(EtiketService);


            KategorileriYukle();

        }




        #region KategorileriYukle 


        private void KategorileriYukle()
        {


            foreach (var Kategori in _KategoriService.GetAll())
            {
                var btn = new Button
                {
                    Content = Kategori.Tanim,
                    Style = (Style)FindResource("KategoriButonStyle")
                };

                btn.Click += (s, e) => UrunleriYukle(Kategori.KategoriID);

                kategoriPanel.Children.Add(btn);
            }

        }


        #endregion



        #region UrunleriYukle

        private void UrunleriYukle(int KategoriID)
        {

            #region 


            urunPanel.Children.Clear();
            var urunler = _UrunService.Urun_GetByKategori_WithResim(KategoriID);

            foreach (var urun in urunler)
            {

                #region


                var border = new Border
                {
                    Style = (Style)FindResource("UrunKartStyle")
                };

                var grid = new Grid();
                grid.RowDefinitions.Add(new RowDefinition { Height = new GridLength(160) }); // Resim
                grid.RowDefinitions.Add(new RowDefinition { Height = new GridLength(35) });  // Alt panel (Muhafaza)
                grid.RowDefinitions.Add(new RowDefinition { Height = new GridLength(20) });  // Ürün adı

                // Resim
                var img = new Image
                {
                    Stretch = Stretch.UniformToFill,
                    Source = UrunResimHelper.IlkResimGetir(urun),
                    HorizontalAlignment = HorizontalAlignment.Stretch,
                    VerticalAlignment = VerticalAlignment.Stretch
                };
                Grid.SetRow(img, 0);

                // Alt panel: Muhafaza bilgisi + ikon
                var altPanel = new StackPanel
                {
                    Orientation = Orientation.Horizontal,
                    HorizontalAlignment = HorizontalAlignment.Center,
                    VerticalAlignment = VerticalAlignment.Center,
                    Margin = new Thickness(0, 2, 0, 2)
                };

                var icon = new Image
                {
                    Width = 20,
                    Height = 20,
                    Source = UrunResimHelper.MuhafazaIconGetir(urun.MuhafazaKosulu),
                    Opacity = 0.7,
                    Margin = new Thickness(0, 0, 5, 0),
                    ToolTip = urun.MuhafazaKosulu?.Tanim
                };

                var txt = new TextBlock
                {
                    Text = urun.MuhafazaKosulu?.Tanim,
                    FontSize = 12,
                    VerticalAlignment = VerticalAlignment.Center,
                    Opacity = 0.8,
                    TextAlignment = TextAlignment.Center
                };

                altPanel.Children.Add(icon);
                altPanel.Children.Add(txt);
                Grid.SetRow(altPanel, 1);

                // Ürün adı
                var urunAdTxt = new TextBlock
                {
                    Text = urun.Tanim,
                    Style = (Style)FindResource("UrunTextStyle"),
                    TextWrapping = TextWrapping.Wrap,
                    TextAlignment = TextAlignment.Center,
                    HorizontalAlignment = HorizontalAlignment.Center,
                    VerticalAlignment = VerticalAlignment.Center,
                    Margin = new Thickness(5, 0, 5, 0)
                };
                Grid.SetRow(urunAdTxt, 2);

                grid.Children.Add(img);
                grid.Children.Add(altPanel);
                grid.Children.Add(urunAdTxt);

                border.Child = grid;

                border.MouseDown += (s, e) =>
                {
                    _HizliEtiketservice.TekTikYazdir(urun);
                };

                urunPanel.Children.Add(border);

                #endregion


            }

            #endregion


        }

        #endregion






    }
}