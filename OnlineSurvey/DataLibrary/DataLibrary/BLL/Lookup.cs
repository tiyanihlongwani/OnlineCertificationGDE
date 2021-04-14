using System.Collections.Generic;
using DataAccessLayer;
using System.Reflection;

namespace BusinessLogicLayer
{
    public class Lookup
    {
        public static int errorNumber = 0;
        public static string errorMessage = string.Empty;

        public int Id { get; set; }
        public string Name { get; set; }

        public static List<Lookup> LookupByTable(string table)
        {
            string[] args = {table };
            List<Lookup> returnList = Globals.ExecuteReaderList<Lookup>(DataAccess.LookupByTable, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);

            Lookup province = new Lookup();
            province.Id = 0;
            province.Name = "Select";
            returnList.Insert(0, province);
            province = null;
            return returnList;
        }

        public static List<Lookup> up_LookupByTableName(string table, string Id)
        {
            string[] args = {table,Id };
            List<Lookup> returnList = Globals.ExecuteReaderList<Lookup>(DataAccess.LookupByTableAndId, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);

            Lookup province = new Lookup();
            province.Id = 0;
            province.Name = "Select";
            returnList.Insert(0, province);
            province = null;
            return returnList;
        }
    }
}
