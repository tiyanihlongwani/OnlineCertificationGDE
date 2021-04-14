//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataLibrary.DataAccessLayer
{
    using System;
    using System.Collections.Generic;
    
    public partial class School
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public School()
        {
            this.AvailedOptionsToSupportGrade12 = new HashSet<AvailedOptionsToSupportGrade12>();
            this.AverageLearnerAttendenceBetween31AugustAnd11September = new HashSet<AverageLearnerAttendenceBetween31AugustAnd11September>();
            this.ClassInformation_NonRotatingGrades = new HashSet<ClassInformation_NonRotatingGrades>();
            this.ClassInformationDetails = new HashSet<ClassInformationDetail>();
            this.CoveredGradeFundamentals = new HashSet<CoveredGradeFundamental>();
            this.CurriculumDeliveries = new HashSet<CurriculumDelivery>();
            this.CurriculumDeliveryAcrossTheDiffentLockdownLevels = new HashSet<CurriculumDeliveryAcrossTheDiffentLockdownLevel>();
            this.DistrictLockdownLearningSupports = new HashSet<DistrictLockdownLearningSupport>();
            this.EducatorResources = new HashSet<EducatorResource>();
            this.EducatorsResourcesDetails = new HashSet<EducatorsResourcesDetail>();
            this.EnablingConditions = new HashSet<EnablingCondition>();
            this.Finances = new HashSet<Finance>();
            this.Grade12LevelOfCompletion = new HashSet<Grade12LevelOfCompletion>();
            this.GradesCompleteRequiredAssessmentTasks = new HashSet<GradesCompleteRequiredAssessmentTask>();
            this.HostelBoarders = new HashSet<HostelBoarder>();
            this.LaggingBehindSchoolInterventions = new HashSet<LaggingBehindSchoolIntervention>();
            this.LearnerInformations = new HashSet<LearnerInformation>();
            this.LearnerInformationByCategories = new HashSet<LearnerInformationByCategory>();
            this.LearnersCovid19StatisticsPerAgeGroup = new HashSet<LearnersCovid19StatisticsPerAgeGroup>();
            this.LearnersCovid19StatisticsPerGrade = new HashSet<LearnersCovid19StatisticsPerGrade>();
            this.LockdownLearningDetails = new HashSet<LockdownLearningDetail>();
            this.LTSMs = new HashSet<LTSM>();
            this.OnlineRemoteAndDistanceLearnings = new HashSet<OnlineRemoteAndDistanceLearning>();
            this.ParentsAndLearnersGuidences = new HashSet<ParentsAndLearnersGuidence>();
            this.SchoolBuildingConditions = new HashSet<SchoolBuildingCondition>();
            this.SchoolLockdownLearnersAssistances = new HashSet<SchoolLockdownLearnersAssistance>();
            this.SchoolMultiGrades = new HashSet<SchoolMultiGrade>();
            this.StaffCovid19StatisticsPerAgeGroup = new HashSet<StaffCovid19StatisticsPerAgeGroup>();
            this.StaffInformationManagementOfConcessions = new HashSet<StaffInformationManagementOfConcession>();
            this.StaffInformationSMTManagementOfAttendences = new HashSet<StaffInformationSMTManagementOfAttendence>();
            this.ClassInformations = new HashSet<ClassInformation>();
            this.StaffInformationHeadCounts = new HashSet<StaffInformationHeadCount>();
        }
    
        public int ID { get; set; }
        public string Name { get; set; }
        public string EMISNo { get; set; }
        public string PrincipalName { get; set; }
        public string PrincipalMobileNo { get; set; }
        public string PrincipalPersalNo { get; set; }
        public string PrincipalIdentityNo { get; set; }
        public string DistrictName { get; set; }
        public string DistrictCode { get; set; }
        public string GautengReferenceNumber { get; set; }
        public string InstLevelBudgetaryRequirements { get; set; }
        public string Level { get; set; }
        public string TypeOfInstitution { get; set; }
        public string RelationWithState { get; set; }
        public string Sector { get; set; }
        public string CircuitNo { get; set; }
        public string ClusterNo { get; set; }
        public Nullable<double> Quintile { get; set; }
        public string NoFee { get; set; }
        public string StreetNo { get; set; }
        public string StreetName { get; set; }
        public string TownshipVillage { get; set; }
        public string Suburb { get; set; }
        public string TownCity { get; set; }
        public string SubPlaceName { get; set; }
        public string MainPlaceName { get; set; }
        public string DistrictMunicipality { get; set; }
        public string LocalMunicipality { get; set; }
        public Nullable<double> WardNumber { get; set; }
        public string Telephone { get; set; }
        public string SchoolEmailAddress { get; set; }
        public string PrincipalEmailAddress { get; set; }
        public Nullable<double> Latitude { get; set; }
        public Nullable<double> Longitude { get; set; }
        public Nullable<bool> IsSurveySubmitted { get; set; }
        public Nullable<System.DateTime> SurveySubmittedDate { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AvailedOptionsToSupportGrade12> AvailedOptionsToSupportGrade12 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AverageLearnerAttendenceBetween31AugustAnd11September> AverageLearnerAttendenceBetween31AugustAnd11September { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ClassInformation_NonRotatingGrades> ClassInformation_NonRotatingGrades { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ClassInformationDetail> ClassInformationDetails { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CoveredGradeFundamental> CoveredGradeFundamentals { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CurriculumDelivery> CurriculumDeliveries { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CurriculumDeliveryAcrossTheDiffentLockdownLevel> CurriculumDeliveryAcrossTheDiffentLockdownLevels { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DistrictLockdownLearningSupport> DistrictLockdownLearningSupports { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EducatorResource> EducatorResources { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EducatorsResourcesDetail> EducatorsResourcesDetails { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EnablingCondition> EnablingConditions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Finance> Finances { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Grade12LevelOfCompletion> Grade12LevelOfCompletion { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<GradesCompleteRequiredAssessmentTask> GradesCompleteRequiredAssessmentTasks { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HostelBoarder> HostelBoarders { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LaggingBehindSchoolIntervention> LaggingBehindSchoolInterventions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LearnerInformation> LearnerInformations { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LearnerInformationByCategory> LearnerInformationByCategories { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LearnersCovid19StatisticsPerAgeGroup> LearnersCovid19StatisticsPerAgeGroup { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LearnersCovid19StatisticsPerGrade> LearnersCovid19StatisticsPerGrade { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LockdownLearningDetail> LockdownLearningDetails { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LTSM> LTSMs { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OnlineRemoteAndDistanceLearning> OnlineRemoteAndDistanceLearnings { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ParentsAndLearnersGuidence> ParentsAndLearnersGuidences { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SchoolBuildingCondition> SchoolBuildingConditions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SchoolLockdownLearnersAssistance> SchoolLockdownLearnersAssistances { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SchoolMultiGrade> SchoolMultiGrades { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<StaffCovid19StatisticsPerAgeGroup> StaffCovid19StatisticsPerAgeGroup { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<StaffInformationManagementOfConcession> StaffInformationManagementOfConcessions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<StaffInformationSMTManagementOfAttendence> StaffInformationSMTManagementOfAttendences { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ClassInformation> ClassInformations { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<StaffInformationHeadCount> StaffInformationHeadCounts { get; set; }
    }
}