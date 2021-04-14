using DataAccessLayer;
using System.Collections.Generic;
using System.Reflection;

namespace BusinessLogicLayer
{
    public  class Qualification
    {
        public static int errorNumber = 0;
        public static string errorMessage = string.Empty;

        public int Id { get; set; }
        public int TraineeId { get; set; }
        public int HighestQualificationId { get; set; }
        public string OtherQualification { get; set; }
        public string HighestQualificationName { get; set; }
        public int Status { get; set; }
        public int YearCompleted { get; set; }
        public int InstitutionId { get; set; }
        public string OtherInstitution { get; set; }
        public string InstitutionName { get; set; }
        public int YearCompletedId { get; set; }

        public static Qualification ById(string Id)
        {
            string[] args = { Id };
            Qualification qualification = new Qualification();
            List<Qualification> returnList = Globals.ExecuteReaderList<Qualification>(DataAccess.QualificationById, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);

            if(returnList != null)
            {
                foreach(Qualification item in returnList)
                {
                    if(item.Id != 0)
                    {
                        qualification.Id = item.Id;
                        qualification.HighestQualificationId = item.HighestQualificationId;
                        qualification.OtherQualification = item.OtherQualification;
                        qualification.Status = item.Status;
                        qualification.TraineeId = item.TraineeId;
                        qualification.YearCompleted = item.YearCompleted;
                        qualification.InstitutionId = item.InstitutionId;
                        qualification.OtherInstitution = item.OtherInstitution;
                        qualification.HighestQualificationName = item.HighestQualificationName;
                        qualification.InstitutionName = item.InstitutionName;
                        qualification.YearCompletedId = item.YearCompletedId;
                    }
                }
            }

            return qualification;
        }
        public static List<Qualification> ByTraineeId(int traineeId)
        {
            string[] args = { traineeId.ToString() };
            return Globals.ExecuteReaderList<Qualification>(DataAccess.QualificationByTraineeId, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static bool Insert(string[] args)
        {
            if(Globals.ExecuteScalar(DataAccess.QualificationInsert,args, ref errorNumber,ref errorMessage,MethodBase.GetCurrentMethod ) > 0)
            {
                return true;
            }
            return false;
        }
        public static bool Update(string[] args)
        {
            if (Globals.ExecuteScalar(DataAccess.QualificationUpdate, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod) > 0)
            {
                return true;
            }
            return false;
        }
        public static bool Save(string[] args)
        {
            if (Globals.ExecuteScalar(DataAccess.QualificationSave, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod) > 0)
            {
                return true;
            }
            return false;
        }
        public static bool Delete(string[] args)
        {            
            if (Globals.ExecuteScalar(DataAccess.QualificationDeleteById,args,ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod) > 0)
            {
                return true;
            }

            return false;
        }
    }
}
