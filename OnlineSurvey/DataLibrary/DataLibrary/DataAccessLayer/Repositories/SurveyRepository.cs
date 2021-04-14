using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataLibrary.Entities;
using DataLibrary.DataAccessLayer.Mappers;
using DataLibrary.DataAccessLayer.Repositories.Interfaces;

namespace DataLibrary.DataAccessLayer.Repositories
{
    public class SurveyRepository : ISurveyRepository
    {
        #region General School Information
        public SchoolModel SaveSchoolDetails(SchoolModel school)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.Schools.FirstOrDefault(x => x.ID == school.ID);

                    if (data != null)
                    {
                        data.PrincipalMobileNo = school.PrincipalMobileNo;
                        data.PrincipalPersalNo = school.PrincipalPersalNo;
                        data.PrincipalIdentityNo = school.PrincipalIdentityNo;
                        data.PrincipalEmailAddress = school.PrincipalEmailAddress;
                        data.PrincipalName = school.PrincipalName;
                    }

                    context.SaveChanges();

                    var results = data.Map();

                    return results;
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        #endregion General School Information

        #region Learner Information

        public AverageLearnerAttendenceBetween31AugustAnd11SeptemberModel SaveAverageLearnerAttendenceBetween31AugustAnd11September(AverageLearnerAttendenceBetween31AugustAnd11SeptemberModel model)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.AverageLearnerAttendenceBetween31AugustAnd11September.FirstOrDefault(x => x.SchoolID == model.SchoolID & x.Grade == model.Grade);

                    if (data == null)
                    {
                        data = new AverageLearnerAttendenceBetween31AugustAnd11September()
                        {
                            DateLogged = DateTime.Now
                        };
                        context.AverageLearnerAttendenceBetween31AugustAnd11September.Add(data);
                    }

                    data.NoOfLearnersExpected = model.NoOfLearnersExpected;
                    data.NoOfLearnersReturned = model.NoOfLearnersReturned;
                    data.AverageAttendance = model.AverageAttendance;
                    data.Grade = model.Grade;
                    data.SchoolID = model.SchoolID;

                    context.SaveChanges();

                    var results = data.Map();

                    return results;



                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        public LearnerInformationByCategoryModel SaveLearnerInformationByCategory(LearnerInformationByCategoryModel model)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.LearnerInformationByCategories.FirstOrDefault(x => x.SchoolID == model.SchoolID & x.Grade == model.Grade);

                    if (data == null)
                    {
                        data = new LearnerInformationByCategory();


                        context.LearnerInformationByCategories.Add(data);
                    }

                    data.HeadcountEnrolment = model.HeadcountEnrolment;
                    data.CurrentEnrolment = model.CurrentEnrolment;
                    data.NoOfLearnersAttendingClassesAtSchoolCurrently = model.NoOfLearnersAttendingClassesAtSchoolCurrently;
                    data.NoOfLearnersStudyingFromHomeCurrently = model.NoOfLearnersStudyingFromHomeCurrently;
                    data.NoOfLearnersDeregisteredFromTheSchoolAndApprovedForHomeEducation = model.NoOfLearnersDeregisteredFromTheSchoolAndApprovedForHomeEducation;
                    data.NoOfLearnersThatHavePotentiallyDroppedOutOfSchool = model.NoOfLearnersThatHavePotentiallyDroppedOutOfSchool;
                    data.NoOfLearnersTransferredIntoTheSchool = model.NoOfLearnersTransferredIntoTheSchool;
                    data.NoOfLearnersTransferredOutToOtherSchools = model.NoOfLearnersTransferredOutToOtherSchools;
                    data.Grade = model.Grade;
                    data.SchoolID = model.SchoolID;

                    context.SaveChanges();

                    var results = data.Map();

                    return results;
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
    }

        public LearnerInformationModel SaveLearnerInformation(LearnerInformationModel model)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.LearnerInformations.FirstOrDefault(x => x.SchoolID == model.SchoolID);

                    if (data == null)
                    {
                        data = new LearnerInformation()
                        {
                            DateLogged = DateTime.Now
                        };

                        context.LearnerInformations.Add(data);
                    }

                    data.NoOfLearnersApprovedForLockdownLearningApprovedByGDE = model.NoOfLearnersApprovedForLockdownLearningApprovedByGDE;
                    data.NoOfLearnersInvolvedInLockdownLearningByArrangementWithTheSchool = model.NoOfLearnersInvolvedInLockdownLearningByArrangementWithTheSchool;
                    data.NoOfLearnersApprovedForLockdownLearningDueToComorbidities = model.NoOfLearnersApprovedForLockdownLearningDueToComorbidities;
                    data.NoOfLearnersApprovedForLockdownLearningDueToAnxietyOrFear = model.NoOfLearnersApprovedForLockdownLearningDueToAnxietyOrFear;
                    data.NoOfLearnersApprovedForLockdownLearningDueToOtherHealthRelatedReasons = model.NoOfLearnersApprovedForLockdownLearningDueToOtherHealthRelatedReasons;
                    data.PotentialDropOutYoungerThan7 = model.PotentialDropOutYoungerThan7;
                    data.PotentialDropOutBetween7And15 = model.PotentialDropOutBetween7And15;
                    data.PotentialDropOutOlderThan15 = model.PotentialDropOutOlderThan15;
                    data.ReviewTheDeregistrationOfLearnersByGDE = model.ReviewTheDeregistrationOfLearnersByGDE;
                    data.NoOfPotentialDropOutsContactedBySchool = model.NoOfPotentialDropOutsContactedBySchool;
                    data.NoOfLearnersWhoseParentsWereContacted = model.NoOfLearnersWhoseParentsWereContacted;
                    data.NoOfLearnersUnableToBeContacted = model.NoOfLearnersUnableToBeContacted;
                    data.DidTheSchoolEscalateToTheDistrict = model.DidTheSchoolEscalateToTheDistrict;
                    data.HasTherBeenFollowUpByDistrict = model.HasTherBeenFollowUpByDistrict;
                    data.HasThisProvenSuccessful = model.HasThisProvenSuccessful;
                    data.SchoolID = model.SchoolID;

                    context.SaveChanges();

                    var results = data.Map();

                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IEnumerable<AverageLearnerAttendenceBetween31AugustAnd11SeptemberModel> GetAverageLearnerAttendenceBetween31AugustAnd11SeptemberBySchoolID(int schoolID)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.AverageLearnerAttendenceBetween31AugustAnd11September.Where(x => x.SchoolID == schoolID);
                    var results = data.Map();

                    return results.ToList();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public IEnumerable<LearnerInformationByCategoryModel> GetLearnerInformationByCategoryBySchoolID(int schoolID)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.LearnerInformationByCategories.Where(x => x.SchoolID == schoolID);
                    var results = data.Map();

                    return results.ToList();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public LearnerInformationModel GetLearnerInformationBySchoolID(int schoolID)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.LearnerInformations.FirstOrDefault(x => x.SchoolID == schoolID);
                    var results = data.Map();

                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion Learner Information

        #region Staff Information

        public StaffInformationHeadCountModel SaveStaffInformationHeadCount(StaffInformationHeadCountModel model)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.StaffInformationHeadCounts.FirstOrDefault(x => x.SchoolID == model.SchoolID && x.Category == model.Category);

                    if (data == null)
                    {
                        data = new StaffInformationHeadCount()
                        {
                            DateLogged = DateTime.Now
                        };

                        context.StaffInformationHeadCounts.Add(data);
                    }

                    data.TenthDayStaffCountsStatePaid = model.TenthDayStaffCountsStatePaid;
                    data.TenthDayStaffCountsSGBAppointed = model.TenthDayStaffCountsSGBAppointed;
                    data.NoOfStaffMembersReturnedStatePaid = model.NoOfStaffMembersReturnedStatePaid;
                    data.NoOfStaffMembersReturnedSGBAppointed = model.NoOfStaffMembersReturnedSGBAppointed;
                    data.NoOfStaffApprovedForConcessionsStatePaid = model.NoOfStaffApprovedForConcessionsStatePaid;
                    data.NoOfStaffApprovedForConcessionsSGBAppointed = model.NoOfStaffApprovedForConcessionsSGBAppointed;
                    data.NoOfStaffAppliedAndAwaitingApprovalForConcessionsStatePaid = model.NoOfStaffAppliedAndAwaitingApprovalForConcessionsStatePaid ;
                    data.NoOfStaffAppliedAndAwaitingApprovalForConcessionsSGBAppointed = model.NoOfStaffAppliedAndAwaitingApprovalForConcessionsSGBAppointed;
                    data.NoOfStaffNotReturnedToWorkForAnyKnownReasonsStatePaid = model.NoOfStaffNotReturnedToWorkForAnyKnownReasonsStatePaid;
                    data.NoOfStaffNotReturnedToWorkForAnyKnownReasonsSGBAppointed = model.NoOfStaffNotReturnedToWorkForAnyKnownReasonsSGBAppointed;
                    data.NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementStatePaid = model.NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementStatePaid;
                    data.NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementSGBAppointed = model.NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementSGBAppointed;

                    data.NoOfStaffAppliedAndNotApprovedForConcessionsStatePaid = model.NoOfStaffAppliedAndNotApprovedForConcessionsStatePaid;
                    data.NoOfStaffAppliedAndNotApprovedForConcessionsSGBAppointed = model.NoOfStaffAppliedAndNotApprovedForConcessionsSGBAppointed;

                    data.Category = model.Category;
                    data.SchoolID = model.SchoolID;

                    context.SaveChanges();

                    var results = data.Map();

                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public StaffInformationManagementOfConcessionModel SaveStaffInformationManagementOfConcession(StaffInformationManagementOfConcessionModel model)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.StaffInformationManagementOfConcessions.FirstOrDefault(x => x.SchoolID == model.SchoolID && x.Category == model.Category);

                    if (data == null)
                    {
                        data = new StaffInformationManagementOfConcession()
                        {
                            DateLogged = DateTime.Now
                        };

                        context.StaffInformationManagementOfConcessions.Add(data);
                    }

                    data.NoOfStaffApprovedForComorbiditiesStatePaid = model.NoOfStaffApprovedForComorbiditiesStatePaid;
                    data.NoOfStaffApprovedForComorbiditiesSGBAppointed = model.NoOfStaffApprovedForComorbiditiesSGBAppointed;
                    data.NoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessStatePaid = model.NoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessStatePaid;
                    data.NoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessSGBAppointed = model.NoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessSGBAppointed;
                    data.NoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsStatePaid = model.NoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsStatePaid;
                    data.NoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsSGBAppointed = model.NoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsSGBAppointed;
                    data.NoOfSubstitutesAppliedForStatePaid = model.NoOfSubstitutesAppliedForStatePaid;
                    data.NoOfSubstitutesReceivedStatePaid = model.NoOfSubstitutesReceivedStatePaid;
                    data.Category = model.Category;
                    data.SchoolID = model.SchoolID;

                    context.SaveChanges();

                    var results = data.Map();

                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public StaffInformationSMTManagementOfAttendenceModel SaveStaffInformationSMTManagementOfAttendence(StaffInformationSMTManagementOfAttendenceModel model)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.StaffInformationSMTManagementOfAttendences.FirstOrDefault(x => x.SchoolID == model.SchoolID);

                    if (data == null)
                    {
                        data = new StaffInformationSMTManagementOfAttendence()
                        {
                            DateLogged = DateTime.Now
                        };

                        context.StaffInformationSMTManagementOfAttendences.Add(data);
                    }

                    data.HaveThereBeenStaffWhoHaveNotNeturnedToSchoolWithoutApproval = model.HaveThereBeenStaffWhoHaveNotNeturnedToSchoolWithoutApproval;
                    data.NoOfStatePaidEducators = model.NoOfStatePaidEducators;
                    data.NoOfPSStaff = model.NoOfPSStaff;
                    data.HasTheGDEInstitutedDisciplinaryProcesses = model.HasTheGDEInstitutedDisciplinaryProcesses;
                    data.HowManyCasesInvolvedStatePaidEducators = model.HowManyCasesInvolvedStatePaidEducators;
                    data.HowManyCasesInvolvedPSStaff = model.HowManyCasesInvolvedPSStaff;
                    data.SchoolID = model.SchoolID;

                    context.SaveChanges();

