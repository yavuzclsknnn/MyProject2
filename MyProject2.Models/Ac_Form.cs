using System;
using System.Collections.Generic;
using System.Text;
using System.Windows;
using System.Windows.Controls;

namespace MyProject2.Models
{
    public class Ac_Form
    {

        public static void UcForm_Ac(Grid grd, UserControl uc)
        {

            grd.Children.Clear();
            uc.HorizontalAlignment = HorizontalAlignment.Stretch;
            uc.VerticalAlignment = VerticalAlignment.Stretch;
            uc.Margin = new Thickness(0);
            grd.Children.Add(uc);

        }
    }
}
