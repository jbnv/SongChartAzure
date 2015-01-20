using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using API.Models;

namespace API.Controllers
{
    public class RankConflictsController : ApiController
    {
        [AllowAnonymous]
        [HttpGet]
        public List<object> Get()
        {
            List<object> data = new List<object>();

            SqlCommand command;
            SqlDataReader reader;

            // Get the data.

            using (SqlConnection conn = SongChartsDatabase.Connection())
            {

                conn.Open();

                command = new SqlCommand("SELECT [Year],[MonthOrdinal],[WeekOrdinal],[Rank],[Title],[Fullname] FROM [RankConflicts] ORDER BY 4,1,2,3", conn);
                command.CommandType = CommandType.Text;
                command.CommandTimeout = 200;

                reader = command.ExecuteReader();
                while (reader.Read())
                {
                    data.Add(new {
                        Year = reader.GetInt16(0),
                        MonthOrdinal = reader.GetByte(1),
                        WeekOrdinal = reader.GetByte(2),
                        Rank = reader.GetDecimal(3),
                        Title = reader.GetString(4),
                        Fullname = reader.GetString(5)
                    });
                }
                reader.Close();

                conn.Close();

            } // using

            // All done.

            return data;
        }
    }
}
