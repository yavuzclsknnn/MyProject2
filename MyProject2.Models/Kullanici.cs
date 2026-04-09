using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;

namespace MyProject2.Models
{
    public class Kullanici : INotifyPropertyChanged, IDataErrorInfo
    {



        public int _KullaniciID { get; set; }
        public string? _KullaniciAdi { get; set; }
        public string? _Email { get; set; }
        public string? _Sifre { get; set; }
        public bool _Aktif { get; set; }
        public bool _Silindi { get; set; }


        public event PropertyChangedEventHandler? PropertyChanged;
        void OnChanged(string prop) => PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(prop));


        public int KullaniciID
        {
            get => _KullaniciID;
            set { _KullaniciID = value; OnChanged(nameof(KullaniciID)); }
        }
        public string? KullaniciAdi
        {
            get => _KullaniciAdi;
            set { _KullaniciAdi = value; OnChanged(nameof(KullaniciAdi)); }
        }
        public string? Email
        {
            get => _Email;
            set { _Email = value; OnChanged(nameof(Email)); }
        }
        public string? Sifre
        {
            get => _Sifre;
            set { _Sifre = value; OnChanged(nameof(Sifre)); }
        }
        public bool Aktif
        {
            get => _Aktif;
            set { _Aktif = value; OnChanged(nameof(Aktif)); }
        }

        public bool Silindi
        {
            get => _Silindi;
            set { _Silindi = value; OnChanged(nameof(Silindi)); }
        }



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
                    case nameof(KullaniciAdi):
                        if (string.IsNullOrWhiteSpace(KullaniciAdi))
                            return "KullaniciAdi boş olamaz";
                        break;

                    case nameof(Sifre):
                        if (string.IsNullOrWhiteSpace(Sifre))
                            return "Sifre boş olamaz";
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
                OnChanged(nameof(KullaniciAdi));
                OnChanged(nameof(Sifre));
            }
        }



    }
}
