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
    
    public partial class SubjectObtainedApproval
    {
        public System.Guid ID { get; set; }
        public int SubjectObtainedApprovalID { get; set; }
        public int EducatorsResourcesDetailsID { get; set; }
        public System.DateTime DateLogged { get; set; }
    
        public virtual EducatorsResourcesDetail EducatorsResourcesDetail { get; set; }
        public virtual LookupItem LookupItem { get; set; }
    }
}
