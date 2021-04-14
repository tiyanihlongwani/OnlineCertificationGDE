using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogicLayer
{
    
    public abstract class Person
    {
        public static string errorMessage = string.Empty;
        public static int errorNumber = 0;

        public int Id { get; set; }
        public string IdNumber { get; set; }
        public int PersalNumber { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public string Initials { get; set; }
        public string Gender { get; set; }       
        public string EmailAddress { get; set; }
        public string CellPhoneNumber { get; set; }
        public string TelephoneNumber { get; set; }
        public int Title { get; set; }

        public abstract bool Insert(string[] args);
        public abstract bool Update(string[] args);        
        public abstract List<T> ByNothing<T>();
        public abstract List<T> BySchoolId<T>(string[] args);
        public abstract List<Y> ByDistrictId<Y>(string[] args);
        
    }
}
