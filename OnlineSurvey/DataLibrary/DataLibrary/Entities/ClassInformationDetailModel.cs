using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.Entities
{
    public class ClassInformationDetailModel
    {
        public int ID { get; set; }
        public string Category { get; set; }
        public int Grade1 { get; set; }
        public int Grade2 { get; set; }
        public int Grade3 { get; set; }
        public int Grade4 { get; set; }
        public int Grade5 { get; set; }
        public int Grade6 { get; set; }
        public int Grade7 { get; set; }
        public int Grade8 { get; set; }
        public int Grade9 { get; set; }
        public int Grade10 { get; set; }
        public int Grade11 { get; set; }
        public int Grade12 { get; set; }
        public int? PreGradeR { get; set; }
        public int? GradeR { get; set; }
        public int? Spec { get; set; }
        public int? Oth { get; set; }
        public int? Total { get; set; }
        public int SchoolID { get; set; }
    }
}
