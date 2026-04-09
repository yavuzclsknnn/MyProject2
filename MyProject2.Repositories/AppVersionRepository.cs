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
    public class AppVersionRepository
    {


        private readonly Db _db = new Db();



        #region  AppVersion


        public AppVersion? GetLastVersion()
        {


            using (var conn = _db.GetConnection())
            {

                try
                {
                    conn.Open();
                    using var cmd = new SqlCommand("sp_AppVersion_GetLast", conn) { CommandType = CommandType.StoredProcedure };
                    using var reader = cmd.ExecuteReader();

                    AppVersion bulunan = new AppVersion();

                    if (reader.Read())
                    {

                        bulunan.ID = reader.GetInt("ID");
                        bulunan.VersionNo = reader.GetString(reader.GetOrdinal("VersionNo"));
                        bulunan.Description = reader.GetString(reader.GetOrdinal("Description"));
                        bulunan.CreatedDate = reader.GetDateTime(reader.GetOrdinal("CreatedDate "));

                        return bulunan;
                    }
                    else
                    {
                        return null;
                    }


                }
                catch (SqlException ex)
                {

                    Logger.Log("AppVersion GetLastVersion Error (SqlException): " + ex.Message);
                    return null;

                }
                catch (Exception ex)
                {

                    Logger.Log("AppVersion GetLastVersion Error (Exception): " + ex.Message);
                    return null;

                }

            }

        }

        #endregion


        #region  Insert

        public void Insert(AppVersion v)
        {
            using var conn = _db.GetConnection();
            conn.Open();

            using var cmd = new SqlCommand("sp_AppVersion_Insert", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@VersionNo", v.VersionNo);
            cmd.Parameters.AddWithValue("@Description", v.Description);

            cmd.ExecuteNonQuery();
        }


        #endregion




    }
}
