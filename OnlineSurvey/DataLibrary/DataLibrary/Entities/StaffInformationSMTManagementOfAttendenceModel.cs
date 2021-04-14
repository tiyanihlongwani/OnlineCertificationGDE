using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.Entities
{
    public class StaffInformationSMTManagementOfAttendenceModel
    {

        public int ID { get; set; }
        public bool HaveThereBeenStaffWhoHaveNotNeturnedToSchoolWithoutApproval { get; set; }
        public int NoOfStatePaidEducators { get; set; }
        public int NoOfPSStaff { get; set; }
        public bool HasTheGDEInstitutedDisciplinaryProcesses { get; set; }
        public int HowManyCasesInvolvedStatePaidEducators { get; set; }
        public int HowManyCasesInvolvedPSStaff { get; set; }
        public int SchoolID { get; set; }
        public System.DateTime DateLogged { get; set; }
    }
}
