using MyProject2.Models;
using MyProject2.Repositories;
using MyProject2.Repositories.Helpers;
using System;
using System.Collections.Generic;
using System.Text;
using System.Windows;

namespace MyProject2.Services
{
    public class MuhafazaKosuluService
    {


        private readonly MuhafazaKosuluRepository _Repo = new MuhafazaKosuluRepository();




        #region CRUD

        public int Ekle(MuhafazaKosulu k) => _Repo.Insert(k);

        public bool Guncelle(MuhafazaKosulu k) => _Repo.Update(k);

        public bool Sil(int kategoriId) => _Repo.Delete(kategoriId);

        #endregion



        #region Get Methods

        public List<MuhafazaKosulu> GetAll() => _Repo.GetAll();

        public MuhafazaKosulu? GetByID(int id) => _Repo.GetByID(id);

        #endregion



        #region Paging / Filtered

        public PagedResult<MuhafazaKosulu> GetPaged(int Page, int PageSize, string Arama) =>
            _Repo.GetAllPaged(Page, PageSize, Arama);

        #endregion





        #region Validation

        public (bool IsValid, string Message) Validate(MuhafazaKosulu _MuhafazaKosulu)
        {
            if (_MuhafazaKosulu == null)
                return (false, "MuhafazaKosulu bilgisi boş olamaz.");

            if (string.IsNullOrWhiteSpace(_MuhafazaKosulu.Tanim))
                return (false, "Tanım boş olamaz.");

            return (true, string.Empty);
        }

        #endregion





        #region LoadData (Paging için servis metodu)

        public (List<MuhafazaKosulu> Items, int TotalCount, int TotalPages, List<int> Pages) LoadPagedData(int CurrentPage, int PageSize, string? Search)
        {
            var Result = _Repo.GetAllPaged_Filtered(CurrentPage, PageSize, Search);
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



        // Hata mesajı
        public void ShowErrorMessage(Window owner, string message)
        {
            MessageBox.Show(owner, message, "Hata", MessageBoxButton.OK, MessageBoxImage.Error);
        }





    }
}
