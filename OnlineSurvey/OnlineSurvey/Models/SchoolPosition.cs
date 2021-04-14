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
    
    public partial class SchoolPosition
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SchoolPosition()
        {
            this.CircuitPositions = new HashSet<CircuitPosition>();
            this.ClusterPositions = new HashSet<ClusterPosition>();
        }
    
        public int Id { get; set; }
        public int SchoolId { get; set; }
        public int PositionId { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CircuitPosition> CircuitPositions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ClusterPosition> ClusterPositions { get; set; }
    }
}