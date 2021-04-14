using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;
using System.Reflection;

namespace BusinessLogicLayer
{
    [Serializable]
    public class TrainingSchedule
    {
        public static int errorNumber = 0;
        public static string errorMessage = string.Empty;
        public int Id { get; set; }
        public DateTime Start_Date { get; set; }
        public DateTime End_Date { get; set; }
        public string Venue { get; set; }
        public string Status { get; set; }
        public float Duration { get; set; }
        public string Phase { get; set; }
        public string Topic { get; set; }
        public bool Cancel { get; set; }
        public int NoOfTraineesRegistered { get; set; }
        public int Capacity { get; set; }
        public int VenueFull { get; set; }
        public string IdNumber { get; set; }
        public string Subject { get; set; }
        public string Project { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public static List<TrainingSchedule> ByTrainingIdAndScheduleId(string[] args,ref bool venueFull)
        {
            List<TrainingSchedule> trainingSchedule = Globals.ExecuteReaderList<TrainingSchedule>(DataAccess.TrainiScheduleByTrainingIdAndScheduleId, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
            foreach(TrainingSchedule tr in trainingSchedule)
            {
                if (tr.VenueFull == 1)
                {
                    venueFull = true;
                }
                break;
            }

            return trainingSchedule;
        }
        public static List<TrainingSchedule> ByIdNumberAndScheduleId(string[] args, ref bool venueFull)
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
        public static List<TrainingSchedule> ByApproverIdNumberAndEnrollId(string[] args, ref bool venueFull)
        {
            List<TrainingSchedule> trainingSchedule = Globals.ExecuteReaderList<TrainingSchedule>(DataAccess.TrainiScheduleByApproverIdNumberAndEnrollId, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);

            return trainingSchedule;
        }
        public static List<TrainingSchedule> ByInstructorId(string[] args)
        {
            return Globals.ExecuteReaderList<TrainingSchedule>(DataAccess.TrainingScheduleByInstructorId, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static List<TrainingSchedule> ByScheduleId(string[] args)
        {
            return Globals.ExecuteReaderList<TrainingSchedule>(DataAccess.TrainingScheduleByScheduleId, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static bool Approve()
        {

            return false;
        }
        public static bool Reject()
        {
            return false;
        }
    }
}
