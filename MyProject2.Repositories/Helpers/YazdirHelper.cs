using MyProject2.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Controls;
using System.Windows.Media.Imaging;

namespace MyProject2.Repositories.Helpers
{
    public class YazdirHelper
    {

        public static void Yazdir(Etiket etiket, BitmapImage barkod)
        {

            var dialog = new PrintDialog();

            if (dialog.ShowDialog() == true)
            {
                var panel = new StackPanel
                {
                    Width = 300
                };

                panel.Children.Add(new TextBlock
                {
                    Text = etiket.Urun.Tanim,
                    FontSize = 18
                });

                //panel.Children.Add(new TextBlock
                //{
                //    Text = "Üretim: " + etiket.UretimTarihi.ToString("dd.MM.yyyy")
                //});

                //panel.Children.Add(new TextBlock
                //{
                //    Text = "SKT: " + etiket.SonTuketimTarihi.ToString("dd.MM.yyyy")
                //});

                panel.Children.Add(new Image
                {
                    Source = barkod,
                    Height = 80
                });

                dialog.PrintVisual(panel, "Etiket");
            }


        }


    }
}
