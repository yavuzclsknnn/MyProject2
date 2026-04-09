using Microsoft.Data.SqlClient;
using MyProject2.Repositories.Data;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace MyProject2.Repositories.Helpers
{
    public static class Logger
    {


        private static readonly Db _db = new Db();



        // Logger aktif mi? TRUE = log yaz, FALSE = log yazma
        public static bool FileLogActive { get; set; } = true;



        // SQL log aktif mi?
        public static bool SqlLogActive { get; set; } = true;



        #region Log

        public static void LogToDb(string message)
        {

            if (!SqlLogActive) return; // DEVRE DIŞI


            try
            {

                using (var conn = _db.GetConnection())
                {


                    var cmd = new SqlCommand("sp_Log_Add", conn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Mesaj", message);

                    conn.Open();
                    cmd.ExecuteNonQuery();

                }

            }
            catch
            {
                // log bile patlarsa sessiz geç
            }


        }


        #endregion



        #region  LogToFile


        // LOG DOSYAYA EKLEME
        public static void LogToFile(string message)
        {


            if (!FileLogActive) return; // DEVRE DIŞI

            try
            {
                string folder = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Logs");
                if (!Directory.Exists(folder))
                    Directory.CreateDirectory(folder);

                string filePath = Path.Combine(folder, $"log_{DateTime.Now:yyyyMMdd}.txt");

                File.AppendAllText(filePath, $"{DateTime.Now:yyyy-MM-dd HH:mm:ss} - {message}{Environment.NewLine}");
            }
            catch
            {
                // Hata bile loglanamazsa sessiz geç
            }


        }


        #endregion


        #region  Log


        // GENEL LOG METODU (hem DB hem dosya)
        public static void Log(string message)
        {

            if (!FileLogActive && !SqlLogActive) return;


            LogToDb(message);
            LogToFile(message);


        }

        #endregion




    }
}
