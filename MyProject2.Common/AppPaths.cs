using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace MyProject2.Common
{
    public static class AppPaths
    {
        public static readonly string BaseDataPath =
            Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "MyProject2");

        public static readonly string ImagePath =
            Path.Combine(BaseDataPath, "Images", "UrunResimleri");



        static AppPaths()
        {
            // klasör yoksa oluştur
            if (!Directory.Exists(ImagePath))
                Directory.CreateDirectory(ImagePath);
        }
    }
}
