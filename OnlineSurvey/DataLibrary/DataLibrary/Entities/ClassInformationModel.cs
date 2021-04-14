using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataLibrary.DataAccessLayer;
using DataLibrary.DataAccessLayer.Repositories;

namespace DataLibrary.Entities
{
    public class ClassInformationModel
    {
        public int ID { get; set; }
        public bool DoesTheSchoolPlatoon { get; set; }
        public bool DoesTheSchoolHaveDoubleShifts { get; set; }
        public bool DoesTheSchoolHaveMultiGradeclasses { get; set; }
        public int NoOfLearnersAccommodatedForDailyRotation { get; set; }
        public int NoOfLearnersAccommodatedForWeeklyRotation { get; set; }
        public int NoOfLearnersAccommodatedForHybrid { get; set; }
        public int LearnerCapacityOfSchoolNormsAndStandardForSchoolInfrastructure { get; set; }
        public int WasTheSchoolAbleToAccommodatePhysicalDistancingID { get; set; }
        public bool HasTheSchoolAdjustedTheSchoolDayToCoverTheRegulatedHoursForCurriculumDelivery { get; set; }
        public double TotalTeachingTimeOverTheCycle { get; set; }
        public bool WereAdditionalMobileClassroomsRequestedByTheSchool { get; set; }
        public int NoOfMobileClassroomsRequestedByTheSchool { get; set; }
        public int NoOfAdditionalMobileClassroomsDelivered { get; set; }
        public int NoOfClassroomsNotUsedDueToPoorCondition { get; set; }
        public bool WasTheSchoolClosedDueToCovid19 { get; set; }
        public int NoOfOccasionsTheSchoolClosedDueToCovid19 { get; set; }
        public int LongestDurationTheSchoolClosedDueToCovid19 { get; set; }
        public bool WasTheSchoolDisinfected { get; set; }
        public int SchoolID { get; set; }
        public System.DateTime DateLogged { get; set; }
        public int? IntroducedRotationID { get; set; }
        public int? TimetableCycleID { get; set; }
        public int? SchoolRotationApproachID { get; set; }
       
        public IEnumerable<ClassInformationDetailModel> ClassInformationDetails { get; set; }
        public List<int> CombinedGradesForMultiGradeClasses { get; set; }
        public List<int> GradesThatDidNotRotate { get; set; }
        public List<int> SchoolDisinfectors { get; set; }
    }
}
