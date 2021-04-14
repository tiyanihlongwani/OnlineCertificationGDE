using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataLibrary.Entities;

namespace DataLibrary.DataAccessLayer.Mappers
{
    public static class MapperExtension
    {
        public static LookupItemModel Map(this LookupItem original)
        {
            if (original == null)
            {
                return null;
            }

            var lookup = new LookupItemModel()
            {
                Value = original.ID.ToString(),
                Text = original.Caption
            };

            return lookup;
        }
        public static IEnumerable<LookupItemModel> Map(this IEnumerable<LookupItem> original)
        {
            if (original == null)
            {
                return null;
            }

            var list = original.Select(x => x.Map()).ToList();
            return list;
        }
        public static SchoolModel Map(this School original)
        {
            if (original == null)
            {
                return null;
            }

            var lookup = new SchoolModel()
            {
                ID  = original.ID,
                Name= original.Name,
                EMISNo = original.EMISNo,
                PrincipalName = original.PrincipalName,
                PrincipalMobileNo = original.PrincipalMobileNo,
                PrincipalPersalNo  = original.PrincipalPersalNo,
                PrincipalIdentityNo = original.PrincipalIdentityNo,
                DistrictName = original.DistrictName,
                DistrictCode = original.DistrictCode,
                GautengReferenceNumber = original.GautengReferenceNumber,
                InstLevelBudgetaryRequirements = original.InstLevelBudgetaryRequirements,
                Level = original.Level,
                TypeOfInstitution = original.TypeOfInstitution,
                RelationWithState = original.RelationWithState,
                Sector = original.Sector,
                CircuitNo = original.CircuitNo,
                ClusterNo = original.ClusterNo,
                Quintile = original.Quintile,
                NoFee = original.NoFee,
                StreetNo = original.StreetNo,
                StreetName = original.StreetName,
                TownshipVillage = original.TownshipVillage,
                Suburb = original.Suburb,
                TownCity = original.TownCity,
                SubPlaceName = original.SubPlaceName,
                MainPlaceName = original.MainPlaceName,
                DistrictMunicipality = original.DistrictMunicipality,
                LocalMunicipality = original.LocalMunicipality,
                WardNumber = original.WardNumber,
                Telephone = original.Telephone,
                SchoolEmailAddress = original.SchoolEmailAddress,
                PrincipalEmailAddress = original.PrincipalEmailAddress,
                Latitude = original.Latitude,
                Longitude = original.Longitude,
                IsSurveySubmitted = original.IsSurveySubmitted.HasValue ? original.IsSurveySubmitted.Value : false
            };

            return lookup;
        }
        public static IEnumerable<SchoolModel> Map(this IEnumerable<School> original)
        {
            if (original == null)
            {
                return null;
            }

            var list = original.Select(x => x.Map()).ToList();
            return list;
        }
        public static AverageLearnerAttendenceBetween31AugustAnd11SeptemberModel Map(this AverageLearnerAttendenceBetween31AugustAnd11September original)
        {
            if (original == null)
            {
                return null;
            }

            var row = new AverageLearnerAttendenceBetween31AugustAnd11SeptemberModel()
            {
                ID = original.ID,
                NoOfLearnersExpected = original.NoOfLearnersExpected,
                NoOfLearnersReturned = original.NoOfLearnersReturned ,
                AverageAttendance = original.AverageAttendance,
                Grade = original.Grade,
                SchoolID= original.SchoolID,
                DateLogged  = original.DateLogged
            };

            return row;
        }
        public static IEnumerable<AverageLearnerAttendenceBetween31AugustAnd11SeptemberModel> Map(this IEnumerable<AverageLearnerAttendenceBetween31AugustAnd11September> original)
        {
            if (original == null)
            {
                return null;
            }

            var list = original.Select(x => x.Map()).ToList();
            return list;
        }
        public static LearnerInformationByCategoryModel Map(this LearnerInformationByCategory original)
        {
            if (original == null)
            {
                return null;
            }

            var row = new LearnerInformationByCategoryModel()
            {
                ID = original.ID,
                HeadcountEnrolment = original.HeadcountEnrolment,
                CurrentEnrolment  = original.CurrentEnrolment,
                NoOfLearnersAttendingClassesAtSchoolCurrently  = original.NoOfLearnersAttendingClassesAtSchoolCurrently,
                NoOfLearnersStudyingFromHomeCurrently  = original.NoOfLearnersStudyingFromHomeCurrently,
                NoOfLearnersDeregisteredFromTheSchoolAndApprovedForHomeEducation  = original.NoOfLearnersDeregisteredFromTheSchoolAndApprovedForHomeEducation,
                NoOfLearnersThatHavePotentiallyDroppedOutOfSchool  = original.NoOfLearnersThatHavePotentiallyDroppedOutOfSchool,
                NoOfLearnersTransferredIntoTheSchool  = original.NoOfLearnersTransferredIntoTheSchool,
                NoOfLearnersTransferredOutToOtherSchools  = original.NoOfLearnersTransferredOutToOtherSchools,
                Grade  = original.Grade,
                SchoolID  = original.SchoolID
            };

            return row;
        }
        public static IEnumerable<LearnerInformationByCategoryModel> Map(this IEnumerable<LearnerInformationByCategory> original)
        {
            if (original == null)
            {
                return null;
            }

            var list = original.Select(x => x.Map()).ToList();
            return list;
        }
        public static LearnerInformationModel Map(this LearnerInformation original)
        {
            if (original == null)
            {
                return null;
            }

            var row = new LearnerInformationModel()
            {
                ID = original.ID,
                NoOfLearnersApprovedForLockdownLearningApprovedByGDE  = original.NoOfLearnersApprovedForLockdownLearningApprovedByGDE,
                NoOfLearnersInvolvedInLockdownLearningByArrangementWithTheSchool  = original.NoOfLearnersInvolvedInLockdownLearningByArrangementWithTheSchool,
                NoOfLearnersApprovedForLockdownLearningDueToComorbidities  = original.NoOfLearnersApprovedForLockdownLearningDueToComorbidities,
                NoOfLearnersApprovedForLockdownLearningDueToAnxietyOrFear  = original.NoOfLearnersApprovedForLockdownLearningDueToAnxietyOrFear,
                NoOfLearnersApprovedForLockdownLearningDueToOtherHealthRelatedReasons  = original.NoOfLearnersApprovedForLockdownLearningDueToOtherHealthRelatedReasons,
                PotentialDropOutYoungerThan7  = original.PotentialDropOutYoungerThan7,
                PotentialDropOutBetween7And15  = original.PotentialDropOutBetween7And15,
                PotentialDropOutOlderThan15  = original.PotentialDropOutOlderThan15,
                ReviewTheDeregistrationOfLearnersByGDE  = original.ReviewTheDeregistrationOfLearnersByGDE,
                NoOfPotentialDropOutsContactedBySchool  = original.NoOfPotentialDropOutsContactedBySchool,
                NoOfLearnersWhoseParentsWereContacted  = original.NoOfLearnersWhoseParentsWereContacted,
                NoOfLearnersUnableToBeContacted  = original.NoOfLearnersUnableToBeContacted,
                DidTheSchoolEscalateToTheDistrict  = original.DidTheSchoolEscalateToTheDistrict,
                HasTherBeenFollowUpByDistrict  = original.HasTherBeenFollowUpByDistrict,
                HasThisProvenSuccessful  = original.HasThisProvenSuccessful,
                DateLogged  = original.DateLogged,
                SchoolID = original.SchoolID
            };

            return row;
        }
        public static IEnumerable<LearnerInformationModel> Map(this IEnumerable<LearnerInformation> original)
        {
            if (original == null)
            {
                return null;
            }

            var list = original.Select(x => x.Map()).ToList();
            return list;
        }
        public static StaffInformationHeadCountModel Map(this StaffInformationHeadCount original)
        {
            if (original == null)
            {
                return null;
            }

            var row = new StaffInformationHeadCountModel()
            {
                ID = original.ID,
                TenthDayStaffCountsStatePaid = original.TenthDayStaffCountsStatePaid,
                TenthDayStaffCountsSGBAppointed = original.TenthDayStaffCountsSGBAppointed,
                NoOfStaffMembersReturnedStatePaid = original.NoOfStaffMembersReturnedStatePaid,
                NoOfStaffMembersReturnedSGBAppointed = original.NoOfStaffMembersReturnedSGBAppointed,
                NoOfStaffApprovedForConcessionsStatePaid = original.NoOfStaffApprovedForConcessionsStatePaid,
                NoOfStaffApprovedForConcessionsSGBAppointed = original.NoOfStaffApprovedForConcessionsSGBAppointed,
                NoOfStaffAppliedAndAwaitingApprovalForConcessionsStatePaid = original.NoOfStaffAppliedAndAwaitingApprovalForConcessionsStatePaid,
                NoOfStaffAppliedAndAwaitingApprovalForConcessionsSGBAppointed = original.NoOfStaffAppliedAndAwaitingApprovalForConcessionsSGBAppointed,
                NoOfStaffNotReturnedToWorkForAnyKnownReasonsStatePaid = original.NoOfStaffNotReturnedToWorkForAnyKnownReasonsStatePaid,
                NoOfStaffNotReturnedToWorkForAnyKnownReasonsSGBAppointed = original.NoOfStaffNotReturnedToWorkForAnyKnownReasonsSGBAppointed,
                NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementStatePaid = original.NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementStatePaid,
                NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementSGBAppointed = original.NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementSGBAppointed,
                NoOfStaffAppliedAndNotApprovedForConcessionsStatePaid = original.NoOfStaffAppliedAndNotApprovedForConcessionsStatePaid,
                NoOfStaffAppliedAndNotApprovedForConcessionsSGBAppointed = original.NoOfStaffAppliedAndNotApprovedForConcessionsSGBAppointed,
                Category = original.Category,
                SchoolID = original.SchoolID,
                DateLogged = original.DateLogged
        };

            return row;
        }
        public static IEnumerable<StaffInformationHeadCountModel> Map(this IEnumerable<StaffInformationHeadCount> original)
        {
            if (original == null)
            {
                return null;
            }

            var list = original.Select(x => x.Map()).ToList();
            return list;
        }
        public static StaffInformationManagementOfConcessionModel Map(this StaffInformationManagementOfConcession original)
        {
            if (original == null)
            {
                return null;
            }

            var row = new StaffInformationManagementOfConcessionModel()
            {
                ID = original.ID,
                NoOfStaffApprovedForComorbiditiesStatePaid = original.NoOfStaffApprovedForComorbiditiesStatePaid,
                NoOfStaffApprovedForComorbiditiesSGBAppointed = original.NoOfStaffApprovedForComorbiditiesSGBAppointed,
                NoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessStatePaid = original.NoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessStatePaid,
                NoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessSGBAppointed = original.NoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessSGBAppointed,
                NoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsStatePaid = original.NoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsStatePaid,
                NoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsSGBAppointed = original.NoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsSGBAppointed,
                NoOfSubstitutesAppliedForStatePaid = original.NoOfSubstitutesAppliedForStatePaid,
                NoOfSubstitutesReceivedStatePaid = original.NoOfSubstitutesReceivedStatePaid,
                Category = original.Category,
                SchoolID = original.SchoolID,
                DateLogged = original.DateLogged
            };

            return row;
        }
        public static IEnumerable<StaffInformationManagementOfConcessionModel> Map(this IEnumerable<StaffInformationManagementOfConcession> original)
        {
            if (original == null)
            {
                return null;
            }

            var list = original.Select(x => x.Map()).ToList();
            return list;
        }
        public static StaffInformationSMTManagementOfAttendenceModel Map(this StaffInformationSMTManagementOfAttendence original)
        {
            if (original == null)
            {
                return null;
            }

            var row = new StaffInformationSMTManagementOfAttendenceModel()
            {
                ID = original.ID,
                HaveThereBeenStaffWhoHaveNotNeturnedToSchoolWithoutApproval = original.HaveThereBeenStaffWhoHaveNotNeturnedToSchoolWithoutApproval,
                NoOfStatePaidEducators = original.NoOfStatePaidEducators,
                NoOfPSStaff = original.NoOfPSStaff,
                HasTheGDEInstitutedDisciplinaryProcesses = original.HasTheGDEInstitutedDisciplinaryProcesses,
                HowManyCasesInvolvedStatePaidEducators = original.HowManyCasesInvolvedStatePaidEducators,
                HowManyCasesInvolvedPSStaff = original.HowManyCasesInvolvedPSStaff,
                SchoolID = original.SchoolID,
                DateLogged = original.DateLogged
            };

            return row;
        }
        public static IEnumerable<StaffInformationSMTManagementOfAttendenceModel> Map(this IEnumerable<StaffInformationSMTManagementOfAttendence> original)
        {
            if (original == null)
            {
                return null;
            }

            var list = original.Select(x => x.Map()).ToList();
            return list;
        }
        public static ClassInformationModel Map(this ClassInformation original)
        {
            if (original == null)
            {
                return null;
            }

            var row = new ClassInformationModel()
            {
                ID = original.ID,
                DoesTheSchoolPlatoon = original.DoesTheSchoolPlatoon,
                DoesTheSchoolHaveDoubleShifts = original.DoesTheSchoolHaveDoubleShifts,
                DoesTheSchoolHaveMultiGradeclasses = original.DoesTheSchoolHaveMultiGradeclasses,
                NoOfLearnersAccommodatedForDailyRotation = original.NoOfLearnersAccommodatedForDailyRotation,
                NoOfLearnersAccommodatedForWeeklyRotation = original.NoOfLearnersAccommodatedForWeeklyRotation,
                NoOfLearnersAccommodatedForHybrid = original.NoOfLearnersAccommodatedForHybrid,
                LearnerCapacityOfSchoolNormsAndStandardForSchoolInfrastructure = original.LearnerCapacityOfSchoolNormsAndStandardForSchoolInfrastructure,
                WasTheSchoolAbleToAccommodatePhysicalDistancingID = original.WasTheSchoolAbleToAccommodatePhysicalDistancingID.HasValue ? original.WasTheSchoolAbleToAccommodatePhysicalDistancingID.Value: 0,
                HasTheSchoolAdjustedTheSchoolDayToCoverTheRegulatedHoursForCurriculumDelivery  = original.HasTheSchoolAdjustedTheSchoolDayToCoverTheRegulatedHoursForCurriculumDelivery,
                TotalTeachingTimeOverTheCycle = original.TotalTeachingTimeOverTheCycle.HasValue ? original.TotalTeachingTimeOverTheCycle.Value : 0.0D,
                WereAdditionalMobileClassroomsRequestedByTheSchool = original.WereAdditionalMobileClassroomsRequestedByTheSchool,
                NoOfMobileClassroomsRequestedByTheSchool = original.NoOfMobileClassroomsRequestedByTheSchool,
                NoOfAdditionalMobileClassroomsDelivered = original.NoOfAdditionalMobileClassroomsDelivered,
                NoOfClassroomsNotUsedDueToPoorCondition = original.NoOfClassroomsNotUsedDueToPoorCondition,
                WasTheSchoolClosedDueToCovid19 = original.WasTheSchoolClosedDueToCovid19.HasValue ? original.WasTheSchoolClosedDueToCovid19.Value : false,
                NoOfOccasionsTheSchoolClosedDueToCovid19 = original.NoOfOccasionsTheSchoolClosedDueToCovid19,
                LongestDurationTheSchoolClosedDueToCovid19 = original.LongestDurationTheSchoolClosedDueToCovid19,
                WasTheSchoolDisinfected = original.WasTheSchoolDisinfected,
                IntroducedRotationID = original.IntroducedRotationID,
                TimetableCycleID = original.TimetableCycleID,
                SchoolRotationApproachID = original.SchoolRotationApproachID,
                SchoolID = original.SchoolID,
                DateLogged = original.DateLogged
            };

            return row;
        }
        public static IEnumerable<ClassInformationModel> Map(this IEnumerable<ClassInformation> original)
        {
            if (original == null)
            {
                return null;
            }

            var list = original.Select(x => x.Map()).ToList();
            return list;
        }
        public static SchoolDisifectorModel Map(this SchoolDisifector original)
        {
            if (original == null)
            {
                return null;
            }

            var row = new SchoolDisifectorModel()
            {
                ID = original.ID,
                DisinfectorID = original.DisinfectorID,
                ClassInformationID = original.ClassInformationID,
                DateLogged = original.DateLogged
            };

            return row;
        }
        public static IEnumerable<SchoolDisifectorModel> Map(this IEnumerable<SchoolDisifector> original)
        {
            if (original == null)
            {
                return null;
            }

            var list = original.Select(x => x.Map()).ToList();
            return list;
        }

