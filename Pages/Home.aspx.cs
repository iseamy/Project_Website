using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void beginSearch_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(searchCriteriaHomePage.Text))
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
        string userSearchInput = searchCriteriaHomePage.Text;
        Session["userInput"] = userSearchInput;
        Response.Redirect("Search_Results.aspx");
    }
}

