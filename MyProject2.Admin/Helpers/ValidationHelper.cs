using System;
using System.Collections.Generic;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;

namespace MyProject2.Admin.Helpers
{
    public static class ValidationHelper
    {
        public static bool IsValid(DependencyObject obj)
        {
            return !HasError(obj);
        }

        public static bool HasError(DependencyObject obj)
        {
            if (obj == null)
                return false;

            // Bu control'de hata var mı
            if (Validation.GetHasError(obj))
                return true;

            // Alt elemanlara bak
            for (int i = 0; i < VisualTreeHelper.GetChildrenCount(obj); i++)
            {
                var child = VisualTreeHelper.GetChild(obj, i);

                if (HasError(child))
                    return true;
            }

            return false;
        }
    }
}