        public static ClassInformationDetailModel Map(this ClassInformationDetail original)
        {
            if (original == null)
            {
                return null;
            }

            var row = new ClassInformationDetailModel()
            {
                ID = original.ID,
                Category = original.Category,
                Grade1 = original.Grade1,
                Grade2 = original.Grade2,
                Grade3 = original.Grade3,
                Grade4 = original.Grade4,
                Grade5 = original.Grade5,
                Grade6 = original.Grade6,
                Grade7 = original.Grade7,
                Grade8 = original.Grade8,
                Grade9 = original.Grade9,
                Grade10 = original.Grade10,
                Grade11 = original.Grade11,
                Grade12 = original.Grade12,
                PreGradeR = original.PreGradeR,
                GradeR = original.GradeR,
                Spec = original.Spec,
                Oth = original.Oth,
                Total = original.Total,
                SchoolID = original.SchoolID
            };

            return row;
        }
        public static IEnumerable<ClassInformationDetailModel> Map(this IEnumerable<ClassInformationDetail> original)
        {
            if (original == null)
            {
                return null;
            }

            var list = original.Select(x => x.Map()).ToList();
            return list;
        }

        public static FinanceModel Map(this Finance original)
        {
            if (original == null)
            {
                return null;
            }

            var revenueShortfallManagementInitiatives = original.FinanceSchoolShortfallOptions.Select(x => x.ShortfallOptionID).ToList();
            var schoolDealingWithSchoolFeeDefaulters = original.FinanceSchoolFeeDefaulters.Select(x => x.SchoolDefaulterID).ToList();

            var row = new FinanceModel()
            {
                ID = original.ID,
                SchoolTypeID = original.SchoolTypeID,
                IsTheSchoolProjectingShortfallInRevenue = original.IsTheSchoolProjectingShortfallInRevenue,
                NoOfLearnersApprovedForSchoolFeeExemptionsConditional2019 = original.NoOfLearnersApprovedForSchoolFeeExemptionsConditional2019,
                NoOfLearnersApprovedForSchoolFeeExemptionsConditional2020 = original.NoOfLearnersApprovedForSchoolFeeExemptionsConditional2020,
                NoOfLearnersApprovedForSchoolFeeExemptionsPartial2019 = original.NoOfLearnersApprovedForSchoolFeeExemptionsPartial2019,
                NoOfLearnersApprovedForSchoolFeeExemptionsPartial2020 = original.NoOfLearnersApprovedForSchoolFeeExemptionsPartial2020,
                NoOfLearnersApprovedForSchoolFeeExemptionsTotal2019 = original.NoOfLearnersApprovedForSchoolFeeExemptionsTotal2019,
                NoOfLearnersApprovedForSchoolFeeExemptionsTotal2020 = original.NoOfLearnersApprovedForSchoolFeeExemptionsTotal2020,
                NoOfLearnersApprovedPostLockdownConditional = original.NoOfLearnersApprovedPostLockdownConditional,
                NoOfLearnersApprovedPostLockdownPartial = original.NoOfLearnersApprovedPostLockdownPartial,
                NoOfLearnersApprovedPostLockdownTotal = original.NoOfLearnersApprovedPostLockdownTotal,
                NoOfLearnersWhoseParentsDefaultedOnSchoolFeePayments2019 = original.NoOfLearnersWhoseParentsDefaultedOnSchoolFeePayments2019,
                NoOfLearnersWhoseParentsDefaultedOnSchoolFeePayments2020 = original.NoOfLearnersWhoseParentsDefaultedOnSchoolFeePayments2020,
                HowDidTheReducedRevenueCollectionImpactOnOperations = original.HowDidTheReducedRevenueCollectionImpactOnOperations,
                DidYouContinueWithSection38APaymentsToStaff = original.DidYouContinueWithSection38APaymentsToStaff,
                HowDidTheSchoolManagePayments = original.HowDidTheSchoolManagePayments,
                CanTheSchoolConfirmThatLTSMHasBeenProcuredFor2021 = original.CanTheSchoolConfirmThatLTSMHasBeenProcuredFor2021,
                CanTheSchoolConfirmThatItHasBeenAbleToPayTheirMunicipalAccounts = original.CanTheSchoolConfirmThatItHasBeenAbleToPayTheirMunicipalAccounts,
                CanTheSchoolConfirmThatItHasBeenAbleToUndertakeMinorRepairsUsingTheMaintenanceBudget = original.CanTheSchoolConfirmThatItHasBeenAbleToUndertakeMinorRepairsUsingTheMaintenanceBudget,
                CanTheSchoolConfirmThatTheyHavePaidAllTheirSGBAppointedStaff = original.CanTheSchoolConfirmThatTheyHavePaidAllTheirSGBAppointedStaff,
                DidTheSchoolRelieveSGBAppointedTeachingStaffOfTheirDuties = original.DidTheSchoolRelieveSGBAppointedTeachingStaffOfTheirDuties,
                NoOfSGBAppointedTeachingStaffWereAffected = original.NoOfSGBAppointedTeachingStaffWereAffected,
                WasTheReprioritisedBudgetApprovedAtAnAGM = original.WasTheReprioritisedBudgetApprovedAtAnAGM,
                DidTheInitiativesPursuedAssistTheSchoolInRealisingTheBudgetRevenueShortfall = original.DidTheInitiativesPursuedAssistTheSchoolInRealisingTheBudgetRevenueShortfall,
                IsThisSchoolSubsidisedByTheState = original.IsThisSchoolSubsidisedByTheState,
                WhatAreTheMainSourcesOfRevenueForTheSchool = original.WhatAreTheMainSourcesOfRevenueForTheSchool,
                IsTheSchoolProjectingShortfallInRevenueCollectionFor2020 = original.IsTheSchoolProjectingShortfallInRevenueCollectionFor2020,
                HaveYouPurchasedAdditionalLearnerAndEducatorSupportMaterial = original.HaveYouPurchasedAdditionalLearnerAndEducatorSupportMaterial,
                DoesTheSchoolHaveSufficientTextbooksForAllTheLearners = original.DoesTheSchoolHaveSufficientTextbooksForAllTheLearners,
                WasTheSchoolAbleToPayTheirMunicipalAccounts = original.WasTheSchoolAbleToPayTheirMunicipalAccounts,
                WasTheSchoolAbleToPurchasePPEsAndCovid19RelatedSupplies = original.WasTheSchoolAbleToPurchasePPEsAndCovid19RelatedSupplies,
                DidTheSchoolRelieveTeachingStaffOfTheirDutiesToBalanceTheBudget = original.DidTheSchoolRelieveTeachingStaffOfTheirDutiesToBalanceTheBudget,
                HowManyTeachingStaffWereRelievedOfTheirDutiesToBalanceTheBudget = original.HowManyTeachingStaffWereRelievedOfTheirDutiesToBalanceTheBudget,
                SchoolID = original.SchoolID,
                DateLogged = original.DateLogged,
                RevenueShortfallManagementInitiatives = revenueShortfallManagementInitiatives,
                SchoolDealingWithSchoolFeeDefaulters = schoolDealingWithSchoolFeeDefaulters
            };

            return row;
        }
        public static IEnumerable<FinanceModel> Map(this IEnumerable<Finance> original)
        {
            if (original == null)
            {
                return null;
            }

            var list = original.Select(x => x.Map()).ToList();
            return list;
        }

