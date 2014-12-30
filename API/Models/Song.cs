using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;

namespace API.Models
{
    public class Song
    {
        public string Fullname { get; set; }
        public string Title { get; set; }
        public Artist Artist { get; set; }
        public Genre Genre { get; set; }
        public Decimal Score { get; set; }
        public Decimal DebutRank { get; set; }
        public Decimal PeakRank { get; set; }
        public Decimal Duration { get; set; }
        //TODO public DebutDate { get; set; }
        public Decimal[] Ranks { get; set;  }

        public Song()
        {

        }

        public static  Song FromDataRecord(IDataRecord dr)
        {
            Song o = new Song();
            int ordinal;

            o.Fullname = dr.GetString(dr.GetOrdinal("Fullname"));

            o.Title = dr.GetString(dr.GetOrdinal("Title"));

            ordinal = dr.GetOrdinal("ArtistId");
            if (!dr.IsDBNull(ordinal))
            {
                Artist artist = new Artist();
                artist.Id = dr.GetInt32(ordinal);
                artist.Fullname = dr.GetString(dr.GetOrdinal("ArtistFullname"));
                artist.Title = dr.GetString(dr.GetOrdinal("ArtistTitle"));
                o.Artist = artist;
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

            //FIX! Invalid cast.
            //FIX! ordinal = dr.GetOrdinal("Duration");
            //FIX! o.Duration = dr.IsDBNull(ordinal) ? 0 : dr.GetDecimal(ordinal);

            return o;
        }

    }
}