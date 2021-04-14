using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataLibrary.Entities;

namespace DataLibrary.DataAccessLayer.Repositories.Interfaces
{
    public interface IUserVerificationRepository
    {
        SchoolModel GetSchoolByEMISNo(string emisNo);
        SchoolModel GetSchoolByPrincipalDetails(string emisNo, string persalNo, string idNo);
        SchoolModel GetSchoolByID(int id);
    }
}
