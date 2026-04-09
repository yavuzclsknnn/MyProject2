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
    public class KategoriRepository
    {

        private readonly Db _db = new Db();



        #region GetAllPaged

        public PagedResult<Kategori> GetAllPaged(int page, int pageSize, string search)
        {


            var result = new PagedResult<Kategori>();
            var list = new List<Kategori>();

            using (var conn = _db.GetConnection())
            {
                conn.Open();

                using var cmd = new SqlCommand("sp_Kategori_GetPagedAll", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Page", page);
                cmd.Parameters.AddWithValue("@PageSize", pageSize);

                cmd.Parameters.AddWithValue("@Kategori",
                    string.IsNullOrWhiteSpace(search) ? DBNull.Value : search.Trim());

                using var reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    list.Add(new Kategori
                    {
                        KategoriID = Convert.ToInt32(reader["KategoriID"]),
                        Tanim = reader["Tanim"]?.ToString()
                    });
                }

                if (reader.NextResult() && reader.Read())
                {
                    result.TotalCount = reader.GetInt32(0);
                }
            }

            result.Items = list;
            result.Page = page;
            result.PageSize = pageSize;

            return result;


        }

        #endregion



        #region GetAll

        public List<Kategori> GetAll()
        {


            var list = new List<Kategori>();

            try
            {

                using (var conn = _db.GetConnection())
                {
                    conn.Open();
                    using var cmd = new SqlCommand("[dbo].[sp_Kategori_GetAll]", conn) { CommandType = CommandType.StoredProcedure };

                    using var reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {

                        Kategori Gelen = new Kategori();

                        Gelen.KategoriID = reader.GetInt("KategoriID");
                        Gelen.Tanim = reader.GetString("Tanim");

                        list.Add(Gelen);
                    }

                }

            }
            catch (SqlException ex)
            {

                Logger.Log("Kategori GetAllHizli Error (SqlException): " + ex.Message);
                return list;

            }
            catch (Exception ex)
            {

                Logger.Log("Kategori GetAllHizli Error (Exception): " + ex.Message);
                return list;

            }

            return list;


        }

        #endregion



        #region GetByID

        public Kategori? GetByID(int KategoriID)
        {

            using (var conn = _db.GetConnection())
            {

                try
                {
                    conn.Open();
                    using var cmd = new SqlCommand("sp_Kategori_GetByID", conn) { CommandType = CommandType.StoredProcedure };
                    cmd.Parameters.AddWithValue("@ID", KategoriID);
                    using var reader = cmd.ExecuteReader();

                    Kategori bulunan = new Kategori();

                    if (reader.Read())
                    {

                        bulunan.KategoriID = reader.GetInt("KategoriID");
                        bulunan.Tanim = reader.GetString("Tanim");


                    }

                    return bulunan;

                }
                catch (SqlException ex)
                {

                    Logger.Log("Kategori GetByID Error (SqlException): " + ex.Message);
                    return null;

                }
                catch (Exception ex)
                {

                    Logger.Log("Kategori GetByID Error (Exception): " + ex.Message);
                    return null;

                }

            }

        }


        #endregion



        #region Insert

        public int Insert(Kategori k)
        {
            try
            {
                using (var conn = _db.GetConnection())
                {

                    conn.Open();
                    using var cmd = new SqlCommand("[dbo].[sp_Kategori_Insert]", conn) { CommandType = CommandType.StoredProcedure };
                    cmd.Parameters.AddWithValue("@Tanim", (object?)k.Tanim ?? DBNull.Value);


                    // Execute ve ID'yi al
                    var result = cmd.ExecuteScalar();
                    if (result == null || result == DBNull.Value)
                        throw new Exception("Insert sırasında ID alınamadı.");

                    k.KategoriID = Convert.ToInt32(result);


                }


                return k.KategoriID;
            }
            catch (SqlException ex)
            {

                Logger.Log("Kategori Insert Error (SqlException): " + ex.Message);
                return -1;

            }
            catch (Exception ex)
            {

                Logger.Log("Kategori Insert Error (Exception): " + ex.Message);
                return -1;

            }

        }

        #endregion




        #region Update


        public bool Update(Kategori u)
        {
            try
            {


                using (var conn = _db.GetConnection())
                {


                    conn.Open();
                    using var cmd = new SqlCommand("sp_Kategori_Update", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@KategoriID", (object?)u.KategoriID ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Tanim", (object?)u.Tanim ?? DBNull.Value);

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

                Logger.Log("Kategori Update Error (SqlException): " + ex.Message);
                return false;

            }
            catch (Exception ex)
            {

                Logger.Log("Kategori Update Error (Exception): " + ex.Message);
                return false;

            }

        }

        #endregion



        #region Delete

        public bool Delete(int KategoriID)
        {
            try
            {

                using (var conn = _db.GetConnection())
                {

                    conn.Open();
                    using var cmd = new SqlCommand("sp_Kategori_Delete", conn) { CommandType = CommandType.StoredProcedure };
                    cmd.Parameters.AddWithValue("@KategoriID", (object?)KategoriID ?? DBNull.Value);
                    cmd.ExecuteNonQuery();


                    var result = cmd.ExecuteScalar();
                    return result != null && Convert.ToInt32(result) == 1;

                }

            }
            catch (SqlException ex)
            {

                Logger.Log("Kategori Delete Error (SqlException): " + ex.Message);
                return false;

            }
            catch (Exception ex)
            {

                Logger.Log("Kategori Delete Error (Exception): " + ex.Message);
                return false;

            }


        }
        #endregion



    }
}
