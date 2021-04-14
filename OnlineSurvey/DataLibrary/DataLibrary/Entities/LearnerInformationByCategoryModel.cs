using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.Entities
{
    public class LearnerInformationByCategoryModel
    {
        public int ID { get; set; }
        public int HeadcountEnrolment { get; set; }
        public int CurrentEnrolment { get; set; }
        public int NoOfLearnersAttendingClassesAtSchoolCurrently { get; set; }
        public int NoOfLearnersStudyingFromHomeCurrently { get; set; }
        public int NoOfLearnersDeregisteredFromTheSchoolAndApprovedForHomeEducation { get; set; }
        public int NoOfLearnersThatHavePotentiallyDroppedOutOfSchool { get; set; }
        public int NoOfLearnersTransferredIntoTheSchool { get; set; }
        public int NoOfLearnersTransferredOutToOtherSchools { get; set; }
        public string Grade { get; set; }
        public int SchoolID { get; set; }
    }
}
