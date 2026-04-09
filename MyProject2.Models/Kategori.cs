using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;

namespace MyProject2.Models
{
    public class Kategori : INotifyPropertyChanged, IDataErrorInfo
    {


        public event PropertyChangedEventHandler? PropertyChanged;
        void OnChanged(string prop) => PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(prop));


        private int _KategoriID { get; set; }
        private string? _Tanim { get; set; }
        private bool _Silindi { get; set; }



        public int KategoriID
        {
            get => _KategoriID;
            set { _KategoriID = value; OnChanged(nameof(KategoriID)); }
        }
        public string? Tanim
        {
            get => _Tanim;
            set { _Tanim = value; OnChanged(nameof(Tanim)); }
        }

        public bool Silindi
        {
            get => _Silindi;
            set { _Silindi = value; OnChanged(nameof(Silindi)); }
        }

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
                            return "Tanim boş olamaz";
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

            }
        }
    }
}
