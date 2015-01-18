using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;

namespace API.Models
{
    public class Artist : Chartable
    {
        public Genre Genre { get; set; }

        public static Artist FromDataRecord(IDataRecord dr)
        {
            Artist o = new Artist();
            int ordinal;

            o.Id = dr.GetInt32(dr.GetOrdinal("Id"));

            o.Fullname = dr.GetString(dr.GetOrdinal("Fullname"));

            o.Title = dr.GetString(dr.GetOrdinal("Title"));

            ordinal = dr.GetOrdinal("GenreId");
            if (!dr.IsDBNull(ordinal))
            {
                Genre genre = new Genre();
                genre.Id = dr.GetInt32(ordinal);
                genre.Fullname = dr.GetString(dr.GetOrdinal("GenreFullname"));
                genre.Title = dr.GetString(dr.GetOrdinal("GenreTitle"));
                o.Genre = genre;
            }

            o.SongCount = dr.GetInt64(dr.GetOrdinal("SongCount"));

            o.Score = dr.GetDecimal(dr.GetOrdinal("Score"));

            ordinal = dr.GetOrdinal("Tags");
            o.Tags = dr.IsDBNull(ordinal) ? "" : dr.GetString(ordinal);

            return o;
        }

    } // class

} // namespace