                    var results = data.Map();

                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IEnumerable<StaffInformationHeadCountModel> GetStaffInformationHeadCountBySchoolID(int schoolID)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.StaffInformationHeadCounts.Where(x => x.SchoolID == schoolID);
                    var results = data.Map();

                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IEnumerable<StaffInformationManagementOfConcessionModel> GetStaffInformationManagementOfConcessionBySchoolID(int schoolID)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.StaffInformationManagementOfConcessions.Where(x => x.SchoolID == schoolID);
                    var results = data.Map();

                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public StaffInformationSMTManagementOfAttendenceModel GetStaffInformationSMTManagementOfAttendenceBySchoolID(int schoolID)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.StaffInformationSMTManagementOfAttendences.FirstOrDefault(x => x.SchoolID == schoolID);
                    var results = data.Map();

                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion Staff Information

        #region Class Information

        public ClassInformationModel SaveClassInformation(ClassInformationModel classInformtion, List<ClassInformationDetailModel> classInformationDetails, List<int> selectedCombinedGradesForMultiGradeClasses, List<int> selectedGradesThatDidNotRotate, List<int> selectedSchoolDisinfectors)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.ClassInformations.FirstOrDefault(x => x.SchoolID == classInformtion.SchoolID);

                    if (data == null)
                    {
                        data = new ClassInformation()
                        {
                            DateLogged = DateTime.Now
                        };

                        context.ClassInformations.Add(data);
                    }

                    data.DoesTheSchoolPlatoon = classInformtion.DoesTheSchoolPlatoon;
                    data.DoesTheSchoolHaveDoubleShifts = classInformtion.DoesTheSchoolHaveDoubleShifts;
                    data.DoesTheSchoolHaveMultiGradeclasses = classInformtion.DoesTheSchoolHaveMultiGradeclasses;
                    data.NoOfLearnersAccommodatedForDailyRotation = classInformtion.NoOfLearnersAccommodatedForDailyRotation;
                    data.NoOfLearnersAccommodatedForWeeklyRotation = classInformtion.NoOfLearnersAccommodatedForWeeklyRotation;
                    data.NoOfLearnersAccommodatedForHybrid = classInformtion.NoOfLearnersAccommodatedForHybrid;
                    data.LearnerCapacityOfSchoolNormsAndStandardForSchoolInfrastructure = classInformtion.LearnerCapacityOfSchoolNormsAndStandardForSchoolInfrastructure;
                    data.WasTheSchoolAbleToAccommodatePhysicalDistancingID = classInformtion.WasTheSchoolAbleToAccommodatePhysicalDistancingID;
                    data.HasTheSchoolAdjustedTheSchoolDayToCoverTheRegulatedHoursForCurriculumDelivery = classInformtion.HasTheSchoolAdjustedTheSchoolDayToCoverTheRegulatedHoursForCurriculumDelivery;
                    data.TotalTeachingTimeOverTheCycle = classInformtion.TotalTeachingTimeOverTheCycle;
                    data.WereAdditionalMobileClassroomsRequestedByTheSchool = classInformtion.WereAdditionalMobileClassroomsRequestedByTheSchool;
                    data.NoOfMobileClassroomsRequestedByTheSchool = classInformtion.NoOfMobileClassroomsRequestedByTheSchool;
                    data.NoOfAdditionalMobileClassroomsDelivered = classInformtion.NoOfAdditionalMobileClassroomsDelivered;
                    data.NoOfClassroomsNotUsedDueToPoorCondition = classInformtion.NoOfClassroomsNotUsedDueToPoorCondition;
                    data.WasTheSchoolClosedDueToCovid19 = classInformtion.WasTheSchoolClosedDueToCovid19;
                    data.NoOfOccasionsTheSchoolClosedDueToCovid19 = classInformtion.NoOfOccasionsTheSchoolClosedDueToCovid19;
                    data.LongestDurationTheSchoolClosedDueToCovid19 = classInformtion.LongestDurationTheSchoolClosedDueToCovid19;
                    data.WasTheSchoolDisinfected = classInformtion.WasTheSchoolDisinfected;
                    data.IntroducedRotationID = classInformtion.IntroducedRotationID;
                    data.TimetableCycleID = classInformtion.TimetableCycleID;
                    data.SchoolRotationApproachID = classInformtion.SchoolRotationApproachID;
                    data.SchoolID = classInformtion.SchoolID;

                    context.SaveChanges();

                    SaveClassInformationDetails(classInformationDetails, data.ID);
                    SaveClassInformationItems(data.SchoolID, data.ID, selectedCombinedGradesForMultiGradeClasses, selectedGradesThatDidNotRotate, selectedSchoolDisinfectors);

