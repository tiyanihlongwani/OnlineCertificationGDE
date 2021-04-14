using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Reflection;


namespace BusinessLogicLayer
{
    public class Employee : Person
    {
        public string Nationality { get; set; }
        public string Language { get; set; }
        public string Race { get; set; }
        public string Age { get; set; }
        public int Disability { get; set; }
        public int DisabilityType { get; set; }
        public int DistrictId { get; set; }
        public int SchoolId { get; set; }
        public string DistrictName { get; set; }
        public string SchoolName { get; set; }
        public int LevelId { get; set; }
        public int LevelTypeId { get; set; }
        public string Position { get; set; }
        public int LevelPosition { get; set; }
        public int CodeStatus { get; set; }
        public override List<Employee> ByDistrictId<Employee>(string[] args)
        {
            throw new NotImplementedException();
        }
        public static Employee ById(string[] args)
        {
            Employee employee = new Employee();
           
            List<Employee> employees = Globals.ExecuteReaderList<Employee>(DataAccess.EmployeeById, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
            try
            {
                foreach (Employee item in employees)
                {
                    employee.Id = item.Id;
                    employee.Nationality = item.Nationality;
                    employee.IdNumber = item.IdNumber;
                    employee.PersalNumber = item.PersalNumber;
                    employee.Title = item.Title;
                    employee.Initials = item.Initials;
                    employee.Name = item.Name;
                    employee.Surname = item.Surname;
                    employee.Gender = item.Gender;
                    employee.EmailAddress = item.EmailAddress;
                    employee.CellPhoneNumber = item.CellPhoneNumber;
                    employee.TelephoneNumber = item.TelephoneNumber;
                    employee.Language = item.Language;
                    employee.Race = item.Race;
                    employee.Age = item.Age;
                    employee.Disability = item.Disability;
                    employee.DisabilityType = item.DisabilityType;
                    employee.LevelId = item.LevelId;
                    employee.LevelTypeId = item.LevelTypeId;
                    employee.LevelPosition = item.LevelPosition;
                    employee.SchoolId = item.SchoolId;
                    
                   
                }
            }
            finally
            {

            }
            return employee;

        }
       
        public static Employee ByIdNumber(string IdNumber)
        {
            string[] args = { IdNumber };
            Employee employee = new Employee();

            List<Employee> employees = Globals.ExecuteReaderList<Employee>(DataAccess.EmployeeByIdNumber, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
            try
            {
                foreach (Employee item in employees)
                {
                    employee.Id = item.Id;
                    employee.IdNumber = item.IdNumber;
                    employee.PersalNumber = item.PersalNumber;
                    employee.Title = item.Title;
                    employee.Initials = item.Initials;
                    employee.Name = item.Name;
                    employee.Surname = item.Surname;
                    employee.Gender = item.Gender;
                    employee.DistrictId = item.DistrictId;
                    employee.SchoolId = item.SchoolId;
                    employee.LevelId = item.LevelId;
                    employee.EmailAddress = item.EmailAddress;
                    employee.CellPhoneNumber = item.CellPhoneNumber;
                    employee.TelephoneNumber = item.TelephoneNumber;
                }
            }
            finally
            {

            }
            return employee;
        }
        public override List<Employee> ByNothing<Employee>()
        {
            string[] args = { };
            return Globals.ExecuteReaderList<Employee>(DataAccess.EmployeeByNothing, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public override List<Person> BySchoolId<Person>(string[] args)
        {
            throw new NotImplementedException();
        }
        public override bool Insert(string[] args)
        {
            if(Globals.ExecuteScalar(DataAccess.EmployeeInsert,args,ref errorNumber, ref errorMessage,MethodBase.GetCurrentMethod) > 0)
            {
                return true;
            }
            return false;
        }
        public override bool Update(string[] args)
        {
            if (Globals.ExecuteScalar(DataAccess.EmployeeUpdate, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod) > 0)
            {
                return true;
            }
            return false;
        }

        public bool DeleteById(string[] args)
        {
            if (Globals.ExecuteScalar(DataAccess.EmployeeDeleteById, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod) > 0)
            {
                return true;
            }

            return false;
        }
        public static bool RequestResetPassword(string[] args,string idNumber,string code)
        {
            if (Globals.ExecuteScalar(DataAccess.EmployeeResetPasswordInsert, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod) > 0)
            {
                Employee emp = Employee.ByIdNumber(idNumber);
                if (emp != null)
                {
                    string[] emailargs = {emp.Name,emp.Surname,code,idNumber,"0" };
                    Communication.GenericCommunication.SMS(emp.CellPhoneNumber, Message.smsForgotPassword(code));
                    if (Communication.GenericCommunication.SendEmail(emp.EmailAddress, "Reset Password", Message.ForgotPassword(emailargs)))
                    {
                        return true;
                    }
                }
            }
            return false;
        }
        public bool RequestResetPasswordUpdate(string[] args,string IdNumber)
        {
            if (Globals.ExecuteScalar(DataAccess.EmployeeResetPasswordUpdate, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod) > 0)
            {
                Employee emp = Employee.ByIdNumber(IdNumber);
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
        public  bool EmployeeResetPasswordCode(string[] args,ref int codeStatus)
        {
            List<Employee> employeeList = Globals.ExecuteReaderList<Employee>(DataAccess.EmployeeResetPasswordCodeByUserIdAndCode, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
            if(employeeList != null)
            {
                foreach (Employee emp in employeeList)
                {
                    codeStatus = emp.CodeStatus;
                    if (emp.CodeStatus ==0)
                    {                
                        return true;
                    }
                }
            }
            return false;
        }

    }
}
