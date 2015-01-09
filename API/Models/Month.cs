using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace API.Models
{
    public class Month : Chart
    {
        public short YearNumber { get; private set; }
        public byte MonthOrdinal { get; private set; }

        public Month() : base()
        {
            //this.Route = "#month/" + this.YearNumber.ToString()+"/"+this.MonthOrdinal.ToString();
            //this.Slug = this.YearNumber.ToString()+"-"+this.MonthOrdinal.ToString(); INCOMPLETE!
            //this.Fullname = "calendar:" + this.Slug;
        }
    }

   
}
