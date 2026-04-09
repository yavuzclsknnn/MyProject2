using MyProject2.Models;
using MyProject2.Repositories.Helpers;
using System;
using System.Collections.Generic;
using System.Text;

namespace MyProject2.Services
{
    public class HizliEtiketService
    {

        private readonly EtiketService _EtiketService;

        public HizliEtiketService(EtiketService EtiketService)
        {
            _EtiketService = EtiketService;
        }

        public void TekTikYazdir(Urun urun)
        {
            var etiket = _EtiketService.EtiketOlustur(urun.UrunID, 1);
            var barkod = _EtiketService.BarkodOlustur(urun.Barkod);

            YazdirHelper.Yazdir(etiket, barkod);
        }


    }
}
