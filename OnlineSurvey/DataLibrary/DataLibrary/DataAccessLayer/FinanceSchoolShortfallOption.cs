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
    
    public partial class FinanceSchoolShortfallOption
    {
        public System.Guid ID { get; set; }
        public int FinanceID { get; set; }
        public int ShortfallOptionID { get; set; }
    
        public virtual Finance Finance { get; set; }
    }
}
