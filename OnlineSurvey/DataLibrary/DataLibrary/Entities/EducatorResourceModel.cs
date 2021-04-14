using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.Entities
{
    public class EducatorResourceModel
    {
        public int ID { get; set; }
        public string Type { get; set; }
        public int ProvidedByGDE { get; set; }
        public int ProvidedBySchool { get; set; }
        public int PersonallyOwned { get; set; }
        public int SchoolID { get; set; }
        public System.DateTime DateLogged { get; set; }
    }
}
