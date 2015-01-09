using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace API.Models
{
    public class Year : Chart
    {
        public short Number { get; private set; }
        public Dictionary<short, Month> Months { get; private set; }

        public Year()
            : base()
        {
            Months = new Dictionary<short, Month>();
        }

        public Year(short number) : this() {
            this.SetNumber(number);
        }

        private void SetNumber(short number)
        {
            this.Number = number;
            this.Title = this.Number.ToString();
            this.Route = "#year/" + this.Number.ToString();
            this.Slug = this.Number.ToString();
            this.Fullname = "calendar:" + this.Slug;
        }

            public void GetSummaryData(IDataReader reader)
            {
                int groupOrdinal = reader.GetOrdinal("YearNumber");
                int countOrdinal = reader.GetOrdinal("SongCount");

                this.SetNumber( (short)reader.GetInt16(groupOrdinal));
                this.SongCount = (int)reader.GetInt32(countOrdinal);
            }

            public void GetSongs()
            {
                //TODO
            }
    }

}