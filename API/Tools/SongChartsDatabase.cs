using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace API
{
    public class SongChartsDatabase
    {
        public static SqlConnection Connection()
        {
            return new SqlConnection(ConfigurationManager.ConnectionStrings["SongChartsDB"].ConnectionString);
        }
    }
}