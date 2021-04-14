using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataLibrary;

namespace OnlineSurvey
{
    public partial class Home : System.Web.UI.Page
    {
        string strconn = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString.ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (chkIsActive.Checked)
                btnCreateAccount.Enabled = true;
            else
                btnCreateAccount.Enabled = false;
        }
        protected void btnCreateAccount_Click(object sender, EventArgs e)
        {

            Response.Redirect("/Pages/Account/UserRegistration.aspx");
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}