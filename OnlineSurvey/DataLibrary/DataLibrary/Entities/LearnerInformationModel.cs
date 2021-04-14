using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.Entities
{
    public class LearnerInformationModel
    {
        public int ID { get; set; }
        public int NoOfLearnersApprovedForLockdownLearningApprovedByGDE { get; set; }
        public int NoOfLearnersInvolvedInLockdownLearningByArrangementWithTheSchool { get; set; }
        public int NoOfLearnersApprovedForLockdownLearningDueToComorbidities { get; set; }
        public int NoOfLearnersApprovedForLockdownLearningDueToAnxietyOrFear { get; set; }
        public int NoOfLearnersApprovedForLockdownLearningDueToOtherHealthRelatedReasons { get; set; }
        public int PotentialDropOutYoungerThan7 { get; set; }
        public int PotentialDropOutBetween7And15 { get; set; }
        public int PotentialDropOutOlderThan15 { get; set; }
        public bool? ReviewTheDeregistrationOfLearnersByGDE { get; set; }
        public int NoOfPotentialDropOutsContactedBySchool { get; set; }
        public int NoOfLearnersWhoseParentsWereContacted { get; set; }
        public int NoOfLearnersUnableToBeContacted { get; set; }
        public bool DidTheSchoolEscalateToTheDistrict { get; set; }
        public bool HasTherBeenFollowUpByDistrict { get; set; }
        public bool HasThisProvenSuccessful { get; set; }
        public System.DateTime DateLogged { get; set; }
        public int SchoolID { get; set; }
    }
}
