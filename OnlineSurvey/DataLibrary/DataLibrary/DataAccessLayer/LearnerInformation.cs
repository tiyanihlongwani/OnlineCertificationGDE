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
    
    public partial class LearnerInformation
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
        public Nullable<bool> ReviewTheDeregistrationOfLearnersByGDE { get; set; }
        public int NoOfPotentialDropOutsContactedBySchool { get; set; }
        public int NoOfLearnersWhoseParentsWereContacted { get; set; }
        public int NoOfLearnersUnableToBeContacted { get; set; }
        public bool DidTheSchoolEscalateToTheDistrict { get; set; }
        public bool HasTherBeenFollowUpByDistrict { get; set; }
        public bool HasThisProvenSuccessful { get; set; }
        public System.DateTime DateLogged { get; set; }
        public int SchoolID { get; set; }
    
        public virtual School School { get; set; }
    }
}