                    var results = data.Map();

                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void SaveClassInformationDetails(List<ClassInformationDetailModel> classInformationDetails, int classInformationID)
        {
            try
            {
                List<ClassInformationDetailModel> results = new List<ClassInformationDetailModel>();
                foreach (var item in classInformationDetails)
                {
                    using (var context = new Covid19ImpactSurveyEntities())
                    {
                        var data = context.ClassInformationDetails.FirstOrDefault(x => x.SchoolID == item.SchoolID && x.Category == item.Category);

                        if (data == null)
                        {
                            data = new ClassInformationDetail()
                            {
                                DateLogged = DateTime.Now
                            };

                            context.ClassInformationDetails.Add(data);
                        }

                        data.Category = item.Category;
                        data.Grade1 = item.Grade1;
                        data.Grade2 = item.Grade2;
                        data.Grade3 = item.Grade3;
                        data.Grade4 = item.Grade4;
                        data.Grade5 = item.Grade5;
                        data.Grade6 = item.Grade6;
                        data.Grade7 = item.Grade7;
                        data.Grade8 = item.Grade8;
                        data.Grade9 = item.Grade9;
                        data.Grade10 = item.Grade10;
                        data.Grade11 = item.Grade11;
                        data.Grade12 = item.Grade12;
                        data.PreGradeR = item.PreGradeR;
                        data.GradeR = item.GradeR;
                        data.Spec = item.Spec;
                        data.Oth = item.Oth;
                        data.Total = item.Total;
                        data.SchoolID = item.SchoolID;

                        context.SaveChanges();
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void SaveClassInformationItems(int schoolID, int classInformationID, List<int> selectedCombinedGradesForMultiGradeClasses, List<int> selectedGradesThatDidNotRotate, List<int> selectedSchoolDisinfectors)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var multiGradeLinks = context.SchoolMultiGrades.Where(x => x.SchoolID == schoolID);
                    context.SchoolMultiGrades.RemoveRange(multiGradeLinks);

                    foreach (var gradeID in selectedCombinedGradesForMultiGradeClasses)
                    {
                        context.SchoolMultiGrades.Add(new SchoolMultiGrade { ID = Guid.NewGuid(), GradeID = gradeID, SchoolID = schoolID });
                    }

                    var nonRotatingGradesLinks = context.ClassInformation_NonRotatingGrades.Where(x => x.SchoolID == schoolID);
                    context.ClassInformation_NonRotatingGrades.RemoveRange(nonRotatingGradesLinks);
                    foreach (var gradeID in selectedGradesThatDidNotRotate)
                    {
                        context.ClassInformation_NonRotatingGrades.Add(new ClassInformation_NonRotatingGrades { ID = Guid.NewGuid(), GradeID = gradeID, SchoolID = schoolID });
                    }

                    var schoolDisifectorLinks = context.SchoolDisifectors.Where(x => x.ClassInformationID == classInformationID);
                    context.SchoolDisifectors.RemoveRange(schoolDisifectorLinks);
                    foreach (var disinfectorID in selectedSchoolDisinfectors)
                    {
                        context.SchoolDisifectors.Add(new SchoolDisifector { ID = Guid.NewGuid(), DisinfectorID = disinfectorID, ClassInformationID = classInformationID, DateLogged = DateTime.Now });
                    }

                    context.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public ClassInformationModel GetClassInformationBySchoolID(int schoolID)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.ClassInformations.FirstOrDefault(x => x.SchoolID == schoolID);
                    var results = data.Map();

                    var classInformationDetails = context.ClassInformationDetails.Where(x => x.SchoolID == schoolID);
                    var combinedGradesForMultiGradeClasses =  context.SchoolMultiGrades.Where(x => x.SchoolID == schoolID).Select(x=>x.GradeID).ToList();
                    var gradesThatDidNotRotate =  context.ClassInformation_NonRotatingGrades.Where(x => x.SchoolID == schoolID).Select(x=>x.GradeID).ToList();
                    var schoolDisinfectors = new List<int>();
                    
                    if(data != null)
                        schoolDisinfectors = context.SchoolDisifectors.Where(x => x.ClassInformationID == data.ID).Select(x=>x.DisinfectorID).ToList();

                    if (results != null)
                    {
                        results.ClassInformationDetails = classInformationDetails.Map();
                        results.CombinedGradesForMultiGradeClasses = combinedGradesForMultiGradeClasses;
                        results.GradesThatDidNotRotate = gradesThatDidNotRotate;
                        results.SchoolDisinfectors = schoolDisinfectors;
                    }

                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public IEnumerable<LookupItemModel> GetDisinfectorLooupItemsByClassInformationID(int id)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    //var data = context.LookupItems.FirstOrDefault(x => x.SchoolID == schoolID);
                    var data = from thisDisinfector in context.SchoolDisifectors
                            join thisLookupItem in context.LookupItems on thisDisinfector.DisinfectorID equals thisLookupItem.ID
                            where thisDisinfector.ClassInformationID == id
                            orderby thisLookupItem.Caption
                            select new LookupItemModel()
                            { 
                                Value = thisLookupItem.ID.ToString(),
                                Text = thisLookupItem.Caption
                            };

                   // var results = data.Map();

                    return data;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion Class Information

        #region Finance Information

        public FinanceModel SaveFinanceInformation(FinanceModel financeInformation)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.Finances.FirstOrDefault(x => x.SchoolID == financeInformation.SchoolID);

                    if (data == null)
                    {
                        data = new Finance()
                        {
                            DateLogged = DateTime.Now
                        };

                        context.Finances.Add(data);
                    }

                    data.SchoolTypeID = financeInformation.SchoolTypeID;
                    data.IsTheSchoolProjectingShortfallInRevenue = financeInformation.IsTheSchoolProjectingShortfallInRevenue;
                    data.NoOfLearnersApprovedForSchoolFeeExemptionsConditional2019 = financeInformation.NoOfLearnersApprovedForSchoolFeeExemptionsConditional2019;
                    data.NoOfLearnersApprovedForSchoolFeeExemptionsConditional2020 = financeInformation.NoOfLearnersApprovedForSchoolFeeExemptionsConditional2020;
                    data.NoOfLearnersApprovedForSchoolFeeExemptionsPartial2019 = financeInformation.NoOfLearnersApprovedForSchoolFeeExemptionsPartial2019;
                    data.NoOfLearnersApprovedForSchoolFeeExemptionsPartial2020 = financeInformation.NoOfLearnersApprovedForSchoolFeeExemptionsPartial2020;
                    data.NoOfLearnersApprovedForSchoolFeeExemptionsTotal2019 = financeInformation.NoOfLearnersApprovedForSchoolFeeExemptionsTotal2019;
                    data.NoOfLearnersApprovedForSchoolFeeExemptionsTotal2020 = financeInformation.NoOfLearnersApprovedForSchoolFeeExemptionsTotal2020;
                    data.NoOfLearnersApprovedPostLockdownConditional = financeInformation.NoOfLearnersApprovedPostLockdownConditional;
                    data.NoOfLearnersApprovedPostLockdownPartial = financeInformation.NoOfLearnersApprovedPostLockdownPartial;
                    data.NoOfLearnersApprovedPostLockdownTotal = financeInformation.NoOfLearnersApprovedPostLockdownTotal;
                    data.NoOfLearnersWhoseParentsDefaultedOnSchoolFeePayments2019 = financeInformation.NoOfLearnersWhoseParentsDefaultedOnSchoolFeePayments2019;
                    data.NoOfLearnersWhoseParentsDefaultedOnSchoolFeePayments2020 = financeInformation.NoOfLearnersWhoseParentsDefaultedOnSchoolFeePayments2020;
                    data.HowDidTheReducedRevenueCollectionImpactOnOperations = financeInformation.HowDidTheReducedRevenueCollectionImpactOnOperations;
                    data.DidYouContinueWithSection38APaymentsToStaff = financeInformation.DidYouContinueWithSection38APaymentsToStaff;
                    data.HowDidTheSchoolManagePayments = financeInformation.HowDidTheSchoolManagePayments;
                    data.CanTheSchoolConfirmThatLTSMHasBeenProcuredFor2021 = financeInformation.CanTheSchoolConfirmThatLTSMHasBeenProcuredFor2021;
                    data.CanTheSchoolConfirmThatItHasBeenAbleToPayTheirMunicipalAccounts = financeInformation.CanTheSchoolConfirmThatItHasBeenAbleToPayTheirMunicipalAccounts;
                    data.CanTheSchoolConfirmThatItHasBeenAbleToUndertakeMinorRepairsUsingTheMaintenanceBudget = financeInformation.CanTheSchoolConfirmThatItHasBeenAbleToUndertakeMinorRepairsUsingTheMaintenanceBudget;
                    data.CanTheSchoolConfirmThatTheyHavePaidAllTheirSGBAppointedStaff = financeInformation.CanTheSchoolConfirmThatTheyHavePaidAllTheirSGBAppointedStaff;
                    data.DidTheSchoolRelieveSGBAppointedTeachingStaffOfTheirDuties = financeInformation.DidTheSchoolRelieveSGBAppointedTeachingStaffOfTheirDuties;
                    data.NoOfSGBAppointedTeachingStaffWereAffected = financeInformation.NoOfSGBAppointedTeachingStaffWereAffected;
                    data.WasTheReprioritisedBudgetApprovedAtAnAGM = financeInformation.WasTheReprioritisedBudgetApprovedAtAnAGM;
                    data.DidTheInitiativesPursuedAssistTheSchoolInRealisingTheBudgetRevenueShortfall = financeInformation.DidTheInitiativesPursuedAssistTheSchoolInRealisingTheBudgetRevenueShortfall;
                    data.IsThisSchoolSubsidisedByTheState = financeInformation.IsThisSchoolSubsidisedByTheState;
                    data.WhatAreTheMainSourcesOfRevenueForTheSchool = financeInformation.WhatAreTheMainSourcesOfRevenueForTheSchool;
                    data.IsTheSchoolProjectingShortfallInRevenueCollectionFor2020 = financeInformation.IsTheSchoolProjectingShortfallInRevenueCollectionFor2020;
                    data.HaveYouPurchasedAdditionalLearnerAndEducatorSupportMaterial = financeInformation.HaveYouPurchasedAdditionalLearnerAndEducatorSupportMaterial;
                    data.DoesTheSchoolHaveSufficientTextbooksForAllTheLearners = financeInformation.DoesTheSchoolHaveSufficientTextbooksForAllTheLearners;
                    data.WasTheSchoolAbleToPayTheirMunicipalAccounts = financeInformation.WasTheSchoolAbleToPayTheirMunicipalAccounts;
                    data.WasTheSchoolAbleToPurchasePPEsAndCovid19RelatedSupplies = financeInformation.WasTheSchoolAbleToPurchasePPEsAndCovid19RelatedSupplies;
                    data.DidTheSchoolRelieveTeachingStaffOfTheirDutiesToBalanceTheBudget = financeInformation.DidTheSchoolRelieveTeachingStaffOfTheirDutiesToBalanceTheBudget;
                    data.HowManyTeachingStaffWereRelievedOfTheirDutiesToBalanceTheBudget = financeInformation.HowManyTeachingStaffWereRelievedOfTheirDutiesToBalanceTheBudget;
                    data.SchoolID = financeInformation.SchoolID;

                    context.SaveChanges();

                    SaveFinanceInformationItems(data.ID, financeInformation.RevenueShortfallManagementInitiatives, financeInformation.SchoolDealingWithSchoolFeeDefaulters);

                    var results = data.Map();

                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public FinanceModel GetFinanceInformationBySchoolID(int schoolID)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.Finances.FirstOrDefault(x => x.SchoolID == schoolID);
                    var results = data.Map();
               
                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void SaveFinanceInformationItems(int financeInformationID, List<int> revenueShortfallManagementInitiatives, List<int> schoolDealingWithSchoolFeeDefaulters)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var financeDefaultersLinks = context.FinanceSchoolFeeDefaulters.Where(x => x.FinanceID == financeInformationID);
                    context.FinanceSchoolFeeDefaulters.RemoveRange(financeDefaultersLinks);

                    foreach (var defaulterID in schoolDealingWithSchoolFeeDefaulters)
                    {
                        context.FinanceSchoolFeeDefaulters.Add(new FinanceSchoolFeeDefaulter { ID = Guid.NewGuid(), FinanceID = financeInformationID, SchoolDefaulterID = defaulterID });
                    }

                    var revenueShortfallManagementInitiativesLinks = context.FinanceSchoolShortfallOptions.Where(x => x.FinanceID == financeInformationID);
                    context.FinanceSchoolShortfallOptions.RemoveRange(revenueShortfallManagementInitiativesLinks);
                   
                    foreach (var shortfalInitiativeID in revenueShortfallManagementInitiatives)
                    {
                        context.FinanceSchoolShortfallOptions.Add(new FinanceSchoolShortfallOption { ID = Guid.NewGuid(), ShortfallOptionID = shortfalInitiativeID, FinanceID = financeInformationID });
                    }

                    context.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion Finance Information

        #region Hostel Boarders Information

        public HostelBoarderModel SaveHostelBoarderInformation(HostelBoarderModel hostelBoarderInformation)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.HostelBoarders.FirstOrDefault(x => x.SchoolID == hostelBoarderInformation.SchoolID);

                    if (data == null)
                    {
                        data = new HostelBoarder()
                        {
                            DateLogged = DateTime.Now
                        };

                        context.HostelBoarders.Add(data);
                    }

                    data.NoOfLearnersAdmittedToTheHostelInJanuary2020Male = hostelBoarderInformation.NoOfLearnersAdmittedToTheHostelInJanuary2020Male;
                    data.NoOfLearnersAdmittedToTheHostelInJanuary2020Female = hostelBoarderInformation.NoOfLearnersAdmittedToTheHostelInJanuary2020Female;
                    data.DidTheSchoolApplyTheRelevantPhysicalDistancingMealTime = hostelBoarderInformation.DidTheSchoolApplyTheRelevantPhysicalDistancingMealTime;
                    data.DidTheSchoolApplyTheRelevantPhysicalDistancingStudyTime = hostelBoarderInformation.DidTheSchoolApplyTheRelevantPhysicalDistancingStudyTime;
                    data.DidTheSchoolApplyTheRelevantPhysicalDistancingLeisureTime = hostelBoarderInformation.DidTheSchoolApplyTheRelevantPhysicalDistancingLeisureTime;
                    data.DidTheSchoolIncreaseTheFrequencyOfCleaningAtTheHostel = hostelBoarderInformation.DidTheSchoolIncreaseTheFrequencyOfCleaningAtTheHostel;
                    data.WereTheLearnersProvidedWithAdequatePPEs = hostelBoarderInformation.WereTheLearnersProvidedWithAdequatePPEs;
                    data.WereTheLearnersProvidedWithAdequateHandSanitiser = hostelBoarderInformation.WereTheLearnersProvidedWithAdequateHandSanitiser;
                    data.SchoolID = hostelBoarderInformation.SchoolID;

                    context.SaveChanges();

                    var results = data.Map();

                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public HostelBoarderModel GetHostelBoarderInformationBySchoolID(int schoolID)
        {
            try 
            { 
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.HostelBoarders.FirstOrDefault(x => x.SchoolID == schoolID);
                    var results = data.Map();

                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        #endregion Hostel Boarders Information

        #region Infections And Mortality Information

        public bool SaveInfectionsAndMortalityInformation(List<LearnersCovid19StatisticsPerGradeModel> learnersByGradeCovid19Statistics, List<LearnersCovid19StatisticsPerAgeGroupModel> learnersByAgeGroupCovid19Statistics, List<StaffCovid19StatisticsPerAgeGroupModel> staffCovid19Statistics)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    foreach(var item in learnersByGradeCovid19Statistics)
                    {
                        var data = context.LearnersCovid19StatisticsPerGrade.FirstOrDefault(x => x.SchoolID == item.SchoolID && x.Grade == item.Grade);
                        if (data == null)
                        {
                            data = new LearnersCovid19StatisticsPerGrade()
                            {
                                DateLogged = DateTime.Now
                            };

                            context.LearnersCovid19StatisticsPerGrade.Add(data);
                        }

                        data.NoOfConfirmedInfectionsMale = item.NoOfConfirmedInfectionsMale;
                        data.NoOfConfirmedInfectionsFemale = item.NoOfConfirmedInfectionsFemale;
                        data.NoOfConfirmedRecoveriesMale = item.NoOfConfirmedRecoveriesMale;
                        data.NoOfConfirmedRecoveriesFemale = item.NoOfConfirmedRecoveriesFemale;
                        data.NoOfConfirmedDeathsMale = item.NoOfConfirmedDeathsMale;
                        data.NoOfConfirmedDeathsFemale = item.NoOfConfirmedDeathsFemale;
                        data.Grade = item.Grade;
                        data.SchoolID = item.SchoolID;
                    }

                    foreach (var item in learnersByAgeGroupCovid19Statistics)
                    {
                        var data = context.LearnersCovid19StatisticsPerAgeGroup.FirstOrDefault(x => x.SchoolID == item.SchoolID && x.AgeGroup == item.AgeGroup);
                        if (data == null)
                        {
                            data = new LearnersCovid19StatisticsPerAgeGroup()
                            {
                                DateLogged = DateTime.Now
                            };

                            context.LearnersCovid19StatisticsPerAgeGroup.Add(data);
                        }

                        data.NoOfConfirmedInfectionsMale = item.NoOfConfirmedInfectionsMale;
                        data.NoOfConfirmedInfectionsFemale = item.NoOfConfirmedInfectionsFemale;
                        data.NoOfConfirmedRecoveriesMale = item.NoOfConfirmedRecoveriesMale;
                        data.NoOfConfirmedRecoveriesFemale = item.NoOfConfirmedRecoveriesFemale;
                        data.NoOfConfirmedDeathsMale = item.NoOfConfirmedDeathsMale;
                        data.NoOfConfirmedDeathsFemale = item.NoOfConfirmedDeathsFemale;
                        data.AgeGroup = item.AgeGroup;
                        data.SchoolID = item.SchoolID;
                    }

                    foreach (var item in staffCovid19Statistics)
                    {
                        var data = context.StaffCovid19StatisticsPerAgeGroup.FirstOrDefault(x => x.SchoolID == item.SchoolID && x.AgeGroup == item.AgeGroup && x.StaffType == item.StaffType);
                        if (data == null)
                        {
                            data = new StaffCovid19StatisticsPerAgeGroup()
                            {
                                DateLogged = DateTime.Now
                            };

                            context.StaffCovid19StatisticsPerAgeGroup.Add(data);
                        }

                        data.NoOfConfirmedInfectionsMale = item.NoOfConfirmedInfectionsMale;
                        data.NoOfConfirmedInfectionsFemale = item.NoOfConfirmedInfectionsFemale;
                        data.NoOfConfirmedRecoveriesMale = item.NoOfConfirmedRecoveriesMale;
                        data.NoOfConfirmedRecoveriesFemale = item.NoOfConfirmedRecoveriesFemale;
                        data.NoOfConfirmedDeathsMale = item.NoOfConfirmedDeathsMale;
                        data.NoOfConfirmedDeathsFemale = item.NoOfConfirmedDeathsFemale;
                        data.StaffType = item.StaffType;
                        data.AgeGroup = item.AgeGroup;
                        data.SchoolID = item.SchoolID;
                    }

                    context.SaveChanges();

                   return true;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public IEnumerable<LearnersCovid19StatisticsPerGradeModel> GetLearnersCovid19StatisticsPerGradeBySchoolID(int schoolID)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.LearnersCovid19StatisticsPerGrade.Where(x => x.SchoolID == schoolID);
                    var results = data.Map();

                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public IEnumerable<LearnersCovid19StatisticsPerAgeGroupModel> GetLearnersCovid19StatisticsPerAgeGroupBySchoolID(int schoolID)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.LearnersCovid19StatisticsPerAgeGroup.Where(x => x.SchoolID == schoolID);
                    var results = data.Map();

                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public IEnumerable<StaffCovid19StatisticsPerAgeGroupModel> GetStaffCovid19StatisticsPerAgeGroupBySchoolID(int schoolID)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.StaffCovid19StatisticsPerAgeGroup.Where(x => x.SchoolID == schoolID);
                    var results = data.Map();

                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion  Infections And Mortality Information

        #region Curriculum Delivery

        public bool SaveCurriculumDeliveryInformation(CurriculumDeliveryModel curriculumDelivery, List<EducatorResourceModel> teacherResources, List<CoveredGradeFundamentalModel> coveredGradeFundamentals, List<Grade12LevelOfCompletionModel> grade12LevelOfCompletion)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {

                    var curriculumDeliveryData = context.CurriculumDeliveries.FirstOrDefault(x => x.SchoolID == curriculumDelivery.SchoolID);
                    if (curriculumDeliveryData == null)
                    {
                        curriculumDeliveryData = new CurriculumDelivery()
                        {
                            DateLogged = DateTime.Now
                        };

                        context.CurriculumDeliveries.Add(curriculumDeliveryData);
                    }

                    curriculumDeliveryData.WasTheSchoolAbleToDeliverLessonsToLearnersDuringLockdownLevel5 = curriculumDelivery.WasTheSchoolAbleToDeliverLessonsToLearnersDuringLockdownLevel5;
                    curriculumDeliveryData.OnlineWithStudentTeacherInteractionID = curriculumDelivery.OnlineWithStudentTeacherInteractionID;
                    curriculumDeliveryData.OnlineWithoutStudentTeacherInteractionID = curriculumDelivery.OnlineWithoutStudentTeacherInteractionID;
                    curriculumDeliveryData.TVBasedLessonsAndProgrammesID = curriculumDelivery.TVBasedLessonsAndProgrammesID;
                    curriculumDeliveryData.RadioLearningProgrammesID = curriculumDelivery.RadioLearningProgrammesID;
                    curriculumDeliveryData.SocialMediaForStudentTeacherInteractionID = curriculumDelivery.SocialMediaForStudentTeacherInteractionID;
                    curriculumDeliveryData.PaperBasedPackagesID = curriculumDelivery.PaperBasedPackagesID;
                    curriculumDeliveryData.HomeVisitsByTeachersID = curriculumDelivery.HomeVisitsByTeachersID;
                    curriculumDeliveryData.UseOfExternalServiceProvidersID = curriculumDelivery.UseOfExternalServiceProvidersID;
                    curriculumDeliveryData.OtherDistanceLearningDescription = curriculumDelivery.OtherDistanceLearningDescription;
                    curriculumDeliveryData.OtherDistanceLearningID = curriculumDelivery.OtherDistanceLearningID;
                    curriculumDeliveryData.DevicesUtilisedByEducatorsUseID = curriculumDelivery.DevicesUtilisedByEducatorsUseID;
                    curriculumDeliveryData.DidTheSchoolProvideEducatorsWithDataToEnableWiFiConnectivityWhenWorkingFromHome = curriculumDelivery.DidTheSchoolProvideEducatorsWithDataToEnableWiFiConnectivityWhenWorkingFromHome;
                    curriculumDeliveryData.NoOfEducatorsTrainedToConductOnlineClasses = curriculumDelivery.NoOfEducatorsTrainedToConductOnlineClasses;
                    curriculumDeliveryData.NoOfEducatorsNotTrainedToConductOnlineClasses = curriculumDelivery.NoOfEducatorsNotTrainedToConductOnlineClasses;
                    curriculumDeliveryData.NoOfEducatorsSuccessfullyConductedOnlineClasses = curriculumDelivery.NoOfEducatorsSuccessfullyConductedOnlineClasses;
                    curriculumDeliveryData.WasTerm1OfTheATPCompleted = curriculumDelivery.WasTerm1OfTheATPCompleted;
                    curriculumDeliveryData.WasTerm1AssessmentCompleted = curriculumDelivery.WasTerm1AssessmentCompleted;
                    curriculumDeliveryData.WereTerm1ReportCardsIssued = curriculumDelivery.WereTerm1ReportCardsIssued;
                    curriculumDeliveryData.IsTheSchoolImplementingTheRevisedATP = curriculumDelivery.IsTheSchoolImplementingTheRevisedATP;
                    curriculumDeliveryData.HaSchoolCommunicatedWithParentsRegardingAssessmentTasksExpectedFromLearners = curriculumDelivery.HaSchoolCommunicatedWithParentsRegardingAssessmentTasksExpectedFromLearners;
                    curriculumDeliveryData.HasSchoolReceivedFortnightlyLearnerActivityPacks = curriculumDelivery.HasSchoolReceivedFortnightlyLearnerActivityPacks;
                    curriculumDeliveryData.HasTheSchoolProvidedTheirOwnResourcesToFacilitateLockdownLearning = curriculumDelivery.HasTheSchoolProvidedTheirOwnResourcesToFacilitateLockdownLearning;
                    curriculumDeliveryData.HaveParentsPickedUpTheFortnightlyLearnerActivityPacks = curriculumDelivery.HaveParentsPickedUpTheFortnightlyLearnerActivityPacks;
                    curriculumDeliveryData.HasTheSchoolFollowedUpWithTheParentsOfLearnersThatFailedToSubmitTheirLearningTasks = curriculumDelivery.HasTheSchoolFollowedUpWithTheParentsOfLearnersThatFailedToSubmitTheirLearningTasks;
                    curriculumDeliveryData.AreTheLearnersAttendingClassAtSchoolAndThoseAtHomeAtTheSameLevelOfCompletion = curriculumDelivery.AreTheLearnersAttendingClassAtSchoolAndThoseAtHomeAtTheSameLevelOfCompletion;
                    curriculumDeliveryData.DoesTheSchoolEnsureThatTheParentsSubmitTheirChildrenAssessmentTasksInTime = curriculumDelivery.DoesTheSchoolEnsureThatTheParentsSubmitTheirChildrenAssessmentTasksInTime;
                    curriculumDeliveryData.NoOfLearnersBenefittedFromTheHomeLearningPacks = curriculumDelivery.NoOfLearnersBenefittedFromTheHomeLearningPacks;
                    curriculumDeliveryData.CompletedRequiredNofAssesmentsGrade1To3ID = curriculumDelivery.CompletedRequiredNofAssesmentsGrade1To3ID;
                    curriculumDeliveryData.CompletedRequiredNofAssesmentsGrade4To9ID = curriculumDelivery.CompletedRequiredNofAssesmentsGrade4To9ID;
                    curriculumDeliveryData.CompletedRequiredNofAssesmentsGrade10To11ID = curriculumDelivery.CompletedRequiredNofAssesmentsGrade10To11ID;
                    curriculumDeliveryData.CompletedRequiredNofAssesmentsGrade12ID = curriculumDelivery.CompletedRequiredNofAssesmentsGrade12ID;
                    curriculumDeliveryData.WillTheSchoolHaveCompletedTheGrade12ProgrammeInAdvanceOfThePrelimExaminations = curriculumDelivery.WillTheSchoolHaveCompletedTheGrade12ProgrammeInAdvanceOfThePrelimExaminations;
                    curriculumDeliveryData.ReasonForNotCompletingTheGrade12ProgrammeInAdvanceOfThePrelimExaminations = curriculumDelivery.ReasonForNotCompletingTheGrade12ProgrammeInAdvanceOfThePrelimExaminations;
                    curriculumDeliveryData.SubjectAdvisorsSupportedTheStaffOther = curriculumDelivery.SubjectAdvisorsSupportedTheStaffOther;
                    curriculumDeliveryData.LaggingBehindSchoolInterventionsOther = curriculumDelivery.LaggingBehindSchoolInterventionsOther;
                    curriculumDeliveryData.SchoolID = curriculumDelivery.SchoolID;

                    context.SaveChanges();


                    var reachedGradesDuringLockdonLevel5Links = context.CurriculumDelivery_ReachedGradesDuringLockdonLevel5.Where(x => x.CurriculumDeliveryID == curriculumDeliveryData.ID);
                    context.CurriculumDelivery_ReachedGradesDuringLockdonLevel5.RemoveRange(reachedGradesDuringLockdonLevel5Links);
                    foreach (var itemID in curriculumDelivery.ReachedGradesDuringLockdonLevel5)
                    {
                        context.CurriculumDelivery_ReachedGradesDuringLockdonLevel5.Add(new CurriculumDelivery_ReachedGradesDuringLockdonLevel5() { ID = Guid.NewGuid(), CurriculumDeliveryID = curriculumDeliveryData.ID,GradeID = itemID });
                    }

                    var accomodatedGradesFollowingMinistersFirstSetOfDirectionLinks = context.CurriculumDelivery_AccomodatedGradesFollowingMinistersFirstSetOfDirection.Where(x => x.CurriculumDeliveryID == curriculumDeliveryData.ID);
                    context.CurriculumDelivery_AccomodatedGradesFollowingMinistersFirstSetOfDirection.RemoveRange(accomodatedGradesFollowingMinistersFirstSetOfDirectionLinks);
                    foreach (var itemID in curriculumDelivery.AccomodatedGradesFollowingMinistersFirstSetOfDirection)
                    {
                        context.CurriculumDelivery_AccomodatedGradesFollowingMinistersFirstSetOfDirection.Add(new CurriculumDelivery_AccomodatedGradesFollowingMinistersFirstSetOfDirection() { ID = Guid.NewGuid(), CurriculumDeliveryID = curriculumDeliveryData.ID, GradeID = itemID });
                    }

                    var accomodatedGradesFollowingMinistersFirstSetOfDirection29June2020Links = context.CurriculumDelivery_AccomodatedGradesFollowingMinistersFirstSetOfDirection29June2020.Where(x => x.CurriculumDeliveryID == curriculumDeliveryData.ID);
                    context.CurriculumDelivery_AccomodatedGradesFollowingMinistersFirstSetOfDirection29June2020.RemoveRange(accomodatedGradesFollowingMinistersFirstSetOfDirection29June2020Links);
                    foreach (var itemID in curriculumDelivery.AccomodatedGradesFollowingMinistersFirstSetOfDirection29June2020)
                    {
                        context.CurriculumDelivery_AccomodatedGradesFollowingMinistersFirstSetOfDirection29June2020.Add(new CurriculumDelivery_AccomodatedGradesFollowingMinistersFirstSetOfDirection29June2020() { ID = Guid.NewGuid(), CurriculumDeliveryID = curriculumDeliveryData.ID, GradeID = itemID });
                    }

                    var accomodatedGradesFollowingMinistersSetOfDirection07July2020Links = context.CurriculumDelivery_AccomodatedGradesFollowingMinistersSetOfDirection07July2020.Where(x => x.CurriculumDeliveryID == curriculumDeliveryData.ID);
                    context.CurriculumDelivery_AccomodatedGradesFollowingMinistersSetOfDirection07July2020.RemoveRange(accomodatedGradesFollowingMinistersSetOfDirection07July2020Links);
                    foreach (var itemID in curriculumDelivery.AccomodatedGradesFollowingMinistersSetOfDirection07July2020)
                    {
                        context.CurriculumDelivery_AccomodatedGradesFollowingMinistersSetOfDirection07July2020.Add(new CurriculumDelivery_AccomodatedGradesFollowingMinistersSetOfDirection07July2020() { ID = Guid.NewGuid(), CurriculumDeliveryID = curriculumDeliveryData.ID, GradeID = itemID });
                    }

                    var accomodatedGradesFollowingMinistersSetOfDirection02August2020Links = context.CurriculumDelivery_AccomodatedGradesFollowingMinistersSetOfDirection02August2020.Where(x => x.CurriculumDeliveryID == curriculumDeliveryData.ID);
                    context.CurriculumDelivery_AccomodatedGradesFollowingMinistersSetOfDirection02August2020.RemoveRange(accomodatedGradesFollowingMinistersSetOfDirection02August2020Links);
                    foreach (var itemID in curriculumDelivery.AccomodatedGradesFollowingMinistersSetOfDirection02August2020)
                    {
                        context.CurriculumDelivery_AccomodatedGradesFollowingMinistersSetOfDirection02August2020.Add(new CurriculumDelivery_AccomodatedGradesFollowingMinistersSetOfDirection02August2020() { ID = Guid.NewGuid(), CurriculumDeliveryID = curriculumDeliveryData.ID, GradeID = itemID });
                    }

                    var teacherDevicesAreReliantOnLinks = context.CurriculumDelivery_TeacherDevicesAreReliantOn.Where(x => x.CurriculumDeliveryID == curriculumDeliveryData.ID);
                    context.CurriculumDelivery_TeacherDevicesAreReliantOn.RemoveRange(teacherDevicesAreReliantOnLinks);
                    foreach (var itemID in curriculumDelivery.TeacherDevicesAreReliantOn)
                    {
                        context.CurriculumDelivery_TeacherDevicesAreReliantOn.Add(new CurriculumDelivery_TeacherDevicesAreReliantOn() { ID = Guid.NewGuid(), CurriculumDeliveryID = curriculumDeliveryData.ID, ItemID = itemID });
                    }

                    var seniorPhaseInitiativesLinks = context.CurriculumDelivery_SeniorPhaseInitiatives.Where(x => x.CurriculumDeliveryID == curriculumDeliveryData.ID);
                    context.CurriculumDelivery_SeniorPhaseInitiatives.RemoveRange(seniorPhaseInitiativesLinks);
                    foreach (var itemID in curriculumDelivery.SeniorPhaseInitiatives)
                    {
                        context.CurriculumDelivery_SeniorPhaseInitiatives.Add(new CurriculumDelivery_SeniorPhaseInitiatives() { ID = Guid.NewGuid(), CurriculumDeliveryID = curriculumDeliveryData.ID, ItemID = itemID });
                    }

                    var laggingBehindSchoolInterventionLinks = context.CurriculumDelivery_LaggingBehindSchoolIntervention.Where(x => x.CurriculumDeliveryID == curriculumDeliveryData.ID);
                    context.CurriculumDelivery_LaggingBehindSchoolIntervention.RemoveRange(laggingBehindSchoolInterventionLinks);
                    foreach (var itemID in curriculumDelivery.LaggingBehindSchoolInterventions)
                    {
                        context.CurriculumDelivery_LaggingBehindSchoolIntervention.Add(new CurriculumDelivery_LaggingBehindSchoolIntervention() { ID = Guid.NewGuid(), CurriculumDeliveryID = curriculumDeliveryData.ID, ItemID = itemID });
                    }

                    var meansToProvideGuidanceToParentsAndLearnersToFacilitateLockdownLearningLinks = context.CurriculumDelivery_MeansToProvideGuidanceToParentsAndLearnersToFacilitateLockdownLearning.Where(x => x.CurriculumDeliveryID == curriculumDeliveryData.ID);
                    context.CurriculumDelivery_MeansToProvideGuidanceToParentsAndLearnersToFacilitateLockdownLearning.RemoveRange(meansToProvideGuidanceToParentsAndLearnersToFacilitateLockdownLearningLinks);
                    foreach (var itemID in curriculumDelivery.MeansToProvideGuidanceToParentsAndLearnersToFacilitateLockdownLearning)
                    {
                        context.CurriculumDelivery_MeansToProvideGuidanceToParentsAndLearnersToFacilitateLockdownLearning.Add(new CurriculumDelivery_MeansToProvideGuidanceToParentsAndLearnersToFacilitateLockdownLearning() { ID = Guid.NewGuid(), CurriculumDeliveryID = curriculumDeliveryData.ID, ItemID = itemID });
                    }

                    var howHasTheSchoolAssistedLockdownLearnersWithTheirAssessmentTasksLinks = context.CurriculumDelivery_HowHasTheSchoolAssistedLockdownLearnersWithTheirAssessmentTasks.Where(x => x.CurriculumDeliveryID == curriculumDeliveryData.ID);
                    context.CurriculumDelivery_HowHasTheSchoolAssistedLockdownLearnersWithTheirAssessmentTasks.RemoveRange(howHasTheSchoolAssistedLockdownLearnersWithTheirAssessmentTasksLinks);
                    foreach (var itemID in curriculumDelivery.HowHasTheSchoolAssistedLockdownLearnersWithTheirAssessmentTasks)
                    {
                        context.CurriculumDelivery_HowHasTheSchoolAssistedLockdownLearnersWithTheirAssessmentTasks.Add(new CurriculumDelivery_HowHasTheSchoolAssistedLockdownLearnersWithTheirAssessmentTasks() { ID = Guid.NewGuid(), CurriculumDeliveryID = curriculumDeliveryData.ID, ItemID = itemID });
                    }

                    var districtSupportRecievedForLockdownLearningLinks = context.CurriculumDelivery_DistrictSupportRecievedForLockdownLearning.Where(x => x.CurriculumDeliveryID == curriculumDeliveryData.ID);
                    context.CurriculumDelivery_DistrictSupportRecievedForLockdownLearning.RemoveRange(districtSupportRecievedForLockdownLearningLinks);
                    foreach (var itemID in curriculumDelivery.DistrictSupportRecievedForLockdownLearning)
                    {
                        context.CurriculumDelivery_DistrictSupportRecievedForLockdownLearning.Add(new CurriculumDelivery_DistrictSupportRecievedForLockdownLearning() { ID = Guid.NewGuid(), CurriculumDeliveryID = curriculumDeliveryData.ID, ItemID = itemID });
                    }

                    var subjectAdvisorsSupportedTheStaffLinks = context.CurriculumDelivery_SubjectAdvisorsSupportedTheStaff.Where(x => x.CurriculumDeliveryID == curriculumDeliveryData.ID);
                    context.CurriculumDelivery_SubjectAdvisorsSupportedTheStaff.RemoveRange(subjectAdvisorsSupportedTheStaffLinks);
                    foreach (var itemID in curriculumDelivery.SubjectAdvisorsSupportedTheStaff)
                    {
                        context.CurriculumDelivery_SubjectAdvisorsSupportedTheStaff.Add(new CurriculumDelivery_SubjectAdvisorsSupportedTheStaff() { ID = Guid.NewGuid(), CurriculumDeliveryID = curriculumDeliveryData.ID, ItemID = itemID });
                    }

                    var initiativesAvailedByTheSchoolToSupportMatriculantsToCompleteTheGrade12ProgrammeLinks = context.CurriculumDelivery_InitiativesAvailedByTheSchoolToSupportMatriculantsToCompleteTheGrade12Programme.Where(x => x.CurriculumDeliveryID == curriculumDeliveryData.ID);
                    context.CurriculumDelivery_InitiativesAvailedByTheSchoolToSupportMatriculantsToCompleteTheGrade12Programme.RemoveRange(initiativesAvailedByTheSchoolToSupportMatriculantsToCompleteTheGrade12ProgrammeLinks);
                    foreach (var itemID in curriculumDelivery.InitiativesAvailedByTheSchoolToSupportMatriculantsToCompleteTheGrade12Programme)
                    {
                        context.CurriculumDelivery_InitiativesAvailedByTheSchoolToSupportMatriculantsToCompleteTheGrade12Programme.Add(new CurriculumDelivery_InitiativesAvailedByTheSchoolToSupportMatriculantsToCompleteTheGrade12Programme() { ID = Guid.NewGuid(), CurriculumDeliveryID = curriculumDeliveryData.ID, ItemID = itemID });
                    }

                    var initiativesAvailedByTheGDEToSupportMatriculantsToCompleteTheGrade12ProgrammeLinks = context.CurriculumDelivery_InitiativesAvailedByTheGDEToSupportMatriculantsToCompleteTheGrade12Programme.Where(x => x.CurriculumDeliveryID == curriculumDeliveryData.ID);
                    context.CurriculumDelivery_InitiativesAvailedByTheGDEToSupportMatriculantsToCompleteTheGrade12Programme.RemoveRange(initiativesAvailedByTheGDEToSupportMatriculantsToCompleteTheGrade12ProgrammeLinks);
                    foreach (var itemID in curriculumDelivery.InitiativesAvailedByTheGDEToSupportMatriculantsToCompleteTheGrade12Programme)
                    {
                        context.CurriculumDelivery_InitiativesAvailedByTheGDEToSupportMatriculantsToCompleteTheGrade12Programme.Add(new CurriculumDelivery_InitiativesAvailedByTheGDEToSupportMatriculantsToCompleteTheGrade12Programme() { ID = Guid.NewGuid(), CurriculumDeliveryID = curriculumDeliveryData.ID, ItemID = itemID });
                    }

                    var initiativesAvailedByThePartnersToSupportMatriculantsToCompleteTheGrade12ProgrammeLinks = context.CurriculumDelivery_InitiativesAvailedByThePartnersToSupportMatriculantsToCompleteTheGrade12Programme.Where(x => x.CurriculumDeliveryID == curriculumDeliveryData.ID);
                    context.CurriculumDelivery_InitiativesAvailedByThePartnersToSupportMatriculantsToCompleteTheGrade12Programme.RemoveRange(initiativesAvailedByThePartnersToSupportMatriculantsToCompleteTheGrade12ProgrammeLinks);
                    foreach (var itemID in curriculumDelivery.InitiativesAvailedByThePartnersToSupportMatriculantsToCompleteTheGrade12Programme)
                    {
                        context.CurriculumDelivery_InitiativesAvailedByThePartnersToSupportMatriculantsToCompleteTheGrade12Programme.Add(new CurriculumDelivery_InitiativesAvailedByThePartnersToSupportMatriculantsToCompleteTheGrade12Programme() { ID = Guid.NewGuid(), CurriculumDeliveryID = curriculumDeliveryData.ID, ItemID = itemID });
                    }

                    var approvedSubjectsLinks = context.CurriculumDelivery_ApprovedSubjects.Where(x => x.CurriculumDeliveryID == curriculumDeliveryData.ID);
                    context.CurriculumDelivery_ApprovedSubjects.RemoveRange(approvedSubjectsLinks);
                    foreach (var itemID in curriculumDelivery.ApprovedSubjects)
                    {
                        context.CurriculumDelivery_ApprovedSubjects.Add(new CurriculumDelivery_ApprovedSubjects() { ID = Guid.NewGuid(), CurriculumDeliveryID = curriculumDeliveryData.ID, SubjectID = itemID });
                    }

                    var onlineWithStudentTeacherInteractionIDsLinks = context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.Where(x => x.CurriculumDeliveryID == curriculumDeliveryData.ID && x.ModeOfDeliveryID == (int)ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.OnlineWithStudentTeacherInteraction);
                    context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.RemoveRange(onlineWithStudentTeacherInteractionIDsLinks);
                    foreach (var itemID in curriculumDelivery.OnlineWithStudentTeacherInteractionIDs)
                    {
                        context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.Add(new CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum() { ID = Guid.NewGuid(), CurriculumDeliveryID = curriculumDeliveryData.ID, UsageID = itemID, ModeOfDeliveryID = (int)ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.OnlineWithStudentTeacherInteraction });
                    }

                    var onlineWithoutStudentTeacherInteractionIDsLinks = context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.Where(x => x.CurriculumDeliveryID == curriculumDeliveryData.ID && x.ModeOfDeliveryID == (int)ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.OnlineWithoutStudentTeacherInteraction);
                    context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.RemoveRange(onlineWithoutStudentTeacherInteractionIDsLinks);
                    foreach (var itemID in curriculumDelivery.OnlineWithoutStudentTeacherInteractionIDs)
                    {
                        context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.Add(new CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum() { ID = Guid.NewGuid(), CurriculumDeliveryID = curriculumDeliveryData.ID, UsageID = itemID, ModeOfDeliveryID = (int)ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.OnlineWithoutStudentTeacherInteraction });
                    }

                    var tVBasedLessonsAndProgrammesIDsLinks = context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.Where(x => x.CurriculumDeliveryID == curriculumDeliveryData.ID && x.ModeOfDeliveryID == (int)ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.TVBasedLessonsAndProgrammes);
                    context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.RemoveRange(tVBasedLessonsAndProgrammesIDsLinks);
                    foreach (var itemID in curriculumDelivery.TVBasedLessonsAndProgrammesIDs)
                    {
                        context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.Add(new CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum() { ID = Guid.NewGuid(), CurriculumDeliveryID = curriculumDeliveryData.ID, UsageID = itemID, ModeOfDeliveryID = (int)ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.TVBasedLessonsAndProgrammes });
                    }

                    var radioLearningProgrammesIDsLinks = context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.Where(x => x.CurriculumDeliveryID == curriculumDeliveryData.ID && x.ModeOfDeliveryID == (int)ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.RadioLearningProgrammes);
                    context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.RemoveRange(radioLearningProgrammesIDsLinks);
                    foreach (var itemID in curriculumDelivery.RadioLearningProgrammesIDs)
                    {
                        context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.Add(new CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum() { ID = Guid.NewGuid(), CurriculumDeliveryID = curriculumDeliveryData.ID, UsageID = itemID, ModeOfDeliveryID = (int)ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.RadioLearningProgrammes });
                    }

                    var socialMediaForStudentTeacherInteractionIDsLinks = context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.Where(x => x.CurriculumDeliveryID == curriculumDeliveryData.ID && x.ModeOfDeliveryID == (int)ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.SocialMediaForStudentTeacherInteraction);
                    context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.RemoveRange(socialMediaForStudentTeacherInteractionIDsLinks);
                    foreach (var itemID in curriculumDelivery.SocialMediaForStudentTeacherInteractionIDs)
                    {
                        context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.Add(new CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum() { ID = Guid.NewGuid(), CurriculumDeliveryID = curriculumDeliveryData.ID, UsageID = itemID, ModeOfDeliveryID = (int)ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.SocialMediaForStudentTeacherInteraction });
                    }

                    var paperBasedPackagesIDsLinks = context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.Where(x => x.CurriculumDeliveryID == curriculumDeliveryData.ID && x.ModeOfDeliveryID == (int)ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.PaperBasedPackages);
                    context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.RemoveRange(paperBasedPackagesIDsLinks);
                    foreach (var itemID in curriculumDelivery.PaperBasedPackagesIDs)
                    {
                        context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.Add(new CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum() { ID = Guid.NewGuid(), CurriculumDeliveryID = curriculumDeliveryData.ID, UsageID = itemID, ModeOfDeliveryID = (int)ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.PaperBasedPackages });
                    }

                    var homeVisitsByTeachersIDsLinks = context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.Where(x => x.CurriculumDeliveryID == curriculumDeliveryData.ID && x.ModeOfDeliveryID == (int)ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.HomeVisitsByTeachers);
                    context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.RemoveRange(homeVisitsByTeachersIDsLinks);
                    foreach (var itemID in curriculumDelivery.HomeVisitsByTeachersIDs)
                    {
                        context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.Add(new CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum() { ID = Guid.NewGuid(), CurriculumDeliveryID = curriculumDeliveryData.ID, UsageID = itemID, ModeOfDeliveryID = (int)ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.HomeVisitsByTeachers });
                    }

                    var useOfExternalServiceProvidersIDsLinks = context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.Where(x => x.CurriculumDeliveryID == curriculumDeliveryData.ID && x.ModeOfDeliveryID == (int)ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.UseOfExternalServiceProviders);
                    context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.RemoveRange(useOfExternalServiceProvidersIDsLinks);
                    foreach (var itemID in curriculumDelivery.UseOfExternalServiceProvidersIDs)
                    {
                        context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.Add(new CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum() { ID = Guid.NewGuid(), CurriculumDeliveryID = curriculumDeliveryData.ID, UsageID = itemID, ModeOfDeliveryID = (int)ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.UseOfExternalServiceProviders });
                    }

                    var otherDistanceLearningIDsLinks = context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.Where(x => x.CurriculumDeliveryID == curriculumDeliveryData.ID && x.ModeOfDeliveryID == (int)ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.OtherDistanceLearning);
                    context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.RemoveRange(otherDistanceLearningIDsLinks);
                    foreach (var itemID in curriculumDelivery.OtherDistanceLearningIDs)
                    {
                        context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.Add(new CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum() { ID = Guid.NewGuid(), CurriculumDeliveryID = curriculumDeliveryData.ID, UsageID = itemID, ModeOfDeliveryID = (int)ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.OtherDistanceLearning });
                    }

                    foreach (var item in teacherResources)
                    {
                        var data = context.EducatorResources.FirstOrDefault(x => x.SchoolID == item.SchoolID && x.Type == item.Type);
                        if (data == null)
                        {
                            data = new EducatorResource()
                            {
                                DateLogged = DateTime.Now
                            };

                            context.EducatorResources.Add(data);
                        }

                        data.Type = item.Type;
                        data.ProvidedByGDE = item.ProvidedByGDE;
                        data.ProvidedBySchool = item.ProvidedBySchool;
                        data.PersonallyOwned = item.PersonallyOwned;
                        data.SchoolID = item.SchoolID;
                    }

                    foreach (var item in coveredGradeFundamentals)
                    {
                        var data = context.CoveredGradeFundamentals.FirstOrDefault(x => x.SchoolID == item.SchoolID && x.Grade == item.Grade);
                        if (data == null)
                        {
                            data = new CoveredGradeFundamental()
                            {
                                DateLogged = DateTime.Now
                            };

                            context.CoveredGradeFundamentals.Add(data);
                        }

                        data.Grade = item.Grade;
                        data.StatusID = item.StatusID;
                        data.SchoolID = item.SchoolID;
                    }

                    foreach (var item in grade12LevelOfCompletion)
                    {
                        var data = context.Grade12LevelOfCompletion.FirstOrDefault(x => x.SchoolID == item.SchoolID && x.Subject == item.Subject);
                        if (data == null)
                        {
                            data = new Grade12LevelOfCompletion()
                            {
                                DateLogged = DateTime.Now
                            };

                            context.Grade12LevelOfCompletion.Add(data);
                        }

                        data.Subject = item.Subject;
                        data.StatusID = item.StatusID;
                        data.SchoolID = item.SchoolID;
                    }

                    context.SaveChanges();

                    return true;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public CurriculumDeliveryModel GetCurriculumDeliveryBySchoolID(int schoolID)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.CurriculumDeliveries.FirstOrDefault(x => x.SchoolID == schoolID);
                    var results = data.Map();

                    var reachedGradesDuringLockdonLevel5 = context.CurriculumDelivery_ReachedGradesDuringLockdonLevel5.Where(x => x.CurriculumDeliveryID == data.ID).Select(x => x.GradeID);
                    var accomodatedGradesFollowingMinistersFirstSetOfDirection = context.CurriculumDelivery_AccomodatedGradesFollowingMinistersFirstSetOfDirection.Where(x => x.CurriculumDeliveryID == data.ID).Select(x => x.GradeID);
                    var accomodatedGradesFollowingMinistersFirstSetOfDirection29June2020 = context.CurriculumDelivery_AccomodatedGradesFollowingMinistersFirstSetOfDirection29June2020.Where(x => x.CurriculumDeliveryID == data.ID).Select(x => x.GradeID);
                    var accomodatedGradesFollowingMinistersSetOfDirection07July2020 = context.CurriculumDelivery_AccomodatedGradesFollowingMinistersSetOfDirection07July2020.Where(x => x.CurriculumDeliveryID == data.ID).Select(x => x.GradeID);
                    var accomodatedGradesFollowingMinistersSetOfDirection02August2020 = context.CurriculumDelivery_AccomodatedGradesFollowingMinistersSetOfDirection02August2020.Where(x => x.CurriculumDeliveryID == data.ID).Select(x => x.GradeID);
                    var teacherDevicesAreReliantOn = context.CurriculumDelivery_TeacherDevicesAreReliantOn.Where(x => x.CurriculumDeliveryID == data.ID).Select(x => x.ItemID);
                    var howDidTheSchoolInformParentsAboutThePerformanceOfTheirChildren = context.CurriculumDelivery_HowDidTheSchoolInformParentsAboutThePerformanceOfTheirChildren.Where(x => x.CurriculumDeliveryID == data.ID).Select(x => x.ItemID);
                    var approvedSubjects = context.CurriculumDelivery_ApprovedSubjects.Where(x => x.CurriculumDeliveryID == data.ID).Select(x => x.SubjectID);
                    var seniorPhaseInitiatives = context.CurriculumDelivery_SeniorPhaseInitiatives.Where(x => x.CurriculumDeliveryID == data.ID).Select(x => x.ItemID);
                    var laggingBehindSchoolInterventions = context.CurriculumDelivery_LaggingBehindSchoolIntervention.Where(x => x.CurriculumDeliveryID == data.ID).Select(x => x.ItemID);
                    var meansToProvideGuidanceToParentsAndLearnersToFacilitateLockdownLearning = context.CurriculumDelivery_MeansToProvideGuidanceToParentsAndLearnersToFacilitateLockdownLearning.Where(x => x.CurriculumDeliveryID == data.ID).Select(x => x.ItemID);
                    var howHasTheSchoolAssistedLockdownLearnersWithTheirAssessmentTasks = context.CurriculumDelivery_HowHasTheSchoolAssistedLockdownLearnersWithTheirAssessmentTasks.Where(x => x.CurriculumDeliveryID == data.ID).Select(x => x.ItemID);
                    var districtSupportRecievedForLockdownLearning = context.CurriculumDelivery_DistrictSupportRecievedForLockdownLearning.Where(x => x.CurriculumDeliveryID == data.ID).Select(x => x.ItemID);
                    var subjectAdvisorsSupportedTheStaff = context.CurriculumDelivery_SubjectAdvisorsSupportedTheStaff.Where(x => x.CurriculumDeliveryID == data.ID).Select(x => x.ItemID);
                    var initiativesAvailedByTheSchoolToSupportMatriculantsToCompleteTheGrade12Programme = context.CurriculumDelivery_InitiativesAvailedByTheSchoolToSupportMatriculantsToCompleteTheGrade12Programme.Where(x => x.CurriculumDeliveryID == data.ID).Select(x => x.ItemID);
                    var initiativesAvailedByTheGDEToSupportMatriculantsToCompleteTheGrade12Programme = context.CurriculumDelivery_InitiativesAvailedByTheGDEToSupportMatriculantsToCompleteTheGrade12Programme.Where(x => x.CurriculumDeliveryID == data.ID).Select(x => x.ItemID);
                    var initiativesAvailedByThePartnersToSupportMatriculantsToCompleteTheGrade12Programme = context.CurriculumDelivery_InitiativesAvailedByThePartnersToSupportMatriculantsToCompleteTheGrade12Programme.Where(x => x.CurriculumDeliveryID == data.ID).Select(x => x.ItemID);

                    var onlineWithStudentTeacherInteractionIDs = context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.Where(x => x.CurriculumDeliveryID == data.ID && x.ModeOfDeliveryID == (int)ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.OnlineWithStudentTeacherInteraction).Select(x=>x.UsageID);
                    var onlineWithoutStudentTeacherInteractionIDs = context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.Where(x => x.CurriculumDeliveryID == data.ID && x.ModeOfDeliveryID == (int)ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.OnlineWithoutStudentTeacherInteraction).Select(x => x.UsageID);
                    var tVBasedLessonsAndProgrammesIDs = context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.Where(x => x.CurriculumDeliveryID == data.ID && x.ModeOfDeliveryID == (int)ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.TVBasedLessonsAndProgrammes).Select(x => x.UsageID);
                    var radioLearningProgrammesIDs = context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.Where(x => x.CurriculumDeliveryID == data.ID && x.ModeOfDeliveryID == (int)ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.RadioLearningProgrammes).Select(x => x.UsageID);
                    var socialMediaForStudentTeacherInteractionIDs = context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.Where(x => x.CurriculumDeliveryID == data.ID && x.ModeOfDeliveryID == (int)ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.SocialMediaForStudentTeacherInteraction).Select(x => x.UsageID);
                    var paperBasedPackagesIDs = context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.Where(x => x.CurriculumDeliveryID == data.ID && x.ModeOfDeliveryID == (int)ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.PaperBasedPackages).Select(x => x.UsageID);
                    var homeVisitsByTeachersIDs = context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.Where(x => x.CurriculumDeliveryID == data.ID && x.ModeOfDeliveryID == (int)ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.HomeVisitsByTeachers).Select(x => x.UsageID);
                    var useOfExternalServiceProvidersIDs = context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.Where(x => x.CurriculumDeliveryID == data.ID && x.ModeOfDeliveryID == (int)ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.UseOfExternalServiceProviders).Select(x => x.UsageID);
                    var otherDistanceLearningIDs = context.CurriculumDelivery_ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.Where(x => x.CurriculumDeliveryID == data.ID && x.ModeOfDeliveryID == (int)ModeOfDeliveryAdoptedByTheSchoolsToDeliverTheCurriculum.OtherDistanceLearning).Select(x => x.UsageID);

                    if (results != null)
                    {
                        results.ReachedGradesDuringLockdonLevel5 = reachedGradesDuringLockdonLevel5.ToList();
                        results.AccomodatedGradesFollowingMinistersFirstSetOfDirection = accomodatedGradesFollowingMinistersFirstSetOfDirection.ToList();
                        results.AccomodatedGradesFollowingMinistersFirstSetOfDirection29June2020 = accomodatedGradesFollowingMinistersFirstSetOfDirection29June2020.ToList();
                        results.AccomodatedGradesFollowingMinistersSetOfDirection07July2020 = accomodatedGradesFollowingMinistersSetOfDirection07July2020.ToList();
                        results.AccomodatedGradesFollowingMinistersSetOfDirection02August2020 = accomodatedGradesFollowingMinistersSetOfDirection02August2020.ToList();
                        results.TeacherDevicesAreReliantOn = teacherDevicesAreReliantOn.ToList();
                        results.HowDidTheSchoolInformParentsAboutThePerformanceOfTheirChildren = howDidTheSchoolInformParentsAboutThePerformanceOfTheirChildren.ToList();
                        results.ApprovedSubjects = approvedSubjects.ToList();
                        results.SeniorPhaseInitiatives = seniorPhaseInitiatives.ToList();
                        results.LaggingBehindSchoolInterventions = laggingBehindSchoolInterventions.ToList();
                        results.MeansToProvideGuidanceToParentsAndLearnersToFacilitateLockdownLearning = meansToProvideGuidanceToParentsAndLearnersToFacilitateLockdownLearning.ToList();
                        results.HowHasTheSchoolAssistedLockdownLearnersWithTheirAssessmentTasks = howHasTheSchoolAssistedLockdownLearnersWithTheirAssessmentTasks.ToList();
                        results.DistrictSupportRecievedForLockdownLearning = districtSupportRecievedForLockdownLearning.ToList();
                        results.SubjectAdvisorsSupportedTheStaff = subjectAdvisorsSupportedTheStaff.ToList();
                        results.InitiativesAvailedByTheSchoolToSupportMatriculantsToCompleteTheGrade12Programme = initiativesAvailedByTheSchoolToSupportMatriculantsToCompleteTheGrade12Programme.ToList();
                        results.InitiativesAvailedByTheGDEToSupportMatriculantsToCompleteTheGrade12Programme = initiativesAvailedByTheGDEToSupportMatriculantsToCompleteTheGrade12Programme.ToList();
                        results.InitiativesAvailedByThePartnersToSupportMatriculantsToCompleteTheGrade12Programme = initiativesAvailedByThePartnersToSupportMatriculantsToCompleteTheGrade12Programme.ToList();

                        results.OnlineWithStudentTeacherInteractionIDs = onlineWithStudentTeacherInteractionIDs.ToList();
                        results.OnlineWithoutStudentTeacherInteractionIDs = onlineWithoutStudentTeacherInteractionIDs.ToList();
                        results.TVBasedLessonsAndProgrammesIDs = tVBasedLessonsAndProgrammesIDs.ToList();
                        results.RadioLearningProgrammesIDs = radioLearningProgrammesIDs.ToList();
                        results.SocialMediaForStudentTeacherInteractionIDs = socialMediaForStudentTeacherInteractionIDs.ToList();
                        results.PaperBasedPackagesIDs = paperBasedPackagesIDs.ToList();
                        results.HomeVisitsByTeachersIDs = homeVisitsByTeachersIDs.ToList();
                        results.UseOfExternalServiceProvidersIDs = useOfExternalServiceProvidersIDs.ToList();
                        results.OtherDistanceLearningIDs = otherDistanceLearningIDs.ToList();
                    }

                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public IEnumerable<EducatorResourceModel> GetEducatorResourcesBySchoolID(int schoolID)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.EducatorResources.Where(x => x.SchoolID == schoolID);
                    var results = data.Map();

                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public IEnumerable<CoveredGradeFundamentalModel> GetCoveredGradeFundamentalsBySchoolID(int schoolID)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.CoveredGradeFundamentals.Where(x => x.SchoolID == schoolID);
                    var results = data.Map();

                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public IEnumerable<Grade12LevelOfCompletionModel> GetGrade12LevelOfCompletionBySchoolID(int schoolID)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.Grade12LevelOfCompletion.Where(x => x.SchoolID == schoolID);
                    var results = data.Map();

                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion  Curriculum Delivery

        #region Enabling Conditions
        public bool SaveEnablingConditionsInformation(EnablingConditionModel enablingConditionsInformation, SchoolBuildingConditionModel buildingConditions, List<LTSMModel> noOfTextbooksList)
        {

            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var enablingConditionsData = context.EnablingConditions.FirstOrDefault(x => x.SchoolID == enablingConditionsInformation.SchoolID);
                    if (enablingConditionsData == null)
                    {
                        enablingConditionsData = new EnablingCondition()
                        {
                            DateLogged = DateTime.Now
                        };

                        context.EnablingConditions.Add(enablingConditionsData);
                    }

                    enablingConditionsData.DoesTheSchoolHaveElectricity = enablingConditionsInformation.DoesTheSchoolHaveElectricity;
                    enablingConditionsData.HasTheSchoolBeenProvidedWithElectricity = enablingConditionsInformation.HasTheSchoolBeenProvidedWithElectricity;
                    enablingConditionsData.DoesTheSchoolHaveRunningWater = enablingConditionsInformation.DoesTheSchoolHaveRunningWater;
                    enablingConditionsData.HasTheSchoolBeenProvidedWithWater = enablingConditionsInformation.HasTheSchoolBeenProvidedWithWater;
                    enablingConditionsData.DoesTheSchoolExperienceWaterPressureIssuesRegularly = enablingConditionsInformation.DoesTheSchoolExperienceWaterPressureIssuesRegularly;
                    enablingConditionsData.DoesTheSchoolHaveAdequateSanitationFacilities = enablingConditionsInformation.DoesTheSchoolHaveAdequateSanitationFacilities;
                    enablingConditionsData.DoesTheSchoolHaveSecureFencing = enablingConditionsInformation.DoesTheSchoolHaveSecureFencing;
                    enablingConditionsData.DidTheSchoolHaveSufficientClassrooms = enablingConditionsInformation.DidTheSchoolHaveSufficientClassrooms;
                    enablingConditionsData.DidTheSchoolRequestAdditionalFurnitureFromTheGDE = enablingConditionsInformation.DidTheSchoolRequestAdditionalFurnitureFromTheGDE;
                    enablingConditionsData.WasTheFurnitureDelivered = enablingConditionsInformation.WasTheFurnitureDelivered;
                    enablingConditionsData.DidTheSchoolRequestAdditionalClassroomsFromTheGDE = enablingConditionsInformation.DidTheSchoolRequestAdditionalClassroomsFromTheGDE;
                    enablingConditionsData.WereTheClassroomsDelivered = enablingConditionsInformation.WereTheClassroomsDelivered;
                    enablingConditionsData.WasTheSchoolAffectedByIncidentsOfVandalism = enablingConditionsInformation.WasTheSchoolAffectedByIncidentsOfVandalism;
                    enablingConditionsData.HowManyOccasionsWasTheSchoolAffectedByIncidentsOfVandalism = enablingConditionsInformation.HowManyOccasionsWasTheSchoolAffectedByIncidentsOfVandalism;
                    enablingConditionsData.DoesTheSchoolHaveLearnersBenefittingFromTheGDELearnerTransportProgramme = enablingConditionsInformation.DoesTheSchoolHaveLearnersBenefittingFromTheGDELearnerTransportProgramme;
                    enablingConditionsData.NoOfLearnersBenefittingFromTheGDELearnerTransportProgramme = enablingConditionsInformation.NoOfLearnersBenefittingFromTheGDELearnerTransportProgramme;
                    enablingConditionsData.WereThereAnyChallengesExperiencedInTermsOfTheLearnerTransportProgrammeDuringTheLockdown = enablingConditionsInformation.WereThereAnyChallengesExperiencedInTermsOfTheLearnerTransportProgrammeDuringTheLockdown;
                    enablingConditionsData.AreAllTheLearnersBeingTransportedAsExpected = enablingConditionsInformation.AreAllTheLearnersBeingTransportedAsExpected;
                    enablingConditionsData.AreAllTheLearnersArrivingOnTime = enablingConditionsInformation.AreAllTheLearnersArrivingOnTime;
                    enablingConditionsData.AreTheLearnersUsingHandSanitisersBeforeEnteringTheBuses = enablingConditionsInformation.AreTheLearnersUsingHandSanitisersBeforeEnteringTheBuses;
                    enablingConditionsData.AreTheLearnersWearingMasksWhileOnTheBuses = enablingConditionsInformation.AreTheLearnersWearingMasksWhileOnTheBuses;
                    enablingConditionsData.IsThePhysicalDistancingRequirementsBeingObservedOnTheBuses = enablingConditionsInformation.IsThePhysicalDistancingRequirementsBeingObservedOnTheBuses;
                    enablingConditionsData.WereTheCovid19BrigadesAvailableToAssistOnTheLearnerTransportRoutes = enablingConditionsInformation.WereTheCovid19BrigadesAvailableToAssistOnTheLearnerTransportRoutes;
                    enablingConditionsData.DoesTheSchoolHaveLearnersBenefittingFromNationalSchoolNutritionProgramme = enablingConditionsInformation.DoesTheSchoolHaveLearnersBenefittingFromNationalSchoolNutritionProgramme;
                    enablingConditionsData.NoOfLearnersBenefittingFromNationalSchoolNutritionProgramme = enablingConditionsInformation.NoOfLearnersBenefittingFromNationalSchoolNutritionProgramme;
                    enablingConditionsData.IsPhysicalDistancingBeingAppliedInTheFoodPreparationArea = enablingConditionsInformation.IsPhysicalDistancingBeingAppliedInTheFoodPreparationArea;
                    enablingConditionsData.IsPhysicalDistancingBeingAppliedWhereLearnersAreBeingFed = enablingConditionsInformation.IsPhysicalDistancingBeingAppliedWhereLearnersAreBeingFed;
                    enablingConditionsData.IsTheFoodPreparationAreaBeingCleanedRegularly = enablingConditionsInformation.IsTheFoodPreparationAreaBeingCleanedRegularly;
                    enablingConditionsData.AreFeedingTimesAreBeingStaggered = enablingConditionsInformation.AreFeedingTimesAreBeingStaggered;
                    enablingConditionsData.HaveTheFoodHandlersBeenTrainedOnCovid19Protocols = enablingConditionsInformation.HaveTheFoodHandlersBeenTrainedOnCovid19Protocols;
                    enablingConditionsData.DoTheFoodHandlersHaveTheNecessaryPPEs = enablingConditionsInformation.DoTheFoodHandlersHaveTheNecessaryPPEs;
                    enablingConditionsData.IsThereProperCleaningOfTheUtensilsTakingPlace = enablingConditionsInformation.IsThereProperCleaningOfTheUtensilsTakingPlace;
                    enablingConditionsData.IsTheSchoolUsingDisposableUtensils = enablingConditionsInformation.IsTheSchoolUsingDisposableUtensils;
                    enablingConditionsData.AreTheSchoolLearnersSharingUtensils = enablingConditionsInformation.AreTheSchoolLearnersSharingUtensils;
                    enablingConditionsData.WereThereAnyChallengesExperiencedInTermsOfTheSchoolNutritionProgrammeDuringLockdown = enablingConditionsInformation.WereThereAnyChallengesExperiencedInTermsOfTheSchoolNutritionProgrammeDuringLockdown;
                    enablingConditionsData.HowAreThoseLearnersThatAreOnRotatioBeingFed = enablingConditionsInformation.HowAreThoseLearnersThatAreOnRotatioBeingFed;
                    enablingConditionsData.HowAreLearnersLearningFromHomeBeingFed = enablingConditionsInformation.HowAreLearnersLearningFromHomeBeingFed;
                    enablingConditionsData.WereLearnersAllowedToTakeHomeTheirTextbooksDuringLockdown = enablingConditionsInformation.WereLearnersAllowedToTakeHomeTheirTextbooksDuringLockdown;
                    enablingConditionsData.DoesTheSchoolHaveSufficientTextbooksForAllLearners = enablingConditionsInformation.DoesTheSchoolHaveSufficientTextbooksForAllLearners;
                    enablingConditionsData.HasTheSchoolBeenAffectedByDisruptions = enablingConditionsInformation.HasTheSchoolBeenAffectedByDisruptions;
                    enablingConditionsData.HasTheSchoolBeenForcedToClose = enablingConditionsInformation.HasTheSchoolBeenForcedToClose;
                    enablingConditionsData.HowManyOccassionsWasTheSchoolForcedToClose = enablingConditionsInformation.HowManyOccassionsWasTheSchoolForcedToClose;
                    enablingConditionsData.TotalNoOfSchoolDaysLostDueToClosure = enablingConditionsInformation.TotalNoOfSchoolDaysLostDueToClosure;
                    enablingConditionsData.SchoolID = enablingConditionsInformation.SchoolID;
                    enablingConditionsData.CausesOfDisruptionsOther = enablingConditionsInformation.CausesOfDisruptionsOther;

                    context.SaveChanges();

                    var schoolRequirementsToComplyWithPhysicalDistanceLinks = context.EnablingConditions_SchoolRequirementsToComplyWithPhysicalDistance.Where(x => x.EnablingConditionsID == enablingConditionsData.ID);
                    context.EnablingConditions_SchoolRequirementsToComplyWithPhysicalDistance.RemoveRange(schoolRequirementsToComplyWithPhysicalDistanceLinks);
                    foreach (var itemID in enablingConditionsInformation.SchoolRequirementsToComplyWithPhysicalDistance)
                    {
                        context.EnablingConditions_SchoolRequirementsToComplyWithPhysicalDistance.Add(new EnablingConditions_SchoolRequirementsToComplyWithPhysicalDistance() { ID = Guid.NewGuid(), EnablingConditionsID = enablingConditionsData.ID, ItemID = itemID });
                    }

                    var howDidTheSchoolConformToThePhysicalDistancingRequirementsFurnitureLinks = context.EnablingConditions_HowDidTheSchoolConformToThePhysicalDistancingRequirementsFurniture.Where(x => x.EnablingConditionsID == enablingConditionsData.ID);
                    context.EnablingConditions_HowDidTheSchoolConformToThePhysicalDistancingRequirementsFurniture.RemoveRange(howDidTheSchoolConformToThePhysicalDistancingRequirementsFurnitureLinks);
                    foreach (var itemID in enablingConditionsInformation.HowDidTheSchoolConformToThePhysicalDistancingRequirementsFurniture)
                    {
                        context.EnablingConditions_HowDidTheSchoolConformToThePhysicalDistancingRequirementsFurniture.Add(new EnablingConditions_HowDidTheSchoolConformToThePhysicalDistancingRequirementsFurniture() { ID = Guid.NewGuid(), EnablingConditionsID = enablingConditionsData.ID, ItemID = itemID });
                    }

                    var howDidTheSchoolConformToThePhysicalDistancingRequirementsClassroomsLinks = context.EnablingConditions_HowDidTheSchoolConformToThePhysicalDistancingRequirementsClassrooms.Where(x => x.EnablingConditionsID == enablingConditionsData.ID);
                    context.EnablingConditions_HowDidTheSchoolConformToThePhysicalDistancingRequirementsClassrooms.RemoveRange(howDidTheSchoolConformToThePhysicalDistancingRequirementsClassroomsLinks);
                    foreach (var itemID in enablingConditionsInformation.HowDidTheSchoolConformToThePhysicalDistancingRequirementsClassrooms)
                    {
                        context.EnablingConditions_HowDidTheSchoolConformToThePhysicalDistancingRequirementsClassrooms.Add(new EnablingConditions_HowDidTheSchoolConformToThePhysicalDistancingRequirementsClassrooms() { ID = Guid.NewGuid(), EnablingConditionsID = enablingConditionsData.ID, ItemID = itemID });
                    }

                    var schoolResponsesToLearnerTransportProgrammeChallengesLinks = context.EnablingConditions_SchoolResponsesToLearnerTransportProgrammeChallenges.Where(x => x.EnablingConditionsID == enablingConditionsData.ID);
                    context.EnablingConditions_SchoolResponsesToLearnerTransportProgrammeChallenges.RemoveRange(schoolResponsesToLearnerTransportProgrammeChallengesLinks);
                    foreach (var itemID in enablingConditionsInformation.SchoolResponsesToLearnerTransportProgrammeChallenges)
                    {
                        context.EnablingConditions_SchoolResponsesToLearnerTransportProgrammeChallenges.Add(new EnablingConditions_SchoolResponsesToLearnerTransportProgrammeChallenges() { ID = Guid.NewGuid(), EnablingConditionsID = enablingConditionsData.ID, ItemID = itemID });
                    }

                    var schoolResponsesToNutritionProgrammeChallengesLinks = context.EnablingConditions_SchoolResponsesToNutritionProgrammeChallenges.Where(x => x.EnablingConditionsID == enablingConditionsData.ID);
                    context.EnablingConditions_SchoolResponsesToNutritionProgrammeChallenges.RemoveRange(schoolResponsesToNutritionProgrammeChallengesLinks);
                    foreach (var itemID in enablingConditionsInformation.SchoolResponsesToNutritionProgrammeChallenges)
                    {
                        context.EnablingConditions_SchoolResponsesToNutritionProgrammeChallenges.Add(new EnablingConditions_SchoolResponsesToNutritionProgrammeChallenges() { ID = Guid.NewGuid(), EnablingConditionsID = enablingConditionsData.ID, ItemID = itemID });
                    }

                    var causesOfDisruptionsLinks = context.EnablingConditions_CausesOfDisruptions.Where(x => x.EnablingConditionsID == enablingConditionsData.ID);
                    context.EnablingConditions_CausesOfDisruptions.RemoveRange(causesOfDisruptionsLinks);
                    foreach (var itemID in enablingConditionsInformation.CausesOfDisruptions)
                    {
                        context.EnablingConditions_CausesOfDisruptions.Add(new EnablingConditions_CausesOfDisruptions() { ID = Guid.NewGuid(), EnablingConditionsID = enablingConditionsData.ID, ItemID = itemID });
                    }

                    var reasonsForSchoolClosureLinks = context.EnablingConditions_ReasonsForSchoolClosure.Where(x => x.EnablingConditionsID == enablingConditionsData.ID);
                    context.EnablingConditions_ReasonsForSchoolClosure.RemoveRange(reasonsForSchoolClosureLinks);
                    foreach (var itemID in enablingConditionsInformation.ReasonsForSchoolClosure)
                    {
                        context.EnablingConditions_ReasonsForSchoolClosure.Add(new EnablingConditions_ReasonsForSchoolClosure() { ID = Guid.NewGuid(), EnablingConditionsID = enablingConditionsData.ID, ItemID = itemID });
                    }

                    var buildingConditionsData = context.SchoolBuildingConditions.FirstOrDefault(x => x.SchoolID == buildingConditions.SchoolID);
                    if (buildingConditionsData == null)
                    {
                        buildingConditionsData = new SchoolBuildingCondition()
                        {
                            DateLogged = DateTime.Now
                        };

                        context.SchoolBuildingConditions.Add(buildingConditionsData);
                    }

                    buildingConditionsData.RoofStatusID = buildingConditions.RoofStatusID;
                    buildingConditionsData.WindowsStatusID = buildingConditions.WindowsStatusID;
                    buildingConditionsData.DoorsStatusID = buildingConditions.DoorsStatusID;
                    buildingConditionsData.WallsStatusID = buildingConditions.WallsStatusID;
                    buildingConditionsData.FloorsStatusID = buildingConditions.FloorsStatusID;
                    buildingConditionsData.SchoolID = buildingConditions.SchoolID;

                    foreach (var item in noOfTextbooksList)
                    {
                        var data = context.LTSMs.FirstOrDefault(x => x.SchoolID == item.SchoolID && x.Category == item.Category);
                        if (data == null)
                        {
                            data = new LTSM()
                            {
                                DateLogged = DateTime.Now
                            };

                            context.LTSMs.Add(data);
                        }

                        data.Grade1 = item.Grade1;
                        data.Grade2 = item.Grade2;
                        data.Grade3 = item.Grade3;
                        data.Grade4 = item.Grade4;
                        data.Grade5 = item.Grade5;
                        data.Grade6 = item.Grade6;
                        data.Grade7 = item.Grade7;
                        data.Grade8 = item.Grade8;
                        data.Grade9 = item.Grade9;
                        data.Grade10 = item.Grade10;
                        data.Grade11 = item.Grade11;
                        data.Grade12 = item.Grade12;
                        data.Category = item.Category;
                        data.SchoolID = item.SchoolID;
                    }
                   
                    context.SaveChanges();

                    return true;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public EnablingConditionModel GetEnablingConditionsBySchoolID(int schoolID)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.EnablingConditions.FirstOrDefault(x => x.SchoolID == schoolID);
                    var results = data.Map();

                    var schoolRequirementsToComplyWithPhysicalDistance = context.EnablingConditions_SchoolRequirementsToComplyWithPhysicalDistance.Where(x => x.EnablingConditionsID == data.ID).Select(x => x.ItemID);
                    var howDidTheSchoolConformToThePhysicalDistancingRequirementsFurniture = context.EnablingConditions_HowDidTheSchoolConformToThePhysicalDistancingRequirementsFurniture.Where(x => x.EnablingConditionsID == data.ID).Select(x => x.ItemID);
                    var howDidTheSchoolConformToThePhysicalDistancingRequirementsClassrooms = context.EnablingConditions_HowDidTheSchoolConformToThePhysicalDistancingRequirementsClassrooms.Where(x => x.EnablingConditionsID == data.ID).Select(x => x.ItemID);
                    var schoolResponsesToLearnerTransportProgrammeChallenges = context.EnablingConditions_SchoolResponsesToLearnerTransportProgrammeChallenges.Where(x => x.EnablingConditionsID == data.ID).Select(x => x.ItemID);
                    var schoolResponsesToNutritionProgrammeChallenges = context.EnablingConditions_SchoolResponsesToNutritionProgrammeChallenges.Where(x => x.EnablingConditionsID == data.ID).Select(x => x.ItemID);
                    var causesOfDisruptions = context.EnablingConditions_CausesOfDisruptions.Where(x => x.EnablingConditionsID == data.ID).Select(x => x.ItemID);
                    var reasonsForSchoolClosure = context.EnablingConditions_ReasonsForSchoolClosure.Where(x => x.EnablingConditionsID == data.ID).Select(x => x.ItemID);

                    if (results != null)
                    {
                        results.SchoolRequirementsToComplyWithPhysicalDistance = schoolRequirementsToComplyWithPhysicalDistance.ToList();
                        results.HowDidTheSchoolConformToThePhysicalDistancingRequirementsFurniture = howDidTheSchoolConformToThePhysicalDistancingRequirementsFurniture.ToList();
                        results.HowDidTheSchoolConformToThePhysicalDistancingRequirementsClassrooms = howDidTheSchoolConformToThePhysicalDistancingRequirementsClassrooms.ToList();
                        results.SchoolResponsesToLearnerTransportProgrammeChallenges = schoolResponsesToLearnerTransportProgrammeChallenges.ToList();
                        results.SchoolResponsesToNutritionProgrammeChallenges = schoolResponsesToNutritionProgrammeChallenges.ToList();
                        results.CausesOfDisruptions = causesOfDisruptions.ToList();
                        results.ReasonsForSchoolClosure = reasonsForSchoolClosure.ToList();
                    }

                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public SchoolBuildingConditionModel GetSchoolBuildingConditionBySchoolID(int schoolID)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.SchoolBuildingConditions.FirstOrDefault(x => x.SchoolID == schoolID);
                    var results = data.Map();

                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public IEnumerable<LTSMModel> GetLTSMBySchoolID(int schoolID)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.LTSMs.Where(x => x.SchoolID == schoolID);
                    var results = data.Map();

                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public SchoolModel SubmitSurvey(int schoolID)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.Schools.FirstOrDefault(x => x.ID == schoolID);

                    if (data != null)
                    {
                        data.IsSurveySubmitted = true;
                        data.SurveySubmittedDate = DateTime.Now;
                    }

                    context.SaveChanges();

                    var results = data.Map();

                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion Enabling Conditions
    }
}
