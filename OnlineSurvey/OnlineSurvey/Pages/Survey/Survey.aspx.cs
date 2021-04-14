using BusinessLogicLayer;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using OnlineSurvey.Models;
using DataLibrary;

namespace OnlineSurvey.Pages.Survey
{
    public partial class Survey : System.Web.UI.Page
    {
        string strConnection = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            string schoolID = CryptorEngine.Decrypt(Request.QueryString["Data"]);  

            hdfSchoolID.Value = schoolID;
            GeneralSchoolInformation.SchoolID = Convert.ToInt32(schoolID);
        }
    }
}