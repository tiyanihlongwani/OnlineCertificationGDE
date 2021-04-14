using BusinessLogicLayer;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Configuration;
using System.Linq;
using System.Web;
using OnlineSurvey.Models;
using DataLibrary;

namespace OnlineSurvey.Pages.Account
{
    public partial class OTPVerification : System.Web.UI.Page
    {
        string strConnection = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string data = CryptorEngine.Decrypt(Request.QueryString["Data"]);  
               
                string schoolID = data.Split('-')[0];
                string otp = data.Split('-')[1];

                hdfSchoolID.Value = CryptorEngine.Encrypt(schoolID);
                hdfOTP.Value = CryptorEngine.Encrypt(otp); 
            }
        }
    }
}