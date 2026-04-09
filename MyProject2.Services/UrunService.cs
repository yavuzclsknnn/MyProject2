using MyProject2.Models;
using MyProject2.Repositories;
using MyProject2.Repositories.Helpers;
using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Documents;

namespace MyProject2.Services
{
    public class UrunService
    {


        private readonly UrunRepository _repo = new UrunRepository();



        #region CRUD

        public int Ekle(Urun u) => _repo.Insert(u);
        public bool Guncelle(Urun u) => _repo.Update(u);
        public bool Sil(int urunId) => _repo.Delete(urunId);

        #endregion



        #region Get Methods

        public List<Urun> GetAll() => _repo.GetAll();
        public List<Urun> GetAllHizli() => _repo.GetAllHizli();
        public Urun? GetByID(int id) => _repo.GetByID(id);

        public List<Urun> GetByKategori(int Kategorid) => _repo.GetByKategori(Kategorid);

        public List<Urun> Urun_GetByKategori_WithResim(int Kategorid) => _repo.Urun_GetByKategori_WithResim(Kategorid);


        #endregion



        #region Paging / Filtered

        public PagedResult<Urun> GetPaged(int page, int pageSize) => _repo.GetAllPaged(page, pageSize);

        public PagedResult<Urun> GetPagedFiltered(int page, int pageSize, string? search) =>
            _repo.GetAllPaged_FilteredlUrun(page, pageSize, search);

        public PagedResult<Urun> GetPagedAllColumns(int page, int pageSize,
            string id = "", string kategori = "", string tanim = "", string barkod = "", string skt = "", string muhafaza = "") =>
            _repo.GetAllPaged_AllColumun(page, pageSize, id, kategori, tanim, barkod, skt, muhafaza);

        public PagedResult<Urun> GetPagedMultiFiltered(int page, int pageSize, string? search,
            string urunId = "", string kategori = "", string tanim = "", string barkod = "", string skt = "", string muhafaza = "") =>
            _repo.GetAllPaged_FilteredlUrun(page, pageSize, search, urunId, kategori, tanim, barkod, skt, muhafaza);

        #endregion




        #region LoadData (Paging için servis metodu)

        public (List<Urun> Items, int TotalCount, int TotalPages, List<int> Pages) LoadPagedData(int currentPage, int pageSize, string? search)
        {
            var result = _repo.GetAllPaged_FilteredlUrun(currentPage, pageSize, search);
            int totalPages = result.PageCount;
            var pages = new List<int>();

            if (totalPages > 0)
            {
                int maxPageToShow = 10;
                int start = Math.Max(1, currentPage - (maxPageToShow / 2));
                int end = Math.Min(totalPages, start + maxPageToShow - 1);

                if (end - start < maxPageToShow - 1)
                    start = Math.Max(1, end - maxPageToShow + 1);

                for (int i = start; i <= end; i++)
                    pages.Add(i);
            }

            return (result.Items, result.TotalCount, totalPages, pages);
        }

        #endregion






        #region Validation

        public (bool IsValid, string Message) ValidateUrun(Urun urun)
        {
            if (urun == null)
                return (false, "Ürün bilgisi boş olamaz.");

            if (string.IsNullOrWhiteSpace(urun.Tanim))
                return (false, "Ürün adı boş olamaz.");

            if (urun.Kategori == null || urun.Kategori.KategoriID <= 0)
                return (false, "Kategori seçilmelidir.");

            if (urun.MuhafazaKosulu == null || urun.MuhafazaKosulu.MuhafazaKosuluID <= 0)
                return (false, "Muhafaza koşulu seçilmelidir.");

            if (urun.SKTGunSayisi < 0)
                return (false, "SKT günü negatif olamaz.");

            return (true, string.Empty);
        }

        #endregion



    }
}
