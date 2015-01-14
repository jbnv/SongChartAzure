using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using API.Models;
using API.Tools;

namespace API.Controllers
{
    public class SongChartsController : ApiController
    {
        [HttpGet]
        [ActionName("decade")]
        public List<Song> GetDecadeSongChart([FromUri] short decade) 
        { 
            GetAction<Song> getAction = new GetAction<Song>();
            getAction.AddParameter(new SqlParameter("@decade", decade));
            getAction.ProcedureName = "dbo.Songs_GetDecade";
            getAction.IDataRecordFunc = Song.FromDataRecord;
            return getAction.Execute();
        }

        [HttpGet]
        [ActionName("year")]
        public List<Song> GetYearSongChart([FromUri] short year)
        {
            GetAction<Song> getAction = new GetAction<Song>();
            getAction.AddParameter(new SqlParameter("@year", year));
            getAction.ProcedureName = "dbo.Songs_GetYear";
            getAction.IDataRecordFunc = Song.FromDataRecord;
            return getAction.Execute();
        }

        [HttpGet]
        [ActionName("month")]
        public List<Song> GetMonthSongChart([FromUri] short year, [FromUri] byte month)
        {
            GetAction<Song> getAction = new GetAction<Song>();
            getAction.AddParameter(new SqlParameter("@year", year));
            getAction.AddParameter(new SqlParameter("@month", month));
            getAction.ProcedureName = "dbo.Songs_GetMonth";
            getAction.IDataRecordFunc = Song.FromDataRecord;
            return getAction.Execute();
        }

        [HttpGet]
        [ActionName("artist")]
        public List<Song> GetArtistSongChart([FromUri] int artist)
        {
            GetAction<Song> getAction = new GetAction<Song>();
            getAction.AddParameter(new SqlParameter("@artistId", artist));
            getAction.ProcedureName = "dbo.Songs_GetArtist";
            getAction.IDataRecordFunc = Song.FromDataRecord;
            return getAction.Execute();
        }

        [HttpGet]
        [ActionName("topByPeak")]
        public List<Song> GetTopSongsByPeakChart([FromUri] int artistId)
        {
            GetAction<Song> getAction = new GetAction<Song>();
            getAction.ProcedureName = "dbo.Songs_GetTopByPeak";
            getAction.IDataRecordFunc = Song.FromDataRecord;
            return getAction.Execute();
        }

        [HttpGet]
        [ActionName("topByDebut")]
        public List<Song> GetTopSongsByDebutChart([FromUri] int artistId)
        {
            GetAction<Song> getAction = new GetAction<Song>();
            getAction.ProcedureName = "dbo.Songs_GetTopByDebut";
            getAction.IDataRecordFunc = Song.FromDataRecord;
            return getAction.Execute();
        }

        [HttpGet]
        [ActionName("topByDuration")]
        public List<Song> GetTopSongsByDurationChart([FromUri] int artistId)
        {
            GetAction<Song> getAction = new GetAction<Song>();
            getAction.ProcedureName = "dbo.Songs_GetTopByDuration";
            getAction.IDataRecordFunc = Song.FromDataRecord;
            return getAction.Execute();
        }

    }
}
