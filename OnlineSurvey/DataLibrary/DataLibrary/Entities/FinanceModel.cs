using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.Entities
{
    public class FinanceModel
    {
        public int ID { get; set; }
        public int SchoolTypeID { get; set; }
        public bool IsTheSchoolProjectingShortfallInRevenue { get; set; }
        public int NoOfLearnersApprovedForSchoolFeeExemptionsConditional2019 { get; set; }
        public int NoOfLearnersApprovedForSchoolFeeExemptionsConditional2020 { get; set; }
        public int NoOfLearnersApprovedForSchoolFeeExemptionsPartial2019 { get; set; }
        public int NoOfLearnersApprovedForSchoolFeeExemptionsPartial2020 { get; set; }
        public int NoOfLearnersApprovedForSchoolFeeExemptionsTotal2019 { get; set; }
        public int NoOfLearnersApprovedForSchoolFeeExemptionsTotal2020 { get; set; }
        public int NoOfLearnersApprovedPostLockdownConditional { get; set; }
        public int NoOfLearnersApprovedPostLockdownPartial { get; set; }
        public int NoOfLearnersApprovedPostLockdownTotal { get; set; }
        public int NoOfLearnersWhoseParentsDefaultedOnSchoolFeePayments2019 { get; set; }
        public int NoOfLearnersWhoseParentsDefaultedOnSchoolFeePayments2020 { get; set; }
        public string HowDidTheReducedRevenueCollectionImpactOnOperations { get; set; }
        public bool DidYouContinueWithSection38APaymentsToStaff { get; set; }
        public string HowDidTheSchoolManagePayments { get; set; }
        public bool CanTheSchoolConfirmThatLTSMHasBeenProcuredFor2021 { get; set; }
        public bool CanTheSchoolConfirmThatItHasBeenAbleToPayTheirMunicipalAccounts { get; set; }
        public bool CanTheSchoolConfirmThatItHasBeenAbleToUndertakeMinorRepairsUsingTheMaintenanceBudget { get; set; }
        public bool CanTheSchoolConfirmThatTheyHavePaidAllTheirSGBAppointedStaff { get; set; }
        public bool DidTheSchoolRelieveSGBAppointedTeachingStaffOfTheirDuties { get; set; }
        public int? NoOfSGBAppointedTeachingStaffWereAffected { get; set; }
        public bool WasTheReprioritisedBudgetApprovedAtAnAGM { get; set; }
        public bool DidTheInitiativesPursuedAssistTheSchoolInRealisingTheBudgetRevenueShortfall { get; set; }
        public bool IsThisSchoolSubsidisedByTheState { get; set; }
        public string WhatAreTheMainSourcesOfRevenueForTheSchool { get; set; }
        public bool IsTheSchoolProjectingShortfallInRevenueCollectionFor2020 { get; set; }
        public bool HaveYouPurchasedAdditionalLearnerAndEducatorSupportMaterial { get; set; }
        public bool DoesTheSchoolHaveSufficientTextbooksForAllTheLearners { get; set; }
        public bool WasTheSchoolAbleToPayTheirMunicipalAccounts { get; set; }
        public bool WasTheSchoolAbleToPurchasePPEsAndCovid19RelatedSupplies { get; set; }
        public bool DidTheSchoolRelieveTeachingStaffOfTheirDutiesToBalanceTheBudget { get; set; }
        public int HowManyTeachingStaffWereRelievedOfTheirDutiesToBalanceTheBudget { get; set; }
        public int SchoolID { get; set; }
        public System.DateTime DateLogged { get; set; }

        public List<int> RevenueShortfallManagementInitiatives { get; set; }
        public List<int> SchoolDealingWithSchoolFeeDefaulters { get; set; }
    }
}
