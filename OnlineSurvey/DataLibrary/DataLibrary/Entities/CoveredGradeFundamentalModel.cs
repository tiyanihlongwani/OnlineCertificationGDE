using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.Entities
{
    public class CoveredGradeFundamentalModel
    {
        public int ID { get; set; }
        public string Grade { get; set; }
        public int StatusID { get; set; }
        public int SchoolID { get; set; }
        public System.DateTime DateLogged { get; set; }
    }
}
