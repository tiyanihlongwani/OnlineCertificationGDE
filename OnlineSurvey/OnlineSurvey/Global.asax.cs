using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace OnlineSurvey
{
    public class Global : HttpApplication
    {
        public static string UserId { get; set; }
        public static string SchoolId { get; set; }
        public static string SchoolName { get; set; }
        public static string DistrictId { get; set; }
        public static string DistrictName { get; set; }
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
    }
}