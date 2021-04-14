using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Configuration;
using System.Net;
using System.Reflection;
using System.Text;
using log4net;

namespace DataLibrary.Notification
{
    public static class NotificationHelper
    {
        private readonly static ILog Log = LogManager.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);
        public static bool SendEmail(string toEmailAddress, string subject, string body, string ccEmailAddress = "")
        {
            MailMessage message = new MailMessage();
            SmtpClient smtp = new SmtpClient();
            bool successfull = true;

            try
            {
                message.From = new MailAddress(ConfigurationManager.AppSettings["NonReply"].ToString());
                message.To.Add(new MailAddress(toEmailAddress));
                if (!string.IsNullOrEmpty(ccEmailAddress) && ccEmailAddress != toEmailAddress)
                {
                    message.To.Add(new MailAddress(ccEmailAddress));
                }
                message.Subject = subject;
                message.IsBodyHtml = true;
                message.Body = body;
                message.Priority = MailPriority.High;
                smtp.Host = ConfigurationManager.AppSettings["MailServer"].ToString();
                smtp.UseDefaultCredentials = false;

                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                // string userState = "test message";
                smtp.Send(message);
            }
            catch (SmtpException ex)
            {

                successfull = false;
            }
            catch (Exception ex)
            {

                successfull = false;
            }
            finally
            {
                message.Dispose();
                message = null;
                smtp.Dispose();
                smtp = null;
                GC.Collect();
            }
            return successfull;
        }
        /// <summary>
        /// Still todo.
        /// </summary>
        public static bool SMS(string cellNumber, string message)
        {
            HttpWebRequest myReq = null;
            HttpWebResponse myResp = null;
            // System.IO.StreamReader respStreamReader = null;
            string responseString = string.Empty;
            try
            {
                myReq = (HttpWebRequest)WebRequest.Create(ConfigurationManager.AppSettings["SMSSever"] + "username=" + ConfigurationManager.AppSettings["SMSServerUsername"] + "&password=" + ConfigurationManager.AppSettings["SMSServerPassword"] + "&number=" + cellNumber + "&message=" + message);
                myReq.Proxy = new WebProxy() { UseDefaultCredentials = true };

                myResp = (HttpWebResponse)myReq.GetResponse();
                //respStreamReader = new System.IO.StreamReader(myResp.GetResponseStream());
                //responseString = respStreamReader.ReadToEnd();
                //respStreamReader.Close();
                //myResp.Close();
                return true;
            }
            catch (Exception ex)
            {
                //TODO: Error log 
                StringBuilder sb = new StringBuilder();
                sb.Append(Environment.NewLine);
                sb.Append("Error Message:" + ex.Message + Environment.NewLine);
                sb.Append("Inner Exception:" + ex.InnerException + Environment.NewLine);
                sb.Append("Stack Trace:" + ex.StackTrace + Environment.NewLine);
                sb.Append("CellPhone:" + cellNumber);
                sb.Append("message:" + message);
                sb.Append("end of error----------------------------------------------------------------");
                Log.Error(sb);
                sb.Clear();
                return false;
            }
            finally
            {
                myReq = null;
                // myResp.Dispose();
                //respStreamReader.Dispose();
                //responseString = string.Empty;
                GC.Collect();
            }
        }

    }
}
