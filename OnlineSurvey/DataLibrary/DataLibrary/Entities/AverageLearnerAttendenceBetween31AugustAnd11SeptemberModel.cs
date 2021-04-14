using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.Entities
{
    public class AverageLearnerAttendenceBetween31AugustAnd11SeptemberModel
    {
        public int ID { get; set; }
        public int NoOfLearnersExpected { get; set; }
        public int NoOfLearnersReturned { get; set; }
        public double AverageAttendance { get; set; }
        public string Grade { get; set; }
        public int SchoolID { get; set; }
        public System.DateTime DateLogged { get; set; }
    }
}
