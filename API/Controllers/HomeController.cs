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
    // Format the data here so that it doesn't have to be formatted on the page.

    public class HomePageData
    {
        public List<Decade> Decades { get; private set; }
        public Dictionary<short, Year> Years { get; private set; }
        // Separate lists of numbers to facilitate iteration.
        public List<short> DecadeNumbers;
        public List<short> YearNumbers;

        public List<Artist> Artists { get; private set; }
        public List<Genre> Genres { get; private set; }
        public List<object> CommonWords { get; private set; }
        public List<string> UniqueWords { get; private set; }

        public HomePageData()
        {
            this.Decades = new List<Decade>();
            this.Years = new Dictionary<short, Year>();

            this.Artists = new List<Artist>();
            this.Genres = new List<Genre>();
            this.CommonWords = new List<object>();
            this.UniqueWords = new List<string>();
        }
    }

    public class HomeController : ApiController
    {
        [AllowAnonymous]
        [HttpGet]
        public HomePageData Get()
        {
            HomePageData data = new HomePageData();

            SqlCommand command;
            SqlDataReader reader;

            // Get the data.

            using (SqlConnection conn = SongChartsDatabase.Connection()) {

                conn.Open();

                command = new SqlCommand("SELECT [DecadeNumber],[SongCount] FROM [dbo].[DecadeSummaries] ORDER BY [DecadeNumber]", conn);
                command.CommandType = CommandType.Text;
                command.CommandTimeout = 200;

                reader  = command.ExecuteReader();
                while (reader.Read())
                {
                    Decade decade = new Decade();
                    decade.GetSummaryData(reader);
                    data.Decades.Add(decade);
                }
                reader.Close();

                command = new SqlCommand("SELECT [YearNumber],[SongCount] FROM [dbo].[YearSummaries] ORDER BY [YearNumber]", conn);
                command.CommandType = CommandType.Text;
                command.CommandTimeout = 200;

                reader  = command.ExecuteReader();
                while (reader.Read())
                {
                    Year year = new Year();
                    year.GetSummaryData(reader);
                    data.Years.Add(year.Number, year);
                }
                reader.Close();

                Get_Artists(conn, data);
                Get_Genres(conn, data);
                Get_CommonWords(conn, data);
                Get_UniqueWords(conn, data);

                conn.Close();

                // Massage data and form output object.

                //TEMP? data.DecadeNumbers = data.Decades.Keys.ToList();
                //TEMP? data.YearNumbers = data.Years.Keys.ToList();

                // Put the year data into the respective decade objects.
                foreach (Decade decade in data.Decades)
                {
                    short decadeNumber = decade.Number;
                    // decade.Years == {}
                    short[] yearOrdinals = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
                    foreach (short y in yearOrdinals)
                    {
                        short yearNumber = (short)(decadeNumber + y);
                        Year year;
                        if (data.Years.ContainsKey(yearNumber))
                        {
                            year = data.Years[yearNumber];
                        }
                        else
                        {
                            year = new Year(yearNumber);
                        }
                        decade.Years.Add( year);
                    }
                }

                // Get artist summary.



            } // using

            // All done.

            return data;
        }

        private void Get_Artists(SqlConnection connection, HomePageData data)
        {
            string sql = "SELECT TOP 40 [Id],[Title],[SongCount],[Score] FROM [Artists] ORDER BY [Score] DESC";

            SqlCommand command = new SqlCommand(sql, connection);
            command.CommandType = CommandType.Text;
            command.CommandTimeout = 200;

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                Artist a = new Artist();
                a.Id = reader.GetInt32(0);
                a.Title = reader.GetString(1);
                a.SongCount = reader.GetInt16(2);
                a.Score = reader.GetDecimal(3);
                data.Artists.Add(a);
            }
            reader.Close();
        }

        private void Get_Genres(SqlConnection connection, HomePageData data)
        {
            string sql = "SELECT TOP 40 [Id],[Title],[SongCount],[Score] FROM [Genres] ORDER BY [Score] DESC";

            SqlCommand command = new SqlCommand(sql, connection);
            command.CommandType = CommandType.Text;
            command.CommandTimeout = 200;

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                Genre a = new Genre();
                a.Id = reader.GetInt32(0);
                a.Title = reader.GetString(1);
                a.SongCount = reader.GetInt16(2);
                a.Score = reader.GetDecimal(3);
                data.Genres.Add(a);
            }
            reader.Close();
        }

        private void Get_CommonWords(SqlConnection connection, HomePageData data)
        {
            string sql = "SELECT TOP 40 [Word],COUNT(*) AS [SongCount] FROM [SongTitleWords] GROUP BY [Word] ORDER BY COUNT(*) DESC";

            SqlCommand command = new SqlCommand(sql, connection);
            command.CommandType = CommandType.Text;
            command.CommandTimeout = 200;

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                data.CommonWords.Add(new  { Title = reader.GetString(0), SongCount = reader.GetInt32(1)  });
            }
            reader.Close();
        }

        private void Get_UniqueWords(SqlConnection connection, HomePageData data)
        {
            string sql = "SELECT [Word] FROM [SongTitleWords] GROUP BY [Word] HAVING COUNT(*) = 1 ORDER BY [Word]";

            SqlCommand command = new SqlCommand(sql, connection);
            command.CommandType = CommandType.Text;
            command.CommandTimeout = 200;

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                data.UniqueWords.Add(reader.GetString(0));
            }
            reader.Close();
        }

    }
}
