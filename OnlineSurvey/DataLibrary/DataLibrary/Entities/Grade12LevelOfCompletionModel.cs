using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.Entities
{
    public class Grade12LevelOfCompletionModel
    {
        public int ID { get; set; }
        public int StatusID { get; set; }
        public string Subject { get; set; }
        public int SchoolID { get; set; }
        public System.DateTime DateLogged { get; set; }
    }
}
