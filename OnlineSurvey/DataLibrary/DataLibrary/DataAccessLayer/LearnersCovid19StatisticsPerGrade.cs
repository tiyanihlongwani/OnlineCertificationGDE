//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataLibrary.DataAccessLayer
{
    using System;
    using System.Collections.Generic;
    
    public partial class LearnersCovid19StatisticsPerGrade
    {
        public int ID { get; set; }
        public int NoOfConfirmedInfectionsMale { get; set; }
        public int NoOfConfirmedInfectionsFemale { get; set; }
        public int NoOfConfirmedRecoveriesMale { get; set; }
        public int NoOfConfirmedRecoveriesFemale { get; set; }
        public int NoOfConfirmedDeathsMale { get; set; }
        public int NoOfConfirmedDeathsFemale { get; set; }
        public string Grade { get; set; }
        public int SchoolID { get; set; }
        public System.DateTime DateLogged { get; set; }
    
        public virtual School School { get; set; }
    }
}