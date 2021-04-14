using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.Entities
{
    public class SchoolDisifectorModel
    {
        public System.Guid ID { get; set; }
        public int DisinfectorID { get; set; }
        public int ClassInformationID { get; set; }
        public System.DateTime DateLogged { get; set; }
    }
}
