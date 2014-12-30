using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace API
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
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
                name: "Other",
                routeTemplate: "{controller}/{id}"
            );
        }
    }
}
