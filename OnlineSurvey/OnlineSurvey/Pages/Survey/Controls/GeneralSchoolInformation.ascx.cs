using DataLibrary.Entities;
using DataLibrary;
using DataLibrary.DataAccessLayer.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineSurvey.Pages.Survey.Controls
{
    public partial class GeneralSchoolInformation : System.Web.UI.UserControl
    {
        public int SchoolID { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UserVerificationRepository _repo = new UserVerificationRepository();
                SchoolModel data = _repo.GetSchoolByID(SchoolID);

                if (data != null)
                {
                    hdfSchoolID.Value = SchoolID.ToString();
                    lblSchoolName.InnerText = data.Name;
                    lblSchoolLevel.InnerText = data.Level;
                    lblEMISNo.InnerText = data.EMISNo;
                    lblEducationalDistrict.InnerText = data.DistrictName;
                    lblRelationWithState.InnerText = data.RelationWithState;
                    lblEmailAddress.InnerText = data.PrincipalEmailAddress;
                    lblPrincipalName.InnerText = data.PrincipalName;
                    lblPrincipalIDNo.InnerText = data.PrincipalIdentityNo;
                    lblPrincipalCellphoneNo.InnerText = data.PrincipalMobileNo;
                    lblPrincipalPersalNo.InnerText = data.PrincipalPersalNo;
                    
                    Session["CurrentUser"] = data.PrincipalName;
                }
            }
        }
    }
}