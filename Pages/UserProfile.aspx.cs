using System;                                  
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.SqlTypes;

/// <summary>
// In order to get this page working fully, there will need to be code checking that when the user clicks on a house,
// it is added to their recently viewed section. Also the most recent post sent should be copied to this profile and a total amount of posts too.
/// </summary>

public partial class Home: System.Web.UI.Page
{
    string userEmailAddress = string.Empty;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        userEmailAddress = getUserLoginDetails();
        DataSet ds = new DataSet();
        ds = GetDataSetFromDb("SELECT * FROM [User] WHERE Email_Address = '" + userEmailAddress + "'"); 
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
            string userID = ds.Tables[0].Rows[0][0].ToString();           
            string userName = ds.Tables[0].Rows[0][1].ToString();
            string firstName = ds.Tables[0].Rows[0][2].ToString();
            string lastName = ds.Tables[0].Rows[0][3].ToString();
            string emailAddress = ds.Tables[0].Rows[0][4].ToString();
            lbl_UserName.Text = userName;
            lbl_Name.Text = firstName + " " + lastName;
            lbl_EmailAddress.Text = emailAddress;
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