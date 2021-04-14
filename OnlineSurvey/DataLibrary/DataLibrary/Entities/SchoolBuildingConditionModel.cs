using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.Entities
{
    public class SchoolBuildingConditionModel
    {
        public int ID { get; set; }
        public int RoofStatusID { get; set; }
        public int WindowsStatusID { get; set; }
        public int DoorsStatusID { get; set; }
        public int WallsStatusID { get; set; }
        public int FloorsStatusID { get; set; }
        public int SchoolID { get; set; }
        public System.DateTime DateLogged { get; set; }
    }
}
