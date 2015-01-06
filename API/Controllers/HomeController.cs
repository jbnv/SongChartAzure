using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace API.Controllers
{
    public class DecadeCount
    {
        public short decade;
        public int count;
    }

    public class YearCount
    {
        public short year;
        public int count;
    }

    public class HomePageData
    {
        public List<DecadeCount> decades;
        public List<YearCount> years;

        public HomePageData()
        {
            decades = new List<DecadeCount>();
            years = new List<YearCount>();
        }
    }

    public class HomeController : ApiController
    {
        [AllowAnonymous]
        [HttpGet]
        public HomePageData Get()
        {
            HomePageData data = new HomePageData();

            SqlConnection conn = SongChartsDatabase.Connection();
            SqlCommand command;
            SqlDataReader reader;

            int groupOrdinal;
            int countOrdinal;

            // Get the data.
            conn.Open();

            command = new SqlCommand("SELECT [DecadeNumber],[SongCount] FROM [dbo].[DecadeSummaries]", conn);
            command.CommandType = CommandType.Text;
            command.CommandTimeout = 200;

            reader  = command.ExecuteReader();
            groupOrdinal = reader.GetOrdinal("DecadeNumber");
            countOrdinal = reader.GetOrdinal("SongCount");
            while (reader.Read())
            {
                DecadeCount o = new DecadeCount();
                o.decade = (short) reader.GetSqlInt16(groupOrdinal);
                o.count = (int)reader.GetInt32(countOrdinal);
                data.decades.Add(o);
            }
            reader.Close();

            command = new SqlCommand("SELECT [YearNumber],[SongCount] FROM [dbo].[YearSummaries]", conn);
            command.CommandType = CommandType.Text;
            command.CommandTimeout = 200;

            reader  = command.ExecuteReader();
            groupOrdinal = reader.GetOrdinal("YearNumber");
            countOrdinal = reader.GetOrdinal("SongCount");
            while (reader.Read())
            {
                YearCount o = new YearCount();
                o.year = (short)reader.GetSqlInt16(groupOrdinal);
                o.count = (int)reader.GetInt32(countOrdinal);
                data.years.Add(o);
            }
            reader.Close();

            //TODO Get month data.

            conn.Close();
            return data;
        }
    }
}
