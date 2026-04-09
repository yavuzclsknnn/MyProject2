using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;

namespace MyProject2.Models
{
    public class Urun : INotifyPropertyChanged, IDataErrorInfo
    {

        private int _urunID;
        private string? _tanim;
        private string? _barkod;
        private int? _sktGunSayisi;
        private bool _silindi;
        private Kategori? _kategori;
        private MuhafazaKosulu? _muhafazaKosulu;
        private List<Resim> _resimler = new List<Resim>();


        public event PropertyChangedEventHandler? PropertyChanged;
        void OnChanged(string prop) => PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(prop));



        public int UrunID
        {
            get => _urunID;
            set { _urunID = value; OnChanged(nameof(UrunID)); }
        }
        public string? Tanim
        {
            get => _tanim;
            set { _tanim = value; OnChanged(nameof(Tanim)); }
        }
        public string? Barkod
        {
            get => _barkod;
            set { _barkod = value; OnChanged(nameof(Barkod)); }
        }
        public int? SKTGunSayisi
        {
            get => _sktGunSayisi;
            set { _sktGunSayisi = value; OnChanged(nameof(SKTGunSayisi)); }
        }
        public bool Silindi
        {
            get => _silindi;
            set { _silindi = value; OnChanged(nameof(Silindi)); }
        }

        public Kategori? Kategori
        {
            get => _kategori;
            set { _kategori = value; OnChanged(nameof(Kategori)); }
        }
        public MuhafazaKosulu? MuhafazaKosulu
        {
            get => _muhafazaKosulu;
            set { _muhafazaKosulu = value; OnChanged(nameof(MuhafazaKosulu)); }
        }

        public List<Resim> Resimler
        {
            get => _resimler;
            set { _resimler = value; OnChanged(nameof(Resimler)); }
        }

        // UI Helper Properties
        public string? KategoriTanim => Kategori?.Tanim;
        public string? MuhafazaTanim => MuhafazaKosulu?.Tanim;

        // Selection for DataGrid checkbox
        public bool IsSelected { get; set; }

        // 🔥 VALIDATION
        public string Error => string.Empty;

        public string this[string columnName]
        {
            get
            {

                if (!ShowErrors)
                    return string.Empty;

                switch (columnName)
                {
                    case nameof(Tanim):
                        if (string.IsNullOrWhiteSpace(Tanim))
                            return "Ürün adı boş olamaz";
                        break;

                    case nameof(Barkod):
                        if (string.IsNullOrWhiteSpace(Barkod))
                            return "Barkod boş olamaz";
                        break;

                    case nameof(SKTGunSayisi):
                        if (SKTGunSayisi == null)
                            return "SKT boş olamaz";

                        if (SKTGunSayisi < 0)
                            return "SKT negatif olamaz";
                        break;

                    case nameof(Kategori):
                        if (Kategori == null || Kategori.KategoriID <= 0)
                            return "Kategori seçiniz";
                        break;

                    case nameof(MuhafazaKosulu):
                        if (MuhafazaKosulu == null || MuhafazaKosulu.MuhafazaKosuluID <= 0)
                            return "Muhafaza seçiniz";
                        break;
                }

                return string.Empty;
            }
        }



        private bool _showErrors;
        public bool ShowErrors
        {
            get => _showErrors;
            set
            {
                _showErrors = value;
                OnChanged(nameof(ShowErrors));

                // tüm alanları tekrar validate ettir
                OnChanged(nameof(Tanim));
                OnChanged(nameof(Barkod));
                OnChanged(nameof(SKTGunSayisi));
                OnChanged(nameof(Kategori));
                OnChanged(nameof(MuhafazaKosulu));
            }
        }


    }
}
