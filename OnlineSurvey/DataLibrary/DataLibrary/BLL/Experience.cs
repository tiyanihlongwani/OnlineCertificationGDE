using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Reflection;


namespace BusinessLogicLayer
{
    public  class Experience
    {
        public static int errorNumber = 0;
        public static string errorMessage = string.Empty;

        public int Id { get; set; }
        public int TraineeId { get; set; }
        public string CompanyName { get; set; }
        public int Status { get; set; }
        public DateTime DateFrom { get; set; }
        public DateTime? DateTo { get; set; }
        public char CurrentPosition { get; set; }
        public char EducationSector { get; set; }

        public static Experience ById(string Id)
        {
            string[] args = { Id };
            Experience experience = new Experience();
            List<Experience> returnList = Globals.ExecuteReaderList<Experience>(DataAccess.ExperienceById, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);

            if(returnList != null)
            {
                foreach(Experience item in returnList)
                {
                    if(item.Id != 0)
                    {
                        experience.Id = item.Id;
                        experience.CompanyName = item.CompanyName;
                        experience.Status = item.Status;
                        experience.TraineeId = item.TraineeId;
                        experience.DateFrom = item.DateFrom;
                        experience.DateTo = item.DateTo;
                        experience.CurrentPosition = item.CurrentPosition;
                        experience.EducationSector = item.EducationSector;
                    }
                }
            }

            return experience;
        }
        public static List<Experience> ByTraineeId(int traineeId)
        {
            string[] args = { traineeId.ToString() };
            return Globals.ExecuteReaderList<Experience>(DataAccess.ExperienceByTraineeId, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod);
        }
        public static bool Insert(string[] args)
        {
            if(Globals.ExecuteScalar(DataAccess.ExperienceInsert,args, ref errorNumber,ref errorMessage,MethodBase.GetCurrentMethod ) > 0)
            {
                return true;
            }
            return false;
        }
        public static bool Update(string[] args)
        {
            if (Globals.ExecuteScalar(DataAccess.ExperienceUpdate, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod) > 0)
            {
                return true;
            }
            return false;
        }

        public static bool Delete(string[] args)
        {            
            if(Globals.ExecuteScalar(DataAccess.ExperienceDeleteById, args,ref errorNumber,ref errorMessage,MethodBase.GetCurrentMethod ) > 0)
            {
                return true;
            }
            return false;
        }

        public static bool Save(string[] args)
        {
            if (Globals.ExecuteScalar(DataAccess.SaveExperience, args, ref errorNumber, ref errorMessage, MethodBase.GetCurrentMethod) > 0)
            {
                return true;
            }
            return false;
        }
    }
}
