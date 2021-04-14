using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Reflection;

namespace BusinessLogicLayer
{
    public class Enroll
    {
        public static int errorNumber = 0;
        public static string errorMessage = string.Empty;
       

        public static bool Insert(string[] args)
        {

            if (Globals.ExecuteScalar(DataAccess.EnrollInsert, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod) > 0)
            {
                //TODO: Send sms to the prncipal & the deputy                
                return true;
            }
            return false;
        }
        public static bool TrainingEnrollCancelByIdNumberAndScheduleId(string[] args, List<TrainingSchedule> dt)
        {
            if (Globals.ExecuteScalar(DataAccess.CancelTrainingEnrollByIdNumberAndScheduleId, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod) > 0)
            {
                Trainee trainee = Trainee.ByEnrolId(args[0]);
                string[] emailArgs = { trainee.Name, trainee.Surname };
                Communication.GenericCommunication.SMS(trainee.CellPhoneNumber, Message.smsCancelTrainingConfirmation());
                Communication.GenericCommunication.SendEmail(trainee.EmailAddress, "Training Cancellation", Message.CancelTrainingConfirmation(emailArgs, dt));
                return true;
            }
            return false;
        }
        public static bool Approve(string[] args, List<TrainingSchedule> dt)
        {
            if (Globals.ExecuteScalar(DataAccess.EnrolApproveById, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod) > 0)
            {
                Trainee trainee = Trainee.ByEnrolId(args[0]);
                string[] emailArgs = { trainee.Name, trainee.Surname };
                Communication.GenericCommunication.SMS(trainee.CellPhoneNumber, Message.smsTrainingApproved());
                Communication.GenericCommunication.SendEmail(trainee.EmailAddress, "Training Approved", Message.TrainingApproved(emailArgs, dt));
                return true;
            }
            return false;
        }
        public static bool Reject(string[] args, List<TrainingSchedule> dt)
        {
            if (Globals.ExecuteScalar(DataAccess.EnrolRejectById, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod) > 0)
            {
                Trainee trainee = Trainee.ByEnrolId(args[0]);
                string[] emailArgs = { trainee.Name, trainee.Surname, args[2] };
                Communication.GenericCommunication.SMS(trainee.CellPhoneNumber, Message.smsTrainingRejected());
                Communication.GenericCommunication.SendEmail(trainee.EmailAddress, "Training Rejected", Message.TrainingRejected(emailArgs, dt));
                return true;
            }
            return false;
        }
        public static bool Registered(int scheduleId, string userId)
        {
            bool Registered = false;
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                // SqlConnection con = new SqlConnection(connString);
                SqlCommand cmd = new SqlCommand();

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[up_UserTraining_ByIdNumber]";
                cmd.Parameters.AddWithValue("@IdNumber", userId);
                cmd.Connection = con;
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows) 
                { 
                    while (reader.Read()) 
                    {
                        if (reader.GetInt32(0) == scheduleId)
                        {
                            Registered = true;
                            break;
                        }
                    } 
                }
                reader.Close();
            }
            return Registered;

        }
    }
}
