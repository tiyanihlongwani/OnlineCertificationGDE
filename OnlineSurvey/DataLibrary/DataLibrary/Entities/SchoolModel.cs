using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.Entities
{
    public class SchoolModel
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string EMISNo { get; set; }
        public string PrincipalName { get; set; }
        public string PrincipalMobileNo { get; set; }
        public string PrincipalPersalNo { get; set; }
        public string PrincipalIdentityNo { get; set; }
        public string DistrictName { get; set; }
        public string DistrictCode { get; set; }
        public string GautengReferenceNumber { get; set; }
        public string InstLevelBudgetaryRequirements { get; set; }
        public string Level { get; set; }
        public string TypeOfInstitution { get; set; }
        public string RelationWithState { get; set; }
        public string Sector { get; set; }
        public string CircuitNo { get; set; }
        public string ClusterNo { get; set; }
        public double? Quintile { get; set; }
        public string NoFee { get; set; }
        public string StreetNo { get; set; }
        public string StreetName { get; set; }
        public string TownshipVillage { get; set; }
        public string Suburb { get; set; }
        public string TownCity { get; set; }
        public string SubPlaceName { get; set; }
        public string MainPlaceName { get; set; }
        public string DistrictMunicipality { get; set; }
        public string LocalMunicipality { get; set; }
        public double? WardNumber { get; set; }
        public string Telephone { get; set; }
        public string SchoolEmailAddress { get; set; }
        public string PrincipalEmailAddress { get; set; }
        public double? Latitude { get; set; }
        public double? Longitude { get; set; }
        public bool IsSurveySubmitted { get; set; }
    }
}
