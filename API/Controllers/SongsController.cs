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
    public class SongsController : ApiController
    {
        [AllowAnonymous]
        [HttpGet]
        public Song Get([FromUri] int id)
        {
            GetAction<Song> getAction = new GetAction<Song>();
            getAction.AddParameter(new SqlParameter("@id", id));
            getAction.ProcedureName = "dbo.Songs_GetOne";
            getAction.IDataRecordFunc = Song.FromDataRecord;

            List<Song> hits = getAction.Execute();
            if (hits.Count == 1)
                return hits[0];
            else
                return null;
            //return new Song();
        }
    

        //public IEnumerable<Song> GetAllSongs()
        //{
        //    //TODO Call the appropriate procedure in database.
        //}

    }
}