        public static HostelBoarderModel Map(this HostelBoarder original)
        {
            if (original == null)
            {
                return null;
            }

            var row = new HostelBoarderModel()
            {
                 ID  = original.ID,
                 NoOfLearnersAdmittedToTheHostelInJanuary2020Male  = original.NoOfLearnersAdmittedToTheHostelInJanuary2020Male,
                 NoOfLearnersAdmittedToTheHostelInJanuary2020Female  = original.NoOfLearnersAdmittedToTheHostelInJanuary2020Female,
                 DidTheSchoolApplyTheRelevantPhysicalDistancingMealTime  = original.DidTheSchoolApplyTheRelevantPhysicalDistancingMealTime,
                 DidTheSchoolApplyTheRelevantPhysicalDistancingStudyTime  = original.DidTheSchoolApplyTheRelevantPhysicalDistancingStudyTime,
                 DidTheSchoolApplyTheRelevantPhysicalDistancingLeisureTime  = original.DidTheSchoolApplyTheRelevantPhysicalDistancingLeisureTime,
                 DidTheSchoolIncreaseTheFrequencyOfCleaningAtTheHostel  = original.DidTheSchoolIncreaseTheFrequencyOfCleaningAtTheHostel,
                 WereTheLearnersProvidedWithAdequatePPEs  = original.WereTheLearnersProvidedWithAdequatePPEs,
                 WereTheLearnersProvidedWithAdequateHandSanitiser = original.WereTheLearnersProvidedWithAdequateHandSanitiser,
                 SchoolID  = original.SchoolID,
                 DateLogged  = original.DateLogged
            };

            return row;
        }
        public static IEnumerable<HostelBoarderModel> Map(this IEnumerable<HostelBoarder> original)
        {
            if (original == null)
            {
                return null;
            }

            var list = original.Select(x => x.Map()).ToList();
            return list;
        }








