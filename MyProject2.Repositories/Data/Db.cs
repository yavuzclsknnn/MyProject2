using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Text;

namespace MyProject2.Repositories.Data
{
    public class Db
    {
        private readonly string connectionString =
            "";

        public SqlConnection GetConnection()
        {
            return new SqlConnection(connectionString);
        }


    }
}
