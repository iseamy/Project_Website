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

public partial class User_Controls_Login : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
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
            userLogin(Email_Address.Text, Password.Text, string.Empty);
        }
    }

    protected void userLogin(string emailAddress, string userPassword, string UserID)
    {
        Email_Address.Text = emailAddress;
        Password.Text = userPassword;
        UserID = string.Empty;
        DataSet getUserIDFromLoginDetails = new DataSet();

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

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(getUserIDFromLoginDetails);
            UserID = getUserIDFromLoginDetails.Tables[0].Rows[0][0].ToString();

            cmd.CommandType = System.Data.CommandType.Text;
            object ob = cmd.ExecuteScalar();

            var userDetailsList = new List<string>();
            userDetailsList.Add(emailAddress);
            userDetailsList.Add(userPassword);
            userDetailsList.Add(UserID);
            

            if (ob != null)
            {
                //login
                string userLoggedIn = "Login=True&Session=Active";                
                Session["userDetails"] = userDetailsList;
                Session["userLoggedIn"] = userLoggedIn;
                if (HttpContext.Current.Request.Url.AbsolutePath == "/Website/Pages/LoginMain.aspx")
                {
                    Response.Redirect("Rate.aspx");
                }
                else
                {
                    Response.Redirect(HttpContext.Current.Request.Url.AbsolutePath);
                }
            }
            else
            {                
                Response.Redirect("LoginMain.aspx?Login=Failed");                
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

}