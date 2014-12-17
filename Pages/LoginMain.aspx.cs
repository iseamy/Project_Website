using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {          
        checkURLForLogin();
    }

    protected void LoginButton_Click(object sender, EventArgs e)
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
        else if (Password.Text == "")
        {
            errorLabel.Text = "You have not entered a password";
            errorLabel.Visible = true;
        }
        else
        {
            userLogin(Email_Address.Text, Password.Text);
        }
    }

    protected void userLogin(string emailAddress, string userPassword)
    {
        Email_Address.Text = emailAddress;
        Password.Text = userPassword;

        string connString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection conn = new SqlConnection(connString);
        string checkuser = "SELECT * FROM [User] WHERE Email_Address = (@Email_Address) AND Password = (@Password)";

        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand(checkuser, conn);
            SqlParameter[] par = new SqlParameter[2];

            //Setting parameters for @Email_Address and @Password
            par[0] = new SqlParameter("@Email_Address", System.Data.SqlDbType.VarChar, 100);
            par[0].Value = emailAddress;
            par[1] = new SqlParameter("@Password", System.Data.SqlDbType.VarChar, 100);
            par[1].Value = userPassword;

            for (int i = 0; i < par.Length; i++)
            {
                cmd.Parameters.Add(par[i]);
            }

            cmd.CommandType = System.Data.CommandType.Text;
            object ob = cmd.ExecuteScalar();

            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            string userIDToList = ds.Tables[0].Rows[0][0].ToString();  

            var userDetailsList = new List<string>();
            userDetailsList.Add(emailAddress);
            userDetailsList.Add(userPassword);
            userDetailsList.Add(userIDToList);

            if (ob != null)
            {
                //login
                string userLoggedIn = "Login=True&Session=Active";
                Session["userLoggedIn"] = userLoggedIn;
                Session["userDetails"] = userDetailsList;
                Response.Redirect("Rate.aspx");       
            }
            else
            {
                //do nothing
                errorLabel.Text = "Login Failed. Please try again.";
                errorLabel.Visible = true;
            }
        }
        catch (System.Data.SqlClient.SqlException ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }

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

    protected void checkURLForLogin()
    {
        //check query string to see if it contains false. if it does, display error label
        if (Request.QueryString["Login"] == "Failed")
        {
            //display error message
            errorLabel.Text = "Login failed, please try again.";
            errorLabel.Visible = true;
        }
        else if (Request.QueryString["Login"] == "False")
        {            
            errorLabel.Text = "You must have a JustRate user profile to continue; enter your login details below.";
            errorLabel.Visible = true;            
        }      
    }
}