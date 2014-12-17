using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.SqlTypes;


public partial class User_Controls_Search : System.Web.UI.UserControl
{
    public string houseDetailsList = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void beginSearch_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(searchCriteria.Text))
        {
            //do nothing
        }
        else
        {
            userInputToSession();
        }
    }

    protected void userInputToSession()
    {
        string userSearchInput = searchCriteria.Text;
        Session["userInput"] = userSearchInput;
        Response.Redirect("Search_Results.aspx");
    }
}