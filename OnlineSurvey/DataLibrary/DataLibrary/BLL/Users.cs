using BusinessLogicLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;

namespace BusinessLogicLayer
{
   public class Users
    {
        public static int ErrorNumber = 0;
        public static string ErrorMessage = string.Empty;

        public int Persal_Number { get; set; }
        public string Lastname { get; set; }
        public string Citizen { get; set; }
        public string Initials { get; set; }
        public string TitleID { get; set; }
        public string ParticipationLevelKey { get; set; }
        public string Firstname { get; set; }
        public string Gender { get; set; }
        public string RegionAndSchool { get; set; }
        public string LearnerIdentificationNumber { get; set; }
        public int Race { get; set; }
        public string RegisterRace { get; set; }
        public int Age { get; set; }
        public int GradeTeaching { get; set; }
        public int HomeLanguageKey { get; set; }
        public string Cell_Number { get; set; }
        public string TelephoneNumber { get; set; }


        public string EmailAddress { get; set; }
        //public string Address { get; set; }
        public string District { get; set; }
        public string Institution { get; set; }
        //public string Disability{get;set;}

        //public string POST_TYPE{get;set;}
        public string Sace_Number { get; set; }
        //public string REGION_DESCRIPTION { get; set; }
        public string Occupation { get; set; }
        public string NationalityKey { get; set; }
        public static int errorNumber = 0;
        public static string errorMessage = string.Empty;
        public int Id { get; set; }
        public string Name { get; set; }


        public string IdNumber { get; set; }
        public string ASPNETUserID { get; set; }

        public string ResidentialAddressHouseNumber { get; set; }
        public string ResidentialAddressBuildingName { get; set; }
        public string ResidentialAddressStreetName { get; set; }
        public string ResidentialAddressSuburbName { get; set; }
        public string ResidentialAddressPostalCode { get; set; }


        public string PostalAddressTypeKey { get; set; }
        public string PostalAddressNumber { get; set; }
        public string PostalAddressSuburbName { get; set; }
        public string PostalAddressPostalCode { get; set; }
        public string ExperienceInCurrentPosition_Months { get; set; }
        public string ExperienceInCurrentPosition_Years { get; set; }
        public string ExperienceInEducationSector_Months { get; set; }
        public string ExperienceInEducationSector_Years { get; set; }

        public string ID_Num { get; set; }

        public string UserName{ get; set; }

        public string Password { get; set; }

        public string PasswordHash { get; set; }

        public static Users UserById(string IdNumber)
        {
            string[] args = { IdNumber };

            List<Users> returnList = BusinessLogicLayer.Globals.ExecuteReaderList<Users>(DataAccessLayer.DataAccess.GetUser, args, ref ErrorNumber, ref ErrorMessage, MethodBase.GetCurrentMethod);
            Users user = new Users();

            if (returnList.Count > 0)
            {
                foreach (Users userDetails in returnList)
                {
                  //  user.LearnerIdentificationNumber = userDetails.LearnerIdentificationNumber;
                    user.IdNumber = userDetails.ID_Num;
                    user.Password = userDetails.Password;

                   ////// user.Id = userDetails.Id;
                   // user.IdNumber = userDetails.IdNumber;
                   // user.ASPNETUserID = userDetails.ASPNETUserID;
                    
                }
            }
            return user;



        }

       public static bool Login(string IdNumber, string password)
       {
           string[] args = { IdNumber, password };
           List<Users> returnList = Globals.ExecuteReaderList<Users>(DataAccess.Login, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);

           Users luser = new Users();
           foreach(Users user in returnList)
           {
               //return (!string.IsNullOrEmpty(user.ID_Num)? true:false);
               return (!string.IsNullOrEmpty(user.UserName) ? true : false);
           }
           return false;
       }

