using MyProject2.Models;
using MyProject2.Repositories;
using MyProject2.Repositories.Helpers;
using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Media.Imaging;

namespace MyProject2.Services
{
    public class EtiketService
    {


        private readonly UrunRepository _Repo;
        private readonly BarkodHelper _BarkodHelper;

        public EtiketService(UrunRepository urunRepo)
        {
            _Repo = urunRepo;
            _BarkodHelper = new BarkodHelper();
        }



        public Etiket EtiketOlustur(int urunId, int miktar)
        {
            var urun = _Repo.GetByID(urunId);

            var uretim = DateTime.Now;

            return new Etiket
            {
                Urun = urun,
                UretimTarihi = uretim,
                SonTuketimTarihi = uretim.AddDays(Convert.ToDouble(urun.SKTGunSayisi)),
                Miktar = miktar
            };
        }



        public BitmapImage BarkodOlustur(string barkod)
        {
            return _BarkodHelper.Olustur(barkod);
        }


    }
}
