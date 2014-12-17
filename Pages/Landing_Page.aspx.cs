using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Text.RegularExpressions;
using System.Net;
using System.Net.Mail;


public partial class _Default : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected static bool emailIsValid(string email)
    {
        string expresion;
        expresion = "\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
        if (Regex.IsMatch(email, expresion))
        {
            if (Regex.Replace(email, expresion, string.Empty).Length == 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        else
        {
            return false;
        }
    }

    protected void Submit_EmailAddress_Click(object sender, EventArgs e)
    {
        bool validation = emailIsValid(EmailAddress.Text);
        errorLabel.ForeColor = System.Drawing.Color.Red;

        if (EmailAddress.Text == "")
        {
            errorLabel.Text = "You have not entered an email address";
            errorLabel.Visible = true;
        }
        else if (validation == false)
        {
            errorLabel.Text = "You have not entered a valid email address";
            errorLabel.Visible = true;
        }
        else
        {
            ExecuteInsert(Time.Text, EmailAddress.Text, string.Empty);
        }
    }

    private void ExecuteInsert(string time, string emailAddress, string checkEmailResult)
    {
        DateTime regComplete = DateTime.Now;
        EmailAddress.Text = emailAddress;
        checkEmailResult = String.Empty;

        string connString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection conn = new SqlConnection(connString);
        string checkEmail = "SELECT Email_Address from Email_Signup where Email_Address = (@Email_Address)";
        string sql = "INSERT INTO Email_Signup (Email_Address,Subscription_Date) VALUES "
                    + " (@Email_Address,@Subscription_Date)";

        try
        {
            conn.Open();
            SqlCommand cmd2 = new SqlCommand(checkEmail, conn);
            SqlParameter[] par = new SqlParameter[1];

            //Setting new parameter for @Email_Address
            par[0] = new SqlParameter("@Email_Address", System.Data.SqlDbType.VarChar, 100);
            //Assigning par[0] with value of emailAddress
            par[0].Value = emailAddress;


            for (int i = 0; i < par.Length; i++)
            {
                cmd2.Parameters.Add(par[i]);
            }

            cmd2.CommandType = System.Data.CommandType.Text;
            object ob = cmd2.ExecuteScalar();


            if (ob != null)
            {
                //do nothing
                errorLabel.Text = "Sorry, this email address has already been registered.";
                errorLabel.Visible = true;
            }
            else
            {
                //open sql connection
                //conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlParameter[] param = new SqlParameter[2];

                //Add values to array and convert datetime to string
                param[0] = new SqlParameter("@Email_Address", System.Data.SqlDbType.VarChar, 100);
                param[1] = new SqlParameter("@Subscription_Date", System.Convert.ToString(regComplete));

                param[0].Value = emailAddress;
                param[1].Value = regComplete;

                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = System.Data.CommandType.Text;
                cmd.ExecuteNonQuery();

                errorLabel.Text = "Thanks! Your email address has been added to the mailing list.";
                errorLabel.Visible = true;
                errorLabel.ForeColor = System.Drawing.Color.Green;

                SetConfirmationEmail();
            }
        }
        catch (System.Data.SqlClient.SqlException ex)
        {
            errorLabel.Text = "There is an error. Please try again.";
            //errorLabel.Text = ex.Message;
            errorLabel.Visible = true;
            //string msg = "Insert Error:";
            //msg += ex.Message;
            //throw new Exception(msg);
        }
        finally
        {
            conn.Close();
        }
    }

    public void SetConfirmationEmail()
    {
        string emailAddressToInsert = string.Empty;
        string emailAddressSubmitID = string.Empty; 
        string emailAddressCreationDate  = string.Empty;
        string emailTo = string.Empty;   

        string command = "SELECT * FROM Email_Signup ORDER BY Subscription_Date desc";
        string connString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand();
               
        DataSet ds = new DataSet();
        DataSet dsEmail_Signup = new DataSet();

        try
        {
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.CommandText = command;

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            conn.Open();
            da.Fill(ds);

            //Data to insert into the email template
            emailAddressSubmitID = ds.Tables[0].Rows[0][0].ToString();
            emailAddressToInsert = ds.Tables[0].Rows[0][1].ToString();
            emailAddressCreationDate = ds.Tables[0].Rows[0][2].ToString();
                                                
            emailTo = emailAddressToInsert;                      
        }
        catch
        {
            errorLabel.Text = "There was an error, please try again or contact support.";
            errorLabel.Visible = true;
        }
        finally
        {
            conn.Close();
            SendConfirmationEmail(emailTo);
        }        
    }

    protected void SendConfirmationEmail(string emailTo)
    {        
        var toAddress = emailTo;
        var fromAddress = "test@jonny.co.uk";
        string pAssw0Rd = "rdkfomhJR_15";
        string fromPassword = pAssw0Rd;

        string subject = "Thank you for registering your email address with JustRate";
        string body = "Thank you for registering with JustRate!" + "\n" + "\n";
        body += "By subscribing to our mailing list you benefit from:-" + "\n" + "\n";
        body += "- Getting all the latest student news" + "\n";
        body += "- And most importantly, progress on our website and app!" + "\n" + "\n";
        body += "If you would prefer not to receive any further emails about special offers or other new products and services, then please email ‘Unsubscribe’ to info@justrate.co.uk" + "\n" + "\n" + "\n";
        body += "______________________________________________________________________________________________" + "\n";
        
        body += "This email message is confidential and solely for the use of the intended recipient. If you are not the intended recipient of this email be advised that any use is strictly prohibited." + "\n";
        body += "Please notify the Information Security Officer by email on info@justrate.co.uk and then delete this email and destroy any copies of it. JustRate does not accept responsibility for changes made to this message after it was sent." + "\n";
        body += "To view our privacy policies please visit www.justrate.co.uk.";

		try
		{
        var smtp = new System.Net.Mail.SmtpClient();
        {
            smtp.Host = "smtp.123-reg.co.uk";
            smtp.Port = 25;
            smtp.EnableSsl = false;
            smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            smtp.Credentials = new NetworkCredential("info@justrate.com", fromPassword);
            smtp.Timeout = 20000;
        }
        smtp.Send(fromAddress, toAddress, subject, body);
		}
		catch
		{
			errorLabel.Text = "The email address entered is not correct. Please try again";
			errorLabel.ForeColor = System.Drawing.Color.Red;
            errorLabel.Visible = true;
		}
    }
}