        public static Users ByIdNumber(string table)
        {
            string[] args = { table };
            List<Users> returnList = Globals.ExecuteReaderList<Users>(DataAccess.LearnerbyIDNumber, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);

            Users user = new Users();
            if (returnList.Count > 0)
            {
                foreach (Users item in returnList)
                {
                    //Personal Details
                    user.LearnerIdentificationNumber = item.LearnerIdentificationNumber;
                    user.Firstname = item.Firstname;
                    user.Lastname = item.Lastname;
                    user.Gender = item.Gender;
                    user.NationalityKey = item.NationalityKey;
                    user.ParticipationLevelKey = item.ParticipationLevelKey;
                    user.EmailAddress = item.EmailAddress;
                    user.Race = item.Race;
                    user.GradeTeaching = item.GradeTeaching;
                    user.Persal_Number = item.Persal_Number;
                    user.Age = item.Age;
                    user.Cell_Number = item.Cell_Number;
                    user.Sace_Number = item.Sace_Number;
                    user.TitleID = item.TitleID;
                    user.TelephoneNumber = item.TelephoneNumber;
                    user.HomeLanguageKey = item.HomeLanguageKey;

                    // Residential Adresses
                    user.ResidentialAddressHouseNumber = item.ResidentialAddressHouseNumber;
                    user.ResidentialAddressBuildingName = item.ResidentialAddressBuildingName;
                    user.ResidentialAddressStreetName = item.ResidentialAddressStreetName;
                    user.ResidentialAddressSuburbName = item.ResidentialAddressSuburbName;
                    user.ResidentialAddressPostalCode = item.ResidentialAddressPostalCode;
                    user.PostalAddressTypeKey = item.PostalAddressTypeKey;

                    //Postal Addresses           
                    user.PostalAddressNumber = item.PostalAddressNumber;
                    user.PostalAddressSuburbName = item.PostalAddressSuburbName;
                    user.PostalAddressPostalCode = item.PostalAddressPostalCode;

                    //Qualifications and Experiences

                    user.ExperienceInCurrentPosition_Months = item.ExperienceInCurrentPosition_Months;
                    user.ExperienceInCurrentPosition_Years = item.ExperienceInCurrentPosition_Years;
                    user.ExperienceInEducationSector_Months = item.ExperienceInEducationSector_Months;
                    user.ExperienceInEducationSector_Years = item.ExperienceInEducationSector_Years;

                }
            }

            return user;
        }
        //Pullng from 
        public static User employeeDetail(string employeeDet)
        {
            string[] args = { employeeDet };

            List<User> returnList = BusinessLogicLayer.Globals.ExecuteReaderList<User>(DataAccessLayer.DataAccess.ApplicantGet, args, ref ErrorNumber, ref ErrorMessage, MethodBase.GetCurrentMethod);
            User employee = new User();
            if (returnList.Count > 0)
            {
                foreach (User employeeDetails in returnList)
                {
                    employee.Persal_Number = employeeDetails.Persal_Number;
                    employee.Lastname = employeeDetails.Lastname;
                    employee.Firstname = employeeDetails.Firstname;
                    employee.Initials = employeeDetails.Initials;
                    employee.RegisterRace = employeeDetails.RegisterRace;
                    employee.Gender = employeeDetails.Gender;
                    employee.RegionAndSchool = employeeDetails.RegionAndSchool;
                    employee.LearnerIdentificationNumber = employeeDetails.LearnerIdentificationNumber;
                    employee.Age = employeeDetails.Age;
                    employee.NationalityKey = employeeDetails.NationalityKey;
                    employee.Occupation = employeeDetails.Occupation;

                }
            }
            return employee;
        }
        public static void AddUserDeatils(string[] args)
        {
            BusinessLogicLayer.Globals.ExecuteScalar(DataAccessLayer.DataAccess.upAddUserDetails, args, ref ErrorNumber, ref ErrorMessage, MethodBase.GetCurrentMethod);

        }

        public static void UpdateUser(string[] args)
        {

            BusinessLogicLayer.Globals.ExecuteScalar(DataAccessLayer.DataAccess.UpDateUserProfile, args, ref ErrorNumber, ref ErrorMessage, MethodBase.GetCurrentMethod);

        }

       //Insert User Logins
        public static void insertUserLogin(string[] args)
        {
            BusinessLogicLayer.Globals.ExecuteScalar(DataAccessLayer.DataAccess.Insertlogin, args, ref ErrorNumber, ref ErrorMessage, MethodBase.GetCurrentMethod);

        }



        //public static Users UserByNetID(string theID_Num)
        //{
        //    string[] args = { theID_Num };

        //    List<Users> returnList = BusinessLogicLayer.Globals.ExecuteReaderList<Users>(DataAccessLayer.DataAccess.GetNetUser, args, ref ErrorNumber, ref ErrorMessage, MethodBase.GetCurrentMethod);
        //    Users user = new Users();

        //    if (returnList.Count > 0)
        //    {
        //        foreach (Users userDetails in returnList)
        //        {
        //            // user.LearnerIdentificationNumber = userDetails.LearnerIdentificationNumber;
        //            user.Id = userDetails.Id;
        //            user.PasswordHash = userDetails.PasswordHash;
       
        //        }
        //    }
        //    return user;



        //}

    }
}
