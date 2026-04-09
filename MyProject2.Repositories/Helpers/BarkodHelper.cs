using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Windows.Media.Imaging;
using ZXing;

namespace MyProject2.Repositories.Helpers
{
    public class BarkodHelper
    {

        public BitmapImage Olustur(string metin)
        {
            var writer = new ZXing.Windows.Compatibility.BarcodeWriter
            {
                Format = BarcodeFormat.CODE_128
            };

            var bitmap = writer.Write(metin);

            using (var memory = new MemoryStream())
            {
                bitmap.Save(memory, System.Drawing.Imaging.ImageFormat.Png);
                memory.Position = 0;

                var image = new BitmapImage();
                image.BeginInit();
                image.StreamSource = memory;
                image.CacheOption = BitmapCacheOption.OnLoad;
                image.EndInit();

                return image;
            }
        }

    }
}
