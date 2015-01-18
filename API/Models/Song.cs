using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Xml;
using System.Xml.Linq;

namespace API.Models
{
    public class Song
    {
        public class SongArtist
        {
            public Artist Artist { get; set; }
            public string RoleSlug { get; set; }
        }

        public long ChartRank { get; set; }
        public string Fullname { get; set; }
        public string Title { get; set; }
        public List<SongArtist> Artists { get; set; }
        public Genre Genre { get; set; }
        public Decimal Score { get; set; }
        public Decimal DebutRank { get; set; }
        public Decimal PeakRank { get; set; }
        public Decimal Duration { get; set; }
        public DebutPeriod DebutDate { get; set; }
        public Decimal[] Ranks { get; set;  }
        public string Tags { get; set; }

        public Song()
        {

        }

        public static  Song FromDataRecord(IDataRecord dr)
        {
            Song o = new Song();
            int ordinal;

            try
            {
                o.ChartRank = dr.GetInt64(dr.GetOrdinal("ChartRank"));
            }
            catch (IndexOutOfRangeException iorx) {
                // Ignore these.
            }

            o.Fullname = dr.GetString(dr.GetOrdinal("Fullname"));

            o.Title = dr.GetString(dr.GetOrdinal("Title"));

            ordinal = dr.GetOrdinal("ArtistsXML");
            if (!dr.IsDBNull(ordinal))
            {
                o.Artists = new List<SongArtist>();
                XDocument doc = XDocument.Parse("<root>"+dr.GetString(ordinal)+"</root>");
                foreach (XElement element in doc.Root.Descendants()) {
                    Artist artist = new Artist() { 
                        Id = (int) element.Attribute("Id"), 
                        Fullname = (string) element.Attribute("Fullname"), 
                        Title = (string) element.Attribute("Title") 
                    };
                    SongArtist sa = new SongArtist()
                    {
                        Artist = artist,
                        RoleSlug = (string)element.Attribute("RoleSlug")
                    };
                    o.Artists.Add(sa);
                }
            }

            ordinal = dr.GetOrdinal("GenreId");
            if (!dr.IsDBNull(ordinal))
            {
                Genre genre = new Genre();
                genre.Id = dr.GetInt32(ordinal);
                genre.Fullname = dr.GetString(dr.GetOrdinal("GenreFullname"));
                genre.Title = dr.GetString(dr.GetOrdinal("GenreTitle"));
                o.Genre = genre;
            }

            //public Decimal[] Ranks { get; set;  }

            ordinal = dr.GetOrdinal("Score");
            o.Score = dr.IsDBNull(ordinal) ? 0 : dr.GetDecimal(ordinal);

            ordinal = dr.GetOrdinal("DebutRank");
            o.DebutRank = dr.IsDBNull(ordinal) ? 0 : dr.GetDecimal(ordinal);

            ordinal = dr.GetOrdinal("PeakRank");
            o.PeakRank = dr.IsDBNull(ordinal) ? 0 : dr.GetDecimal(ordinal);

            ordinal = dr.GetOrdinal("Duration");
            o.Duration = dr.IsDBNull(ordinal) ? 0 : dr.GetInt32(ordinal);

            ordinal = dr.GetOrdinal("DebutDateFullname");
            if (!dr.IsDBNull(ordinal))
            {
                o.DebutDate = new DebutPeriod(dr.GetString(ordinal));
            }

            ordinal = dr.GetOrdinal("Tags");
            o.Tags = dr.IsDBNull(ordinal) ? "" : dr.GetString(ordinal);

            return o;
        }

    }

}