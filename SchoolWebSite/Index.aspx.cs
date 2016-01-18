using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using SchoolWebSite.Models;
using System.Net.Mail;

namespace SchoolWebSite
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string output = GenerateCapcha("","","","");
            Capcha.Value = output;
        }

        [WebMethod(EnableSession=true)]
        public static string GenerateCapcha(String name, string email, String contact, string query)
        {
            string randomNumber = System.Guid.NewGuid().ToString().Substring(0, 4);
            string output = string.Empty;
            foreach (char caracter in randomNumber)
            {
                output += " ";
                output += caracter;
            }
            if (!string.IsNullOrEmpty(name))
            {
                insertUserName(name, email, contact, query);
                MailSend(name, email, contact, query);
            }
            return output;
        }

        private static void insertUserName(String name, string email, String contact, string query)
        {
            CustomerQuery customerQuery = new CustomerQuery()
            {
                CustomerName = name,
                Email = email,
                IsQueryResponded = "N",
                Message = query,
                MobileNumber = contact,
                QueryResponse = string.Empty,
                QueryResponseDate = null,
                ReceiveDate = DateTime.Now
            };

            using (var dbContext = new SmarteezDatabaseEntities())
            {
                dbContext.CustomerQueries.Add(customerQuery);
                dbContext.SaveChanges();
            }
        }

        private static void MailSend(String name, string email, String contact, string query)
        {
            try
            {
                System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
                mail.To.Add("vkverma_76@rediffmail.com");
                mail.From = new MailAddress("Info@smarteez.co.in", "Smarteez", System.Text.Encoding.UTF8);
                mail.Subject = "Customer Inquery - Smarteez School";
                mail.SubjectEncoding = System.Text.Encoding.UTF8;
                mail.Body = "Email from WebSite " + Environment.NewLine + "Name:  " + name + Environment.NewLine + "Email:  " + email + Environment.NewLine + "Contact: " + contact + Environment.NewLine + "Query:  " + query;
                mail.BodyEncoding = System.Text.Encoding.UTF8;
                mail.IsBodyHtml = false;
                mail.Priority = MailPriority.High;
                SmtpClient client = new SmtpClient();
                client.Credentials = new System.Net.NetworkCredential("Info@smarteez.co.in", "Vv_Mit20!");
                client.Port = 25;
                client.Host = "mail.smarteez.co.in";
                client.EnableSsl = false;
                client.Send(mail);
            }
            catch (Exception)
            {
                //throw Ex;
            }
        }
    }
}