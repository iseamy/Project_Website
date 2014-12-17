using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Text.RegularExpressions;
using Recaptcha;
using Recaptcha.Design;
using Recaptcha.Web;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        checkSession();
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

    protected void Submit_Registration_Click(object sender, EventArgs e)
    {
        bool validation = emailIsValid(Email_Address.Text);
        errorLabel.ForeColor = System.Drawing.Color.Red;

        if (Email_Address.Text == "")
        {
            errorLabel.Text = "You have not entered an email address";
            errorLabel.Visible = true;
        }
        else if (validation == false)
        {
            errorLabel.Text = "You have not entered a valid email address";
            errorLabel.Visible = true;
        }
        else if (Password_Enter.Text != Password_Verification.Text)
        {
            errorLabel.Text = "The passwords entered do not match";
            errorLabel.Visible = true;
        }
        else
        {
            ExecuteInsert(Time.Text, Email_Address.Text, string.Empty, User_Name.Text, First_Name.Text, Last_Name.Text, Password_Verification.Text);            
        }
    }

    private void ExecuteInsert(string time, string emailAddress, string checkEmailResult, string userName, string firstName, string lastName, string passwordVerification)
    {
        DateTime regComplete = DateTime.Now;
        Email_Address.Text = emailAddress;
        User_Name.Text = userName;
        First_Name.Text = firstName;
        Last_Name.Text = lastName;
        Password_Verification.Text = passwordVerification;
        checkEmailResult = String.Empty;

        string connString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection connReg = new SqlConnection(connString);
        string checkEmail = "SELECT Email_Address from [User] where Email_Address = (@Email_Address)";
        string sqlRegUser = "INSERT INTO [User] (User_Name, First_Name, Last_Name, Email_Address, Password, Subscription_Date) VALUES "
                    + " (@User_Name,@First_Name,@Last_Name,@Email_Address,@Password,@Subscription_Date)";

        if (formVerification.Checked == false)
        {
            errorLabelReg.Text = "Please check the box and click submit to send your registration";
            errorLabelReg.Visible = true;
        }
        else
        {
            try
            {
                connReg.Open();
                SqlCommand cmd2 = new SqlCommand(checkEmail, connReg);
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
                    errorLabel.Text = "This email address has already been registered.";
                    errorLabel.Visible = true;
                }
                else
                {
                    //open sql connection
                    //conn.Open();
                    SqlCommand cmd = new SqlCommand(sqlRegUser, connReg);
                    SqlParameter[] param = new SqlParameter[6];

                    //Add values to array and convert datetime to string
                    param[0] = new SqlParameter("@Email_Address", System.Data.SqlDbType.VarChar, 100);
                    param[1] = new SqlParameter("@Subscription_Date", System.Convert.ToString(regComplete));
                    param[2] = new SqlParameter("@First_Name", System.Data.SqlDbType.VarChar, 50);
                    param[3] = new SqlParameter("@Last_Name", System.Data.SqlDbType.VarChar, 50);
                    param[4] = new SqlParameter("@Password", System.Data.SqlDbType.NVarChar, 50);
                    param[5] = new SqlParameter("@User_Name", System.Data.SqlDbType.NVarChar, 50);

                    param[0].Value = emailAddress;
                    param[1].Value = regComplete;
                    param[2].Value = firstName;
                    param[3].Value = lastName;
                    param[4].Value = passwordVerification;
                    param[5].Value = userName;

                    for (int i = 0; i < param.Length; i++)
                    {
                        cmd.Parameters.Add(param[i]);
                    }

                    cmd.CommandType = System.Data.CommandType.Text;
                    cmd.ExecuteNonQuery();

                    errorLabel.Text = "You have successfully registered as a user";
                    errorLabel.Visible = true;
                    errorLabel.ForeColor = System.Drawing.Color.Green;
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
                connReg.Close();
            }
        }
    }

    private void checkSession()
    {
        if ((Session["EmailFooter"]) != null)
        {
            string emailAddressFooter = (string)(Session["EmailFooter"]);
            Email_Address.Text = Email_Address.Text.Insert(0, emailAddressFooter);
            Session.Abandon();
        }    
    }
}