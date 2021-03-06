using System;

namespace HL.Lib.Global
{
    public class Mail
    {
        public static void SendWebMail(string to, string from, string name, string subject, string body)
        {
            System.Web.Mail.MailMessage myMail = new System.Web.Mail.MailMessage();
            myMail.To = to;
            myMail.From = "\"" + name + "\" <" + from + ">";
            myMail.Subject = subject;
            myMail.BodyFormat = System.Web.Mail.MailFormat.Html;
            myMail.BodyEncoding = System.Text.Encoding.UTF8;

            myMail.Body = body;
            try
            {
                System.Web.Mail.SmtpMail.Send(myMail);
            }
            catch (Exception ex)
            {
                HL.Lib.Global.Error.Write("SendWebMail", ex);
            }
        }

        private static void SendWebMail(string sHost, 
            int nPort, 
            string sUserName, 
            string sPassword, 
            string sFromName, 
            string sFromEmail, 
            string sToEmail, 
            string sHeader, 
            string sMessage, 
            bool fSSL)
        {
            try
            {
                if (sFromName == "") 
                    sFromName = sFromEmail;

                System.Web.Mail.MailMessage Mail = new System.Web.Mail.MailMessage();
                Mail.Fields["http://schemas.microsoft.com/cdo/configuration/smtpserver"] = sHost;
                Mail.Fields["http://schemas.microsoft.com/cdo/configuration/sendusing"] = 2;
                Mail.Fields["http://schemas.microsoft.com/cdo/configuration/smtpserverport"] = nPort.ToString();
                if (fSSL) Mail.Fields["http://schemas.microsoft.com/cdo/configuration/smtpusessl"] = "true";

                if (sUserName.Length == 0)
                {
                   
                }
                else
                {
                    Mail.Fields["http://schemas.microsoft.com/cdo/configuration/smtpauthenticate"] = 1;
                    Mail.Fields["http://schemas.microsoft.com/cdo/configuration/sendusername"] = sUserName;
                    Mail.Fields["http://schemas.microsoft.com/cdo/configuration/sendpassword"] = sPassword;
                }

                Mail.To = sToEmail;
                Mail.From = "\"" + sFromName + "\" <" + sFromEmail + ">"; 
                Mail.Subject = sHeader;
                Mail.Body = sMessage;
                Mail.BodyFormat = System.Web.Mail.MailFormat.Html;
                Mail.BodyEncoding = System.Text.Encoding.UTF8;

                System.Web.Mail.SmtpMail.SmtpServer = sHost;
                System.Web.Mail.SmtpMail.Send(Mail);
            }
            catch (Exception ex)
            {
                HL.Lib.Global.Error.Write("SendWebMail", ex);
            }
        }

        public static void SendNetMail(string to, string from, string name, string subject, string body)
        {
            try
            {
                System.Net.Mail.MailMessage myMail = new System.Net.Mail.MailMessage();
                myMail.From = new System.Net.Mail.MailAddress(from, name);
                myMail.To.Add(to);
                myMail.Subject = subject;
                myMail.IsBodyHtml = true;
                myMail.Body = body;
                myMail.BodyEncoding = System.Text.Encoding.UTF8;

                System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient();
                smtp.Send(myMail);
            }
            catch (Exception ex)
            {
                HL.Lib.Global.Error.Write("SendNetMail", ex);
            }
        }

        public static void SendMail(string to, string from, string name, string subject, string body)
        {
            string HostName = HL.Core.Global.Config.GetValue("Mod.SmtpServer").ToString().Trim();
            if (HostName != string.Empty)
            {
                int Port = HL.Core.Global.Config.GetValue("Mod.SmtpPort").ToInt();
                string UserName = HL.Core.Global.Config.GetValue("Mod.SmtpUser").ToString();
                string UserPass = HL.Core.Global.Config.GetValue("Mod.SmtpPass").ToString();
                bool SSL = HL.Core.Global.Config.GetValue("Mod.SmtpSSL").ToBool();

                if (Port < 1)
                    Port = 25;

                SendWebMail(HostName, Port, UserName, UserPass, name, from, to, subject, body, SSL);
            }
            else
            {
                bool IsByNet = HL.Core.Global.Config.GetValue("Mod.MailByNet").ToBool();

                if (!IsByNet) 
                    SendWebMail(to, from, name, subject, body);
                else 
                    SendNetMail(to, from, name, subject, body);
            }
        }
    }
}
