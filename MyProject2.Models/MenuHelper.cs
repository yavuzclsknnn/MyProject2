using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Controls;
using System.Windows.Media;

namespace MyProject2.Models
{
    public static class MenuHelper
    {

        private static readonly string ActiveColorHex = "#7b5cd6";

        /// <summary>
        /// Tüm butonları sıfırlar ve aktif butonun arka planını değiştirir.
        /// </summary>
        /// <param name="buttons">Menüdeki tüm butonlar</param>
        /// <param name="activeButton">Aktif olan buton</param>
        public static void SetActiveButton(List<Button> buttons, Button activeButton)
        {
            foreach (var btn in buttons)
            {
                if (btn == activeButton)
                {
                    var brush = new BrushConverter().ConvertFrom(ActiveColorHex) as SolidColorBrush;

                    if (brush != null)
                    {
                        btn.Background = brush;
                    }
                }
                else
                {
                    btn.ClearValue(Button.BackgroundProperty);
                }
            }
        }


    }
}
