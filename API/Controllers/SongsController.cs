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
        public Song Get([FromUri] string fullname)
        {
            //if (fullname.Substring(0, 2) != "s:")
            //{
            //    fullname = "s:" + fullname;
            //}

            //Song song;
            //GetAction<Song> getAction = new GetAction<Song>();
            //getAction.AddParameter(new SqlParameter("@Fullname", fullname));
            //getAction.ProcedureName = "Songs_GetOne";
            //getAction.IDataRecordFunc = Song.FromDataRecord;
            //song = getAction.Execute()[0];

            ////if (song == null)
            ////{
            ////    return NotFound();
            ////}
            ////return Ok(song);
            //return song;
            return new Song();
        }
    

        //public IEnumerable<Song> GetAllSongs()
        //{
        //    //TODO Call the appropriate procedure in database.
        //}

    }
}
