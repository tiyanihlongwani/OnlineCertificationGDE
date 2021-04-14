using BusinessLogicLayer;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineSurvey.Models;

namespace OnlineSurvey.Pages.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                // Validate the user password
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();
                //manager.UserLockoutEnabledByDefault = true;
                //manager.DefaultAccountLockoutTimeSpan = TimeSpan.FromMinutes(1);
                //manager.MaxFailedAccessAttemptsBeforeLockout = 2;
                // This doen't count login failures towards account lockout
                // To enable password failures to trigger lockout, change to shouldLockout: true
                var result = signinManager.PasswordSignIn(txtIDNumber.Text, Password.Text, true, shouldLockout: false);
               
                switch (result)
                {
                    case SignInStatus.LockedOut:
                        break;
                    case SignInStatus.Success:
                        ApplicationUser user = manager.FindByName(txtIDNumber.Text);

                        Session["UserId"] = user.Id;
                        Session["IDNumber"] = txtIDNumber.Text;
                        if(!user.EmailConfirmed)
                        {
                            Uri uri = HttpContext.Current.Request.Url;
                            string baseUrl = uri.Scheme + "://" + uri.Authority + HttpContext.Current.Request.ApplicationPath;
                            baseUrl = baseUrl.EndsWith("/") ? baseUrl : baseUrl + '/';
                            string data = HttpContext.Current.Server.UrlEncode(EncryptionHelper.EncryptData(user.Id.ToString()));
                            string url = "OTPVerification.aspx?Data=" + data;
                            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
                            Session.Abandon();
                            Response.Redirect(url);                       
                        }

                        var trainee = BusinessLogicLayer.Trainee.ByIdNumber(txtIDNumber.Text.Trim()); 
                        if (trainee.Id == 0)
                        {
                            errorMessageHeader.InnerText = "Warning!";
                            spErorrMessage.InnerText = "No profile details found for this user account. Please click OK or go to Profile link on the menu to capture the details.";
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowErrorMessage();", true);
                            break;
                        }

                        if (((ClaimsIdentity)User.Identity).FindFirstValue("CanApprove") == "1")
                        {
                            Response.Redirect("../Training/Approvals.aspx");
                        }

                        Response.Redirect("../Training/Dashboard.aspx");
                        break;                    
                    case SignInStatus.Failure:
                    default:
                        spError.InnerText = "Invalid Username or Password";
                        spError.Visible = true;
                        divError.Visible = true;
                        break;
                }
            }
        }
    }
}