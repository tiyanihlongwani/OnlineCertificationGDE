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
    
    public partial class Enroll
    {
        public int Id { get; set; }
        public int TraineeId { get; set; }
        public int TrainingScheduleId { get; set; }
        public int StatusId { get; set; }
        public System.DateTime LastUpdatedDate { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public string CreatedBy { get; set; }
        public string Approver1 { get; set; }
        public string Approver2 { get; set; }
        public string LastUpdatedBy { get; set; }
        public Nullable<bool> CheckedIn { get; set; }
        public Nullable<bool> CheckedOut { get; set; }
        public Nullable<System.DateTime> CheckInDate { get; set; }
        public Nullable<System.DateTime> CheckOutDate { get; set; }
        public string IntructorId { get; set; }
    
        public virtual Status Status { get; set; }
        public virtual Trainee Trainee { get; set; }
        public virtual TrainingSchedule TrainingSchedule { get; set; }
    }
}
