using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Http;
using SchoolWebSite.Models;

namespace SchoolWebSite
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            GlobalConfiguration.Configure(WebApiConfig.Register);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        void Session_Start(object sender, EventArgs e)
        {
            //Code that runs when a new session is started
            Application.Lock();
            using (var dbContext = new SmarteezDatabaseEntities())
            {
                WebSiteUser websiteUser = new WebSiteUser()
                {
                    ClientBrowser = HttpContext.Current.Request.Browser.Browser,
                    MachineIP = string.IsNullOrEmpty(HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"]) ? HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"] : HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"],
                    VisitDate = DateTime.Now
                };
                int i = dbContext.Users.Count();
                dbContext.WebSiteUsers.Add(websiteUser);
                dbContext.SaveChanges();
                int userCount = dbContext.WebSiteUsers.Count<WebSiteUser>() + 1000;
                Application.Add("UserCount", userCount);
            }
            Application.UnLock();
        }

    }
}