        public static StaffCovid19StatisticsPerAgeGroupModel Map(this StaffCovid19StatisticsPerAgeGroup original)
        {
            if (original == null)
            {
                return null;
            }

            var row = new StaffCovid19StatisticsPerAgeGroupModel()
            {
                ID = original.ID,
                NoOfConfirmedInfectionsMale = original.NoOfConfirmedInfectionsMale,
                NoOfConfirmedInfectionsFemale = original.NoOfConfirmedInfectionsFemale,
                NoOfConfirmedRecoveriesMale = original.NoOfConfirmedRecoveriesMale,
                NoOfConfirmedRecoveriesFemale = original.NoOfConfirmedRecoveriesFemale,
                NoOfConfirmedDeathsMale = original.NoOfConfirmedDeathsMale,
                NoOfConfirmedDeathsFemale = original.NoOfConfirmedDeathsFemale,
                AgeGroup = original.AgeGroup,
                StaffType = original.StaffType,
                SchoolID = original.SchoolID,
                DateLogged = original.DateLogged
            };

            return row;
        }
        public static IEnumerable<StaffCovid19StatisticsPerAgeGroupModel> Map(this IEnumerable<StaffCovid19StatisticsPerAgeGroup> original)
        {
            if (original == null)
            {
                return null;
            }

            var list = original.Select(x => x.Map()).ToList();
            return list;
        }

