//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace OnlineSurvey.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ApprovalRoute
    {
        public int Id { get; set; }
        public int FId { get; set; }
        public string Approval1 { get; set; }
        public string Approval2 { get; set; }
        public int LevelId { get; set; }
        public System.DateTime DateCreated { get; set; }
    
        public virtual Level Level { get; set; }
    }
}
