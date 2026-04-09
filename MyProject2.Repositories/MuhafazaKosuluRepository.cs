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
    public class MuhafazaKosuluRepository
    {

        private readonly Db _db = new Db();





        #region GetAllPaged_Filtered  //  Aramalı tüm data da Tanımını arıyor


        public PagedResult<MuhafazaKosulu> GetAllPaged_Filtered(int page, int pageSize, string? search)
        {


            var result = new PagedResult<MuhafazaKosulu>
            {
                Page = page,
                PageSize = pageSize
            };

            var list = new List<MuhafazaKosulu>();

            try
            {


                using (var conn = _db.GetConnection())
                {


                    conn.Open();

                    using var cmd = new SqlCommand("sp_MuhafazaKosulu_Filtered", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Page", page);
                    cmd.Parameters.AddWithValue("@PageSize", pageSize);
                    cmd.Parameters.AddWithValue("@Arama", string.IsNullOrWhiteSpace(search) ? (object)DBNull.Value : search);

                    using var reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        list.Add(new MuhafazaKosulu
                        {


                            MuhafazaKosuluID = reader.GetInt32(reader.GetOrdinal("MuhafazaKosuluID")),
                            Tanim = reader.GetString("Tanim"),
                            Silindi = reader.GetBoolean("Silindi")

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

                Logger.Log("MuhafazaKosulu GetAllPaged_Filtered Error (SqlException): " + ex.Message);
                return result;

            }
            catch (Exception ex)
            {

                Logger.Log("MuhafazaKosulu GetAllPaged_Filtered Error (Exception): " + ex.Message);
                return result;

            }


        }




        #endregion





        #region GetAllPaged

        public PagedResult<MuhafazaKosulu> GetAllPaged(int Page, int PageSize, string Search)
        {


            var result = new PagedResult<MuhafazaKosulu>();
            var list = new List<MuhafazaKosulu>();

            using (var conn = _db.GetConnection())
            {
                conn.Open();

                using var cmd = new SqlCommand("sp_MuhafazaKosulu_GetPagedAll", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Page", Page);
                cmd.Parameters.AddWithValue("@PageSize", PageSize);

                cmd.Parameters.AddWithValue("@Arama",
                    string.IsNullOrWhiteSpace(Search) ? DBNull.Value : Search.Trim());

                using var reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    list.Add(new MuhafazaKosulu
                    {
                        MuhafazaKosuluID = Convert.ToInt32(reader["MuhafazaKosuluID"]),
                        Tanim = reader["Tanim"]?.ToString()
                    });
                }

                if (reader.NextResult() && reader.Read())
                {
                    result.TotalCount = reader.GetInt32(0);
                }
            }

            result.Items = list;
            result.Page = Page;
            result.PageSize = PageSize;

            return result;


        }

        #endregion



        #region GetAll

        public List<MuhafazaKosulu> GetAll()
        {


            var list = new List<MuhafazaKosulu>();

            try
            {


                using (var conn = _db.GetConnection())
                {

                    conn.Open();
                    using var cmd = new SqlCommand("[dbo].[sp_MuhafazaKosulu_GetAll]", conn) { CommandType = CommandType.StoredProcedure };

                    using var reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {

                        MuhafazaKosulu Gelen = new MuhafazaKosulu();

                        Gelen.MuhafazaKosuluID = reader.GetInt("MuhafazaKosuluID");
                        Gelen.Tanim = reader.GetString("Tanim");

                        list.Add(Gelen);

                    }

                }

            }
            catch (SqlException ex)
            {

                Logger.Log("MuhafazaKosulu GetAll Error (SqlException): " + ex.Message);
                return list;

            }
            catch (Exception ex)
            {

                Logger.Log("MuhafazaKosulu GetAll Error (Exception): " + ex.Message);
                return list;

            }


            return list;

        }

        #endregion




        #region GetByID

        public MuhafazaKosulu? GetByID(int MuhafazaKosuluID)
        {


            using (var conn = _db.GetConnection())
            {

                try
                {

                    conn.Open();
                    using var cmd = new SqlCommand("sp_MuhafazaKosulu_GetByID", conn) { CommandType = CommandType.StoredProcedure };
                    cmd.Parameters.AddWithValue("@MuhafazaKosuluID", MuhafazaKosuluID);
                    using var reader = cmd.ExecuteReader();

                    MuhafazaKosulu bulunan = new MuhafazaKosulu();

                    if (reader.Read())
                    {

                        bulunan.MuhafazaKosuluID = reader.GetInt("MuhafazaKosuluID");
                        bulunan.Tanim = reader.GetString("Tanim");


                    }

                    return bulunan;

                }
                catch (SqlException ex)
                {

                    Logger.Log("MuhafazaKosulu GetByID Error (SqlException): " + ex.Message);
                    return null;

                }
                catch (Exception ex)
                {

                    Logger.Log("MuhafazaKosulu GetByID Error (Exception): " + ex.Message);
                    return null;

                }

            }
        }


        #endregion




        #region Insert

        public int Insert(MuhafazaKosulu k)
        {
            try
            {

                using (var conn = _db.GetConnection())
                {

                    conn.Open();
                    using var cmd = new SqlCommand("[dbo].[sp_MuhafazaKosulu_Insert]", conn) { CommandType = CommandType.StoredProcedure };
                    cmd.Parameters.AddWithValue("@Tanim", (object?)k.Tanim ?? DBNull.Value);


                    // Execute ve ID'yi al
                    var result = cmd.ExecuteScalar();
                    if (result == null || result == DBNull.Value)
                        throw new Exception("Insert sırasında ID alınamadı.");

                    k.MuhafazaKosuluID = Convert.ToInt32(result);


                }

                return k.MuhafazaKosuluID;

            }
            catch (SqlException ex)
            {

                Logger.Log("MuhafazaKosulu Insert Error (SqlException): " + ex.Message);
                return -1;

            }
            catch (Exception ex)
            {

                Logger.Log("MuhafazaKosulu Insert Error (Exception): " + ex.Message);
                return -1;

            }

        }

        #endregion




        #region Update


        public bool Update(MuhafazaKosulu k)
        {
            try
            {


                using (var conn = _db.GetConnection())
                {


                    conn.Open();
                    using var cmd = new SqlCommand("sp_MuhafazaKosulu_Update", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@MuhafazaKosuluID", (object?)k.MuhafazaKosuluID ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Tanim", (object?)k.Tanim ?? DBNull.Value);

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

                Logger.Log("MuhafazaKosulu Update Error (SqlException): " + ex.Message);
                return false;

            }
            catch (Exception ex)
            {

                Logger.Log("MuhafazaKosulu Update Error (Exception): " + ex.Message);
                return false;

            }

        }

        #endregion



        #region Delete

        public bool Delete(int MuhafazaKosuluID)
        {
            try
            {

                using (var conn = _db.GetConnection())
                {

                    conn.Open();
                    using var cmd = new SqlCommand("sp_MuhafazaKosulu_Delete", conn) { CommandType = CommandType.StoredProcedure };
                    cmd.Parameters.AddWithValue("@MuhafazaKosuluID", (object?)MuhafazaKosuluID ?? DBNull.Value);
                    cmd.ExecuteNonQuery();


                    var result = cmd.ExecuteScalar();
                    return result != null && Convert.ToInt32(result) == 1;

                }

            }
            catch (SqlException ex)
            {

                Logger.Log("MuhafazaKosulu Delete Error (SqlException): " + ex.Message);
                return false;

            }
            catch (Exception ex)
            {

                Logger.Log("MuhafazaKosulu Delete Error (Exception): " + ex.Message);
                return false;

            }


        }


        #endregion




    }
}