        public static LearnersCovid19StatisticsPerAgeGroupModel Map(this LearnersCovid19StatisticsPerAgeGroup original)
        {
            if (original == null)
            {
                return null;
            }

            var row = new LearnersCovid19StatisticsPerAgeGroupModel()
            {
                ID = original.ID,
                NoOfConfirmedInfectionsMale = original.NoOfConfirmedInfectionsMale,
                NoOfConfirmedInfectionsFemale = original.NoOfConfirmedInfectionsFemale,
                NoOfConfirmedRecoveriesMale = original.NoOfConfirmedRecoveriesMale,
                NoOfConfirmedRecoveriesFemale = original.NoOfConfirmedRecoveriesFemale,
                NoOfConfirmedDeathsMale = original.NoOfConfirmedDeathsMale,
                NoOfConfirmedDeathsFemale = original.NoOfConfirmedDeathsFemale,
                AgeGroup = original.AgeGroup,
                SchoolID = original.SchoolID,
                DateLogged = original.DateLogged
            };

            return row;
        }
        public static IEnumerable<LearnersCovid19StatisticsPerAgeGroupModel> Map(this IEnumerable<LearnersCovid19StatisticsPerAgeGroup> original)
        {
            if (original == null)
            {
                return null;
            }

            var list = original.Select(x => x.Map()).ToList();
            return list;
        }

