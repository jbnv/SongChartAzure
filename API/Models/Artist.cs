using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace API.Models
{
    public class Artist
    {
        public int Id { get; set; }
        public string Fullname { get; set; }
        public string Title { get; set; }
        public Genre Genre { get; set; }
        public Decimal Score { get; set; }
    }
}