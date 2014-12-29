﻿using System;
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
                name: "SongChartsAPI",
                routeTemplate: "{controller}/{id}"
            );
        }
    }
}