        public static LearnersCovid19StatisticsPerGradeModel Map(this LearnersCovid19StatisticsPerGrade original)
        {
            if (original == null)
            {
                return null;
            }

            var row = new LearnersCovid19StatisticsPerGradeModel()
            {
                ID = original.ID,
                NoOfConfirmedInfectionsMale = original.NoOfConfirmedInfectionsMale,
                NoOfConfirmedInfectionsFemale = original.NoOfConfirmedInfectionsFemale,
                NoOfConfirmedRecoveriesMale = original.NoOfConfirmedRecoveriesMale,
                NoOfConfirmedRecoveriesFemale = original.NoOfConfirmedRecoveriesFemale,
                NoOfConfirmedDeathsMale = original.NoOfConfirmedDeathsMale,
                NoOfConfirmedDeathsFemale = original.NoOfConfirmedDeathsFemale,
                Grade = original.Grade,
                SchoolID = original.SchoolID
            };

            return row;
        }
        public static IEnumerable<LearnersCovid19StatisticsPerGradeModel> Map(this IEnumerable<LearnersCovid19StatisticsPerGrade> original)
        {
            if (original == null)
            {
                return null;
            }

            var list = original.Select(x => x.Map()).ToList();
            return list;
        }


        public static CurriculumDeliveryModel Map(this CurriculumDelivery original)
        {
            if (original == null)
            {
                return null;
            }

            var row = new CurriculumDeliveryModel()
            {
                ID = original.ID,
                WasTheSchoolAbleToDeliverLessonsToLearnersDuringLockdownLevel5 = original.WasTheSchoolAbleToDeliverLessonsToLearnersDuringLockdownLevel5,
                OnlineWithStudentTeacherInteractionID = original.OnlineWithStudentTeacherInteractionID,
                OnlineWithoutStudentTeacherInteractionID = original.OnlineWithoutStudentTeacherInteractionID,
                TVBasedLessonsAndProgrammesID = original.TVBasedLessonsAndProgrammesID,
                RadioLearningProgrammesID = original.RadioLearningProgrammesID,
                SocialMediaForStudentTeacherInteractionID = original.SocialMediaForStudentTeacherInteractionID,
                PaperBasedPackagesID = original.PaperBasedPackagesID,
                HomeVisitsByTeachersID = original.HomeVisitsByTeachersID,
                UseOfExternalServiceProvidersID = original.UseOfExternalServiceProvidersID,
                OtherDistanceLearningDescription = original.OtherDistanceLearningDescription,
                OtherDistanceLearningID = original.OtherDistanceLearningID,
                DevicesUtilisedByEducatorsUseID = original.DevicesUtilisedByEducatorsUseID,
                DidTheSchoolProvideEducatorsWithDataToEnableWiFiConnectivityWhenWorkingFromHome = original.DidTheSchoolProvideEducatorsWithDataToEnableWiFiConnectivityWhenWorkingFromHome,
                NoOfEducatorsTrainedToConductOnlineClasses = original.NoOfEducatorsTrainedToConductOnlineClasses,
                NoOfEducatorsNotTrainedToConductOnlineClasses = original.NoOfEducatorsNotTrainedToConductOnlineClasses,
                NoOfEducatorsSuccessfullyConductedOnlineClasses = original.NoOfEducatorsSuccessfullyConductedOnlineClasses,
                WasTerm1OfTheATPCompleted = original.WasTerm1OfTheATPCompleted,
                WasTerm1AssessmentCompleted = original.WasTerm1AssessmentCompleted,
                WereTerm1ReportCardsIssued = original.WereTerm1ReportCardsIssued,
                IsTheSchoolImplementingTheRevisedATP = original.IsTheSchoolImplementingTheRevisedATP,
                HaSchoolCommunicatedWithParentsRegardingAssessmentTasksExpectedFromLearners = original.HaSchoolCommunicatedWithParentsRegardingAssessmentTasksExpectedFromLearners,
                HasSchoolReceivedFortnightlyLearnerActivityPacks = original.HasSchoolReceivedFortnightlyLearnerActivityPacks,
                HasTheSchoolProvidedTheirOwnResourcesToFacilitateLockdownLearning = original.HasTheSchoolProvidedTheirOwnResourcesToFacilitateLockdownLearning,
                HaveParentsPickedUpTheFortnightlyLearnerActivityPacks = original.HaveParentsPickedUpTheFortnightlyLearnerActivityPacks,
                HasTheSchoolFollowedUpWithTheParentsOfLearnersThatFailedToSubmitTheirLearningTasks = original.HasTheSchoolFollowedUpWithTheParentsOfLearnersThatFailedToSubmitTheirLearningTasks,
                AreTheLearnersAttendingClassAtSchoolAndThoseAtHomeAtTheSameLevelOfCompletion = original.AreTheLearnersAttendingClassAtSchoolAndThoseAtHomeAtTheSameLevelOfCompletion,
                DoesTheSchoolEnsureThatTheParentsSubmitTheirChildrenAssessmentTasksInTime = original.DoesTheSchoolEnsureThatTheParentsSubmitTheirChildrenAssessmentTasksInTime,
                NoOfLearnersBenefittedFromTheHomeLearningPacks = original.NoOfLearnersBenefittedFromTheHomeLearningPacks,
                CompletedRequiredNofAssesmentsGrade1To3ID = original.CompletedRequiredNofAssesmentsGrade1To3ID,
                CompletedRequiredNofAssesmentsGrade4To9ID = original.CompletedRequiredNofAssesmentsGrade4To9ID,
                CompletedRequiredNofAssesmentsGrade10To11ID = original.CompletedRequiredNofAssesmentsGrade10To11ID,
                CompletedRequiredNofAssesmentsGrade12ID = original.CompletedRequiredNofAssesmentsGrade12ID,
                WillTheSchoolHaveCompletedTheGrade12ProgrammeInAdvanceOfThePrelimExaminations = original.WillTheSchoolHaveCompletedTheGrade12ProgrammeInAdvanceOfThePrelimExaminations,
                ReasonForNotCompletingTheGrade12ProgrammeInAdvanceOfThePrelimExaminations = original.ReasonForNotCompletingTheGrade12ProgrammeInAdvanceOfThePrelimExaminations,
                DateLogged = original.DateLogged,
                SchoolID = original.SchoolID,
                SubjectAdvisorsSupportedTheStaffOther = original.SubjectAdvisorsSupportedTheStaffOther,
                LaggingBehindSchoolInterventionsOther = original.LaggingBehindSchoolInterventionsOther
            };

            return row;
        }
        public static IEnumerable<CurriculumDeliveryModel> Map(this IEnumerable<CurriculumDelivery> original)
        {
            if (original == null)
            {
                return null;
            }

            var list = original.Select(x => x.Map()).ToList();
            return list;
        }


