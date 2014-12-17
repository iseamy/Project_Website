using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Controls_Header : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        checkSession();
        hideSearchOnHomePage();
    }

    private void checkSession()
    {
        string userLoggedIn = string.Empty;
        if ((Session["userLoggedIn"]) != null)
        {
            userLoggedIn = (string)(Session["userLoggedIn"]);
            //IF user is logged in, hide the login control and show the active user control
            Login.Visible = false;
            ActiveUser.Visible = true;
        }
    }

    private void hideSearchOnHomePage()
    {
        if (HttpContext.Current.Request.Url.AbsolutePath == "/Website/Pages/Home.aspx")
        {
            Search1.Visible = false;
        }       
    }
}