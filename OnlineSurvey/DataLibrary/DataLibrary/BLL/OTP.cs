using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;
using System.Reflection;

namespace BusinessLogicLayer
{
    public class OTP
    {
        public static int ErrorNumber = 0;
        public static string ErrorMessage = string.Empty;
        
        public int Id { get; set; }
        public DateTime TimeStamp { get; set; }
        public int Code { get; set; }
        public DateTime ValidFrom { get; set; }
        public DateTime ValidTo { get; set; }
        public Guid UserId { get; set; }
        public bool Expired { get; set; }
        public bool AutoExpired { get; set; }
        public DateTime LastUpdatedTime { get; set; }
        public string CellPhone { get; set; }
        public string EmailAddress { get; set; }

        public static void InsertOTP(string[] args)
        {
            BusinessLogicLayer.Globals.ExecuteScalar(DataAccessLayer.DataAccess.InsertOTP, args, ref ErrorNumber, ref ErrorMessage, MethodBase.GetCurrentMethod);
        }

        public static int ConfirmOTP(string[] args)
        {
            return BusinessLogicLayer.Globals.ExecuteScalar(DataAccessLayer.DataAccess.ConfirmOTP, args, ref ErrorNumber, ref ErrorMessage, MethodBase.GetCurrentMethod);
        }
    }
}
