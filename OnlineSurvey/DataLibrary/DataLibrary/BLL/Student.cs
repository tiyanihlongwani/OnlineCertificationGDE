using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogicLayer
{
   public class Student
    {
        public static string errorMessage = string.Empty;
        public static int errorNumber = 0;

        public int Id { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public int Gender { get; set; }
        public int Province { get; set; }
        public int Status { get; set; }
        public int Country { get; set; }
        public string CellPhone { get; set; }

        public static List<Student> upStudentById(string[] args)
        {
            List<Student> returnList = Globals.ExecuteReaderList<Student>(DataAccessLayer.DataAccess.StudentByID, args,ref errorNumber,ref errorMessage, MethodBase.GetCurrentMethod);
            return returnList;
        }
    }
}
