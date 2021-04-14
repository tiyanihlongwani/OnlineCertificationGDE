using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogicLayer
{
   public class Province
    {
        private static int errorNumber = 0;
        private static string errorMessage = string.Empty;

        public string Name { get; set; }

        public static int ProvinceAdd(string[] args)
        {
            int returnValue = Globals.ExecuteScalar(DataAccessLayer.DataAccess.ProvinceAdd,args,ref errorNumber,ref errorMessage,MethodBase.GetCurrentMethod);

            return returnValue;
        }
    }
}
