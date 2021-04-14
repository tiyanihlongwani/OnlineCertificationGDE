using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLibrary.Notification
{
    public static class Message
    {
        public static string UserVerificationEmailMessage(string[] args)
        {
            StringBuilder sb = new StringBuilder();

            sb.AppendFormat("Dear " + args[0]);
            sb.AppendFormat("<br />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("You have successfully verified your user account. Please the One Time PIN to continue.");
            sb.AppendFormat("<br />");
            sb.AppendFormat("One Time PIN: <b> " + args[1] + "<b />");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>The Gauteng Department of Education Team </i></b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>email: support @educatortraining.gauteng.gov.za</i></b>");
            sb.AppendFormat("<br />");
            sb.AppendFormat("<b><i>phone : 011 843 6742 </i></b>");

            return sb.ToString();
        }

        public static string UserVerificationSMSMessage(string[] args)
        {
            string message = string.Empty;

            message = "You have successfully verified your user account on GPEDU Online Survey System. OTP: " + args[0];
            return message;
        }
    }
}
