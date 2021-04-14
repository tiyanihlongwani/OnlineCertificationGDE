using BusinessLogicLayer;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Configuration;
using System.Linq;
using System.Web;
using OnlineSurvey.Models;
using DataLibrary;
using DataLibrary.Entities;
using DataLibrary.DataAccessLayer.Repositories;

namespace OnlineSurvey.Pages.Account
{
    public partial class SchoolDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string schoolID = CryptorEngine.Decrypt(Request.QueryString["Data"]);  

                UserVerificationRepository _repo = new UserVerificationRepository();
                SchoolModel data = _repo.GetSchoolByID(Convert.ToInt32(schoolID));

                if (data != null)
                {
                    hdfSchoolID.Value = schoolID.ToString();
                    lblSchoolName.InnerText = data.Name;
                    lblSchoolLevel.InnerText = data.Level;
                    lblEMISNo.InnerText = data.EMISNo;
                    lblEducationalDistrict.InnerText = data.DistrictName;
                    lblRelationWithState.InnerText = data.RelationWithState;
                }
            }
        }
    }
}