        public static CoveredGradeFundamentalModel Map(this CoveredGradeFundamental original)
        {
            if (original == null)
            {
                return null;
            }

            var row = new CoveredGradeFundamentalModel()
            {
                ID = original.ID,
                Grade= original.Grade,
                StatusID = original.StatusID,
                SchoolID = original.SchoolID,
                DateLogged = original.DateLogged
            };

            return row;
        }
        public static IEnumerable<CoveredGradeFundamentalModel> Map(this IEnumerable<CoveredGradeFundamental> original)
        {
            if (original == null)
            {
                return null;
            }

            var list = original.Select(x => x.Map()).ToList();
            return list;
        }

        public static EducatorResourceModel Map(this EducatorResource original)
        {
            if (original == null)
            {
                return null;
            }

            var row = new EducatorResourceModel()
            {
                ID = original.ID,
                Type = original.Type,
                ProvidedByGDE = original.ProvidedByGDE,
                ProvidedBySchool = original.ProvidedBySchool,
                PersonallyOwned = original.PersonallyOwned,
                SchoolID = original.SchoolID,
                DateLogged = original.DateLogged
            };

            return row;
        }
        public static IEnumerable<EducatorResourceModel> Map(this IEnumerable<EducatorResource> original)
        {
            if (original == null)
            {
                return null;
            }

            var list = original.Select(x => x.Map()).ToList();
            return list;
        }

        public static Grade12LevelOfCompletionModel Map(this Grade12LevelOfCompletion original)
        {
            if (original == null)
            {
                return null;
            }

            var row = new Grade12LevelOfCompletionModel()
            {
                ID = original.ID,
                StatusID = original.StatusID,
                Subject = original.Subject,
                SchoolID = original.SchoolID,
                DateLogged = original.DateLogged
            };

            return row;
        }
        public static IEnumerable<Grade12LevelOfCompletionModel> Map(this IEnumerable<Grade12LevelOfCompletion> original)
        {
            if (original == null)
            {
                return null;
            }

            var list = original.Select(x => x.Map()).ToList();
            return list;
        }

