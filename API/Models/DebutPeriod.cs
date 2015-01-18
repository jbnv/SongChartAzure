using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Text.RegularExpressions;

namespace API.Models
{
    public class DebutPeriod : Dictionary<string,object>
    {
        public DebutPeriod(string s)
        {

            this.Add("slug", s.Replace("calendar:", ""));

            Regex expression;
            Match m;

            // Debut (month charts only)
            if (s == "debut")
            {
                this.Add("debut", true);
                this.Add("hash", null); // field must be returned 
                return;
            }

            this.Add("debut", false);

            // Decade 
            expression = new Regex(@"^(calendar:)?(?<decade>\d\d\d\d)s$");
            m = expression.Match(s);
            if (m.Success)
            {
                short decade;
                short.TryParse(m.Result("${decade}"), out decade);
                this.Add("decade", decade);
                this.Add("hash", String.Format("decade/" , decade));
                return;
            }

            // Year 
            expression = new Regex(@"^(calendar:)?(?<year>\d\d\d\d)$");
            m = expression.Match(s);
            if (m.Success)
            {
                short year;
                short.TryParse(m.Result("${year}"), out year);
                this.Add("year", year);
                this.Add("hash", String.Format("year/" , year));
                return;
            }

            // Month 
            expression = new Regex(@"^(calendar:)?(?<year>\d\d\d\d)-(?<month>\d\d)$");
            m = expression.Match(s);
            if (m.Success)
            {
                short year;
                short.TryParse(m.Result("${year}"), out year);
                byte month;
                byte.TryParse(m.Result("${month}"), out month);
                this.Add("year", year);
                this.Add("month", month);
                this.Add("hash", String.Format("month/{0}/{1}" , year, month));
                return;
            }

            this.Add("hash", null); // field must be returned 
        }
    }

}
