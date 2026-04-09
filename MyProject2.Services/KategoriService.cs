using MyProject2.Models;
using MyProject2.Repositories;
using MyProject2.Repositories.Helpers;
using System;
using System.Collections.Generic;
using System.Text;
using System.Windows;

namespace MyProject2.Services
{
    public class KategoriService
    {


        private readonly KategoriRepository _Repo = new KategoriRepository();



        #region CRUD

        public int Ekle(Kategori k) => _Repo.Insert(k);

        public bool Guncelle(Kategori k) => _Repo.Update(k);

        public bool Sil(int kategoriId) => _Repo.Delete(kategoriId);

        #endregion



        #region Get Methods

        public List<Kategori> GetAll() => _Repo.GetAll();

        public Kategori? GetByID(int id) => _Repo.GetByID(id);

        #endregion



        #region Paging / Filtered

        public PagedResult<Kategori> GetPaged(int page, int pageSize, string kategori) =>
            _Repo.GetAllPaged(page, pageSize, kategori);

        #endregion




        #region LoadData (UI için hazır)

        public (List<Kategori> Items, int TotalCount, int TotalPages, List<int> Pages)
            LoadPagedData(int CurrentPage, int PageSize, string? Search)
        {
            var result = _Repo.GetAllPaged(CurrentPage, PageSize, Search);

            int TotalPages = result.PageCount;
            var Pages = new List<int>();

            if (TotalPages > 0)
            {
                int maxPageToShow = 10;

                int start = Math.Max(1, CurrentPage - (maxPageToShow / 2));
                int end = Math.Min(TotalPages, start + maxPageToShow - 1);

                if (end - start < maxPageToShow - 1)
                    start = Math.Max(1, end - maxPageToShow + 1);

                for (int i = start; i <= end; i++)
                    Pages.Add(i);
            }

            return (result.Items, result.TotalCount, TotalPages, Pages);
        }

        #endregion





        #region Validation

        public (bool IsValid, string Message) Validate(Kategori kategori)
        {
            if (kategori == null)
                return (false, "Kategori bilgisi boş olamaz.");

            if (string.IsNullOrWhiteSpace(kategori.Tanim))
                return (false, "Tanim boş olamaz.");

            return (true, string.Empty);
        }

        #endregion




        #region ShowErrorMessage 

        // Hata mesajı
        public void ShowErrorMessage(Window owner, string message)
        {

            //CustomMessageBox2.Show(
            //                   message,
            //                   MessageBoxButton.OK,
            //                   MessageType.Warning);

        }

        #endregion



    }
}
