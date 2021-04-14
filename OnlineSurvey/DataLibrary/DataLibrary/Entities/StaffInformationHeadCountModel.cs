using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.Entities
{
    public class StaffInformationHeadCountModel
    {
        public int ID { get; set; }
        public int TenthDayStaffCountsStatePaid { get; set; }
        public int TenthDayStaffCountsSGBAppointed { get; set; }
        public int NoOfStaffMembersReturnedStatePaid { get; set; }
        public int NoOfStaffMembersReturnedSGBAppointed { get; set; }
        public int NoOfStaffApprovedForConcessionsStatePaid { get; set; }
        public int NoOfStaffApprovedForConcessionsSGBAppointed { get; set; }
        public int NoOfStaffAppliedAndAwaitingApprovalForConcessionsStatePaid { get; set; }
        public int NoOfStaffAppliedAndAwaitingApprovalForConcessionsSGBAppointed { get; set; }
        public int NoOfStaffAppliedAndNotApprovedForConcessionsStatePaid { get; set; }
        public int NoOfStaffAppliedAndNotApprovedForConcessionsSGBAppointed { get; set; }
        public int NoOfStaffNotReturnedToWorkForAnyKnownReasonsStatePaid { get; set; }
        public int NoOfStaffNotReturnedToWorkForAnyKnownReasonsSGBAppointed { get; set; }
        public int NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementStatePaid { get; set; }
        public int NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementSGBAppointed { get; set; }
        public string Category { get; set; }
        public int SchoolID { get; set; }
        public System.DateTime DateLogged { get; set; }
    }
}
