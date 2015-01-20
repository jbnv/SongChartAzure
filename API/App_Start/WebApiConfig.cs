using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Web.Http.Cors;

namespace API
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Cross-browser restriction.
            EnableCorsAttribute cors = new EnableCorsAttribute("http://localhost:50775", "*", "*");
            //TODO? cors.SupportsCredentials = true;
            config.EnableCors(cors);

            // Authorize.
            //TODO? config.Filters.Add(new AuthorizeAttribute());

            // Web API configuration and services
            //config.EnableSystemDiagnosticsTracing();
            config.Formatters.Add(new API.Tools.BrowserJsonFormatter());

            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DecadeSongChart",
                routeTemplate: "songcharts/decade/{decade}",
                defaults: new { controller = "SongCharts", action = "decade" }
            );

            config.Routes.MapHttpRoute(
                name: "YearSongChart",
                routeTemplate: "songcharts/year/{year}",
                defaults: new { controller = "SongCharts", action = "year" }
            );

            config.Routes.MapHttpRoute(
                name: "MonthSongChart",
                routeTemplate: "songcharts/month/{year}/{month}",
                defaults: new { controller = "SongCharts", action = "month" }
            );

            config.Routes.MapHttpRoute(
                name: "ArtistSongChart",
                routeTemplate: "songcharts/artist/{artist}",
                defaults: new { controller = "SongCharts", action = "artist" }
            );

            config.Routes.MapHttpRoute(
                name: "TopByPeakSongChart",
                routeTemplate: "songcharts/topByPeak",
                defaults: new { controller = "SongCharts", action = "topByPeak" }
            );

            config.Routes.MapHttpRoute(
                name: "TopByDebutSongChart",
                routeTemplate: "songcharts/topByDebut",
                defaults: new { controller = "SongCharts", action = "topByDebut" }
            );

            config.Routes.MapHttpRoute(
                name: "TopByDurationSongChart",
                routeTemplate: "songcharts/topByDuration",
                defaults: new { controller = "SongCharts", action = "topByDuration" }
            );

            config.Routes.MapHttpRoute(
                name: "Home",
                routeTemplate: "home",
                defaults: new { controller = "Home" }
            );

            config.Routes.MapHttpRoute(
                name: "Rank Conflicts",
                routeTemplate: "rankconflicts",
                defaults: new { controller = "RankConflicts" }
            );

            config.Routes.MapHttpRoute(
                name: "Other",
                routeTemplate: "{controller}/{id}"
            );
        }
    }
}
