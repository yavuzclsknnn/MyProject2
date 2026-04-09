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
    public class ResimRepository
    {



        private readonly Db _db = new Db();





        #region GetUrunResimler

        public List<Resim> GetUrunResimler(int UrunID)
        {


            var list = new List<Resim>();

            try
            {

                using (var conn = _db.GetConnection())
                {
                    conn.Open();
                    using var cmd = new SqlCommand("[dbo].[sp_Resim_GetUrunResimler]", conn) { CommandType = CommandType.StoredProcedure };
                    cmd.Parameters.AddWithValue("@UrunID", UrunID);


                    using var reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {

                        Resim Gelen = new Resim();

                        Gelen.ResimID = reader.GetInt("ResimID");
                        Gelen.UrunID = reader.GetInt("UrunID");
                        Gelen.SiraNo = reader.GetInt("SiraNo");
                        Gelen.ResimAdi = reader.GetString("ResimAdi");
                        Gelen.DosyaYolu = reader.GetString("DosyaYolu");
                        Gelen.AnaResimMi = reader.GetBoolean("AnaResimMi");
                        Gelen.Silindi = reader.GetBoolean("Silindi");
                        Gelen.Aktif = reader.GetBoolean("Aktif");

                        list.Add(Gelen);
                    }

                }

            }
            catch (SqlException ex)
            {

                Logger.Log("Resim GetUrunResimler Error (SqlException): " + ex.Message);
                return list;

            }
            catch (Exception ex)
            {

                Logger.Log("Resim GetUrunResimler Error (Exception): " + ex.Message);
                return list;

            }

            return list;


        }


        #endregion





        #region GetByID

        public Resim? GetByID(int ResimID)
        {

            using (var conn = _db.GetConnection())
            {

                try
                {


                    conn.Open();
                    using var cmd = new SqlCommand("sp_Resim_GetByID", conn) { CommandType = CommandType.StoredProcedure };
                    cmd.Parameters.AddWithValue("@ResimID", ResimID);
                    using var reader = cmd.ExecuteReader();

                    Resim bulunan = new Resim();

                    if (reader.Read())
                    {

                        bulunan.ResimID = reader.GetInt("ResimID");
                        bulunan.UrunID = reader.GetInt("UrunID");
                        bulunan.SiraNo = reader.GetInt("SiraNo");
                        bulunan.ResimAdi = reader.GetString("ResimAdi");
                        bulunan.DosyaYolu = reader.GetString("DosyaYolu");
                        bulunan.AnaResimMi = reader.GetBoolean("AnaResimMi");
                        bulunan.Silindi = reader.GetBoolean("Silindi");
                        bulunan.Aktif = reader.GetBoolean("Aktif");


                    }

                    return bulunan;

                }
                catch (SqlException ex)
                {

                    Logger.Log("Resim GetByID Error (SqlException): " + ex.Message);
                    return null;

                }
                catch (Exception ex)
                {

                    Logger.Log("Resim GetByID Error (Exception): " + ex.Message);
                    return null;

                }

            }

        }


        #endregion



        #region Insert

        public int Insert(Resim k)
        {


            try
            {


                using (var conn = _db.GetConnection())
                {

                    conn.Open();
                    using var cmd = new SqlCommand("[dbo].[sp_Resim_Insert]", conn) { CommandType = CommandType.StoredProcedure };
                    cmd.Parameters.AddWithValue("@UrunID", (object?)k.UrunID ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@SiraNo", (object?)k.SiraNo ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@ResimAdi", (object?)k.ResimAdi ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@DosyaYolu", (object?)k.DosyaYolu ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@AnaResimMi", (object?)k.AnaResimMi ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Aktif", (object?)k.Aktif ?? DBNull.Value);

                    // Execute ve ID'yi al
                    var result = cmd.ExecuteScalar();
                    if (result == null || result == DBNull.Value)
                        throw new Exception("Insert sırasında ID alınamadı.");

                    int newID = Convert.ToInt32(result);

                    return newID;

                }
            }
            catch (SqlException ex)
            {

                Logger.Log("Resim Insert Error (SqlException): " + ex.Message);
                return -1;

            }
            catch (Exception ex)
            {

                Logger.Log("Resim Insert Error (Exception): " + ex.Message);
                return -1;

            }

        }

        #endregion




        #region Update


        public bool Update(Resim k)
        {


            try
            {


                using (var conn = _db.GetConnection())
                {


                    conn.Open();

                    using var cmd = new SqlCommand("[dbo].[sp_Resim_Update]", conn) { CommandType = CommandType.StoredProcedure };
                    cmd.Parameters.AddWithValue("@ResimID", (object?)k.ResimID ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@UrunID", (object?)k.UrunID ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@SiraNo", (object?)k.SiraNo ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@ResimAdi", (object?)k.ResimAdi ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@DosyaYolu", (object?)k.DosyaYolu ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@AnaResimMi", (object?)k.AnaResimMi ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Aktif", (object?)k.Aktif ?? DBNull.Value);


                    // Execute ve ID'yi al
                    var result = cmd.ExecuteScalar();
                    if (result == null || result == DBNull.Value)
                        throw new Exception("Bilgi alınamadı.");

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

                Logger.Log("Resim Update Error (SqlException): " + ex.Message);
                return false;

            }
            catch (Exception ex)
            {

                Logger.Log("Resim Update Error (Exception): " + ex.Message);
                return false;

            }



        }


        #endregion




        #region AktifUpdate


        public bool AktifUpdate(int _ID, bool _Durum)
        {


            try
            {


                using (var conn = _db.GetConnection())
                {


                    conn.Open();

                    using var cmd = new SqlCommand("[dbo].[sp_Resim_AktifUpdate]", conn) { CommandType = CommandType.StoredProcedure };
                    cmd.Parameters.AddWithValue("@ResimID", (object?)_ID ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Aktif", (object?)_Durum ?? DBNull.Value);


                    // Execute ve ID'yi al
                    var result = cmd.ExecuteScalar();
                    if (result == null || result == DBNull.Value)
                        throw new Exception("Bilgi alınamadı.");

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

                Logger.Log("Resim AktifUpdate Error (SqlException): " + ex.Message);
                return false;

            }
            catch (Exception ex)
            {

                Logger.Log("Resim AktifUpdate Error (Exception): " + ex.Message);
                return false;

            }


        }



        #endregion




        #region Delete

        public bool Delete(int ResimID)
        {


            try
            {

                using (var conn = _db.GetConnection())
                {

                    conn.Open();
                    using var cmd = new SqlCommand("sp_Resim_Delete", conn) { CommandType = CommandType.StoredProcedure };
                    cmd.Parameters.AddWithValue("@ResimID", (object?)ResimID ?? DBNull.Value);
                    cmd.ExecuteNonQuery();


                    var result = cmd.ExecuteScalar();
                    return result != null && Convert.ToInt32(result) == 1;

                }

            }
            catch (SqlException ex)
            {

                Logger.Log("Resim Delete Error (SqlException): " + ex.Message);
                return false;

            }
            catch (Exception ex)
            {

                Logger.Log("Resim Delete Error (Exception): " + ex.Message);
                return false;

            }


        }
        #endregion





    }
}
