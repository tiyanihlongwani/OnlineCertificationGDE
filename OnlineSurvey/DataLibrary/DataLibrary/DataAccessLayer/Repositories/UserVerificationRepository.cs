using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataLibrary.Entities;
using DataLibrary.DataAccessLayer;
using DataLibrary.DataAccessLayer.Mappers;
using DataLibrary.DataAccessLayer.Repositories.Interfaces;

namespace DataLibrary.DataAccessLayer.Repositories
{
    public class UserVerificationRepository : IUserVerificationRepository
    {
        public SchoolModel GetSchoolByEMISNo(string emisNo)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.Schools.FirstOrDefault(x => x.EMISNo == emisNo);
                    var results = data.Map();

                    return results;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public SchoolModel GetSchoolByPrincipalDetails(string emisNo, string persalNo, string idNo)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.Schools.FirstOrDefault(x => x.EMISNo == emisNo && x.PrincipalPersalNo == persalNo);
                    var results = data.Map();

                    return results;
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
        public SchoolModel GetSchoolByID(int id)
        {
            try
            {
                using (var context = new Covid19ImpactSurveyEntities())
                {
                    var data = context.Schools.FirstOrDefault(x => x.ID == id);
                    var results = data.Map();

                    return results;
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}
