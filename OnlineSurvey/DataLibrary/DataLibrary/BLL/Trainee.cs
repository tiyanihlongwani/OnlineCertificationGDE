using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLogicLayer
{
    public class Trainee
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
        public DateTime DateOfBirth { get; set; }
        public string EmailAddress { get; set; }
        public string Citizen { get; set; }
        public string CellPhoneNumber { get; set; }
        public string TelephoneNumber { get; set; }
        public int LevelId { get; set; }
        public int LevelTypeId { get; set; }
        public int PositionId { get; set; }
        public string Position { get; set; }
        public int LevelPosition { get; set; }
        public int Race { get; set; }
        public int Nationality { get; set; }
        public int SaceNumber { get; set; }
        public int Language { get; set; }
        public int Age { get; set; }
        public int Title { get; set; }
        public int Disability { get; set; }
        public int DisabilityType { get; set; }
        public int CodeStatus { get; set; }
        public string ApproverEmailAddress { get; set; }
        public string A1Name { get; set; }
        public string A1Surname { get; set; }        
        public string ApproverCellPhone { get; set; }
        public string Approver2EmailAddress { get; set; }
        public string A2Name { get; set; }
        public string A2Surname { get; set; }
        public string Approver2CellPhone { get; set; }
        public int DistrictId { get; set; }
        public static bool Insert(string[] args,string password)
        {
            if (Globals.ExecuteScalar(DataAccess.TraineeInsert, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod) > 0)
            {
                string[] emailArgs = { args[4], args[5],args[0],password };
                Communication.GenericCommunication.SendEmail(args[19], "Registration Successful", Message.RegistrationSuccessMessage(emailArgs));
                Communication.GenericCommunication.SMS(args[11], Message.smsRegistrationSuccessMessage());
                return true;
            }
            return false;           
        }
        public static bool Update(string[] args)
        {
            if(Globals.ExecuteScalar(DataAccess.TraineeUpdate,args,ref errorNumber,ref errorMessage,MethodBase.GetCurrentMethod) > 0)
            {
                return true;
            }
            return false;
        }
        public static bool SavePersonalDetails(string[] args)
        {
            if (Globals.ExecuteScalar(DataAccess.SaveTraineePersonalDetails, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod) > 0)
            {
                return true;
            }
            return false;
        }
        public static Trainee ByIdNumber(string IdNumber)
        {
            string[] args = { IdNumber };
            Trainee trainee = new Trainee();
            try
            {
                List<Trainee> returnList = Globals.ExecuteReaderList<Trainee>(DataAccess.TraineeByIdNumber, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
                
                if(returnList != null)
                {
                    foreach(Trainee traineeItem in returnList)
                    {
                        if(!string.IsNullOrEmpty( traineeItem.IdNumber))
                        {
                            trainee.Id = traineeItem.Id;
                            trainee.Citizen = traineeItem.Citizen;
                            trainee.IdNumber = traineeItem.IdNumber;
                            trainee.PersalNumber = traineeItem.PersalNumber;
                            trainee.Name = traineeItem.Name;
                            trainee.Surname = traineeItem.Surname;
                            trainee.Gender = traineeItem.Gender;
                            trainee.Race = traineeItem.Race;
                            trainee.DateOfBirth = traineeItem.DateOfBirth;
                            trainee.PositionId = traineeItem.PositionId;
                            trainee.EmailAddress = traineeItem.EmailAddress;
                            trainee.Initials = traineeItem.Initials;
                            trainee.Language = traineeItem.Language;
                            trainee.SaceNumber = traineeItem.SaceNumber;
                            trainee.Age = traineeItem.Age;
                            trainee.CellPhoneNumber = traineeItem.CellPhoneNumber;
                            trainee.TelephoneNumber = traineeItem.TelephoneNumber;
                            trainee.Nationality = traineeItem.Nationality;
                            trainee.Title = traineeItem.Title;
                            trainee.Disability = traineeItem.Disability;
                            trainee.DisabilityType = traineeItem.DisabilityType;
                            trainee.LevelId = traineeItem.LevelId;
                            trainee.LevelTypeId = traineeItem.LevelTypeId;
                            trainee.LevelPosition = traineeItem.LevelPosition;
                            trainee.ApproverEmailAddress = traineeItem.ApproverEmailAddress;
                            trainee.Approver2EmailAddress = traineeItem.Approver2EmailAddress;
                            trainee.ApproverCellPhone = traineeItem.ApproverCellPhone;
                            trainee.Approver2CellPhone = traineeItem.Approver2CellPhone;
                            trainee.DistrictId = traineeItem.DistrictId;
                        }
                    }
                }
            }
            finally
            {
                GC.Collect();
            }

            return trainee;
        }
        public static Trainee ByEnrolId(string enrollID)
        {
            string[] args = { enrollID };
            Trainee trainee = new Trainee();
            try
            {
                List<Trainee> returnList = Globals.ExecuteReaderList<Trainee>(DataAccess.TraineeByEnrolId, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);

                if (returnList != null)
                {
                    foreach (Trainee traineeItem in returnList)
                    {
                        if (!string.IsNullOrEmpty(traineeItem.Name))
                        {                           
                            trainee.Name = traineeItem.Name;
                            trainee.Surname = traineeItem.Surname;
                            trainee.EmailAddress = traineeItem.EmailAddress;
                            trainee.CellPhoneNumber = traineeItem.CellPhoneNumber;
                            trainee.A1Name = traineeItem.A1Name;
                            trainee.A1Surname = traineeItem.A1Surname;
                            trainee.ApproverEmailAddress = traineeItem.ApproverEmailAddress;
                            trainee.A2Name = traineeItem.A2Name;
                            trainee.A2Surname = traineeItem.A2Surname;

                            trainee.Approver2EmailAddress = traineeItem.Approver2EmailAddress;
                            trainee.ApproverCellPhone = traineeItem.ApproverCellPhone;
                            trainee.Approver2CellPhone = traineeItem.Approver2CellPhone;
                        }
                    }
                }
            }
            finally
            {
                GC.Collect();
            }

            return trainee;
        }        
        public static Trainee ByPersalNumber(string[] args)
        {
            Trainee trainee = new Trainee();
            try
            {

            }
            finally
            {                
                GC.Collect();
            }

            return trainee;
        }
        public static bool RequestResetPassword(string[] args, string idNumber, string code)
        {
            if (Globals.ExecuteScalar(DataAccess.EmployeeResetPasswordInsert, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod) > 0)
            {
                Trainee emp = Trainee.ByIdNumber(idNumber);
                if (emp != null)
                {
                    string[] emailargs = { emp.Name, emp.Surname, code, idNumber,"1" };
                    Communication.GenericCommunication.SMS(emp.CellPhoneNumber, Message.smsForgotPassword(code));
                    if (Communication.GenericCommunication.SendEmail(emp.EmailAddress, "Reset Password", Message.ForgotPassword(emailargs)))
                    {
                        return true;
                    }
                }
            }
            return false;
        }
        public static bool RequestResetPasswordUpdate(string[] args, string IdNumber)
        {
            if (Globals.ExecuteScalar(DataAccess.EmployeeResetPasswordUpdate, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod) > 0)
            {
                Trainee emp = Trainee.ByIdNumber(IdNumber);
                if (emp != null)
                {
                    string[] emailargs = { emp.Name, emp.Surname };
                    Communication.GenericCommunication.SMS(emp.CellPhoneNumber, Message.smsForgotPasswordResetSuccess());
                    if (Communication.GenericCommunication.SendEmail(emp.EmailAddress, "Reset Password Success", Message.ForgotPasswordResetSuccess(emailargs)))
                    {
                        return true;
                    }
                }
            }
            return false;
        }
        public static bool TraineeResetPasswordCode(string[] args, ref int codeStatus)
        {
            List<Trainee> employeeList = Globals.ExecuteReaderList<Trainee>(DataAccess.EmployeeResetPasswordCodeByUserIdAndCode, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
            if (employeeList != null)
            {
                foreach (Trainee emp in employeeList)
                {
                    codeStatus = emp.CodeStatus;
                    if (emp.CodeStatus == 0)
                    {
                        return true;
                    }
                }
            }
            return false;
        }
        public static List<Trainee> ByPrincipalIdNumber(string[] args)
        {
            return Globals.ExecuteReaderList<Trainee>(DataAccess.TraineeByPrincipalIdNumber, args,ref errorNumber,ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static List<Lookup> LeveleTypePositionsByLevelTypeId(string[] args)
        {
            return Globals.ExecuteReaderList<Lookup>(DataAccess.LeveleTypePositionsByLevelTypeId, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }

        public static List<Lookup> LevelTypesByDistrictId(string[] args)
        {
            return Globals.ExecuteReaderList<Lookup>(DataAccess.LevelTypesByDistrictId, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }

    }
}
