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
    
    public partial class Training
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Training()
        {
            this.TrainingSchedules = new HashSet<TrainingSchedule>();
        }
    
        public int Id { get; set; }
        public string Topic { get; set; }
        public int PhaseSubjectId { get; set; }
        public int SubjectProjectId { get; set; }
    
        public virtual PhaseSubject PhaseSubject { get; set; }
        public virtual SubjectProject SubjectProject { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TrainingSchedule> TrainingSchedules { get; set; }
    }
}
