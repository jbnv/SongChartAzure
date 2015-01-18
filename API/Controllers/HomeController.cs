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
        public List<Decade> Decades;
        public Dictionary<short, Year> Years;
        // Separate lists of numbers to facilitate iteration.
        public List<short> DecadeNumbers;
        public List<short> YearNumbers;

        public List<Artist> Artists;
        public List<Word> Words;

        public HomePageData()
        {
            this.Decades = new List<Decade>();
            this.Years = new Dictionary<short, Year>();
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

            // Get the data.

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

            //TODO Get month data.

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

            return data;
        }
    }
}
