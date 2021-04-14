using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.Entities
{
    public class CurriculumDeliveryModel
    {
        public int ID { get; set; }
        public bool WasTheSchoolAbleToDeliverLessonsToLearnersDuringLockdownLevel5 { get; set; }
        public Nullable<int> OnlineWithStudentTeacherInteractionID { get; set; }
        public Nullable<int> OnlineWithoutStudentTeacherInteractionID { get; set; }
        public Nullable<int> TVBasedLessonsAndProgrammesID { get; set; }
        public Nullable<int> RadioLearningProgrammesID { get; set; }
        public Nullable<int> SocialMediaForStudentTeacherInteractionID { get; set; }
        public Nullable<int> PaperBasedPackagesID { get; set; }
        public Nullable<int> HomeVisitsByTeachersID { get; set; }
        public Nullable<int> UseOfExternalServiceProvidersID { get; set; }
        public string OtherDistanceLearningDescription { get; set; }
        public Nullable<int> OtherDistanceLearningID { get; set; }
        public int DevicesUtilisedByEducatorsUseID { get; set; }
        public bool DidTheSchoolProvideEducatorsWithDataToEnableWiFiConnectivityWhenWorkingFromHome { get; set; }
        public int NoOfEducatorsTrainedToConductOnlineClasses { get; set; }
        public int NoOfEducatorsNotTrainedToConductOnlineClasses { get; set; }
        public int NoOfEducatorsSuccessfullyConductedOnlineClasses { get; set; }
        public bool WasTerm1OfTheATPCompleted { get; set; }
        public bool WasTerm1AssessmentCompleted { get; set; }
        public bool WereTerm1ReportCardsIssued { get; set; }
        public bool IsTheSchoolImplementingTheRevisedATP { get; set; }
        public bool HaSchoolCommunicatedWithParentsRegardingAssessmentTasksExpectedFromLearners { get; set; }
        public bool HasSchoolReceivedFortnightlyLearnerActivityPacks { get; set; }
        public bool HasTheSchoolProvidedTheirOwnResourcesToFacilitateLockdownLearning { get; set; }
        public bool HaveParentsPickedUpTheFortnightlyLearnerActivityPacks { get; set; }
        public bool HasTheSchoolFollowedUpWithTheParentsOfLearnersThatFailedToSubmitTheirLearningTasks { get; set; }
        public bool AreTheLearnersAttendingClassAtSchoolAndThoseAtHomeAtTheSameLevelOfCompletion { get; set; }
        public bool DoesTheSchoolEnsureThatTheParentsSubmitTheirChildrenAssessmentTasksInTime { get; set; }
        public int NoOfLearnersBenefittedFromTheHomeLearningPacks { get; set; }
        public Nullable<int> CompletedRequiredNofAssesmentsGrade1To3ID { get; set; }
        public Nullable<int> CompletedRequiredNofAssesmentsGrade4To9ID { get; set; }
        public Nullable<int> CompletedRequiredNofAssesmentsGrade10To11ID { get; set; }
        public Nullable<int> CompletedRequiredNofAssesmentsGrade12ID { get; set; }
        public bool WillTheSchoolHaveCompletedTheGrade12ProgrammeInAdvanceOfThePrelimExaminations { get; set; }
        public string ReasonForNotCompletingTheGrade12ProgrammeInAdvanceOfThePrelimExaminations { get; set; }
        public int SchoolID { get; set; }
        public System.DateTime DateLogged { get; set; }
        public string SubjectAdvisorsSupportedTheStaffOther { get; set; }
        public string LaggingBehindSchoolInterventionsOther { get; set; }

        public List<int> ReachedGradesDuringLockdonLevel5  { get; set; }
        public List<int> AccomodatedGradesFollowingMinistersFirstSetOfDirection  { get; set; }
        public List<int> AccomodatedGradesFollowingMinistersFirstSetOfDirection29June2020 { get; set; }
        public List<int> AccomodatedGradesFollowingMinistersSetOfDirection07July2020  { get; set; }
        public List<int> AccomodatedGradesFollowingMinistersSetOfDirection02August2020  { get; set; }
        public List<int> TeacherDevicesAreReliantOn  { get; set; }
        public List<int> HowDidTheSchoolInformParentsAboutThePerformanceOfTheirChildren  { get; set; }
        public List<int> ApprovedSubjects { get; set; }
        public List<int> SeniorPhaseInitiatives { get; set; }
        public List<int> LaggingBehindSchoolInterventions { get; set; }
        public List<int> MeansToProvideGuidanceToParentsAndLearnersToFacilitateLockdownLearning { get; set; }
        public List<int> HowHasTheSchoolAssistedLockdownLearnersWithTheirAssessmentTasks { get; set; }
        public List<int> DistrictSupportRecievedForLockdownLearning { get; set; }
        public List<int> SubjectAdvisorsSupportedTheStaff { get; set; }
        public List<int> InitiativesAvailedByTheSchoolToSupportMatriculantsToCompleteTheGrade12Programme { get; set; }
        public List<int> InitiativesAvailedByTheGDEToSupportMatriculantsToCompleteTheGrade12Programme { get; set; }
        public List<int> InitiativesAvailedByThePartnersToSupportMatriculantsToCompleteTheGrade12Programme { get; set; }

        public List<int> OnlineWithStudentTeacherInteractionIDs { get; set; }
        public List<int> OnlineWithoutStudentTeacherInteractionIDs { get; set; }
        public List<int> TVBasedLessonsAndProgrammesIDs { get; set; }
        public List<int> RadioLearningProgrammesIDs { get; set; }
        public List<int> SocialMediaForStudentTeacherInteractionIDs { get; set; }
        public List<int> PaperBasedPackagesIDs { get; set; }
        public List<int> HomeVisitsByTeachersIDs { get; set; }
        public List<int> UseOfExternalServiceProvidersIDs { get; set; }
        public List<int> OtherDistanceLearningIDs { get; set; }
    }
}
