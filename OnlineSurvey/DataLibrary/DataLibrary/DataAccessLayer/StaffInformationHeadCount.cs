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
    
    public partial class StaffInformationHeadCount
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
        public int NoOfStaffNotReturnedToWorkForAnyKnownReasonsStatePaid { get; set; }
        public int NoOfStaffNotReturnedToWorkForAnyKnownReasonsSGBAppointed { get; set; }
        public int NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementStatePaid { get; set; }
        public int NoOfStaffThatHaveNotReturnedAsAResulOfResignationOrRetirementSGBAppointed { get; set; }
        public string Category { get; set; }
        public int SchoolID { get; set; }
        public System.DateTime DateLogged { get; set; }
        public int NoOfStaffAppliedAndNotApprovedForConcessionsStatePaid { get; set; }
        public int NoOfStaffAppliedAndNotApprovedForConcessionsSGBAppointed { get; set; }
    
        public virtual School School { get; set; }
    }
}