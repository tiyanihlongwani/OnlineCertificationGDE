using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.Entities
{
    public class EnablingConditionModel
    {
        public int ID { get; set; }
        public bool DoesTheSchoolHaveElectricity { get; set; }
        public bool HasTheSchoolBeenProvidedWithElectricity { get; set; }
        public bool DoesTheSchoolHaveRunningWater { get; set; }
        public bool HasTheSchoolBeenProvidedWithWater { get; set; }
        public bool DoesTheSchoolExperienceWaterPressureIssuesRegularly { get; set; }
        public bool DoesTheSchoolHaveAdequateSanitationFacilities { get; set; }
        public bool DoesTheSchoolHaveSecureFencing { get; set; }
        public bool DidTheSchoolHaveSufficientClassrooms { get; set; }
        public bool DidTheSchoolRequestAdditionalFurnitureFromTheGDE { get; set; }
        public bool WasTheFurnitureDelivered { get; set; }
        public bool DidTheSchoolRequestAdditionalClassroomsFromTheGDE { get; set; }
        public bool WereTheClassroomsDelivered { get; set; }
        public bool WasTheSchoolAffectedByIncidentsOfVandalism { get; set; }
        public int HowManyOccasionsWasTheSchoolAffectedByIncidentsOfVandalism { get; set; }
        public bool DoesTheSchoolHaveLearnersBenefittingFromTheGDELearnerTransportProgramme { get; set; }
        public int NoOfLearnersBenefittingFromTheGDELearnerTransportProgramme { get; set; }
        public bool WereThereAnyChallengesExperiencedInTermsOfTheLearnerTransportProgrammeDuringTheLockdown { get; set; }
        public bool AreAllTheLearnersBeingTransportedAsExpected { get; set; }
        public bool AreAllTheLearnersArrivingOnTime { get; set; }
        public bool AreTheLearnersUsingHandSanitisersBeforeEnteringTheBuses { get; set; }
        public bool AreTheLearnersWearingMasksWhileOnTheBuses { get; set; }
        public bool IsThePhysicalDistancingRequirementsBeingObservedOnTheBuses { get; set; }
        public bool WereTheCovid19BrigadesAvailableToAssistOnTheLearnerTransportRoutes { get; set; }
        public bool DoesTheSchoolHaveLearnersBenefittingFromNationalSchoolNutritionProgramme { get; set; }
        public int NoOfLearnersBenefittingFromNationalSchoolNutritionProgramme { get; set; }
        public bool IsPhysicalDistancingBeingAppliedInTheFoodPreparationArea { get; set; }
        public bool IsPhysicalDistancingBeingAppliedWhereLearnersAreBeingFed { get; set; }
        public bool IsTheFoodPreparationAreaBeingCleanedRegularly { get; set; }
        public bool AreFeedingTimesAreBeingStaggered { get; set; }
        public bool HaveTheFoodHandlersBeenTrainedOnCovid19Protocols { get; set; }
        public bool DoTheFoodHandlersHaveTheNecessaryPPEs { get; set; }
        public bool IsThereProperCleaningOfTheUtensilsTakingPlace { get; set; }
        public bool IsTheSchoolUsingDisposableUtensils { get; set; }
        public bool AreTheSchoolLearnersSharingUtensils { get; set; }
        public bool WereThereAnyChallengesExperiencedInTermsOfTheSchoolNutritionProgrammeDuringLockdown { get; set; }
        public string HowAreThoseLearnersThatAreOnRotatioBeingFed { get; set; }
        public string HowAreLearnersLearningFromHomeBeingFed { get; set; }
        public bool WereLearnersAllowedToTakeHomeTheirTextbooksDuringLockdown { get; set; }
        public bool DoesTheSchoolHaveSufficientTextbooksForAllLearners { get; set; }
        public bool HasTheSchoolBeenAffectedByDisruptions { get; set; }
        public bool HasTheSchoolBeenForcedToClose { get; set; }
        public Nullable<int> HowManyOccassionsWasTheSchoolForcedToClose { get; set; }
        public Nullable<int> TotalNoOfSchoolDaysLostDueToClosure { get; set; }
        public int SchoolID { get; set; }
        public System.DateTime DateLogged { get; set; }
        public string CausesOfDisruptionsOther { get; set; }

        public List<int> SchoolRequirementsToComplyWithPhysicalDistance { get; set; }
        public List<int> HowDidTheSchoolConformToThePhysicalDistancingRequirementsFurniture { get; set; }
        public List<int> HowDidTheSchoolConformToThePhysicalDistancingRequirementsClassrooms { get; set; }
        public List<int> SchoolResponsesToLearnerTransportProgrammeChallenges { get; set; }
        public List<int> SchoolResponsesToNutritionProgrammeChallenges { get; set; }
        public List<int> CausesOfDisruptions { get; set; }
        public List<int> ReasonsForSchoolClosure { get; set; }
    }
}
