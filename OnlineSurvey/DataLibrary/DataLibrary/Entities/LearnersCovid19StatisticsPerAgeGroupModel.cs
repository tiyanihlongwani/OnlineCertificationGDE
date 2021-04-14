using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.Entities
{
    public class LearnersCovid19StatisticsPerAgeGroupModel
    {
        public int ID { get; set; }
        public int NoOfConfirmedInfectionsMale { get; set; }
        public int NoOfConfirmedInfectionsFemale { get; set; }
        public int NoOfConfirmedRecoveriesMale { get; set; }
        public int NoOfConfirmedRecoveriesFemale { get; set; }
        public int NoOfConfirmedDeathsMale { get; set; }
        public int NoOfConfirmedDeathsFemale { get; set; }
        public string AgeGroup { get; set; }
        public int SchoolID { get; set; }
        public System.DateTime DateLogged { get; set; }
    }
}
