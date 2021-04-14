using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using DataLibrary.Entities;
using DataLibrary.DataAccessLayer.Repositories;
using DataLibrary.Notification;
using System.Web.Script.Serialization;
using DataLibrary;
using System.Web.Services.Description;
using OnlineSurvey.Pages.Survey.Controls;
using DataLibrary.DataAccessLayer;

namespace OnlineSurvey.Services
{
    /// <summary>
    /// Summary description for Service
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class Service : System.Web.Services.WebService
    {
        #region General School Information

        [WebMethod(EnableSession = true)]
        public string GetSchoolByEMISNo(string emisNo)
        {
            string results = string.Empty;
            JavaScriptSerializer js = new JavaScriptSerializer();

            try
            {
                UserVerificationRepository _repo = new UserVerificationRepository();
                SchoolModel data = _repo.GetSchoolByEMISNo(emisNo);

                if (data != null)
                {
                    if(data.IsSurveySubmitted)
                    {
                        throw new Exception("Survey Already Submitted to the GDE.");
                    }

                  //  string encryptedData = HttpContext.Current.Server.UrlEncode(EncryptionHelper.EncryptData(data.ID.ToString()));

                    string encryptedData = CryptorEngine.Encrypt(data.ID.ToString());

                    results = js.Serialize(new { School = data, Data = encryptedData });
                }
            }
            catch (Exception ex)
            {
                results = js.Serialize(string.Format("Error - {0}", ex.Message));
            }

            return results;
        }

        [WebMethod(EnableSession = true)]
        public string VerifyUser(string emisNo, string persalNo, string identityNo)
        {
            string results = string.Empty;
            JavaScriptSerializer js = new JavaScriptSerializer();

            try
            {
                string[] args = { emisNo, persalNo, identityNo };
                UserVerificationRepository _repo = new UserVerificationRepository();
                SchoolModel data = _repo.GetSchoolByPrincipalDetails(emisNo, persalNo, identityNo);

                if (data != null)
                {
                    Random rnd = new Random();
                    string otp = rnd.Next(1000, 9999).ToString();

                    string emailAddress = data.PrincipalEmailAddress;
                    //   string cellphoneNo = data.PrincipalMobileNo;
                    string cellphoneNo = "0826793366";
                    //HttpContext.Current.Session["CurrentUser"] = data.PrincipalName;

                    //if (!string.IsNullOrEmpty(emailAddress))
                    //{
                    //    string[] emailArgs = { data.PrincipalName, otp };
                    //    NotificationHelper.SendEmail(emailAddress, "User Verification", DataLibrary.Notification.Message.UserVerificationEmailMessage(emailArgs));
                    //}

                    string[] smsArgs = { otp };
                    NotificationHelper.SMS(cellphoneNo.Trim(), DataLibrary.Notification.Message.UserVerificationSMSMessage(smsArgs));

                   // string encryptedData = HttpContext.Current.Server.UrlEncode(EncryptionHelper.EncryptData(string.Format("{0}-{1}", data.ID, otp)));
                    string encryptedData = CryptorEngine.Encrypt(string.Format("{0}-{1}", data.ID, otp)); 

                    results = js.Serialize(new { School = data, Data = encryptedData });
                }
            }
            catch (Exception ex)
            {
                results = js.Serialize(string.Format("Error - {0}", ex.Message));
            }

            return results;
        }

        [WebMethod]
        public string VerifyOTP(string userOTPNo, string systemOTPNo, string schoolID)
        {
            string results = string.Empty;
            JavaScriptSerializer js = new JavaScriptSerializer();

            try
            {
                var serverOTP = CryptorEngine.Decrypt(systemOTPNo);
                if (userOTPNo == serverOTP)
                {
                    var data = new { Message = "Success", Data = schoolID };
                    results = js.Serialize(data);
                }
            }
            catch (Exception ex)
            {
                var data = new { Message = "Error", Data = string.Format("Error - {0}", ex.Message) };
                results = js.Serialize(data);
            }

            return results;
        }

        [WebMethod]
        public string SaveSchoolDetails(SchoolModel school)
        {
            string results = string.Empty;
            JavaScriptSerializer js = new JavaScriptSerializer();

            try
            {
                //string[] args = { schoolID, emailAddress };

                SurveyRepository repo = new SurveyRepository();
                var data = repo.SaveSchoolDetails(school);
                //Send OTP here
                if (data != null)
                {
                    Random rnd = new Random();
                    string otp = rnd.Next(1000, 9999).ToString();

                    string emailAddress = data.PrincipalEmailAddress;
                    string cellphoneNo = data.PrincipalMobileNo;
                    //HttpContext.Current.Session["CurrentUser"] = data.PrincipalName;

                    //if (!string.IsNullOrEmpty(emailAddress))
                    //{
                    //    string[] emailArgs = { data.PrincipalName, otp };
                    //    NotificationHelper.SendEmail(emailAddress, "User Verification", DataLibrary.Notification.Message.UserVerificationEmailMessage(emailArgs));
                    //}

                    string[] smsArgs = { otp };
                    NotificationHelper.SMS(cellphoneNo.Trim(), DataLibrary.Notification.Message.UserVerificationSMSMessage(smsArgs));

                  //  string encryptedData = HttpContext.Current.Server.UrlEncode(EncryptionHelper.EncryptData(string.Format("{0}-{1}", data.ID, otp)));
                    string encryptedData = CryptorEngine.Encrypt(string.Format("{0}-{1}", data.ID, otp)); 

                    results = js.Serialize(new {Message = "Success", Data = encryptedData });
                }
                else
                {
                    results = js.Serialize(new { Message = "There was an error when saving school details.", Data = data });
                }
            }
            catch (Exception ex)
            {
                results = js.Serialize(new { Message = string.Format("Error - {0}", ex.Message) });

                results = js.Serialize(string.Format("Error - {0}", ex.Message));
            }

            return results;
        }

        [WebMethod]
        public string ResetOTP(string schoolID)
        {
            string results = string.Empty;
            JavaScriptSerializer js = new JavaScriptSerializer();

            try
            {
                string lSchoolID = CryptorEngine.Decrypt(schoolID);
                UserVerificationRepository _repo = new UserVerificationRepository();
                var data = _repo.GetSchoolByID(Convert.ToInt32(lSchoolID));
              
                if (data != null)
                {
                    Random rnd = new Random();
                    string otp = rnd.Next(1000, 9999).ToString();

                    string emailAddress = data.PrincipalEmailAddress;
                    string cellphoneNo = data.PrincipalMobileNo;

                    string[] smsArgs = { otp };
                    NotificationHelper.SMS(cellphoneNo.Trim(), DataLibrary.Notification.Message.UserVerificationSMSMessage(smsArgs));
                    string encryptedData = CryptorEngine.Encrypt(string.Format("{0}-{1}", data.ID, otp));

                    results = js.Serialize(new { Message = "Success", Data = encryptedData });
                }
                else
                {
                    results = js.Serialize(new { Message = "There was an error when resetting OTP.", Data = data });
                }
            }
            catch (Exception ex)
            {
                results = js.Serialize(new { Message = string.Format("Error - {0}", ex.Message) });

                results = js.Serialize(string.Format("Error - {0}", ex.Message));
            }

            return results;
        }

        #endregion General School Information

        #region Learner Information

        [WebMethod]
        public string SaveLearnerInformation(LearnerInformationModel learnerInformation, List<LearnerInformationByCategoryModel> learnerInformationByCategories, List<AverageLearnerAttendenceBetween31AugustAnd11SeptemberModel> averageLearnerAttendenceBetween31AugustAnd11September)
        {
            string results = string.Empty;
            List<string> resultList = new List<string>();
            JavaScriptSerializer js = new JavaScriptSerializer();

            try
            {
                //string[] args = { schoolID, emailAddress };

                SurveyRepository repo = new SurveyRepository();

                var learnerInfo = repo.SaveLearnerInformation(learnerInformation);
                if(learnerInfo != null)
                {
                    resultList.Add("Success");
                }

                foreach (var item in learnerInformationByCategories)
                {
                    var data = repo.SaveLearnerInformationByCategory(item);
                    if(data != null)
                    {
                        resultList.Add("Success");
                    }
                }

                foreach (var item in averageLearnerAttendenceBetween31AugustAnd11September)
                {
                    var data = repo.SaveAverageLearnerAttendenceBetween31AugustAnd11September(item);
                    if (data != null)
                    {
                        resultList.Add("Success");
                    }
                }
            }
            catch (Exception ex)
            {
                resultList.Add(string.Format("Error - {0}", ex.Message));
            }

            results = js.Serialize(resultList);
            return results;
        }

        [WebMethod(EnableSession = true)]
        public string GetLearnerInformationBySchoolID(int schoolID)
        {
            string results = string.Empty;
            JavaScriptSerializer js = new JavaScriptSerializer();

            try
            {
                SurveyRepository _repo = new SurveyRepository();
                LearnerInformationModel data = _repo.GetLearnerInformationBySchoolID(schoolID);

               results = js.Serialize(new { Message = "Success", Data = data });
            }
            catch (Exception ex)
            {
                results = js.Serialize(new { Message = string.Format("Error - {0}", ex.Message) });
            }

            return results;
        }

        [WebMethod(EnableSession = true)]
        public string GetAverageLearnerAttendenceBetween31AugustAnd11SeptemberBySchoolID(int schoolID)
        {
            string results = string.Empty;
            JavaScriptSerializer js = new JavaScriptSerializer();

            try
            {
                SurveyRepository _repo = new SurveyRepository();
                IEnumerable<AverageLearnerAttendenceBetween31AugustAnd11SeptemberModel> data = _repo.GetAverageLearnerAttendenceBetween31AugustAnd11SeptemberBySchoolID(schoolID);

                results = js.Serialize(new { Message = "Success", Data = data });
            }
            catch (Exception ex)
            {
                results = js.Serialize(new { Message = string.Format("Error - {0}", ex.Message) });
            }

            return results;
        }

        [WebMethod(EnableSession = true)]
        public string GetLearnerInformationByCategoryBySchoolID(int schoolID)
        {
            string results = string.Empty;
            JavaScriptSerializer js = new JavaScriptSerializer();

            try
            {
                SurveyRepository _repo = new SurveyRepository();
                IEnumerable<LearnerInformationByCategoryModel> data = _repo.GetLearnerInformationByCategoryBySchoolID(schoolID);

                results = js.Serialize(new { Message = "Success", Data = data });
            }
            catch (Exception ex)
            {
                results = js.Serialize(new { Message = string.Format("Error - {0}", ex.Message) });
            }

            return results;
        }

        #endregion Learner Information

        #region Staff Information
        

        [WebMethod]
        public string SaveStaffInformation(List<StaffInformationHeadCountModel> staffInformationHeadcount, List<StaffInformationManagementOfConcessionModel> staffInformationConcessions, StaffInformationSMTManagementOfAttendenceModel sMTManagementOfAttendence)
        {
            string results = string.Empty;
            List<string> resultList = new List<string>();
            JavaScriptSerializer js = new JavaScriptSerializer();

            try
            {
                SurveyRepository repo = new SurveyRepository();

                var learnerInfo = repo.SaveStaffInformationSMTManagementOfAttendence(sMTManagementOfAttendence);
                if (learnerInfo != null)
                {
                    resultList.Add("Success");
                }

                foreach (var item in staffInformationHeadcount)
                {
                    var data = repo.SaveStaffInformationHeadCount(item);
                    if (data != null)
                    {
                        resultList.Add("Success");
                    }
                }

                foreach (var item in staffInformationConcessions)
                {
                    var data = repo.SaveStaffInformationManagementOfConcession(item);
                    if (data != null)
                    {
                        resultList.Add("Success");
                    }
                }
            }
            catch (Exception ex)
            {
                resultList.Add(string.Format("Error - {0}", ex.Message));
            }

            results = js.Serialize(resultList);
            return results;
        }

        [WebMethod(EnableSession = true)]
        public string GetStaffInformationBySchoolID(int schoolID)
        {
            string results = string.Empty;
            JavaScriptSerializer js = new JavaScriptSerializer();

            try
            {
                SurveyRepository _repo = new SurveyRepository();
                IEnumerable<StaffInformationHeadCountModel> data = _repo.GetStaffInformationHeadCountBySchoolID(schoolID);

                results = js.Serialize(new { Message = "Success", Data = data });
            }
            catch (Exception ex)
            {
                results = js.Serialize(new { Message = string.Format("Error - {0}", ex.Message) });
            }

            return results;
        }

        [WebMethod(EnableSession = true)]
        public string GetStaffInformationConcessionsBySchoolID(int schoolID)
        {
            string results = string.Empty;
            JavaScriptSerializer js = new JavaScriptSerializer();

            try
            {
                SurveyRepository _repo = new SurveyRepository();
                IEnumerable<StaffInformationManagementOfConcessionModel> data = _repo.GetStaffInformationManagementOfConcessionBySchoolID(schoolID);

                results = js.Serialize(new { Message = "Success", Data = data });
            }
            catch (Exception ex)
            {
                results = js.Serialize(new { Message = string.Format("Error - {0}", ex.Message) });
            }

            return results;
        }

        [WebMethod(EnableSession = true)]
        public string GetStaffInformationManagementOfAbsenceBySMTBySchoolID(int schoolID)
        {
            string results = string.Empty;
            JavaScriptSerializer js = new JavaScriptSerializer();

            try
            {
                SurveyRepository _repo = new SurveyRepository();
                StaffInformationSMTManagementOfAttendenceModel data = _repo.GetStaffInformationSMTManagementOfAttendenceBySchoolID(schoolID);

                results = js.Serialize(new { Message = "Success", Data = data });
            }
            catch (Exception ex)
            {
                results = js.Serialize(new { Message = string.Format("Error - {0}", ex.Message) });
            }

            return results;
        }

        #endregion Staff Informtion

        #region Class information

        [WebMethod]
        public string SaveClassInformation(ClassInformationModel classInformtion, List<ClassInformationDetailModel> classInformationDetails, List<int> selectedCombinedGradesForMultiGradeClasses, List<int> selectedGradesThatDidNotRotate, List<int> selectedSchoolDisinfectors)
        {
            string results = string.Empty;
            List<string> resultList = new List<string>();
            JavaScriptSerializer js = new JavaScriptSerializer();

            try
            {
                SurveyRepository repo = new SurveyRepository();
                ClassInformationModel data = repo.SaveClassInformation(classInformtion, classInformationDetails, selectedCombinedGradesForMultiGradeClasses, selectedGradesThatDidNotRotate, selectedSchoolDisinfectors);

                if (data.ID > 0)
                {
                    resultList.Add("Success");
                }
            }
            catch (Exception ex)
            {
                resultList.Add(string.Format("Error - {0}", ex.Message));
            }

            results = js.Serialize(resultList);
            return results;
        }

        [WebMethod(EnableSession = true)]
        public string GetClassInformationBySchoolID(int schoolID)
        {
            string results = string.Empty;
            JavaScriptSerializer js = new JavaScriptSerializer();

            try
            {
                SurveyRepository _repo = new SurveyRepository();
                ClassInformationModel data = _repo.GetClassInformationBySchoolID(schoolID);

                results = js.Serialize(new { Message = "Success", Data = data });
            }
            catch (Exception ex)
            {
                results = js.Serialize(new { Message = string.Format("Error - {0}", ex.Message) });
            }

            return results;
        }

        #endregion Class Information

        #region Finance information

        [WebMethod]
        public string SaveFinanceInformation(FinanceModel financeInformtion)
        {
            string results = string.Empty;
            List<string> resultList = new List<string>();
            JavaScriptSerializer js = new JavaScriptSerializer();

            try
            {
                SurveyRepository repo = new SurveyRepository();
                FinanceModel data = repo.SaveFinanceInformation(financeInformtion);

                if (data.ID > 0)
                {
                    resultList.Add("Success");
                }
            }
            catch (Exception ex)
            {
                resultList.Add(string.Format("Error - {0}", ex.Message));
            }

            results = js.Serialize(resultList);
            return results;
        }

        [WebMethod(EnableSession = true)]
        public string GetFinanceInformationBySchoolID(int schoolID)
        {
            string results = string.Empty;
            JavaScriptSerializer js = new JavaScriptSerializer();

            try
            {
                SurveyRepository _repo = new SurveyRepository();
                FinanceModel data = _repo.GetFinanceInformationBySchoolID(schoolID);

                results = js.Serialize(new { Message = "Success", Data = data });
            }
            catch (Exception ex)
            {
                results = js.Serialize(new { Message = string.Format("Error - {0}", ex.Message) });
            }

            return results;
        }

        #endregion Finance Information

        #region Hostel Boarder information

        [WebMethod]
        public string SaveHostelBoardersInformation(HostelBoarderModel hostelBoarderInformation)
        {
            string results = string.Empty;
            List<string> resultList = new List<string>();
            JavaScriptSerializer js = new JavaScriptSerializer();

            try
            {
                SurveyRepository repo = new SurveyRepository();
                HostelBoarderModel data = repo.SaveHostelBoarderInformation(hostelBoarderInformation);

                if (data.ID > 0)
                {
                    resultList.Add("Success");
                }
            }
            catch (Exception ex)
            {
                resultList.Add(string.Format("Error - {0}", ex.Message));
            }

            results = js.Serialize(resultList);
            return results;
        }

        [WebMethod(EnableSession = true)]
        public string GetHostelBoardersInformationBySchoolID(int schoolID)
        {
            string results = string.Empty;
            JavaScriptSerializer js = new JavaScriptSerializer();

            try
            {
                SurveyRepository _repo = new SurveyRepository();
                HostelBoarderModel data = _repo.GetHostelBoarderInformationBySchoolID(schoolID);

                results = js.Serialize(new { Message = "Success", Data = data });
            }
            catch (Exception ex)
            {
                results = js.Serialize(new { Message = string.Format("Error - {0}", ex.Message) });
            }

            return results;
        }

        #endregion Hostel Boarder Information

        #region Infections And Mortality Information

        [WebMethod]
        public string SaveInfectionsAndMortalityInformation(List<LearnersCovid19StatisticsPerGradeModel> learnersByGradeCovid19Statistics, List<LearnersCovid19StatisticsPerAgeGroupModel> learnersByAgeGroupCovid19Statistics, List<StaffCovid19StatisticsPerAgeGroupModel> staffCovid19Statistics)
        {
            string results = string.Empty;
            List<string> resultList = new List<string>();
            JavaScriptSerializer js = new JavaScriptSerializer();

            try
            {
                SurveyRepository repo = new SurveyRepository();
                bool data = repo.SaveInfectionsAndMortalityInformation(learnersByGradeCovid19Statistics, learnersByAgeGroupCovid19Statistics, staffCovid19Statistics);

                if (data)
                {
                    resultList.Add("Success");
                }else
                {
                    resultList.Add("Error when saving Infections And Mortality Information");
                }
            }
            catch (Exception ex)
            {
                resultList.Add(string.Format("Error - {0}", ex.Message));
            }

            results = js.Serialize(resultList);
            return results;
        }

        [WebMethod(EnableSession = true)]
        public string GetInfectionsAndMortalityInformationBySchoolID(int schoolID)
        {
            string results = string.Empty;
            JavaScriptSerializer js = new JavaScriptSerializer();

            try
            {
                //learnersByGradeCovid19Statistics, learnersByAgeGroupCovid19Statistics, staffCovid19Statistics
                SurveyRepository _repo = new SurveyRepository();
                
                IEnumerable<LearnersCovid19StatisticsPerGradeModel> learnersByGradeCovid19Statistics = _repo.GetLearnersCovid19StatisticsPerGradeBySchoolID(schoolID);
                IEnumerable<LearnersCovid19StatisticsPerAgeGroupModel> learnersByAgeGroupCovid19Statistics = _repo.GetLearnersCovid19StatisticsPerAgeGroupBySchoolID(schoolID);
                IEnumerable<StaffCovid19StatisticsPerAgeGroupModel> staffCovid19Statistics = _repo.GetStaffCovid19StatisticsPerAgeGroupBySchoolID(schoolID);

                var data = new
                {
                    LearnersByGradeCovid19Statistics = learnersByGradeCovid19Statistics,
                    LearnersByAgeGroupCovid19Statistics = learnersByAgeGroupCovid19Statistics,
                    StaffCovid19Statistics = staffCovid19Statistics
                };

                results = js.Serialize(new { Message = "Success", Data = data });
            }
            catch (Exception ex)
            {
                results = js.Serialize(new { Message = string.Format("Error - {0}", ex.Message) });
            }

            return results;
        }

        #endregion Infections And Mortality Information

        #region Curriculum Delivery

        [WebMethod]
        public string SaveCurriculumDeliveryInformation(CurriculumDeliveryModel curriculumDelivery, List<EducatorResourceModel> teacherResources, List<CoveredGradeFundamentalModel> coveredGradeFundamentals, List<Grade12LevelOfCompletionModel> grade12LevelOfCompletion)
        {
            string results = string.Empty;
            List<string> resultList = new List<string>();
            JavaScriptSerializer js = new JavaScriptSerializer();

            try
            {
                SurveyRepository repo = new SurveyRepository();
                bool data = repo.SaveCurriculumDeliveryInformation(curriculumDelivery, teacherResources, coveredGradeFundamentals, grade12LevelOfCompletion);

                if (data)
                {
                    resultList.Add("Success");
                }
                else
                {
                    resultList.Add("Error when saving Curriculum Delivery Information");
                }
            }
            catch (Exception ex)
            {
                resultList.Add(string.Format("Error - {0}", ex.Message));
            }

            results = js.Serialize(resultList);
            return results;
        }

        [WebMethod(EnableSession = true)]
        public string GetCurriculumDeliveryInformationBySchoolID(int schoolID)
        {
            string results = string.Empty;
            JavaScriptSerializer js = new JavaScriptSerializer();

            try
            {
                //CurriculumDeliveryModel curriculumDelivery, List<EducatorResourceModel> teacherResources, List<CoveredGradeFundamentalModel> coveredGradeFundamentals, List<Grade12LevelOfCompletionModel> grade12LevelOfCompletion
                SurveyRepository _repo = new SurveyRepository();
               
                CurriculumDeliveryModel curriculumDelivery = _repo.GetCurriculumDeliveryBySchoolID(schoolID);
                IEnumerable<EducatorResourceModel> teacherResources = _repo.GetEducatorResourcesBySchoolID(schoolID);
                IEnumerable<CoveredGradeFundamentalModel> coveredGradeFundamentals = _repo.GetCoveredGradeFundamentalsBySchoolID(schoolID);
                IEnumerable<Grade12LevelOfCompletionModel> grade12LevelOfCompletion = _repo.GetGrade12LevelOfCompletionBySchoolID(schoolID);

                var data = new
                {
                    CurriculumDelivery = curriculumDelivery,
                    TeacherResources = teacherResources,
                    CoveredGradeFundamentals = coveredGradeFundamentals,
                    Grade12LevelOfCompletion = grade12LevelOfCompletion
                };

                results = js.Serialize(new { Message = "Success", Data = data });
            }
            catch (Exception ex)
            {
                results = js.Serialize(new { Message = string.Format("Error - {0}", ex.Message) });
            }

            return results;
        }

        #endregion Curriculum Delivery

        #region Enabling Conditions

        [WebMethod]
        public string SaveEnablingConditionsInformation(EnablingConditionModel enablingConditionsInformation, SchoolBuildingConditionModel buildingConditions, List<LTSMModel> noOfTextbooksList)
        {
            string results = string.Empty;
            List<string> resultList = new List<string>();
            JavaScriptSerializer js = new JavaScriptSerializer();

            try
            {
                SurveyRepository repo = new SurveyRepository();
                bool data = repo.SaveEnablingConditionsInformation(enablingConditionsInformation, buildingConditions, noOfTextbooksList);

                if (data)
                {
                    resultList.Add("Success");
                }
                else
                {
                    resultList.Add("Error when saving Enabling Conditions Information");
                }
            }
            catch (Exception ex)
            {
                resultList.Add(string.Format("Error - {0}", ex.Message));
            }

            results = js.Serialize(resultList);
            return results;
        }

        [WebMethod(EnableSession = true)]
        public string GetEnablingConditionsInformationBySchoolID(int schoolID)
        {
            string results = string.Empty;
            JavaScriptSerializer js = new JavaScriptSerializer();

            try
            {
                SurveyRepository _repo = new SurveyRepository();

                EnablingConditionModel enablingConditionsInformation = _repo.GetEnablingConditionsBySchoolID(schoolID);
                SchoolBuildingConditionModel buildingConditions = _repo.GetSchoolBuildingConditionBySchoolID(schoolID);
                IEnumerable<LTSMModel> noOfTextbooksList = _repo.GetLTSMBySchoolID(schoolID);

                var data = new
                {
                    EnablingConditions = enablingConditionsInformation,
                    BuildingConditions = buildingConditions,
                    LTSM = noOfTextbooksList
                };

                results = js.Serialize(new { Message = "Success", Data = data });
            }
            catch (Exception ex)
            {
                results = js.Serialize(new { Message = string.Format("Error - {0}", ex.Message) });
            }

            return results;
        }

        [WebMethod]
        public string SubmitSurvey(int schoolID)
        {
            string results = string.Empty;
            List<string> resultList = new List<string>();
            JavaScriptSerializer js = new JavaScriptSerializer();

            try
            {
                SurveyRepository repo = new SurveyRepository();
                SchoolModel data = repo.SubmitSurvey(schoolID);

                if (data != null)
                {
                    resultList.Add("Success");
                }
                else
                {
                    resultList.Add("Error when saving Submitting Survey");
                }
            }
            catch (Exception ex)
            {
                resultList.Add(string.Format("Error - {0}", ex.Message));
            }

            results = js.Serialize(resultList);
            return results;
        }


        #endregion Enabling Conditions
    }
}
