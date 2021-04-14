using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;
using System.Reflection;

namespace BusinessLogicLayer
{
    public class Address
    {
        public static int errorNumber = 0;
        public static string errorMessage = string.Empty;

        public int Id { get; set; }
        public int TraineeId { get; set; }
        public string StreetName { get; set; }
        public string SuburbName { get; set; }
        public int PostalCode { get; set; }
        public string PostalAddress { get; set; }
        public string PostalAddressNumber { get; set; }        
        public string PostalAddressSuburbName { get; set; }
        public int PostalAddressCode { get; set; }
        public string HouseNumber { get; set; }
        public string BuildingName { get; set; }

        public static Address ByTraineeId(string[] args)
        {
            Address address = new Address();
            List<Address> returnList = Globals.ExecuteReaderList<Address>(DataAccess.AddressByTraineeId, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
            if (returnList != null)
            {
                foreach (Address item in returnList)
                {
                    //if (Id != 0)
                    //{
                        address.Id = item.Id;
                        address.TraineeId = item.TraineeId;
                        address.StreetName = item.StreetName;
                        address.SuburbName = item.SuburbName;
                        address.PostalCode = item.PostalCode;
                        address.PostalAddress = item.PostalAddress;
                        address.PostalAddressNumber = item.PostalAddressNumber;
                        address.PostalAddressSuburbName = item.PostalAddressSuburbName;
                        address.PostalAddressCode = item.PostalAddressCode;
                        address.HouseNumber = item.HouseNumber;
                        address.BuildingName = item.BuildingName;
                   // }
                }
            }
            return address;
        }
        public static bool Insert(string[] Args)
        {
            if(Globals.ExecuteScalar(DataAccess.AddressInsert,Args,ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod) > 0)
            {
                return true;
            }

            return false;
        }

        public static bool Update(string[] Args)
        {
            if (Globals.ExecuteScalar(DataAccess.AddressUpdate, Args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod) > 0)
            {
                return true;
            }
            return false;
        }
    }
}