        public static EnablingConditionModel Map(this EnablingCondition original)
        {
            if (original == null)
            {
                return null;
            }

            var row = new EnablingConditionModel()
            {
                ID = original.ID,
                DoesTheSchoolHaveElectricity = original.DoesTheSchoolHaveElectricity,
                HasTheSchoolBeenProvidedWithElectricity = original.HasTheSchoolBeenProvidedWithElectricity,
                DoesTheSchoolHaveRunningWater = original.DoesTheSchoolHaveRunningWater,
                HasTheSchoolBeenProvidedWithWater = original.HasTheSchoolBeenProvidedWithWater,
                DoesTheSchoolExperienceWaterPressureIssuesRegularly = original.DoesTheSchoolExperienceWaterPressureIssuesRegularly,
                DoesTheSchoolHaveAdequateSanitationFacilities = original.DoesTheSchoolHaveAdequateSanitationFacilities,
                DoesTheSchoolHaveSecureFencing = original.DoesTheSchoolHaveSecureFencing,
                DidTheSchoolHaveSufficientClassrooms = original.DidTheSchoolHaveSufficientClassrooms,
                DidTheSchoolRequestAdditionalFurnitureFromTheGDE = original.DidTheSchoolRequestAdditionalFurnitureFromTheGDE,
                WasTheFurnitureDelivered = original.WasTheFurnitureDelivered,
                DidTheSchoolRequestAdditionalClassroomsFromTheGDE = original.DidTheSchoolRequestAdditionalClassroomsFromTheGDE,
                WereTheClassroomsDelivered = original.WereTheClassroomsDelivered,
                WasTheSchoolAffectedByIncidentsOfVandalism = original.WasTheSchoolAffectedByIncidentsOfVandalism,
                HowManyOccasionsWasTheSchoolAffectedByIncidentsOfVandalism = original.HowManyOccasionsWasTheSchoolAffectedByIncidentsOfVandalism,
                DoesTheSchoolHaveLearnersBenefittingFromTheGDELearnerTransportProgramme = original.DoesTheSchoolHaveLearnersBenefittingFromTheGDELearnerTransportProgramme,
                NoOfLearnersBenefittingFromTheGDELearnerTransportProgramme = original.NoOfLearnersBenefittingFromTheGDELearnerTransportProgramme,
                WereThereAnyChallengesExperiencedInTermsOfTheLearnerTransportProgrammeDuringTheLockdown = original.WereThereAnyChallengesExperiencedInTermsOfTheLearnerTransportProgrammeDuringTheLockdown,
                AreAllTheLearnersBeingTransportedAsExpected = original.AreAllTheLearnersBeingTransportedAsExpected,
                AreAllTheLearnersArrivingOnTime = original.AreAllTheLearnersArrivingOnTime,
                AreTheLearnersUsingHandSanitisersBeforeEnteringTheBuses = original.AreTheLearnersUsingHandSanitisersBeforeEnteringTheBuses,
                AreTheLearnersWearingMasksWhileOnTheBuses = original.AreTheLearnersWearingMasksWhileOnTheBuses,
                IsThePhysicalDistancingRequirementsBeingObservedOnTheBuses = original.IsThePhysicalDistancingRequirementsBeingObservedOnTheBuses,
                WereTheCovid19BrigadesAvailableToAssistOnTheLearnerTransportRoutes = original.WereTheCovid19BrigadesAvailableToAssistOnTheLearnerTransportRoutes,
                DoesTheSchoolHaveLearnersBenefittingFromNationalSchoolNutritionProgramme = original.DoesTheSchoolHaveLearnersBenefittingFromNationalSchoolNutritionProgramme,
                NoOfLearnersBenefittingFromNationalSchoolNutritionProgramme = original.NoOfLearnersBenefittingFromNationalSchoolNutritionProgramme,
                IsPhysicalDistancingBeingAppliedInTheFoodPreparationArea = original.IsPhysicalDistancingBeingAppliedInTheFoodPreparationArea,
                IsPhysicalDistancingBeingAppliedWhereLearnersAreBeingFed = original.IsPhysicalDistancingBeingAppliedWhereLearnersAreBeingFed,
                IsTheFoodPreparationAreaBeingCleanedRegularly = original.IsTheFoodPreparationAreaBeingCleanedRegularly,
                AreFeedingTimesAreBeingStaggered = original.AreFeedingTimesAreBeingStaggered,
                HaveTheFoodHandlersBeenTrainedOnCovid19Protocols = original.HaveTheFoodHandlersBeenTrainedOnCovid19Protocols,
                DoTheFoodHandlersHaveTheNecessaryPPEs = original.DoTheFoodHandlersHaveTheNecessaryPPEs,
                IsThereProperCleaningOfTheUtensilsTakingPlace = original.IsThereProperCleaningOfTheUtensilsTakingPlace,
                IsTheSchoolUsingDisposableUtensils = original.IsTheSchoolUsingDisposableUtensils,
                AreTheSchoolLearnersSharingUtensils = original.AreTheSchoolLearnersSharingUtensils,
                WereThereAnyChallengesExperiencedInTermsOfTheSchoolNutritionProgrammeDuringLockdown = original.WereThereAnyChallengesExperiencedInTermsOfTheSchoolNutritionProgrammeDuringLockdown,
                HowAreThoseLearnersThatAreOnRotatioBeingFed = original.HowAreThoseLearnersThatAreOnRotatioBeingFed,
                HowAreLearnersLearningFromHomeBeingFed = original.HowAreLearnersLearningFromHomeBeingFed,
                WereLearnersAllowedToTakeHomeTheirTextbooksDuringLockdown = original.WereLearnersAllowedToTakeHomeTheirTextbooksDuringLockdown,
                DoesTheSchoolHaveSufficientTextbooksForAllLearners = original.DoesTheSchoolHaveSufficientTextbooksForAllLearners,
                HasTheSchoolBeenAffectedByDisruptions = original.HasTheSchoolBeenAffectedByDisruptions,
                HasTheSchoolBeenForcedToClose = original.HasTheSchoolBeenForcedToClose,
                HowManyOccassionsWasTheSchoolForcedToClose = original.HowManyOccassionsWasTheSchoolForcedToClose,
                TotalNoOfSchoolDaysLostDueToClosure = original.TotalNoOfSchoolDaysLostDueToClosure,
                SchoolID = original.SchoolID,
                DateLogged = original.DateLogged,
                CausesOfDisruptionsOther = original.CausesOfDisruptionsOther
            };

            return row;
        }
        public static IEnumerable<EnablingConditionModel> Map(this IEnumerable<EnablingCondition> original)
        {
            if (original == null)
            {
                return null;
            }

            var list = original.Select(x => x.Map()).ToList();
            return list;
        }
        public static SchoolBuildingConditionModel Map(this SchoolBuildingCondition original)
        {
            if (original == null)
            {
                return null;
            }

            var row = new SchoolBuildingConditionModel()
            {
                ID = original.ID,
                RoofStatusID = original.RoofStatusID,
                WindowsStatusID = original.WindowsStatusID,
                DoorsStatusID = original.DoorsStatusID,
                WallsStatusID = original.WallsStatusID,
                FloorsStatusID = original.FloorsStatusID,
                SchoolID = original.SchoolID,
                DateLogged = original.DateLogged
            };

            return row;
        }
        public static IEnumerable<SchoolBuildingConditionModel> Map(this IEnumerable<SchoolBuildingCondition> original)
        {
            if (original == null)
            {
                return null;
            }

            var list = original.Select(x => x.Map()).ToList();
            return list;
        }
        public static LTSMModel Map(this LTSM original)
        {
            if (original == null)
            {
                return null;
            }

            var row = new LTSMModel()
            {
                ID = original.ID,
                Grade1 = original.Grade1,
                Grade2 = original.Grade2,
                Grade3 = original.Grade3,
                Grade4 = original.Grade4,
                Grade5 = original.Grade5,
                Grade6 = original.Grade6,
                Grade7 = original.Grade7,
                Grade8 = original.Grade8,
                Grade9 = original.Grade9,
                Grade10 = original.Grade10,
                Grade11 = original.Grade11,
                Grade12 = original.Grade12,
                Category = original.Category,
                SchoolID = original.SchoolID,
                DateLogged = original.DateLogged
            };

            return row;
        }
        public static IEnumerable<LTSMModel> Map(this IEnumerable<LTSM> original)
        {
            if (original == null)
            {
                return null;
            }

            var list = original.Select(x => x.Map()).ToList();
            return list;
        }
    }
}
