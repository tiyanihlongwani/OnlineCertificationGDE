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
    
    public partial class SchoolAdjustmentsToConform
    {
        public System.Guid ID { get; set; }
        public int EnablingConditionsID { get; set; }
        public int AdjustmentToConformID { get; set; }
        public System.DateTime DateLogged { get; set; }
    
        public virtual LookupItem LookupItem { get; set; }
        public virtual EnablingCondition EnablingCondition { get; set; }
    }
}
