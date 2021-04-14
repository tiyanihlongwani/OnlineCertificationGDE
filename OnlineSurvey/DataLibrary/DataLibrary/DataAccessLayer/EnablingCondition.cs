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
    
    public partial class EnablingCondition
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public EnablingCondition()
        {
            this.EnablingConditions_CausesOfDisruptions = new HashSet<EnablingConditions_CausesOfDisruptions>();
            this.EnablingConditions_HowDidTheSchoolConformToThePhysicalDistancingRequirementsClassrooms = new HashSet<EnablingConditions_HowDidTheSchoolConformToThePhysicalDistancingRequirementsClassrooms>();
            this.EnablingConditions_HowDidTheSchoolConformToThePhysicalDistancingRequirementsFurniture = new HashSet<EnablingConditions_HowDidTheSchoolConformToThePhysicalDistancingRequirementsFurniture>();
            this.EnablingConditions_ReasonsForSchoolClosure = new HashSet<EnablingConditions_ReasonsForSchoolClosure>();
            this.EnablingConditions_SchoolRequirementsToComplyWithPhysicalDistance = new HashSet<EnablingConditions_SchoolRequirementsToComplyWithPhysicalDistance>();
            this.EnablingConditions_SchoolResponsesToLearnerTransportProgrammeChallenges = new HashSet<EnablingConditions_SchoolResponsesToLearnerTransportProgrammeChallenges>();
            this.EnablingConditions_SchoolResponsesToNutritionProgrammeChallenges = new HashSet<EnablingConditions_SchoolResponsesToNutritionProgrammeChallenges>();
            this.SchoolAdjustmentsToConforms = new HashSet<SchoolAdjustmentsToConform>();
            this.SchoolConformOptions = new HashSet<SchoolConformOption>();
            this.SchoolDisruptionsCauses = new HashSet<SchoolDisruptionsCaus>();
            this.SchoolForcedClosureReasons = new HashSet<SchoolForcedClosureReason>();
            this.SchoolNutritionChallengeResponses = new HashSet<SchoolNutritionChallengeRespons>();
            this.SchoolRequirementsToComplyWithCovid19 = new HashSet<SchoolRequirementsToComplyWithCovid19>();
            this.SchoolTransportChallengeResponses = new HashSet<SchoolTransportChallengeRespons>();
        }
    
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
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EnablingConditions_CausesOfDisruptions> EnablingConditions_CausesOfDisruptions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EnablingConditions_HowDidTheSchoolConformToThePhysicalDistancingRequirementsClassrooms> EnablingConditions_HowDidTheSchoolConformToThePhysicalDistancingRequirementsClassrooms { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EnablingConditions_HowDidTheSchoolConformToThePhysicalDistancingRequirementsFurniture> EnablingConditions_HowDidTheSchoolConformToThePhysicalDistancingRequirementsFurniture { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EnablingConditions_ReasonsForSchoolClosure> EnablingConditions_ReasonsForSchoolClosure { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EnablingConditions_SchoolRequirementsToComplyWithPhysicalDistance> EnablingConditions_SchoolRequirementsToComplyWithPhysicalDistance { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EnablingConditions_SchoolResponsesToLearnerTransportProgrammeChallenges> EnablingConditions_SchoolResponsesToLearnerTransportProgrammeChallenges { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EnablingConditions_SchoolResponsesToNutritionProgrammeChallenges> EnablingConditions_SchoolResponsesToNutritionProgrammeChallenges { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SchoolAdjustmentsToConform> SchoolAdjustmentsToConforms { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SchoolConformOption> SchoolConformOptions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SchoolDisruptionsCaus> SchoolDisruptionsCauses { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SchoolForcedClosureReason> SchoolForcedClosureReasons { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SchoolNutritionChallengeRespons> SchoolNutritionChallengeResponses { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SchoolRequirementsToComplyWithCovid19> SchoolRequirementsToComplyWithCovid19 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SchoolTransportChallengeRespons> SchoolTransportChallengeResponses { get; set; }
        public virtual School School { get; set; }
    }
}
