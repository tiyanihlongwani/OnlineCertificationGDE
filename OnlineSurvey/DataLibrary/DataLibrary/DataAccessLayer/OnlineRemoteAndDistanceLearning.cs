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
    
    public partial class OnlineRemoteAndDistanceLearning
    {
        public int ID { get; set; }
        public int ModeID { get; set; }
        public bool PrePrimary { get; set; }
        public bool Primary { get; set; }
        public bool Secondary { get; set; }
        public int SchoolID { get; set; }
        public System.DateTime DateLogged { get; set; }
    
        public virtual School School { get; set; }
    }
}