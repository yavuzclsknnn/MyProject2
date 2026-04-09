using Microsoft.Data.SqlClient;
using MyProject2.Models;
using MyProject2.Repositories.Data;
using MyProject2.Repositories.Helpers;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace MyProject2.Repositories
{
    public class UrunRepository
    {


        private readonly Db _db = new Db();



        #region GetAll

        public List<Urun> GetAll()
        {


            var list = new List<Urun>();

            try
            {

                using (var conn = _db.GetConnection())
                {
                    conn.Open();
                    using var cmd = new SqlCommand("[dbo].[sp_Urun_GetAll]", conn) { CommandType = CommandType.StoredProcedure };

                    using var reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {

                        Urun Gelen = new Urun();

                        Gelen.UrunID = reader.GetInt("UrunID");

                        Kategori Kat = new Kategori
                        {
                            KategoriID = reader.GetInt32(reader.GetOrdinal("KategoriID")),
                            Tanim = reader.GetString(reader.GetOrdinal("KategoriTanim"))
                        };

                        MuhafazaKosulu Muh = new MuhafazaKosulu
                        {
                            MuhafazaKosuluID = reader.GetInt32(reader.GetOrdinal("MuhafazaKosuluID")),
                            Tanim = reader.GetString(reader.GetOrdinal("MuhafazaTanim"))
                        };

                        Gelen.Kategori = Kat;
                        Gelen.MuhafazaKosulu = Muh;

                        Gelen.Tanim = reader.GetString("Tanim");
                        Gelen.Barkod = reader.GetString("Barkod");
                        Gelen.SKTGunSayisi = reader.GetInt("SKTGunSayisi");

                        list.Add(Gelen);
                    }

                }

            }
            catch (SqlException ex)
            {

                Logger.Log("Urun GetAll Error (SqlException): " + ex.Message);
                return list;

            }
            catch (Exception ex)
            {

                Logger.Log("Urun GetAll Error (Exception): " + ex.Message);
                return list;

            }

            return list;


        }

        #endregion



        #region PageResult

        public class PageResult<T>
        {

            public List<T> Items { get; set; } = new List<T>();
            public int TotalCount { get; set; }
            public int PageCount => (int)Math.Ceiling((double)TotalCount / PageSize);
            public int PageSize { get; set; }
            public int Page { get; set; }



        }


        #endregion



        #region GetAllPaged_FilteredlUrun  //  Aramalı tüm data da Ürün Tanımını arıyor


        public PagedResult<Urun> GetAllPaged_FilteredlUrun(int page, int pageSize, string? search)
        {


            var result = new PagedResult<Urun>
            {
                Page = page,
                PageSize = pageSize
            };

            var list = new List<Urun>();

            try
            {


                using (var conn = _db.GetConnection())
                {


                    conn.Open();

                    using var cmd = new SqlCommand("sp_Urun_Filtered_Urun", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Page", page);
                    cmd.Parameters.AddWithValue("@PageSize", pageSize);
                    cmd.Parameters.AddWithValue("@Search", string.IsNullOrWhiteSpace(search) ? (object)DBNull.Value : search);

                    using var reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        list.Add(new Urun
                        {


                            UrunID = reader.GetInt32(reader.GetOrdinal("UrunID")),


                            Kategori = new Kategori
                            {
                                KategoriID = reader.GetInt32(reader.GetOrdinal("KategoriID")),
                                Tanim = reader.GetString(reader.GetOrdinal("KategoriTanim"))
                            },

                            MuhafazaKosulu = new MuhafazaKosulu
                            {
                                MuhafazaKosuluID = reader.GetInt32(reader.GetOrdinal("MuhafazaKosuluID")),
                                Tanim = reader.GetString(reader.GetOrdinal("MuhafazaTanim"))
                            },


                            Tanim = reader.GetString("Tanim"),
                            Barkod = reader.GetString("Barkod"),
                            SKTGunSayisi = reader.GetInt("SKTGunSayisi")
                        });
                    }

                    // total count reader
                    if (reader.NextResult() && reader.Read())
                    {
                        result.TotalCount = reader.GetInt32(0);
                    }
                }

                result.Items = list;
                return result;


            }
            catch (SqlException ex)
            {

                Logger.Log("Urun GetAllPaged_FilteredlUrun Error (SqlException): " + ex.Message);
                return result;

            }
            catch (Exception ex)
            {

                Logger.Log("Urun GetAllPaged_FilteredlUrun Error (Exception): " + ex.Message);
                return result;

            }


        }




        #endregion



        #region Multi kolonlarda tüm datada arama yapıyor

        public PagedResult<Urun> GetAllPaged_AllColumun(int page, int pageSize, string id, string kategori, string tanim, string barkod, string skt, string muhafaza)
        {
            var result = new PagedResult<Urun>();

            var list = new List<Urun>();

            using (var conn = _db.GetConnection())
            {
                conn.Open();

                using var cmd = new SqlCommand("sp_Urun_Filtered_MultiColumun", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Page", page);
                cmd.Parameters.AddWithValue("@PageSize", pageSize);

                cmd.Parameters.AddWithValue("@UrunID", (object?)id ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@Kategori", (object?)kategori ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@Tanim", (object?)tanim ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@Barkod", (object?)barkod ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@SKT", (object?)skt ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@Muhafaza", (object?)muhafaza ?? DBNull.Value);

                using var reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    list.Add(new Urun
                    {
                        UrunID = reader.GetInt32(reader.GetOrdinal("UrunID")),
                        Tanim = reader.GetString("Tanim"),
                        Barkod = reader.GetString("Barkod"),
                        SKTGunSayisi = reader.GetInt("SKTGunSayisi")
                    });
                }

                if (reader.NextResult() && reader.Read())
                {
                    result.TotalCount = reader.GetInt32(0);
                }
            }

            result.Items = list;
            return result;
        }




        #endregion



        #region

        public PagedResult<Urun> GetAllPaged_FilteredlUrun(int page, int pageSize, string? search, string urunId, string kategori, string tanim, string barkod, string skt, string muhafaza)
        {


            var result = new PagedResult<Urun>();
            var list = new List<Urun>();


            using (var conn = _db.GetConnection())
            {


                using (SqlCommand cmd = new SqlCommand("sp_Urun_AllFiltered", conn))
                {


                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Page", page);
                    cmd.Parameters.AddWithValue("@PageSize", pageSize);

                    cmd.Parameters.AddWithValue("@Search", (object?)search ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@UrunID", (object?)urunId ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Kategori", (object?)kategori ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Tanim", (object?)tanim ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Barkod", (object?)barkod ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@SKT", (object?)skt ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Muhafaza", (object?)muhafaza ?? DBNull.Value);

                    conn.Open();


                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {

                            list.Add(new Urun
                            {

                                UrunID = Convert.ToInt32(dr["UrunID"]),
                                Tanim = dr["Tanim"].ToString(),
                                Barkod = dr["Barkod"].ToString(),
                                SKTGunSayisi = dr["SKTGunSayisi"] as int?,

                                Kategori = new Kategori
                                {
                                    KategoriID = Convert.ToInt32(dr["KategoriID"]),
                                    Tanim = dr["KategoriTanim"].ToString()
                                },

                                MuhafazaKosulu = new MuhafazaKosulu
                                {
                                    Tanim = dr["MuhafazaTanim"].ToString()
                                }
                            });
                        }

                        if (dr.NextResult())
                        {
                            if (dr.Read())
                                result.TotalCount = dr.GetInt32(0);
                        }
                    }

                    // 🔥 EN KRİTİK KISIM
                    result.Items = list;
                    result.Page = page;
                    result.PageSize = pageSize;

                    return result;
                }
            }
        }




        #endregion



        #region GetAllPaged

        public PagedResult<Urun> GetAllPaged(int page, int pageSize)
        {


            var result = new PagedResult<Urun>
            {
                Page = page,
                PageSize = pageSize
            };



            try
            {

                using (var conn = _db.GetConnection())
                {


                    conn.Open();
                    using var cmd = new SqlCommand("[dbo].[sp_Urun_GetAll_Paged]", conn) { CommandType = CommandType.StoredProcedure };
                    cmd.Parameters.AddWithValue("@Page", page);
                    cmd.Parameters.AddWithValue("@PageSize", pageSize);


                    using var reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {

                        Urun Gelen = new Urun();

                        Gelen.UrunID = reader.GetInt("UrunID");
                        Kategori kat = new Kategori
                        {
                            KategoriID = reader.GetInt32(reader.GetOrdinal("KategoriID")),
                            Tanim = reader.GetString(reader.GetOrdinal("KategoriTanim"))
                        };

                        MuhafazaKosulu Muh = new MuhafazaKosulu
                        {
                            MuhafazaKosuluID = reader.GetInt32(reader.GetOrdinal("MuhafazaKosuluID")),
                            Tanim = reader.GetString(reader.GetOrdinal("MuhafazaTanim"))
                        };


                        Gelen.Kategori = kat;
                        Gelen.MuhafazaKosulu = Muh;

                        Gelen.Tanim = reader.GetString("Tanim");
                        Gelen.Barkod = reader.GetString("Barkod");
                        Gelen.SKTGunSayisi = reader.GetInt("SKTGunSayisi");

                        result.Items.Add(Gelen);


                        // 🔥 BURASI KRİTİK
                        if (result.TotalCount == 0 && reader["TotalCount"] != DBNull.Value)
                            result.TotalCount = Convert.ToInt32(reader["TotalCount"]);


                    }

                }

            }
            catch (SqlException ex)
            {

                Logger.Log("Urun GetAll Error (SqlException): " + ex.Message);
                return result;

            }
            catch (Exception ex)
            {

                Logger.Log("Urun GetAll Error (Exception): " + ex.Message);
                return result;

            }

            return result;


        }

        #endregion




        #region GetAllHizli

        public List<Urun> GetAllHizli()
        {


            var list = new List<Urun>();

            try
            {

                using (var conn = _db.GetConnection())
                {
                    conn.Open();
                    using var cmd = new SqlCommand("[dbo].[sp_Urun_GetAll]", conn) { CommandType = CommandType.StoredProcedure };

                    using var reader = cmd.ExecuteReader();



                    int IdIndex = reader.GetOrdinal("ID");
                    int TanimIndex = reader.GetOrdinal("Tanim");


                    while (reader.Read())
                    {

                        Urun Gelen = new Urun();

                        Gelen.UrunID = !reader.IsDBNull(IdIndex) ? reader.GetInt32(IdIndex) : 0;


                        Kategori kat = new Kategori
                        {
                            KategoriID = reader.GetInt32(reader.GetOrdinal("KategoriID")),
                            Tanim = reader.GetString(reader.GetOrdinal("KategoriTanim"))
                        };


                        Gelen.Kategori = kat;

                        MuhafazaKosulu Muh = new MuhafazaKosulu
                        {
                            MuhafazaKosuluID = reader.GetInt32(reader.GetOrdinal("MuhafazaKosuluID")),
                            Tanim = reader.GetString(reader.GetOrdinal("MuhafazaTanim"))
                        };


                        Gelen.MuhafazaKosulu = Muh;


                        Gelen.Tanim = !reader.IsDBNull(TanimIndex) ? reader.GetString(TanimIndex) : null;
                        Gelen.Barkod = reader.GetString("Barkod");
                        Gelen.SKTGunSayisi = reader.GetInt("SKTGunSayisi");

                        list.Add(Gelen);
                    }

                }

            }
            catch (SqlException ex)
            {

                Logger.Log("Urun GetAllHizli Error (SqlException): " + ex.Message);
                return list;

            }
            catch (Exception ex)
            {

                Logger.Log("Urun GetAllHizli Error (Exception): " + ex.Message);
                return list;

            }

            return list;


        }

        #endregion





        #region GetByKategori

        public List<Urun> GetByKategori(int _KategoriID)
        {


            var list = new List<Urun>();

            try
            {

                using (var conn = _db.GetConnection())
                {


                    conn.Open();

                    using var cmd = new SqlCommand("[dbo].[sp_Urun_GetByKategoriID]", conn) { CommandType = CommandType.StoredProcedure };
                    cmd.Parameters.AddWithValue("@KategoriID", _KategoriID);


                    using var reader = cmd.ExecuteReader();



                    int IdIndex = reader.GetOrdinal("UrunID");
                    int TanimIndex = reader.GetOrdinal("Tanim");


                    while (reader.Read())
                    {

                        Urun Gelen = new Urun();

                        Gelen.UrunID = !reader.IsDBNull(IdIndex) ? reader.GetInt32(IdIndex) : 0;


                        Kategori Kat = new Kategori
                        {
                            KategoriID = reader.GetInt32(reader.GetOrdinal("KategoriID")),
                            Tanim = reader.GetString(reader.GetOrdinal("KategoriTanim"))
                        };

                        MuhafazaKosulu Muh = new MuhafazaKosulu
                        {
                            MuhafazaKosuluID = reader.GetInt32(reader.GetOrdinal("MuhafazaKosuluID")),
                            Tanim = reader.GetString(reader.GetOrdinal("MuhafazaTanim"))
                        };


                        Gelen.Kategori = Kat;
                        Gelen.MuhafazaKosulu = Muh;



                        Gelen.Tanim = !reader.IsDBNull(TanimIndex) ? reader.GetString(TanimIndex) : null;
                        Gelen.Barkod = reader.GetString("Barkod");
                        Gelen.SKTGunSayisi = reader.GetInt("SKTGunSayisi");

                        list.Add(Gelen);
                    }

                }

            }
            catch (SqlException ex)
            {

                Logger.Log("Urun GetByKategori Error (SqlException): " + ex.Message);
                return list;

            }
            catch (Exception ex)
            {

                Logger.Log("Urun GetByKategori Error (Exception): " + ex.Message);
                return list;

            }

            return list;


        }

        #endregion




        #region Urun_GetByKategori_WithResim

        public List<Urun> Urun_GetByKategori_WithResim(int _KategoriID)
        {


            var list = new List<Urun>();

            try
            {

                using (var conn = _db.GetConnection())
                {


                    conn.Open();

                    using var cmd = new SqlCommand("[dbo].[sp_Urun_GetByKategori_WithResim]", conn) { CommandType = CommandType.StoredProcedure };
                    cmd.Parameters.AddWithValue("@KategoriID", _KategoriID);


                    using var reader = cmd.ExecuteReader();



                    int IdIndex = reader.GetOrdinal("UrunID");
                    int TanimIndex = reader.GetOrdinal("Tanim");


                    while (reader.Read())
                    {

                        Urun Gelen = new Urun();

                        Gelen.UrunID = !reader.IsDBNull(IdIndex) ? reader.GetInt32(IdIndex) : 0;


                        Kategori kat = new Kategori
                        {
                            KategoriID = reader.GetInt32(reader.GetOrdinal("KategoriID")),
                            Tanim = reader.GetString(reader.GetOrdinal("KategoriTanim"))
                        };

                        Gelen.Kategori = kat;

                        MuhafazaKosulu Muh = new MuhafazaKosulu
                        {
                            MuhafazaKosuluID = reader.GetInt32(reader.GetOrdinal("MuhafazaKosuluID")),
                            Tanim = reader.GetString(reader.GetOrdinal("MuhafazaTanim"))
                        };

                        Gelen.MuhafazaKosulu = Muh;

                        Gelen.Tanim = !reader.IsDBNull(TanimIndex) ? reader.GetString(TanimIndex) : null;
                        Gelen.Barkod = reader.GetString("Barkod");
                        Gelen.SKTGunSayisi = reader.GetInt("SKTGunSayisi");


                        // 🔥 RESİM VARSA EKLE
                        if (!reader.IsDBNull(reader.GetOrdinal("ResimID")))
                        {

                            Gelen.Resimler = new List<Resim>();

                            Resim Resim = new Resim();
                            Resim.ResimID = reader.GetInt32(reader.GetOrdinal("ResimID"));
                            Resim.DosyaYolu = reader.GetString(reader.GetOrdinal("DosyaYolu"));
                            Resim.Aktif = true;
                            Resim.Silindi = false;

                            Gelen.Resimler.Add(Resim);

                        }



                        list.Add(Gelen);
                    }

                }

            }
            catch (SqlException ex)
            {

                Logger.Log("Urun GetByKategori Error (SqlException): " + ex.Message);
                return list;

            }
            catch (Exception ex)
            {

                Logger.Log("Urun GetByKategori Error (Exception): " + ex.Message);
                return list;

            }

            return list;


        }

        #endregion





        #region GetByID

        public Urun? GetByID(int id)
        {

            using (var conn = _db.GetConnection())
            {

                try
                {
                    conn.Open();
                    using var cmd = new SqlCommand("sp_Urun_GetByID", conn) { CommandType = CommandType.StoredProcedure };
                    cmd.Parameters.AddWithValue("@UrunID", id);
                    using var reader = cmd.ExecuteReader();

                    Urun bulunan = new Urun();

                    if (reader.Read())
                    {

                        bulunan.UrunID = reader.GetInt("UrunID");

                        Kategori Kat = new Kategori
                        {
                            KategoriID = reader.GetInt32(reader.GetOrdinal("KategoriID")),
                            Tanim = reader.GetString(reader.GetOrdinal("KategoriTanim"))
                        };

                        MuhafazaKosulu Muh = new MuhafazaKosulu
                        {
                            MuhafazaKosuluID = reader.GetInt32(reader.GetOrdinal("MuhafazaKosuluID")),
                            Tanim = reader.GetString(reader.GetOrdinal("MuhafazaTanim"))
                        };


                        bulunan.Kategori = Kat;
                        bulunan.MuhafazaKosulu = Muh;

                        bulunan.Tanim = reader.GetString("Tanim");
                        bulunan.Barkod = reader.GetString("Barkod");
                        bulunan.SKTGunSayisi = reader.GetInt("SKTGunSayisi");


                    }

                    return bulunan;

                }
                catch (Exception ex)
                {
                    Logger.Log("Urun GetByID Error: " + ex.Message);
                    throw new Exception("Urun GetByID: " + ex.Message);

                }

            }

        }


        #endregion




        #region Insert


        public int Insert(Urun u)
        {
            try
            {


                using (var conn = _db.GetConnection())
                {


                    conn.Open();
                    using var cmd = new SqlCommand("sp_Urun_Insert", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@KategoriID", (object?)u.Kategori?.KategoriID ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@MuhafazaKosuluID", (object?)u.MuhafazaKosulu?.MuhafazaKosuluID ?? DBNull.Value);

                    cmd.Parameters.AddWithValue("@Tanim", (object?)u.Tanim ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Barkod", (object?)u.Barkod ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@SKTGunSayisi", (object?)u.SKTGunSayisi ?? DBNull.Value);

                    // Execute ve ID'yi al
                    var result = cmd.ExecuteScalar();
                    if (result == null || result == DBNull.Value)
                        throw new Exception("Insert sırasında ID alınamadı.");

                    u.UrunID = Convert.ToInt32(result);


                }
                return u.UrunID;
            }
            catch (SqlException ex)
            {

                Logger.Log("Urun Insert Error (SqlException): " + ex.Message);
                return -1;

            }
            catch (Exception ex)
            {

                Logger.Log("Urun Insert Error (Exception): " + ex.Message);
                return -1;

            }

        }

        #endregion




        #region Update


        public bool Update(Urun u)
        {
            try
            {


                using (var conn = _db.GetConnection())
                {


                    conn.Open();
                    using var cmd = new SqlCommand("sp_Urun_Update", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@UrunID", (object?)u.UrunID ?? DBNull.Value);

                    cmd.Parameters.AddWithValue("@KategoriID", (object?)u.Kategori?.KategoriID ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@MuhafazaKosuluID", (object?)u.MuhafazaKosulu?.MuhafazaKosuluID ?? DBNull.Value);

                    cmd.Parameters.AddWithValue("@Tanim", (object?)u.Tanim ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Barkod", (object?)u.Barkod ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@SKTGunSayisi", (object?)u.SKTGunSayisi ?? DBNull.Value);


                    var result = cmd.ExecuteScalar();
                    if (result == null || result == DBNull.Value)
                        throw new Exception("Update sırasında ID alınamadı.");

                    int IslemSonucu = Convert.ToInt32(cmd.ExecuteScalar());

                    if (IslemSonucu > 0)
                    {
                        return true; // Başarılı
                    }
                    else
                    {
                        return false;
                    }


                }


            }
            catch (SqlException ex)
            {

                Logger.Log("Urun Update Error (SqlException): " + ex.Message);
                return false;

            }
            catch (Exception ex)
            {

                Logger.Log("Urun Update Error (Exception): " + ex.Message);
                return false;

            }

        }

        #endregion





        #region Delete

        public bool Delete(int UrunID)
        {
            try
            {

                using (var conn = _db.GetConnection())
                {
                    conn.Open();
                    using var cmd = new SqlCommand("sp_Urun_Delete", conn) { CommandType = CommandType.StoredProcedure };
                    cmd.Parameters.AddWithValue("@UrunID", (object?)UrunID ?? DBNull.Value);
                    cmd.ExecuteNonQuery();


                    var result = cmd.ExecuteScalar();
                    return result != null && Convert.ToInt32(result) == 1;
                }

            }
            catch (SqlException ex)
            {

                Logger.Log("Urun Delete Error (SqlException): " + ex.Message);
                return false;

            }
            catch (Exception ex)
            {

                Logger.Log("Urun Delete Error (Exception): " + ex.Message);
                return false;

            }


        }
        #endregion





    }
}
