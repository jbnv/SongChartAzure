using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API.Models
{
    public class Chart
    {
        public string Route { get; protected set; }
        public string Slug { get; protected set; }
        public string Fullname { get; protected set; }
        public string Title { get; protected set; }
        public int SongCount { get; protected set; }
        public List<Song> Songs { get; private set; }

        public Chart()
        {
            Songs = new List<Song>();

        }
    }

}
