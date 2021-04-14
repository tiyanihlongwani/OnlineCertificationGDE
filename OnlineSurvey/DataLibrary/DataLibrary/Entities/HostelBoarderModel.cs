using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.Entities
{
    public class HostelBoarderModel
    {
        public int ID { get; set; }
        public int NoOfLearnersAdmittedToTheHostelInJanuary2020Male { get; set; }
        public int NoOfLearnersAdmittedToTheHostelInJanuary2020Female { get; set; }
        public bool DidTheSchoolApplyTheRelevantPhysicalDistancingMealTime { get; set; }
        public bool DidTheSchoolApplyTheRelevantPhysicalDistancingStudyTime { get; set; }
        public bool DidTheSchoolApplyTheRelevantPhysicalDistancingLeisureTime { get; set; }
        public bool DidTheSchoolIncreaseTheFrequencyOfCleaningAtTheHostel { get; set; }
        public bool WereTheLearnersProvidedWithAdequatePPEs { get; set; }
        public bool WereTheLearnersProvidedWithAdequateHandSanitiser { get; set; }
        public int SchoolID { get; set; }
        public System.DateTime DateLogged { get; set; }
    }
}
