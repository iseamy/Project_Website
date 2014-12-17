using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.SqlTypes;

public partial class User_Controls_ActiveUser : System.Web.UI.UserControl
{
    string sessionString = string.Empty;
    string userDetailsList = string.Empty;   
    string userEmailAddress = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {        
        userEmailAddress = getUserLoginDetails();

        DataSet ds = new DataSet();
        sessionString = checkSession();
        if (sessionString != "")
        {
            ds = GetDataSetFromDb("SELECT * FROM [User] WHERE Email_Address = '"+userEmailAddress+"'");             
        }
    }

    protected void LogOut_Click(object sender, EventArgs e)
    {
        Session.Remove("userLoggedIn");
        Session.Remove("userDetails");
        if (HttpContext.Current.Request.Url.AbsolutePath == "/Website/Pages/Rate.aspx")
        {
            Response.Redirect("Home.aspx");
        }
        else
        {
            Response.Redirect(HttpContext.Current.Request.Url.AbsolutePath);
        }
    }

    private string getUserLoginDetails()
    {
        string emailAddress = string.Empty;
        if ((Session["userDetails"]) != null)
        {
            List<string> uDList = Session["userDetails"] as List<string>;
            emailAddress = uDList[0];                                
        }
        return emailAddress;
    }

    private string checkSession()
    {
        string userLoggedIn = string.Empty;
        if ((Session["userLoggedIn"]) != null)
        {
            userLoggedIn = (string)(Session["userLoggedIn"]);
        }     
        return userLoggedIn;       
    }

    public DataSet GetDataSetFromDb(string command)
    {
        string connString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand();

        DataSet ds = new DataSet();
        
        try
        {
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.CommandText = command;

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            conn.Open();
            da.Fill(ds);
            //string userID = ds.Tables[0].Rows[0][0].ToString();
            //string userName = ds.Tables[0].Rows[0][1].ToString();
            string firstName = ds.Tables[0].Rows[0][2].ToString();
            string lastName = ds.Tables[0].Rows[0][3].ToString();
            Lbl_Name.Text = firstName + " " + lastName;
            Lbl_Name.ForeColor = System.Drawing.Color.Green;            
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
            cmd.Dispose();
        }
        return ds;
    }  
}