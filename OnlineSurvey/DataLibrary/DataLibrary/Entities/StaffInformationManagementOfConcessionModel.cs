using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.Entities
{
    public class StaffInformationManagementOfConcessionModel
    {
        public int ID { get; set; }
        public int NoOfStaffApprovedForComorbiditiesStatePaid { get; set; }
        public int NoOfStaffApprovedForComorbiditiesSGBAppointed { get; set; }
        public int NoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessStatePaid { get; set; }
        public int NoOfStaffApprovedForConcessionsBasedOnAgeAndIllnessSGBAppointed { get; set; }
        public int NoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsStatePaid { get; set; }
        public int NoOfStaffApprovedForConcessionsBasedOnUnderlyingConditionsSGBAppointed { get; set; }
        public int NoOfSubstitutesAppliedForStatePaid { get; set; }
        public int NoOfSubstitutesReceivedStatePaid { get; set; }
        public string Category { get; set; }
        public int SchoolID { get; set; }
        public System.DateTime DateLogged { get; set; }
    }
}
