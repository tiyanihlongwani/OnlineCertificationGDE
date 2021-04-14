using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogicLayer
{
    public class Message
    {
        public static string RegistrationSuccessMessage(string[] args)
        {
            StringBuilder sb = new StringBuilder();            

            sb.AppendFormat(string.Format("Dear {0} {1},", args[0], args[1]));
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("This serves to confirm that you have successfully registered on the GDE Teacher Development System.");
            
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("Username: <b> " + args[2] + "<b />");
            sb.AppendFormat("<br />");            
            sb.AppendFormat("Password: <b> " + args[3] + "<b />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>The Teacher Development Team </i></b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>email: support @educatortraining.gauteng.gov.za</i></b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>phone : 011 843 6742 </i></b> ");

            return sb.ToString();
        }
        public static string smsRegistrationSuccessMessage()
        {
            string message = string.Empty;
            message = "Good Day, This serves to confirm that you have successfully registered on the GDE Teacher Development System.";
            return message;
        }

        public static string ForgotPassword(string[] args)
        {
            StringBuilder sb = new StringBuilder();

            sb.AppendFormat(string.Format("Dear {0} {1},", args[0], args[1]));
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("Please click on the link below in order to change your password. (This link is valid for 12 hours only)" );
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("Pass code is:  " + args[2] + Environment.NewLine);
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<a href='" + ConfigurationManager.AppSettings["Url"] + "Pages/Account/ResetPassword.aspx" + "?ResetCode=" + args[2] + "&uid=" + args[3] + "&ut=" + args[4] + "'>Click here to reset password</a>" + Environment.NewLine);
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("* If you did not make this request, you can safely ignore this email.");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>The Teacher Development Team </i></b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>email: support@educatortraining.gauteng.gov.za</i></b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>phone : 011 843 6742 </i></b> ");

            return sb.ToString();
        }

        public static string smsForgotPassword(string code)
        {
            string message = string.Empty;
            message = "Good Day, GDE Teacher Development Reset password Code: " + code;
            return message;
        }
        public static string ForgotPasswordResetSuccess(string[] args)
        {
            StringBuilder sb = new StringBuilder();

            sb.AppendFormat(string.Format("Dear {0} {1},", args[0], args[1]));
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("Your password has been changed recently.");
            sb.AppendFormat("<br />");
            sb.AppendFormat("If you did not request this password change, please contact the support team.");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>The Teacher Development Team </i></b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>email: support@educatortraining.gauteng.gov.za </i></b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>5phone : 011 843 6742 </i></b>");

            return sb.ToString();
        }

        public static string smsForgotPasswordResetSuccess()
        {
            string message = string.Empty;
            message = "Good Day, Teacher Developmentr Application password changed, If you did not request this password change contact customer support team. ";
            return message;
        }
        public static string CancelTrainingConfirmation(string[] args, List<TrainingSchedule> dt)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat(string.Format("Dear {0} {1},", args[0], args[1]));
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("Kindly note that your training programme has been cancelled, See details below:");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("Status: <b>Cancelled</b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<table style='border:1px;border-collapse:collapse;'><th style='border: 1px solid;text-align: left;'>Start Date</th><th style='border: 1px solid;text-align: left;'>End Date</th><th style='border: 1px solid;text-align: left;'>Phase</th><th style='border: 1px solid'>Topic</th><th style='border: 1px solid;text-align: left;'>Venue</th>");
            foreach (TrainingSchedule schedule in dt)
            {
                sb.AppendFormat("<tr><td style='border: 1px solid'>" + schedule.Start_Date + "</td><td style='border: 1px solid'>" + schedule.End_Date + "</td><td style='border: 1px solid'>" + schedule.Phase + "</td><td style='border: 1px solid'>" + schedule.Topic + "</td>" + "</td><td style='border: 1px solid'>" + schedule.Venue + "</td>" + "</tr>");
            }
            sb.AppendFormat("</table>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>The Teacher Development Team </i></b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>email: support@educatortraining.gauteng.gov.za</i></b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>phone : 011 843 6742 </i></b> ");

            return sb.ToString();
        }

        public static string smsCancelTrainingConfirmation()
        {
            string message = string.Empty;
            message = "Good Day, Traininng schedule cancelled, Login to the system to check the details.";
            return message;
        }
        public static string TrainingApproved(string[] args, List<TrainingSchedule> dt)
        {
            StringBuilder sb = new StringBuilder();

            sb.AppendFormat(string.Format("Dear {0} {1},", args[0], args[1]));
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("Kindly note that your request to participate in a professional development training has been approved.See below details:");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("Status: <b>Approved</b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<table style='border:1px;border-collapse:collapse;'><th style='border: 1px solid;text-align: left;'>Start Date</th><th style='border: 1px solid;text-align: left;'>End Date</th><th style='border: 1px solid;text-align: left;'>Phase</th><th style='border: 1px solid'>Topic</th><th style='border: 1px solid;text-align: left;'>Venue</th>");
            foreach (TrainingSchedule schedule in dt)
            {
                sb.AppendFormat("<tr><td style='border: 1px solid'>" + schedule.Start_Date + "</td><td style='border: 1px solid'>" + schedule.End_Date + "</td><td style='border: 1px solid'>" + schedule.Phase + "</td><td style='border: 1px solid'>" + schedule.Topic + "</td>" + "</td><td style='border: 1px solid'>" + schedule.Venue + "</td>" + "</tr>");
            }
            sb.AppendFormat("</table>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>The Teacher Development Team </i></b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>email: support@educatortraining.gauteng.gov.za</i></b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>phone : 011 843 6742 </i></b> ");

            return sb.ToString();
        }
        public static string smsTrainingApproved()
        {
            string message = string.Empty;
            message = "Good Day, Traininng schedule approved, Login to the system to check the details.";
            return message;
        }
        public static string TrainingRejected(string[] args,List<TrainingSchedule> dt)
        {
            StringBuilder sb = new StringBuilder();

            sb.AppendFormat(string.Format("Dear {0} {1},", args[0], args[1]));
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("Kindly note that your request to participate in a professional development training has been rejected. See below details");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");            
            sb.AppendFormat("Status: <b>Rejected</b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("Reason: " + args[2]);
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<table style='border:1px;border-collapse:collapse;'><th style='border: 1px solid;text-align: left;'>Start Date</th><th style='border: 1px solid;text-align: left;'>End Date</th><th style='border: 1px solid;text-align: left;'>Phase</th><th style='border: 1px solid'>Topic</th><th style='border: 1px solid;text-align: left;'>Venue</th>");
            foreach (TrainingSchedule schedule in dt)
            {
                sb.AppendFormat("<tr><td style='border: 1px solid'>" + schedule.Start_Date + "</td><td style='border: 1px solid'>" + schedule.End_Date + "</td><td style='border: 1px solid'>" + schedule.Phase + "</td><td style='border: 1px solid'>" + schedule.Topic + "</td>" + "</td><td style='border: 1px solid'>" + schedule.Venue + "</td>" + "</tr>");
            }
            sb.AppendFormat("</table>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>The Teacher Development Team </i></b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>email: support@educatortraining.gauteng.gov.za</i></b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>phone : 011 843 6742 </i></b> ");

            return sb.ToString();
        }

        public static string smsTrainingRejected()
        {
            string message = string.Empty;
            message = "Good Day, Training schedule has been rejected on the Teacher Development System. Kindly login for more details.";
            return message;
        }

        public static string CourseChanges(string[] args)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append(string.Format("Dear {0} {1},", args[0], args[1]) + Environment.NewLine + Environment.NewLine);


            sb.Append("" + Environment.NewLine);

            sb.AppendFormat(string.Format("Dear {0} {1},", args[0], args[1]));
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("Kindly take note of the following changes pertaining to the training program you have enrolled for: (E.g. The training date for ICT: Mediation of ICT Tool Kit in Foundation Phase has now been changed from 28 August 2019 to 3 September 2019).");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");           
            sb.AppendFormat("<b><i>The Teacher Development Team </i></b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>email: support@educatortraining.gauteng.gov.za</i></b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>phone : 011 843 6742 </i></b> ");

            return sb.ToString();
        }

        public static string TrainingReminder(string[] args)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append(string.Format("Dear {0} {1},", args[0], args[1]) + Environment.NewLine + Environment.NewLine);

            sb.Append("" + Environment.NewLine);

            sb.AppendFormat(string.Format("Dear {0} {1},", args[0], args[1]));
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("You are hereby reminded of the training for (Name of the training programme, e.g.ICT: Mediation of ICT Tool Kit in Foundation Phase) scheduled to take place on the(Date of the training Program) at(Venue).");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>The Teacher Development Team </i></b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>email: support@educatortraining.gauteng.gov.za</i></b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>phone : 011 843 6742 </i></b> ");

            return sb.ToString();
        }

        public static string ChangeOfDetails(string[] args)
        {
            StringBuilder sb = new StringBuilder();

            sb.Append(string.Format("Dear {0} {1},", args[0], args[1]) + Environment.NewLine + Environment.NewLine);


            sb.Append("" + Environment.NewLine);

            sb.AppendFormat(string.Format("Dear {0} {1},", args[0], args[1]));
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("You have successfully updated your details on the system. In an event the details change in the future, kindly update them at any time.");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>The Teacher Development Team </i></b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>email: support@educatortraining.gauteng.gov.za</i></b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>phone : 011 843 6742 </i></b> ");

            return sb.ToString();
        }

        public static string smsChangeOfDetails(string[] args)
        {
            string message = string.Empty;
            message = "Good Day, Teacher development profile details updated successfully.";
            return message;
        }

        public static string ScheduleChanges(string[] args)
        {
            StringBuilder sb = new StringBuilder();

            sb.AppendFormat(string.Format("Dear {0} {1},", args[0], args[1]));
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("Kindly note the following changes made to the training schedule on the system");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");           
            sb.AppendFormat("<b><i>The Teacher Development Team </i></b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>email: support@educatortraining.gauteng.gov.za</i></b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>phone : 011 843 6742 </i></b> ");

            return sb.ToString();
        }

        public static string CourseRegistrationConfirmation(string[] args, List<TrainingSchedule> dt)
        {
            StringBuilder sb = new StringBuilder();

            sb.AppendFormat(string.Format("Dear {0} {1},", args[0], args[1]));
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("You have successfully enrolled for training on Teacher Development System, see training details below:");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("Status: <b>Pending Approval</b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");

            sb.AppendFormat("<table style='border:1px;border-collapse:collapse;'><th style='border: 1px solid;text-align: left;'>Start Date</th><th style='border: 1px solid;text-align: left;'>End Date</th><th style='border: 1px solid;text-align: left;'>Phase</th><th style='border: 1px solid'>Topic</th><th style='border: 1px solid;text-align: left;'>Venue</th>");
            foreach (TrainingSchedule schedule in dt)
            {
                sb.AppendFormat("<tr><td style='border: 1px solid'>" + schedule.Start_Date + "</td><td style='border: 1px solid'>" + schedule.End_Date + "</td><td style='border: 1px solid'>" + schedule.Phase + "</td><td style='border: 1px solid'>" + schedule.Topic + "</td>" + "</td><td style='border: 1px solid'>" + schedule.Venue + "</td>" + "</tr>");
            }
            sb.AppendFormat("</table>");

            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>The Teacher Development Team </i></b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>email: support@educatortraining.gauteng.gov.za</i></b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>phone : 011 843 6742 </i></b> ");

            return sb.ToString();
        }
        public static string smsCourseRegistrationConfirmation()
        {
            string message = string.Empty;
            message = "Good Day, You have successfully enrolled for training on Teacher Development System. Kindly login for more details. " + DateTime.Now;
            return message;
        }
        public static string TrainingAwaitingApproval()
        {
            StringBuilder sb = new StringBuilder();

            sb.AppendFormat(string.Format("Good Day,"));
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("A training request is awaiting your approval on the Teacher Development System. Kindly login to action");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>The Teacher Development Team </i></b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>email: support@educatortraining.gauteng.gov.za</i></b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>phone : 011 843 6742 </i></b> ");

            return sb.ToString();
        }
        public static string smsTrainingAwaitingApproval(string[] args)
        {
            string message = string.Empty;
            message = "Good Day, A training request is awaiting your approval on the Teacher Development System. Kindly login to action." + DateTime.Now;
            return message;
        }

        public static string CreateUserAccountSuccessMessage(string[] args)
        {
            StringBuilder sb = new StringBuilder();

            sb.AppendFormat("Dear User,");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("This serves to confirm that you have successfully registered on the GDE Teacher Development System.");
            sb.AppendFormat("<br />");
            sb.AppendFormat(string.Format("Click <a href=\"{0}\">here</a> or copy-paste the below link in to your browser and enter the following One Time PIN(OTP) to activate you user account.", args[3]));
            sb.AppendFormat("<br />");
            sb.AppendFormat("One Time PIN: <b> " + args[2] + "<b />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("URL: <b>" + args[3] + "<b />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("Username: <b> " + args[0] + "<b />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("Password: <b> " + args[1] + "<b />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>The Teacher Development Team </i></b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>email: support @educatortraining.gauteng.gov.za</i></b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>phone : 011 843 6742 </i></b>");

            return sb.ToString();
        }

        public static string smsCreateUserAccountSuccessMessage(string[] args)
        {
            string message = string.Empty;
        
            message = "Your user account was created successfully on GDE Teacher Development System. OTP: " + args[0] + ", Username: " + args[1] + ", Password: " + args[2];
            return message;
        }

        public static string GenerateOTPSuccessMessage(string[] args)
        {
            StringBuilder sb = new StringBuilder();

            sb.AppendFormat("Dear User,");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("This serves to confirm that the OTP has been reset successfully on the GDE Teacher Development System.");
            sb.AppendFormat("<br />");
            sb.AppendFormat(string.Format("Click <a href=\"{0}\">here</a> or copy-paste the below link in to your browser and enter the following One Time PIN(OTP) to activate you user account.", args[1]));
            sb.AppendFormat("<br />");
            sb.AppendFormat("One Time PIN: <b> " + args[0] + "<b />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("URL: <b>" + args[1] + "<b />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>The Teacher Development Team </i></b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>email: support @educatortraining.gauteng.gov.za</i></b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>phone : 011 843 6742 </i></b>");

            return sb.ToString();
        }

        public static string smsGenerateOTPSuccessMessage(string otp)
        {
            string message = "New OTP number generated successfully on the GDE Teacher Development System. New OTP: " + otp;

            return message;
        }
    }
}
