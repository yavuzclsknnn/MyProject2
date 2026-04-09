using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Text;

namespace MyProject2.Repositories.Helpers
{
    public static class DataReaderHelper
    {


        public static int GetInt(this SqlDataReader r, string col)
        {
            if (!r.HasColumn(col) || r[col] == DBNull.Value)
                return 0;

            return Convert.ToInt32(r[col]);
        }



        public static string? GetString(this SqlDataReader r, string col)
        {
            if (!r.HasColumn(col) || r[col] == DBNull.Value)
                return null;

            return r[col].ToString();
        }


        public static bool HasColumn(this SqlDataReader reader, string columnName)
        {
            for (int i = 0; i < reader.FieldCount; i++)
            {
                if (reader.GetName(i).Equals(columnName, StringComparison.OrdinalIgnoreCase))
                    return true;
            }
            return false;
        }


        public static int? GetNullableInt(this SqlDataReader r, string col)
        {
            if (!r.HasColumn(col) || r[col] == DBNull.Value)
                return null;

            return Convert.ToInt32(r[col]);
        }

        // -------------------------
        // BOOL
        // -------------------------
        public static bool GetBool(this SqlDataReader r, string col)
        {
            if (!r.HasColumn(col) || r[col] == DBNull.Value)
                return false;

            return Convert.ToBoolean(r[col]);
        }

        public static bool? GetNullableBool(this SqlDataReader r, string col)
        {
            if (!r.HasColumn(col) || r[col] == DBNull.Value)
                return null;

            return Convert.ToBoolean(r[col]);
        }

        // -------------------------
        // DATETIME
        // -------------------------
        public static DateTime GetDateTime(this SqlDataReader r, string col)
        {
            if (!r.HasColumn(col) || r[col] == DBNull.Value)
                return DateTime.MinValue;

            return Convert.ToDateTime(r[col]);
        }

        public static DateTime? GetNullableDateTime(this SqlDataReader r, string col)
        {
            if (!r.HasColumn(col) || r[col] == DBNull.Value)
                return null;

            return Convert.ToDateTime(r[col]);
        }

        // -------------------------
        // DECIMAL
        // -------------------------
        public static decimal GetDecimal(this SqlDataReader r, string col)
        {
            if (!r.HasColumn(col) || r[col] == DBNull.Value)
                return 0;

            return Convert.ToDecimal(r[col]);
        }

        public static decimal? GetNullableDecimal(this SqlDataReader r, string col)
        {
            if (!r.HasColumn(col) || r[col] == DBNull.Value)
                return null;

            return Convert.ToDecimal(r[col]);
        }

        // -------------------------
        // DOUBLE
        // -------------------------


        public static double GetDouble(this SqlDataReader r, string col)
        {
            if (!r.HasColumn(col) || r[col] == DBNull.Value)
                return 0;

            return Convert.ToDouble(r[col]);
        }

        public static double? GetNullableDouble(this SqlDataReader r, string col)
        {
            if (!r.HasColumn(col) || r[col] == DBNull.Value)
                return null;

            return Convert.ToDouble(r[col]);
        }



    }
}
