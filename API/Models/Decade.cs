using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace API.Models
{
    public class Decade : Chart
    {
        public short Number { get; private set; }
        public List<Year> Years { get; private set; }

        public Decade()
            : base()
        {
            Years = new List<Year>();
        }

        public Decade(short number)
            : this()
        {
            this.SetNumber(number);
        }

        private void SetNumber(short number)
        {
            this.Number = number;
            this.Title = this.Number.ToString() + "s";
            this.Route = "#decade/" + this.Number.ToString();
            this.Slug = this.Number.ToString() + "s";
            this.Fullname = "calendar:" + this.Slug;
        }

        public void GetSummaryData(IDataReader reader)
        {
            int groupOrdinal = reader.GetOrdinal("DecadeNumber");
            int countOrdinal = reader.GetOrdinal("SongCount");

            this.SetNumber(  (short)reader.GetInt16(groupOrdinal));
            this.SongCount = (int)reader.GetInt32(countOrdinal);
        }

        public void GetSongs()
        {
//TODO
        }
    }

}