using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using API.Models;
using API.Tools;

namespace API.Controllers
{
    public class ArtistsController : ApiController
    {
        [AllowAnonymous]
        [HttpGet]
        public Artist Get([FromUri] int id)
        {
            GetAction<Artist> getAction = new GetAction<Artist>();
            getAction.AddParameter(new ActionParameter("@id", id));
            getAction.ProcedureName = "dbo.Artists_GetOne";
            getAction.IDataRecordFunc = Artist.FromDataRecord;

            List<Artist> hits = getAction.Execute();
            if (hits.Count == 1)
                return hits[0];
            else
                return null;
        }
    }
}
