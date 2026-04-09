using MyProject2.Models;
using MyProject2.Repositories;
using MyProject2.Repositories.Helpers;
using System;
using System.Collections.Generic;
using System.Text;
using System.Windows;

namespace MyProject2.Services
{
    public class KullaniciService
    {

        private readonly KullaniciRepository _Repo = new KullaniciRepository();



        #region  Statik aktif kullanıcı - Login

        private static Kullanici? _currentUser;
        public static Kullanici? CurrentUser
        {
            get => _currentUser;
            private set
            {
                _currentUser = value;
                // İstersen buraya event tetikleyebilirsin, örn. UserChanged event
            }
        }


        #region Login Method (Updated)
        public Kullanici? Login(string kullaniciAdi, string sifre)
        {
            var user = _Repo.Login(kullaniciAdi, sifre);

            if (user != null && user.Aktif && !user.Silindi)
            {
                CurrentUser = user; // Aktif kullanıcıyı güncelle
            }
            else
            {
                CurrentUser = null;
            }

            return CurrentUser;
        }
        #endregion


        #endregion



        #region CRUD

        public int Ekle(Kullanici k) => _Repo.Insert(k);

        public bool Guncelle(Kullanici k) => _Repo.Update(k);

        public bool Sil(int kullaniciId) => _Repo.Delete(kullaniciId);

        #endregion





        #region Get Methods

        public List<Kullanici> GetAll() => _Repo.GetAll();

        public Kullanici? GetByID(int id) => _Repo.GetByID(id);

        #endregion



        #region Paging / Filtered

        public PagedResult<Kullanici> GetPaged(int Page, int PageSize, string Arama) =>
            _Repo.GetAllPaged(Page, PageSize, Arama);

        #endregion





        #region Validation

        public (bool IsValid, string Message) Validate(Kullanici _Kullanici)
        {

            if (_Kullanici == null)
                return (false, "Kullanici bilgisi boş olamaz.");

            if (string.IsNullOrWhiteSpace(_Kullanici.KullaniciAdi))
                return (false, "TanKullaniciAdiım boş olamaz.");

            if (string.IsNullOrWhiteSpace(_Kullanici.Sifre))
                return (false, "Sifre boş olamaz.");

            return (true, string.Empty);

        }

        #endregion






        #region LoadData (Paging için servis metodu)

        public (List<Kullanici> Items, int TotalCount, int TotalPages, List<int> Pages) LoadPagedData(int CurrentPage, int PageSize, string? Search)
        {
            var Result = _Repo.GetAllPaged(CurrentPage, PageSize, Search);
            int TotalPages = Result.PageCount;
            var Pages = new List<int>();

            if (TotalPages > 0)
            {
                int MaxPageToShow = 10;
                int Start = Math.Max(1, CurrentPage - (MaxPageToShow / 2));
                int End = Math.Min(TotalPages, Start + MaxPageToShow - 1);

                if (End - Start < MaxPageToShow - 1)
                    Start = Math.Max(1, End - MaxPageToShow + 1);

                for (int i = Start; i <= End; i++)
                    Pages.Add(i);
            }

            return (Result.Items, Result.TotalCount, TotalPages, Pages);
        }

        #endregion





        #region ShowErrorMessage 

        // Hata mesajı
        public void ShowErrorMessage(Window owner, string message)
        {
            MessageBox.Show(owner, message, "Hata", MessageBoxButton.OK, MessageBoxImage.Error);
        }

        #endregion




    }
}
