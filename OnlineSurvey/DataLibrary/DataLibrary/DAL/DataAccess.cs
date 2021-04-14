using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Reflection;

namespace DataAccessLayer
{
    public  class DataAccess
    {        
        private static string CONNECTION_STRING = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
         
        private static SqlAccessHelper _DataAccess = new SqlAccessHelper(CONNECTION_STRING);

        #region"Insertlogin"
        public static int Insertlogin(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();


            _DataAccess.AddParamCmd(ref cmd, "@ID_Num", SqlDbType.Int, 15, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@Name", SqlDbType.VarChar, 50, ParameterDirection.Input, args[1]);
            _DataAccess.AddParamCmd(ref cmd, "@SurName", SqlDbType.VarChar, 50, ParameterDirection.Input, args[2]);
            _DataAccess.AddParamCmd(ref cmd, "@Password", SqlDbType.VarChar, 50, ParameterDirection.Input, args[3]);

            return ExecuteScalaHelper(cmd, "[Insert_User]", ref errorMessage, MethodBase.GetCurrentMethod);
        }


        #endregion
        #region "Enroll"
        public static int EnrollInsert(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();

            _DataAccess.AddParamCmd(ref cmd, "@Id", SqlDbType.VarChar, 13, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@UserId", SqlDbType.VarChar, 13, ParameterDirection.Input, args[1]);

            return ExecuteScalaHelper(cmd, "[up_Enroll_Insert]", ref errorMessage, MethodBase.GetCurrentMethod);
        }

        public static int CancelTrainingEnrollByIdNumberAndScheduleId(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();

            _DataAccess.AddParamCmd(ref cmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@IdNumber", SqlDbType.VarChar, 13, ParameterDirection.Input, args[1]);
            _DataAccess.AddParamCmd(ref cmd, "@UserId", SqlDbType.NVarChar, 128, ParameterDirection.Input, args[2]);

            return ExecuteScalaHelper(cmd, "[up_UserTraining_CancelByIdNumberAndSchuduleId]", ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static int EnrolApproveById(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();

            _DataAccess.AddParamCmd(ref cmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@UserId", SqlDbType.NVarChar, 128, ParameterDirection.Input, args[1]);

            return ExecuteScalaHelper(cmd, "[up_UserTraining_ApproveById]", ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static int EnrolRejectById(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();

            _DataAccess.AddParamCmd(ref cmd, "@Id", SqlDbType.Int, 13, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@UserId", SqlDbType.NVarChar, 128, ParameterDirection.Input, args[1]);

            return ExecuteScalaHelper(cmd, "[up_UserTraining_RejectById]", ref errorMessage, MethodBase.GetCurrentMethod);
        }


        #endregion
        #region"Register"
        public static int upAddUserDetails(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand(); 
	
            _DataAccess.AddParamCmd(ref cmd, "@Persal_Number", SqlDbType.Int, 100, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@IDIndicatorKey", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[1]);
            _DataAccess.AddParamCmd(ref cmd, "@LearnerIdentificationNumber", SqlDbType.VarChar, 0, ParameterDirection.Input, args[2]);            
            _DataAccess.AddParamCmd(ref cmd, "@Age", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[3]);
            _DataAccess.AddParamCmd(ref cmd, "@Sace_Number", SqlDbType.VarChar, 20, ParameterDirection.Input, args[4]);
            _DataAccess.AddParamCmd(ref cmd, "@TitleID", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[5]);
            _DataAccess.AddParamCmd(ref cmd, "@Firstname", SqlDbType.VarChar, 50, ParameterDirection.Input, args[6]);
            _DataAccess.AddParamCmd(ref cmd, "@Lastname", SqlDbType.VarChar, 50, ParameterDirection.Input, args[7]);
            _DataAccess.AddParamCmd(ref cmd, "@GenderKey", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[8]);
            _DataAccess.AddParamCmd(ref cmd, "@nationalitykey", SqlDbType.VarChar, 50, ParameterDirection.Input, args[9]);
           // _DataAccess.AddParamCmd(ref cmd, "@participationlevelkey", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[10]);
           // _DataAccess.AddParamCmd(ref cmd, "@districtschoolindicatorkey", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[11]);
            _DataAccess.AddParamCmd(ref cmd, "@populationkey", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[10]);
            _DataAccess.AddParamCmd(ref cmd, "@homelanguagekey", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[11]);
            _DataAccess.AddParamCmd(ref cmd, "@Cell_Number", SqlDbType.VarChar, 20, ParameterDirection.Input, args[12]);
            _DataAccess.AddParamCmd(ref cmd, "@TelephoneNumber", SqlDbType.VarChar, 20, ParameterDirection.Input, args[13]);
            _DataAccess.AddParamCmd(ref cmd, "@EmailAddress", SqlDbType.VarChar, 50, ParameterDirection.Input, args[14]);
            //_DataAccess.AddParamCmd(ref cmd, "@Disabled", SqlDbType.Int, 0, ParameterDirection.Input, args[17]);
            //_DataAccess.AddParamCmd(ref cmd, "@DisabilityKey", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[18]);
            //_DataAccess.AddParamCmd(ref cmd, "@SchoolIDKey", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[19]);
            //_DataAccess.AddParamCmd(ref cmd, "@DistrictIDKey", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[20]);
            //_DataAccess.AddParamCmd(ref cmd, "@JobTitleKey", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[21]);
            //_DataAccess.AddParamCmd(ref cmd, "@GradeTeaching", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[22]);
            //_DataAccess.AddParamCmd(ref cmd, "@ResidentialAddressHouseNumber", SqlDbType.VarChar, 50, ParameterDirection.Input, args[23]);
            //_DataAccess.AddParamCmd(ref cmd, "@ResidentialAddressBuildingName", SqlDbType.VarChar, 50, ParameterDirection.Input, args[24]);
            //_DataAccess.AddParamCmd(ref cmd, "@ResidentialAddressStreetName", SqlDbType.VarChar, 50, ParameterDirection.Input, args[25]);
            //_DataAccess.AddParamCmd(ref cmd, "@ResidentialAddressSuburbName", SqlDbType.VarChar, 50, ParameterDirection.Input, args[26]);
            //_DataAccess.AddParamCmd(ref cmd, "@ResidentialAddressPostalCode", SqlDbType.VarChar, 5, ParameterDirection.Input, args[27]);
            //_DataAccess.AddParamCmd(ref cmd, "@PostalAddressTypeKey", SqlDbType.VarChar, 20, ParameterDirection.Input, args[28]);
            //_DataAccess.AddParamCmd(ref cmd, "@PostalAddressNumber", SqlDbType.VarChar, 50, ParameterDirection.Input, args[29]);
            //_DataAccess.AddParamCmd(ref cmd, "@PostalAddressSuburbName", SqlDbType.VarChar, 50, ParameterDirection.Input, args[30]);
            //_DataAccess.AddParamCmd(ref cmd, "@PostalAddressPostalCode", SqlDbType.VarChar, 5, ParameterDirection.Input, args[31]);
            //_DataAccess.AddParamCmd(ref cmd, "@ExperienceInCurrentPosition_Months", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[32]);
            //_DataAccess.AddParamCmd(ref cmd, "@ExperienceInCurrentPosition_Years", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[33]);
            //_DataAccess.AddParamCmd(ref cmd, "@ExperienceInEducationSector_Months", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[34]);
            //_DataAccess.AddParamCmd(ref cmd, "@ExperienceInEducationSector_Years", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[35]);

            return ExecuteScalaHelper(cmd, "[Up_AddLearner]", ref errorMessage, MethodBase.GetCurrentMethod);
        }
        #endregion
        #region"UserProfile Update"
        public static int UpDateUserProfile(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
           _DataAccess.AddParamCmd(ref cmd, "@LearnerIdentificationNumber", SqlDbType.VarChar, 0, ParameterDirection.Input, args[0]);
           _DataAccess.AddParamCmd(ref cmd, "@Age", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[1]);
           _DataAccess.AddParamCmd(ref cmd, "@Sace_Number", SqlDbType.VarChar, 20, ParameterDirection.Input, args[2]);
           _DataAccess.AddParamCmd(ref cmd, "@TitleID", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[3]);
           _DataAccess.AddParamCmd(ref cmd, "@Firstname", SqlDbType.VarChar, 50, ParameterDirection.Input, args[4]);
           _DataAccess.AddParamCmd(ref cmd, "@Lastname", SqlDbType.VarChar, 50, ParameterDirection.Input, args[5]);
           _DataAccess.AddParamCmd(ref cmd, "@GenderKey", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[6]);         
           _DataAccess.AddParamCmd(ref cmd, "@nationalitykey", SqlDbType.VarChar, 50, ParameterDirection.Input, args[7]);
           _DataAccess.AddParamCmd(ref cmd, "@homelanguagekey", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[8]);
           _DataAccess.AddParamCmd(ref cmd, "@Cell_Number", SqlDbType.VarChar, 20, ParameterDirection.Input, args[9]);
           _DataAccess.AddParamCmd(ref cmd, "@TelephoneNumber", SqlDbType.VarChar, 20, ParameterDirection.Input, args[10]);
           _DataAccess.AddParamCmd(ref cmd, "@EmailAddress", SqlDbType.VarChar, 50, ParameterDirection.Input, args[11]);
           _DataAccess.AddParamCmd(ref cmd, "@ExperienceInCurrentPosition_Months", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[12]);
           _DataAccess.AddParamCmd(ref cmd, "@ExperienceInCurrentPosition_Years", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[13]);
           _DataAccess.AddParamCmd(ref cmd, "@ExperienceInEducationSector_Months", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[14]);
           _DataAccess.AddParamCmd(ref cmd, "@ExperienceInEducationSector_Years", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[15]);

            return ExecuteScalaHelper(cmd, "[Up_UserUpdate]", ref errorMessage, MethodBase.GetCurrentMethod);
        }

        public static DataTable LearnerbyIDNumber(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@LearnerIdentificationNumber", SqlDbType.VarChar, 13, ParameterDirection.Input, args[0]);

            return ExecuteReaderHelper(cmd, "[up_Learner_ByIdNumber]", ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }
        #endregion
        #region "Trainee"
        public static int TraineeInsert(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();

            _DataAccess.AddParamCmd(ref cmd, "@UserName", SqlDbType.VarChar, 13, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@IdNumber", SqlDbType.VarChar, 13, ParameterDirection.Input, args[1]);
            _DataAccess.AddParamCmd(ref cmd, "@Title", SqlDbType.Int, 0, ParameterDirection.Input, args[2]);
            _DataAccess.AddParamCmd(ref cmd, "@Initials", SqlDbType.VarChar, 5, ParameterDirection.Input, args[3]);
            _DataAccess.AddParamCmd(ref cmd, "@Name", SqlDbType.VarChar, 100, ParameterDirection.Input, args[4]);
            _DataAccess.AddParamCmd(ref cmd, "@Surname", SqlDbType.VarChar, 100, ParameterDirection.Input, args[5]);
            _DataAccess.AddParamCmd(ref cmd, "@Gender", SqlDbType.VarChar, 6, ParameterDirection.Input, args[6]);
            _DataAccess.AddParamCmd(ref cmd, "@DateOfBirth", SqlDbType.VarChar,10, ParameterDirection.Input, args[7]);
            _DataAccess.AddParamCmd(ref cmd, "@PositionId", SqlDbType.Int, 0, ParameterDirection.Input, args[8]);            
            _DataAccess.AddParamCmd(ref cmd, "@Race", SqlDbType.Int, 0, ParameterDirection.Input, args[9]);
            _DataAccess.AddParamCmd(ref cmd, "@Language", SqlDbType.Int, 0, ParameterDirection.Input, args[10]);
            _DataAccess.AddParamCmd(ref cmd, "@CellPhoneNumber", SqlDbType.VarChar, 10, ParameterDirection.Input, args[11]);
            _DataAccess.AddParamCmd(ref cmd, "@TelephoneNumber", SqlDbType.VarChar, 10, ParameterDirection.Input, args[12]);
            _DataAccess.AddParamCmd(ref cmd, "@SACENumber", SqlDbType.Int, 0, ParameterDirection.Input, args[13]);
            _DataAccess.AddParamCmd(ref cmd, "@Age", SqlDbType.Int, 0, ParameterDirection.Input, args[14]);
            _DataAccess.AddParamCmd(ref cmd, "@Nationality", SqlDbType.Int, 0, ParameterDirection.Input, args[15]);
            _DataAccess.AddParamCmd(ref cmd, "@Disability", SqlDbType.Int, 0, ParameterDirection.Input, args[16]);
            _DataAccess.AddParamCmd(ref cmd, "@DisabilityType", SqlDbType.Int, 0, ParameterDirection.Input, args[17]);            
            _DataAccess.AddParamCmd(ref cmd, "@PersalNumber", SqlDbType.Int, 0, ParameterDirection.Input, args[18]);
            _DataAccess.AddParamCmd(ref cmd, "@EmailAddress", SqlDbType.VarChar, 100, ParameterDirection.Input, args[19]);
            _DataAccess.AddParamCmd(ref cmd, "@Citizen", SqlDbType.Int, 0, ParameterDirection.Input, args[20]);

            return ExecuteScalaHelper(cmd, "[up_Trainee_Insert]", ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static int TraineeUpdate(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();

            _DataAccess.AddParamCmd(ref cmd, "@UserName", SqlDbType.VarChar, 13, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@IdNumber", SqlDbType.VarChar, 13, ParameterDirection.Input, args[1]);
            _DataAccess.AddParamCmd(ref cmd, "@Title", SqlDbType.Int, 0, ParameterDirection.Input, args[2]);
            _DataAccess.AddParamCmd(ref cmd, "@Initials", SqlDbType.VarChar, 5, ParameterDirection.Input, args[3]);
            _DataAccess.AddParamCmd(ref cmd, "@Name", SqlDbType.VarChar, 100, ParameterDirection.Input, args[4]);
            _DataAccess.AddParamCmd(ref cmd, "@Surname", SqlDbType.VarChar, 100, ParameterDirection.Input, args[5]);
            _DataAccess.AddParamCmd(ref cmd, "@Gender", SqlDbType.VarChar, 6, ParameterDirection.Input, args[6]);
            _DataAccess.AddParamCmd(ref cmd, "@DateOfBirth", SqlDbType.VarChar, 10, ParameterDirection.Input, args[7]);
            _DataAccess.AddParamCmd(ref cmd, "@PositionId", SqlDbType.Int, 0, ParameterDirection.Input, args[8]);
            _DataAccess.AddParamCmd(ref cmd, "@Race", SqlDbType.Int, 0, ParameterDirection.Input, args[9]);
            _DataAccess.AddParamCmd(ref cmd, "@Language", SqlDbType.Int, 0, ParameterDirection.Input, args[10]);
            _DataAccess.AddParamCmd(ref cmd, "@CellPhoneNumber", SqlDbType.VarChar, 10, ParameterDirection.Input, args[11]);
            _DataAccess.AddParamCmd(ref cmd, "@TelephoneNumber", SqlDbType.VarChar, 10, ParameterDirection.Input, args[12]);
            _DataAccess.AddParamCmd(ref cmd, "@SACENumber", SqlDbType.Int, 0, ParameterDirection.Input, args[13]);
            _DataAccess.AddParamCmd(ref cmd, "@Age", SqlDbType.Int, 0, ParameterDirection.Input, args[14]);
            _DataAccess.AddParamCmd(ref cmd, "@Nationality", SqlDbType.Int, 0, ParameterDirection.Input, args[15]);
            _DataAccess.AddParamCmd(ref cmd, "@Disability", SqlDbType.Int, 0, ParameterDirection.Input, args[16]);
            _DataAccess.AddParamCmd(ref cmd, "@DisabilityType", SqlDbType.Int, 0, ParameterDirection.Input, args[17]);
            _DataAccess.AddParamCmd(ref cmd, "@Citizen", SqlDbType.Int, 0, ParameterDirection.Input, args[19]);

            return ExecuteScalaHelper(cmd, "[up_Trainee_Update]", ref errorMessage, MethodBase.GetCurrentMethod);
        }

        public static int SaveTraineePersonalDetails(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();

            _DataAccess.AddParamCmd(ref cmd, "@UserName", SqlDbType.VarChar, 13, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@IdNumber", SqlDbType.VarChar, 13, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@Title", SqlDbType.Int, 0, ParameterDirection.Input, args[1]);
            _DataAccess.AddParamCmd(ref cmd, "@Initials", SqlDbType.VarChar, 5, ParameterDirection.Input, args[2]);
            _DataAccess.AddParamCmd(ref cmd, "@Name", SqlDbType.VarChar, 100, ParameterDirection.Input, args[3]);
            _DataAccess.AddParamCmd(ref cmd, "@Surname", SqlDbType.VarChar, 100, ParameterDirection.Input, args[4]);
            _DataAccess.AddParamCmd(ref cmd, "@Gender", SqlDbType.VarChar, 6, ParameterDirection.Input, args[5]);
            _DataAccess.AddParamCmd(ref cmd, "@Citizen", SqlDbType.Int, 0, ParameterDirection.Input, args[6]);
            _DataAccess.AddParamCmd(ref cmd, "@DateOfBirth", SqlDbType.VarChar, 10, ParameterDirection.Input, args[7]);
            _DataAccess.AddParamCmd(ref cmd, "@PositionId", SqlDbType.Int, 0, ParameterDirection.Input, args[8]);
            _DataAccess.AddParamCmd(ref cmd, "@Race", SqlDbType.Int, 0, ParameterDirection.Input, args[9]);
            _DataAccess.AddParamCmd(ref cmd, "@Language", SqlDbType.Int, 0, ParameterDirection.Input, args[10]);
            _DataAccess.AddParamCmd(ref cmd, "@CellPhoneNumber", SqlDbType.VarChar, 10, ParameterDirection.Input, args[11]);
            _DataAccess.AddParamCmd(ref cmd, "@TelephoneNumber", SqlDbType.VarChar, 10, ParameterDirection.Input, args[12]);
            _DataAccess.AddParamCmd(ref cmd, "@SACENumber", SqlDbType.Int, 0, ParameterDirection.Input, args[13]);
            _DataAccess.AddParamCmd(ref cmd, "@Age", SqlDbType.Int, 0, ParameterDirection.Input, args[14]);
            _DataAccess.AddParamCmd(ref cmd, "@Nationality", SqlDbType.Int, 0, ParameterDirection.Input, args[15]);
            _DataAccess.AddParamCmd(ref cmd, "@Disability", SqlDbType.Int, 0, ParameterDirection.Input, args[16]);
            _DataAccess.AddParamCmd(ref cmd, "@DisabilityType", SqlDbType.Int, 0, ParameterDirection.Input, args[17]);
            _DataAccess.AddParamCmd(ref cmd, "@PersalNumber", SqlDbType.Int, 0, ParameterDirection.Input, args[18]);
            _DataAccess.AddParamCmd(ref cmd, "@EmailAddress", SqlDbType.VarChar, 100, ParameterDirection.Input, args[19]);
            _DataAccess.AddParamCmd(ref cmd, "@ID", SqlDbType.Int, 0, ParameterDirection.Input, args[20]);
            _DataAccess.AddParamCmd(ref cmd, "@LevelTypeId", SqlDbType.Int, 0, ParameterDirection.Input, args[21]);
            
            return ExecuteScalaHelper(cmd, "[up_Trainee_Save]", ref errorMessage, MethodBase.GetCurrentMethod);
        }

        public static DataTable TraineeByIdNumber(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@IdNumber", SqlDbType.VarChar, 13, ParameterDirection.Input, args[0]);

            return ExecuteReaderHelper(cmd, "[dbo].[up_Trainee_ByIdNumber]", ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static DataTable TraineeByEnrolId(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@EnrollId", SqlDbType.Int, 0, ParameterDirection.Input, args[0]);

            return ExecuteReaderHelper(cmd, "[dbo].[up_Trainee_ByEnrolId]", ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static DataTable TraineeByPrincipalIdNumber(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@IdNumber", SqlDbType.VarChar, 13, ParameterDirection.Input, args[0]);

            return ExecuteReaderHelper(cmd, "[dbo].[up_Trainees_ByPrincipalIdNumber]", ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }
        
        #endregion
        #region "Employee"
        public static int EmployeeInsert(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            
            _DataAccess.AddParamCmd(ref cmd, "@IdNumber", SqlDbType.VarChar, 13, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@Nationality", SqlDbType.Int, 0, ParameterDirection.Input, args[1]);
            _DataAccess.AddParamCmd(ref cmd, "@PersalNumber", SqlDbType.VarChar, 10, ParameterDirection.Input, args[2]);
            _DataAccess.AddParamCmd(ref cmd, "@Title", SqlDbType.Int, 0, ParameterDirection.Input, args[3]);
            _DataAccess.AddParamCmd(ref cmd, "@Initials", SqlDbType.VarChar, 5, ParameterDirection.Input, args[4]);
            _DataAccess.AddParamCmd(ref cmd, "@Name", SqlDbType.VarChar, 100, ParameterDirection.Input, args[5]);
            _DataAccess.AddParamCmd(ref cmd, "@Surname", SqlDbType.VarChar, 100, ParameterDirection.Input, args[6]);
            _DataAccess.AddParamCmd(ref cmd, "@Gender", SqlDbType.VarChar, 6, ParameterDirection.Input, args[7]);
            _DataAccess.AddParamCmd(ref cmd, "@EmailAddress", SqlDbType.VarChar, 100, ParameterDirection.Input, args[8]);
            _DataAccess.AddParamCmd(ref cmd, "@CellPhone", SqlDbType.VarChar, 10, ParameterDirection.Input, args[9]);
            _DataAccess.AddParamCmd(ref cmd, "@TelephoneNumber", SqlDbType.VarChar, 10, ParameterDirection.Input, args[10]);
            _DataAccess.AddParamCmd(ref cmd, "@Langauge", SqlDbType.Int, 0, ParameterDirection.Input, args[11]);
            _DataAccess.AddParamCmd(ref cmd, "@Race", SqlDbType.Int, 0, ParameterDirection.Input, args[12]);
            _DataAccess.AddParamCmd(ref cmd, "@Age", SqlDbType.Int, 0, ParameterDirection.Input, args[13]);          
            _DataAccess.AddParamCmd(ref cmd, "@Disability", SqlDbType.Int, 0, ParameterDirection.Input, args[14]);
            _DataAccess.AddParamCmd(ref cmd, "@DisabilityType", SqlDbType.Int, 0, ParameterDirection.Input, args[15]);
            _DataAccess.AddParamCmd(ref cmd, "@LevelId", SqlDbType.Int, 0, ParameterDirection.Input, args[16]);
            _DataAccess.AddParamCmd(ref cmd, "@DistrictId", SqlDbType.Int, 0, ParameterDirection.Input, args[17]);
            _DataAccess.AddParamCmd(ref cmd, "@PositionId", SqlDbType.Int, 0, ParameterDirection.Input, args[18]);
            _DataAccess.AddParamCmd(ref cmd, "@UserId", SqlDbType.NVarChar, 128, ParameterDirection.Input, args[19]);
            _DataAccess.AddParamCmd(ref cmd, "@CreatedById", SqlDbType.NVarChar, 128, ParameterDirection.Input, args[20]);
           

            return ExecuteScalaHelper(cmd, "[up_User_Insert]", ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static int EmployeeUpdate(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();

            _DataAccess.AddParamCmd(ref cmd, "@IdNumber", SqlDbType.VarChar, 13, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@Nationality", SqlDbType.Int, 0, ParameterDirection.Input, args[1]);
            _DataAccess.AddParamCmd(ref cmd, "@PersalNumber", SqlDbType.VarChar, 10, ParameterDirection.Input, args[2]);
            _DataAccess.AddParamCmd(ref cmd, "@Title", SqlDbType.Int, 0, ParameterDirection.Input, args[3]);
            _DataAccess.AddParamCmd(ref cmd, "@Initials", SqlDbType.VarChar, 5, ParameterDirection.Input, args[4]);
            _DataAccess.AddParamCmd(ref cmd, "@Name", SqlDbType.VarChar, 100, ParameterDirection.Input, args[5]);
            _DataAccess.AddParamCmd(ref cmd, "@Surname", SqlDbType.VarChar, 100, ParameterDirection.Input, args[6]);
            _DataAccess.AddParamCmd(ref cmd, "@Age", SqlDbType.Int, 0, ParameterDirection.Input, args[7]);
            _DataAccess.AddParamCmd(ref cmd, "@Gender", SqlDbType.VarChar, 6, ParameterDirection.Input, args[8]);
            _DataAccess.AddParamCmd(ref cmd, "@Race", SqlDbType.Int, 0, ParameterDirection.Input, args[9]);
            _DataAccess.AddParamCmd(ref cmd, "@Langauge", SqlDbType.Int, 0, ParameterDirection.Input, args[10]);
            _DataAccess.AddParamCmd(ref cmd, "@EmailAddress", SqlDbType.VarChar, 100, ParameterDirection.Input, args[11]);
            _DataAccess.AddParamCmd(ref cmd, "@CellPhone", SqlDbType.VarChar, 10, ParameterDirection.Input, args[12]);
            _DataAccess.AddParamCmd(ref cmd, "@TelephoneNumber", SqlDbType.VarChar, 10, ParameterDirection.Input, args[13]);
            _DataAccess.AddParamCmd(ref cmd, "@Disability", SqlDbType.Int, 0, ParameterDirection.Input, args[14]);
            _DataAccess.AddParamCmd(ref cmd, "@DisabilityType", SqlDbType.Int, 0, ParameterDirection.Input, args[15]);
            _DataAccess.AddParamCmd(ref cmd, "@LevelId", SqlDbType.Int, 0, ParameterDirection.Input, args[16]);
            _DataAccess.AddParamCmd(ref cmd, "@DistrictId", SqlDbType.Int, 0, ParameterDirection.Input, args[17]);
            _DataAccess.AddParamCmd(ref cmd, "@PositionId", SqlDbType.Int, 0, ParameterDirection.Input, args[18]);
            _DataAccess.AddParamCmd(ref cmd, "@UserId", SqlDbType.NVarChar, 128, ParameterDirection.Input, args[19]);
            _DataAccess.AddParamCmd(ref cmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, args[20]);


            return ExecuteScalaHelper(cmd, "[up_User_Update]", ref errorMessage, MethodBase.GetCurrentMethod);
        }

        public static DataTable EmployeeByNothing(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();            

            return ExecuteReaderHelper(cmd, "[up_User_ByNothing]", ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static DataTable EmployeeById(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, args[0]);
            return ExecuteReaderHelper(cmd, "[up_User_ById]", ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static DataTable EmployeeByIdNumber(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@IdNumber", SqlDbType.VarChar, 13, ParameterDirection.Input, args[0]);
            return ExecuteReaderHelper(cmd, "[up_User_ByIdNumber]", ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }
        
        public static int EmployeeDeleteById(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, args[0]);
            return ExecuteScalaHelper(cmd, "[up_User_Delete]", ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static int EmployeeResetPasswordInsert(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@UserId", SqlDbType.VarChar, 128, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@Code", SqlDbType.Int, 0, ParameterDirection.Input, args[1]);
            return ExecuteScalaHelper(cmd, "[up_ResetPassword_Insert]", ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static int EmployeeResetPasswordUpdate(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@UserId", SqlDbType.VarChar, 128, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@Code", SqlDbType.Int, 0, ParameterDirection.Input, args[1]);
            return ExecuteScalaHelper(cmd, "[up_ResetPassword_Update]", ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static DataTable EmployeeResetPasswordCodeByUserIdAndCode(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@UserId", SqlDbType.VarChar, 128, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@Code", SqlDbType.Int, 0, ParameterDirection.Input, args[1]);
            return ExecuteReaderHelper(cmd, "[up_ResetPassword_BYUserIdAndCode]", ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }        
        #endregion
        #region "Address"
        public static DataTable AddressByTraineeId(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@TraineeId", SqlDbType.Int, 0, ParameterDirection.Input, args[0]);

            return ExecuteReaderHelper(cmd, "[up_Address_ByTraineeId]", ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static int AddressInsert(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            
            _DataAccess.AddParamCmd(ref cmd, "@UserName", SqlDbType.VarChar, 13, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@StreetName", SqlDbType.VarChar, 100, ParameterDirection.Input, args[1]);
            _DataAccess.AddParamCmd(ref cmd, "@SuburbName", SqlDbType.VarChar, 100, ParameterDirection.Input, args[2]);
            _DataAccess.AddParamCmd(ref cmd, "@PostalCode", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[3]);
            _DataAccess.AddParamCmd(ref cmd, "@PostalAddress", SqlDbType.VarChar, 100, ParameterDirection.Input, args[4]);
            _DataAccess.AddParamCmd(ref cmd, "@PostalAddressNumber", SqlDbType.VarChar, 20, ParameterDirection.Input, args[5]);
            _DataAccess.AddParamCmd(ref cmd, "@PostalAddressSuburbName", SqlDbType.VarChar, 100, ParameterDirection.Input, args[6]);
            _DataAccess.AddParamCmd(ref cmd, "@PostalAddressCode", SqlDbType.SmallInt, 4, ParameterDirection.Input, args[7]);
            _DataAccess.AddParamCmd(ref cmd, "@HouseNumber", SqlDbType.VarChar, 10, ParameterDirection.Input, args[8]);
            _DataAccess.AddParamCmd(ref cmd, "@BuildingName", SqlDbType.VarChar, 100, ParameterDirection.Input, args[9]);            

            return ExecuteScalaHelper(cmd, "[up_Address_Insert]", ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static int AddressUpdate(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();

            _DataAccess.AddParamCmd(ref cmd, "@UserName", SqlDbType.VarChar, 13, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@StreetName", SqlDbType.VarChar, 100, ParameterDirection.Input, args[1]);
            _DataAccess.AddParamCmd(ref cmd, "@SuburbName", SqlDbType.Int, 100, ParameterDirection.Input, args[2]);
            _DataAccess.AddParamCmd(ref cmd, "@PostalCode", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[3]);
            _DataAccess.AddParamCmd(ref cmd, "@PostalAddress", SqlDbType.VarChar, 100, ParameterDirection.Input, args[4]);
            _DataAccess.AddParamCmd(ref cmd, "@PostalAddressNumber", SqlDbType.VarChar, 20, ParameterDirection.Input, args[5]);
            _DataAccess.AddParamCmd(ref cmd, "@PostalAddressSuburbName", SqlDbType.VarChar, 100, ParameterDirection.Input, args[6]);
            _DataAccess.AddParamCmd(ref cmd, "@PostalAddressCode", SqlDbType.SmallInt, 4, ParameterDirection.Input, args[7]);
            _DataAccess.AddParamCmd(ref cmd, "@HouseNumber", SqlDbType.VarChar, 10, ParameterDirection.Input, args[8]);
            _DataAccess.AddParamCmd(ref cmd, "@BuildingName", SqlDbType.VarChar, 100, ParameterDirection.Input, args[9]);            

            return ExecuteScalaHelper(cmd, "[up_Address_Update]", ref errorMessage, MethodBase.GetCurrentMethod);
        }
        #endregion
        #region "Experience"
        public static DataTable ExperienceById(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, args[0]);

            return ExecuteReaderHelper(cmd, "[up_Experience_ById]", ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static DataTable ExperienceByTraineeId(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@TraineeId", SqlDbType.Int, 0, ParameterDirection.Input, args[0]);

            return ExecuteReaderHelper(cmd, "[up_Experience_ByTraineeId]", ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static int ExperienceInsert(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();

            _DataAccess.AddParamCmd(ref cmd, "@TraineeId", SqlDbType.Int, 0, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@CompanyName", SqlDbType.VarChar, 100, ParameterDirection.Input, args[1]);
            _DataAccess.AddParamCmd(ref cmd, "@DateFrom", SqlDbType.DateTime2, 0, ParameterDirection.Input, args[2]);
            _DataAccess.AddParamCmd(ref cmd, "@DateTo", SqlDbType.DateTime2, 0, ParameterDirection.Input,  string.IsNullOrEmpty(args[3])? null:args[3]);
            _DataAccess.AddParamCmd(ref cmd, "@CurrentPosition", SqlDbType.Char, 1, ParameterDirection.Input, args[4]);
            _DataAccess.AddParamCmd(ref cmd, "@EducationSector", SqlDbType.Char, 1, ParameterDirection.Input, args[5]);
            _DataAccess.AddParamCmd(ref cmd, "@Username", SqlDbType.VarChar, 100, ParameterDirection.Input, args[6]);

            return ExecuteScalaHelper(cmd, "[up_Experience_Insert]", ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static int ExperienceUpdate(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();

            _DataAccess.AddParamCmd(ref cmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@CompanyName", SqlDbType.VarChar, 13, ParameterDirection.Input, args[1]);
            _DataAccess.AddParamCmd(ref cmd, "@DateFrom", SqlDbType.VarChar, 100, ParameterDirection.Input, args[2]);
            _DataAccess.AddParamCmd(ref cmd, "@DateTo", SqlDbType.VarChar, 100, ParameterDirection.Input, args[3]);
            _DataAccess.AddParamCmd(ref cmd, "@CurrentPosition", SqlDbType.Char, 1, ParameterDirection.Input, args[4]);
            _DataAccess.AddParamCmd(ref cmd, "@EducationSector", SqlDbType.Char, 1, ParameterDirection.Input, args[5]);
            _DataAccess.AddParamCmd(ref cmd, "@Username", SqlDbType.VarChar, 100, ParameterDirection.Input, args[6]);

            return ExecuteScalaHelper(cmd, "[up_Experience_Update]", ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static int ExperienceDeleteById(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@Username", SqlDbType.VarChar, 100, ParameterDirection.Input, args[1]);

            return ExecuteScalaHelper(cmd, "[up_Experience_Delete]", ref errorMessage, MethodBase.GetCurrentMethod);
        }

        public static int SaveExperience(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();

            _DataAccess.AddParamCmd(ref cmd, "@ID", SqlDbType.Int, 0, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@CompanyName", SqlDbType.VarChar, 250, ParameterDirection.Input, args[1]);
            _DataAccess.AddParamCmd(ref cmd, "@DateFrom", SqlDbType.VarChar, 100, ParameterDirection.Input, args[2]);
            _DataAccess.AddParamCmd(ref cmd, "@DateTo", SqlDbType.VarChar, 100, ParameterDirection.Input, args[3]);
            _DataAccess.AddParamCmd(ref cmd, "@CurrentPosition", SqlDbType.Char, 1, ParameterDirection.Input, args[4]);
            _DataAccess.AddParamCmd(ref cmd, "@EducationSector", SqlDbType.Char, 1, ParameterDirection.Input, args[5]);
            _DataAccess.AddParamCmd(ref cmd, "@Username", SqlDbType.VarChar, 100, ParameterDirection.Input, args[6]);
            _DataAccess.AddParamCmd(ref cmd, "@TraineeID", SqlDbType.VarChar, 100, ParameterDirection.Input, args[7]);
            
            return ExecuteScalaHelper(cmd, "[up_Experience_Save]", ref errorMessage, MethodBase.GetCurrentMethod);
        }

        #endregion
        #region "Qualification"
        public static DataTable QualificationById(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, args[0]);

            return ExecuteReaderHelper(cmd, "[up_Qaulification_ById]", ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static DataTable QualificationByTraineeId(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@TraineeId", SqlDbType.Int, 0, ParameterDirection.Input, args[0]);

            return ExecuteReaderHelper(cmd, "[up_Qaulification_ByTraineeId]", ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static int QualificationInsert(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();

            _DataAccess.AddParamCmd(ref cmd, "@TraineeId", SqlDbType.Int, 0, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@HighestQualificationId", SqlDbType.Int, 0, ParameterDirection.Input, args[1]);
            _DataAccess.AddParamCmd(ref cmd, "@OtherQualification", SqlDbType.VarChar, 100, ParameterDirection.Input, args[2]);
            _DataAccess.AddParamCmd(ref cmd, "@YearCompleted", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[3]);
            _DataAccess.AddParamCmd(ref cmd, "@InstitutionId", SqlDbType.Int, 0, ParameterDirection.Input, args[4]);
            _DataAccess.AddParamCmd(ref cmd, "@OtherInstitution", SqlDbType.VarChar, 100, ParameterDirection.Input, args[5]);
            _DataAccess.AddParamCmd(ref cmd, "@Username", SqlDbType.VarChar, 100, ParameterDirection.Input, args[6]);

            return ExecuteScalaHelper(cmd, "[up_Qualification_Insert]", ref errorMessage, MethodBase.GetCurrentMethod);
        }

        public static int QualificationSave(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();

            _DataAccess.AddParamCmd(ref cmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@TraineeId", SqlDbType.Int, 0, ParameterDirection.Input, args[1]);
            _DataAccess.AddParamCmd(ref cmd, "@HighestQualificationId", SqlDbType.Int, 0, ParameterDirection.Input, args[2]);
            _DataAccess.AddParamCmd(ref cmd, "@OtherQualification", SqlDbType.VarChar, 100, ParameterDirection.Input, args[3]);
            _DataAccess.AddParamCmd(ref cmd, "@YearCompleted", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[4]);
            _DataAccess.AddParamCmd(ref cmd, "@InstitutionId", SqlDbType.Int, 0, ParameterDirection.Input, args[5]);
            _DataAccess.AddParamCmd(ref cmd, "@OtherInstitution", SqlDbType.VarChar, 100, ParameterDirection.Input, args[6]);
            _DataAccess.AddParamCmd(ref cmd, "@Username", SqlDbType.VarChar, 100, ParameterDirection.Input, args[7]);

            return ExecuteScalaHelper(cmd, "[up_Qualification_Save]", ref errorMessage, MethodBase.GetCurrentMethod);
        }

        public static int QualificationUpdate(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();

            _DataAccess.AddParamCmd(ref cmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, args[0]);            
            _DataAccess.AddParamCmd(ref cmd, "@HighestQualificationId", SqlDbType.Int, 0, ParameterDirection.Input, args[1]);
            _DataAccess.AddParamCmd(ref cmd, "@OtherQualification", SqlDbType.VarChar, 100, ParameterDirection.Input, args[2]);
            _DataAccess.AddParamCmd(ref cmd, "@YearCompleted", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[3]);
            _DataAccess.AddParamCmd(ref cmd, "@InstitutionId", SqlDbType.Int, 0, ParameterDirection.Input, args[4]);
            _DataAccess.AddParamCmd(ref cmd, "@OtherInstitution", SqlDbType.VarChar, 100, ParameterDirection.Input, args[5]);
            _DataAccess.AddParamCmd(ref cmd, "@Username", SqlDbType.VarChar, 100, ParameterDirection.Input, args[6]);

            return ExecuteScalaHelper(cmd, "[up_Qualification_Update]", ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static int QualificationDeleteById(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@Username", SqlDbType.VarChar, 100, ParameterDirection.Input, args[1]);

            return ExecuteScalaHelper(cmd, "[up_Qualification_Delete]", ref errorMessage, MethodBase.GetCurrentMethod);
        }        
        #endregion
        #region"NetUsers"
        public static DataTable GetNetUser(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@Id", SqlDbType.VarChar, 13, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@PasswordHash", SqlDbType.VarChar, 128, ParameterDirection.Input, args[1]);
            return ExecuteReaderHelper(cmd, "[Up_GetID_FromNetUsers]", ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }
        #endregion
        #region"User"
        public static DataTable GetUser(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@ID_Num", SqlDbType.VarChar, 13, ParameterDirection.Input, args[0]);
            
            return ExecuteReaderHelper(cmd, "[Up_GetID_FromUsers]", ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }

        public static DataTable ApplicantGet(string[] args,ref int  errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@IDNUMBER", SqlDbType.VarChar, 100, ParameterDirection.Input, args[0]);

            return ExecuteReaderHelper(cmd, "up_User_ByPerIDNo", ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }       

        public static int upUserAdd(string[] args,ref int errorNumber , ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@Name", SqlDbType.VarChar, 100, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@ID_Number", SqlDbType.VarChar, 120, ParameterDirection.Input, args[1]);
            _DataAccess.AddParamCmd(ref cmd, "@EmailAddress", SqlDbType.VarChar, 100, ParameterDirection.Input, args[2]);
            _DataAccess.AddParamCmd(ref cmd, "@FirstName", SqlDbType.VarChar, 100, ParameterDirection.Input, args[3]);
            _DataAccess.AddParamCmd(ref cmd, "@Surname", SqlDbType.VarChar, 100, ParameterDirection.Input, args[3]);
            _DataAccess.AddParamCmd(ref cmd, "@PersalNo", SqlDbType.VarChar, 100, ParameterDirection.Input, args[4]);
            _DataAccess.AddParamCmd(ref cmd, "@Disability", SqlDbType.VarChar, 100, ParameterDirection.Input, args[5]);
            _DataAccess.AddParamCmd(ref cmd, "@Race", SqlDbType.VarChar, 100, ParameterDirection.Input, args[6]);
            _DataAccess.AddParamCmd(ref cmd, "@Age", SqlDbType.VarChar, 100, ParameterDirection.Input, args[7]);
            _DataAccess.AddParamCmd(ref cmd, "@Initials", SqlDbType.VarChar, 100, ParameterDirection.Input, args[8]);
            _DataAccess.AddParamCmd(ref cmd, "@District", SqlDbType.VarChar, 100, ParameterDirection.Input, args[9]);
            _DataAccess.AddParamCmd(ref cmd, "@PostType", SqlDbType.VarChar, 100, ParameterDirection.Input, args[10]);
            _DataAccess.AddParamCmd(ref cmd, "@Nationality", SqlDbType.VarChar, 100, ParameterDirection.Input, args[11]);
            _DataAccess.AddParamCmd(ref cmd, "@RegionDescription", SqlDbType.VarChar, 100, ParameterDirection.Input, args[12]);
            _DataAccess.AddParamCmd(ref cmd, "@Nationality", SqlDbType.VarChar, 100, ParameterDirection.Input, args[13]);
           


            return ExecuteScalaHelper(cmd, "up_user_Add", ref errorMessage, MethodBase.GetCurrentMethod);
        }

        public static DataTable Login(string[] args,ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();

            //_DataAccess.AddParamCmd(ref cmd ,"@IdNumber",SqlDbType.VarChar,13,ParameterDirection.Input,args[0]);
            //    _DataAccess.AddParamCmd(ref cmd ,"@Password",SqlDbType.VarChar,20,ParameterDirection.Input,args[1]);

            _DataAccess.AddParamCmd(ref cmd, "@UserName", SqlDbType.VarChar, 13, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@PasswordHash", SqlDbType.VarChar, 20, ParameterDirection.Input, args[1]);

                return ExecuteReaderHelper(cmd, "[Up_Login_ByUserNameAndPassword]",ref errorNumber,ref errorMessage, MethodBase.GetCurrentMethod);
        }
        #endregion
        #region "Student"
        public static DataTable StudentByID(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();

            return ExecuteReaderHelper(cmd, "UP_STUDENT_BYID", ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }
        #endregion
        #region "Province"
        public static int ProvinceAdd(string[] args,ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();

            _DataAccess.AddParamCmd(ref cmd, "Name", SqlDbType.VarChar, 50, ParameterDirection.Input, args[0]);

            return ExecuteScalaHelper(cmd, "up_Province_Add",ref errorMessage,MethodBase.GetCurrentMethod);

        }
        #endregion
        #region "Lookup"
        public static DataTable LookupByTable(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd,"@table",SqlDbType.VarChar,50,ParameterDirection.Input,args[0]);
            return ExecuteReaderHelper(cmd, "[Lookup].[up_LookupByTableName]", ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }

        public static DataTable LookupByTableAndId(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@table", SqlDbType.VarChar, 50, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, args[1]);
            return ExecuteReaderHelper(cmd, "[Lookup].[up_LookupByTableNameAndId]", ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }
        #endregion
        #region "TrainingSchedule"
        public static DataTable TrainiScheduleByTrainingIdAndScheduleId(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@TrainingId", SqlDbType.Int, 0, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@ScheduleId", SqlDbType.Int, 0, ParameterDirection.Input, args[1]);

            return ExecuteReaderHelper(cmd, "[dbo].[up_TrainingSchedule_ByTrainingIdAndScheduleId]", ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static DataTable TrainiScheduleByIdNumberAndId(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@IdNumber", SqlDbType.VarChar, 13, ParameterDirection.Input, args[1]);

            return ExecuteReaderHelper(cmd, "[dbo].[up_UserTraining_ByIdNumberAndSchuduleId]", ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }        
        public static DataTable TrainingScheduleByIdNumberAndRelatedToId(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@RelatedTo", SqlDbType.Int, 0, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@IdNumber", SqlDbType.VarChar, 13, ParameterDirection.Input, args[1]);

            return ExecuteReaderHelper(cmd, "[up_UserTraining_ByIdNumberAndRelatedToId]", ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static DataTable TrainiScheduleByApproverIdNumberAndEnrollId(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@IdNumber", SqlDbType.VarChar, 13, ParameterDirection.Input, args[1]);

            return ExecuteReaderHelper(cmd, "[dbo].[up_TrainingAwaitingApproval_ByApproverIdNumberAndId]", ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static DataTable TrainingScheduleByInstructorId(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@InstructorId", SqlDbType.NVarChar, 128, ParameterDirection.Input, args[0]);

            return ExecuteReaderHelper(cmd, "[dbo].[up_TrainingSchedule_ByInstructorId]", ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static DataTable TrainingScheduleByScheduleId(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@ScheduleId", SqlDbType.NVarChar, 128, ParameterDirection.Input, args[0]);

            return ExecuteReaderHelper(cmd, "[dbo].[up_TrainingSchedule_ByScheduleId]", ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }
        #endregion
        #region "Attendance Register"           
        public static DataTable AttendanceRegisterById(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@ScheduleId", SqlDbType.NVarChar, 128, ParameterDirection.Input, args[0]);          

            return ExecuteReaderHelper(cmd, "[dbo].[up_AttendanceRegister_ById]", ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static int AttendanceRegisterCheckIn(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@CheckIn", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[1]);

            return ExecuteScalaHelper(cmd, "[dbo].[up_CheckIn_UpdateById]", ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static int AttendanceRegisteCheckOut(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@Id", SqlDbType.Int, 0, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@CheckOut", SqlDbType.SmallInt, 0, ParameterDirection.Input, args[1]);

            return ExecuteScalaHelper(cmd, "[dbo].[up_CheckOut_UpdateById]", ref errorMessage, MethodBase.GetCurrentMethod);
        }

        #endregion



        #region"OTP"
        public static int InsertOTP(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();

            _DataAccess.AddParamCmd(ref cmd, "@Code", SqlDbType.Int, 15, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@UserId", SqlDbType.VarChar, 36, ParameterDirection.Input, args[1]);
            _DataAccess.AddParamCmd(ref cmd, "@CellPhone", SqlDbType.VarChar, 10, ParameterDirection.Input, args[2]);
            _DataAccess.AddParamCmd(ref cmd, "@EmailAddress", SqlDbType.VarChar, 50, ParameterDirection.Input, args[3]);

            return ExecuteScalaHelper(cmd, "[up_OTP_Insert]", ref errorMessage, MethodBase.GetCurrentMethod);
        }

        public static int ConfirmOTP(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();

            _DataAccess.AddParamCmd(ref cmd, "@Code", SqlDbType.Int, 15, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@UserId", SqlDbType.VarChar, 36, ParameterDirection.Input, args[1]);

            return ExecuteScalaHelper(cmd, "[up_OTP_Confirm]", ref errorMessage, MethodBase.GetCurrentMethod);
        }


        #endregion

        #region "Data Access Helpers"
        private static DataTable ExecuteReaderHelper(SqlCommand cmd, string storeProcedure,ref int errorNumber, ref string errorMessage, Func<MethodBase> getCurrentMethod)
        {
            DataTable returnTable = null;            
           
            try
            {
                _DataAccess.AddParamCmd(ref cmd,"@ReturnValue",SqlDbType.Int,0,ParameterDirection.ReturnValue,null);

                _DataAccess.SetCommandType(ref cmd, CommandType.StoredProcedure, storeProcedure);

                returnTable = _DataAccess.ExecuteReaderCmd(ref cmd);

                errorNumber = Convert.ToInt32(cmd.Parameters["@ReturnValue"].Value);
            } 
            catch (Exception ex)
            {
                //TODO:Log error.
                Console.WriteLine(ex);
            }

            finally
            {
                
            }

            return returnTable;
        }
        private static int ExecuteScalaHelper(SqlCommand cmd, string storedProcedure, ref string errorMessage, Func<MethodBase> method)
        {
            int errorNumber = 0;

            try
            {
                _DataAccess.AddParamCmd(ref cmd, "@ReturnValue", SqlDbType.Int,0, ParameterDirection.ReturnValue, null);
                _DataAccess.AddParamCmd(ref cmd, "@Message", SqlDbType.VarChar, 1000, ParameterDirection.Output, null);               
                
                _DataAccess.SetCommandType(ref cmd, CommandType.StoredProcedure, storedProcedure);
                _DataAccess.ExecuteScalarCmd(ref cmd, ref errorNumber);

                errorMessage = (string)(cmd.Parameters["@Message"].Value);
                errorNumber = (int)(cmd.Parameters["@ReturnValue"].Value);
                               
            }
            catch (Exception ex)
            {
                //TODO:Log error.
                Console.WriteLine(ex);
            }

            finally
            {

            }

            return errorNumber;
        }

        #endregion


        #region Levele Types
        public static DataTable LeveleTypePositionsByLevelTypeId(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@levelId", SqlDbType.Int, 0, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@LevelTypeId", SqlDbType.Int, 0, ParameterDirection.Input, args[1]);

            return ExecuteReaderHelper(cmd, "[dbo].[up_LevelTypePositions_ByLevelTypeId]", ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }

        public static DataTable LevelTypesByDistrictId(string[] args, ref int errorNumber, ref string errorMessage)
        {
            SqlCommand cmd = new SqlCommand();
            _DataAccess.AddParamCmd(ref cmd, "@LevelId", SqlDbType.Int, 0, ParameterDirection.Input, args[0]);
            _DataAccess.AddParamCmd(ref cmd, "@DistrictId", SqlDbType.Int, 0, ParameterDirection.Input, args[1]);

            return ExecuteReaderHelper(cmd, "[dbo].[up_LevelTypes_ByDistrictId]", ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }


        #endregion
    }
}
