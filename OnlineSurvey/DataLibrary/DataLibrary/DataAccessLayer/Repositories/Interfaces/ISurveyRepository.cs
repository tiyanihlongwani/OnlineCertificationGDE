using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataLibrary.Entities;

namespace DataLibrary.DataAccessLayer.Repositories.Interfaces
{
    public interface ISurveyRepository
    {
        #region General School Information
        SchoolModel SaveSchoolDetails(SchoolModel school);

        #endregion General School Information

        #region Learner Information
        AverageLearnerAttendenceBetween31AugustAnd11SeptemberModel SaveAverageLearnerAttendenceBetween31AugustAnd11September(AverageLearnerAttendenceBetween31AugustAnd11SeptemberModel model);
        LearnerInformationByCategoryModel SaveLearnerInformationByCategory(LearnerInformationByCategoryModel model);
        LearnerInformationModel SaveLearnerInformation(LearnerInformationModel model);

        IEnumerable<AverageLearnerAttendenceBetween31AugustAnd11SeptemberModel> GetAverageLearnerAttendenceBetween31AugustAnd11SeptemberBySchoolID(int schoolID);
        IEnumerable<LearnerInformationByCategoryModel> GetLearnerInformationByCategoryBySchoolID(int schoolID);
        LearnerInformationModel GetLearnerInformationBySchoolID(int schoolID);


        #endregion Learner Information

        #region Staff Information

        StaffInformationHeadCountModel SaveStaffInformationHeadCount(StaffInformationHeadCountModel model);
        StaffInformationManagementOfConcessionModel SaveStaffInformationManagementOfConcession(StaffInformationManagementOfConcessionModel model);
        StaffInformationSMTManagementOfAttendenceModel SaveStaffInformationSMTManagementOfAttendence(StaffInformationSMTManagementOfAttendenceModel model);
        IEnumerable<StaffInformationHeadCountModel> GetStaffInformationHeadCountBySchoolID(int schoolID);
        IEnumerable<StaffInformationManagementOfConcessionModel> GetStaffInformationManagementOfConcessionBySchoolID(int schoolID);
        StaffInformationSMTManagementOfAttendenceModel GetStaffInformationSMTManagementOfAttendenceBySchoolID(int schoolID);

        #endregion Staff Information

        #region Class Information

        ClassInformationModel SaveClassInformation(ClassInformationModel classInformtion, List<ClassInformationDetailModel> classInformationDetails, List<int> selectedCombinedGradesForMultiGradeClasses, List<int> selectedGradesThatDidNotRotate, List<int> selectedSchoolDisinfectors);
      //  ClassInformationDetailModel SaveClassInformationDetails(ClassInformationDetailModel model);
        ClassInformationModel GetClassInformationBySchoolID(int schoolID);

        IEnumerable<LookupItemModel> GetDisinfectorLooupItemsByClassInformationID(int id);

        #endregion Class Information

        #region Finance Information

        FinanceModel SaveFinanceInformation(FinanceModel financeInformation);
        FinanceModel GetFinanceInformationBySchoolID(int schoolID);

        #endregion Finance Information

        #region Hostel Boarders Information

        HostelBoarderModel SaveHostelBoarderInformation(HostelBoarderModel hostelBoarderInformation);
        HostelBoarderModel GetHostelBoarderInformationBySchoolID(int schoolID);

        #endregion Hostel Boarders Information

        #region Infections And Mortality Information

        bool SaveInfectionsAndMortalityInformation(List<LearnersCovid19StatisticsPerGradeModel> learnersByGradeCovid19Statistics, List<LearnersCovid19StatisticsPerAgeGroupModel> learnersByAgeGroupCovid19Statistics, List<StaffCovid19StatisticsPerAgeGroupModel> staffCovid19Statistics);
        IEnumerable<LearnersCovid19StatisticsPerGradeModel> GetLearnersCovid19StatisticsPerGradeBySchoolID(int schoolID);
        IEnumerable<LearnersCovid19StatisticsPerAgeGroupModel> GetLearnersCovid19StatisticsPerAgeGroupBySchoolID(int schoolID);
        IEnumerable<StaffCovid19StatisticsPerAgeGroupModel> GetStaffCovid19StatisticsPerAgeGroupBySchoolID(int schoolID);

        #endregion  Infections And Mortality Information

        #region Curriculum Delivery

        bool SaveCurriculumDeliveryInformation(CurriculumDeliveryModel curriculumDelivery, List<EducatorResourceModel> teacherResources, List<CoveredGradeFundamentalModel> coveredGradeFundamentals, List<Grade12LevelOfCompletionModel> grade12LevelOfCompletion);

        CurriculumDeliveryModel GetCurriculumDeliveryBySchoolID(int schoolID);
        IEnumerable<EducatorResourceModel> GetEducatorResourcesBySchoolID(int schoolID);
        IEnumerable<CoveredGradeFundamentalModel> GetCoveredGradeFundamentalsBySchoolID(int schoolID);
        IEnumerable<Grade12LevelOfCompletionModel> GetGrade12LevelOfCompletionBySchoolID(int schoolID);

        #endregion  Curriculum Delivery

        #region Enabling Conditions

        bool SaveEnablingConditionsInformation(EnablingConditionModel enablingConditionsInformation, SchoolBuildingConditionModel buildingConditions, List<LTSMModel> noOfTextbooksList);
        EnablingConditionModel GetEnablingConditionsBySchoolID(int schoolID);
        SchoolBuildingConditionModel GetSchoolBuildingConditionBySchoolID(int schoolID);
        IEnumerable<LTSMModel> GetLTSMBySchoolID(int schoolID);
        SchoolModel SubmitSurvey(int schoolID);

        #endregion Enabling Conditions
    }
}
