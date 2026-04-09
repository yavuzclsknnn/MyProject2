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
    public class KullaniciRepository
    {

        private readonly Db _db = new Db();





        #region GetAllPaged_Filtered  //  Aramalı tüm data da Tanımını arıyor


        public PagedResult<Kullanici> GetAllPaged(int Page, int PageSize, string Search)
        {


            var result = new PagedResult<Kullanici>
            {
                Page = Page,
                PageSize = PageSize
            };

            var list = new List<Kullanici>();

            try
            {


                using (var conn = _db.GetConnection())
                {


                    conn.Open();

                    using var cmd = new SqlCommand("sp_Kullanici_Filtered", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Page", Page);
                    cmd.Parameters.AddWithValue("@PageSize", PageSize);
                    cmd.Parameters.AddWithValue("@Arama", string.IsNullOrWhiteSpace(Search) ? (object)DBNull.Value : Search);

                    using var reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {


                        Kullanici Gelen = new Kullanici();

                        Gelen.KullaniciID = reader.GetInt("KullaniciID");
                        Gelen.KullaniciAdi = reader.GetString("KullaniciAdi");
                        Gelen.Email = reader.GetString("Email");
                        Gelen.Sifre = reader.GetString("Sifre");
                        Gelen.Aktif = reader.GetBool("Aktif");
                        Gelen.Silindi = reader.GetBool("Silindi");

                        list.Add(Gelen);


                    }


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

                Logger.Log("Kullanici GetAllPaged_Filtered Error (SqlException): " + ex.Message);
                return result;

            }
            catch (Exception ex)
            {

                Logger.Log("Kullanici GetAllPaged_Filtered Error (Exception): " + ex.Message);
                return result;

            }


        }




        #endregion




        #region GetAll

        public List<Kullanici> GetAll()
        {


            var list = new List<Kullanici>();

            try
            {

                using (var conn = _db.GetConnection())
                {
                    conn.Open();
                    using var cmd = new SqlCommand("[dbo].[sp_Kullanici_GetAll]", conn) { CommandType = CommandType.StoredProcedure };

                    using var reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {

                        Kullanici Gelen = new Kullanici();

                        Gelen.KullaniciID = reader.GetInt("KullaniciID");
                        Gelen.KullaniciAdi = reader.GetString("KullaniciAdi");
                        Gelen.Email = reader.GetString("Email");
                        Gelen.Sifre = reader.GetString("Sifre");
                        Gelen.Aktif = reader.GetBool("Aktif");
                        Gelen.Silindi = reader.GetBool("Silindi");

                        list.Add(Gelen);
                    }

                }

            }
            catch (SqlException ex)
            {

                Logger.Log("Kullanici GetAll Error (SqlException): " + ex.Message);
                return list;

            }
            catch (Exception ex)
            {

                Logger.Log("Kullanici GetAll Error (Exception): " + ex.Message);
                return list;

            }

            return list;


        }

        #endregion





        #region GetByID

        public Kullanici? GetByID(int KullaniciID)
        {

            using (var conn = _db.GetConnection())
            {

                try
                {
                    conn.Open();
                    using var cmd = new SqlCommand("sp_Kullanici_GetByID", conn) { CommandType = CommandType.StoredProcedure };
                    cmd.Parameters.AddWithValue("@KullaniciID", KullaniciID);
                    using var reader = cmd.ExecuteReader();

                    Kullanici bulunan = new Kullanici();

                    if (reader.Read())
                    {

                        bulunan.KullaniciID = reader.GetInt("KullaniciID");
                        bulunan.KullaniciAdi = reader.GetString("KullaniciAdi");
                        bulunan.Email = reader.GetString("Email");
                        bulunan.Sifre = reader.GetString("Sifre");
                        bulunan.Aktif = reader.GetBool("Aktif");
                        bulunan.Silindi = reader.GetBool("Silindi");


                    }

                    return bulunan;

                }
                catch (Exception ex)
                {
                    Logger.Log("Kullanici GetByID Error: " + ex.Message);
                    throw new Exception("Kullanici GetByID: " + ex.Message);

                }

            }

        }


        #endregion



        #region Login

        Kullanici bulunan;

        public Kullanici? Login(string _KullaniciAdi, string _Sifre)
        {



            using (var conn = _db.GetConnection())
            {

                try
                {
                    conn.Open();
                    using var cmd = new SqlCommand("sp_Login", conn) { CommandType = CommandType.StoredProcedure };
                    cmd.Parameters.AddWithValue("@KullaniciAdi", _KullaniciAdi);
                    cmd.Parameters.AddWithValue("@Sifre", _Sifre);
                    using var reader = cmd.ExecuteReader();



                    if (reader.Read())
                    {

                        bulunan = new Kullanici();

                        bulunan.KullaniciID = reader.GetInt("KullaniciID");
                        bulunan.KullaniciAdi = reader.GetString("KullaniciAdi");
                        bulunan.Email = reader.GetString("Email");
                        bulunan.Sifre = reader.GetString("Sifre");
                        bulunan.Aktif = reader.GetBool("Aktif");
                        bulunan.Silindi = reader.GetBool("Silindi");


                    }

                    return bulunan;

                }
                catch (Exception ex)
                {
                    Logger.Log("Kullanici Login Error: " + ex.Message);
                    throw new Exception("Kullanici Login: " + ex.Message);

                }

            }

        }


        #endregion





        #region Insert


        public int Insert(Kullanici u)
        {
            try
            {


                using (var conn = _db.GetConnection())
                {


                    conn.Open();
                    using var cmd = new SqlCommand("sp_Kullanici_Insert", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@KullaniciAdi", (object?)u.KullaniciAdi ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Email", (object?)u.Email ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Sifre", (object?)u.Sifre ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Aktif", (object?)u.Aktif ?? DBNull.Value);

                    // Execute ve ID'yi al
                    var result = cmd.ExecuteScalar();
                    if (result == null || result == DBNull.Value)
                        throw new Exception("Insert sırasında ID alınamadı.");

                    u.KullaniciID = Convert.ToInt32(result);


                }
                return u.KullaniciID;
            }
            catch (SqlException ex)
            {

                Logger.Log("Kullanici Insert Error (SqlException): " + ex.Message);
                return -1;

            }
            catch (Exception ex)
            {

                Logger.Log("Kullanici Insert Error (Exception): " + ex.Message);
                return -1;

            }

        }

        #endregion




        #region Update


        public bool Update(Kullanici u)
        {
            try
            {


                using (var conn = _db.GetConnection())
                {


                    conn.Open();
                    using var cmd = new SqlCommand("sp_Kullanici_Update", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@KullaniciID", (object?)u.KullaniciID ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@KullaniciAdi", (object?)u.KullaniciAdi ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Email", (object?)u.Email ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Sifre", (object?)u.Sifre ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Aktif", (object?)u.Aktif ?? DBNull.Value);


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

                Logger.Log("Kullanici Update Error (SqlException): " + ex.Message);
                return false;

            }
            catch (Exception ex)
            {

                Logger.Log("Kullanici Update Error (Exception): " + ex.Message);
                return false;

            }

        }

        #endregion





        #region Delete

        public bool Delete(int KullaniciID)
        {
            try
            {

                using (var conn = _db.GetConnection())
                {
                    conn.Open();
                    using var cmd = new SqlCommand("sp_Kullanici_Delete", conn) { CommandType = CommandType.StoredProcedure };
                    cmd.Parameters.AddWithValue("@KullaniciID", (object?)KullaniciID ?? DBNull.Value);
                    cmd.ExecuteNonQuery();


                    var result = cmd.ExecuteScalar();
                    return result != null && Convert.ToInt32(result) == 1;
                }

            }
            catch (SqlException ex)
            {

                Logger.Log("Kullanici Delete Error (SqlException): " + ex.Message);
                return false;

            }
            catch (Exception ex)
            {

                Logger.Log("Kullanici Delete Error (Exception): " + ex.Message);
                return false;

            }


        }
        #endregion






    }
}
