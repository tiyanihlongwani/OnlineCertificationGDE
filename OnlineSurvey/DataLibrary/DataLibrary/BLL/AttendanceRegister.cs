using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;
using System.Reflection;

namespace BusinessLogicLayer
{
    public class AttendanceRegister
    {
        public static int errorNumber = 0;
        public static string errorMessage = string.Empty;

        public int Id { get; set; }      
        public string IdNumber { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public DateTime Start_Date { get; set; }
        public DateTime End_Date { get; set; }
        public string Venue { get; set; }
        public string Status { get; set; }
        public float Duration { get; set; }
        public string Project { get; set; }
        public string Subject { get; set; }
        public string Phase { get; set; }
        public string Topic { get; set; }
        public int CheckIn { get; set; }
        public int CheckOut { get; set; }
        public string PersalNumber { get; set; }
        public string EmailAddress { get; set; }
        public string Gender { get; set; }
        public string SACENumber { get; set; }
        public string CellPhoneNumber { get; set; }
        public string Race { get; set; }
        public string Age { get; set; }
        public string Disability { get; set; }
        public string DisabilityType { get; set; }
        public string DistrictName { get; set; }
        public string CircuitName { get; set; }
        public string ClusterName { get; set; }
        public string SchoolName { get; set; }

        public static ICollection<AttendanceRegister> ByScheduleId(string[] args)
        {
            List<AttendanceRegister> trainingSchedule = Globals.ExecuteReaderList<AttendanceRegister>(DataAccess.AttendanceRegisterById, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
            
            return trainingSchedule;
        }
        public static ICollection<TrainingSchedule> ByIdNumberAndScheduleId(string[] args, ref bool venueFull)
        {
            List<TrainingSchedule> trainingSchedule = Globals.ExecuteReaderList<TrainingSchedule>(DataAccess.TrainiScheduleByIdNumberAndId, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
           
            return trainingSchedule;
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

        public static List<TrainingSchedule> ByIdNumberAndRelatedToId(string[] args,ref bool cancel)
        {
            List<TrainingSchedule> trainingSchedule =  Globals.ExecuteReaderList<TrainingSchedule>(DataAccess.TrainingScheduleByIdNumberAndRelatedToId, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);

            foreach (TrainingSchedule tr in trainingSchedule)
            {                
                if(tr.Cancel == false)
                {
                    cancel = false;                    
                }
                break;
            }
            return trainingSchedule;
        }

        public static ICollection<TrainingSchedule> ByApproverIdNumberAndEnrollId(string[] args, ref bool venueFull)
        {
            List<TrainingSchedule> trainingSchedule = Globals.ExecuteReaderList<TrainingSchedule>(DataAccess.TrainiScheduleByApproverIdNumberAndEnrollId, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);

            return trainingSchedule;
        }
        public static List<TrainingSchedule> ByInstructorId(string[] args)
        {
            return Globals.ExecuteReaderList<TrainingSchedule>(DataAccess.TrainingScheduleByInstructorId, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static bool CheckInById(string[] args)
        {
            if(Globals.ExecuteScalar(DataAccess.AttendanceRegisterCheckIn,args,ref errorNumber,ref errorMessage,MethodBase.GetCurrentMethod) > 0)
            {
                return true;
            }
            return false;
        }

        public static bool CheckOutById(string[] args)
        {
            if (Globals.ExecuteScalar(DataAccess.AttendanceRegisteCheckOut, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod) > 0)
            {
                return true;
            }
            return false;
        }
    }
}
