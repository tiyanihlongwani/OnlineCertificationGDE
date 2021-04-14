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
    
    public partial class Circuit
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Circuit()
        {
            this.CircuitPositions = new HashSet<CircuitPosition>();
            this.Clusters = new HashSet<Cluster>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public int FId { get; set; }
    
        public virtual District District { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CircuitPosition> CircuitPositions { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Cluster> Clusters { get; set; }
    }
}