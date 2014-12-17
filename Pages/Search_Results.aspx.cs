using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.SqlTypes;

public partial class Search_Results : System.Web.UI.Page
{
    public string userSearchInput;
    string sessionString = string.Empty;
    double overallRatingPercentageForHouse;
    int SelectedPage;
       
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSet housesFromUserInput = new DataSet();        
        sessionString = checkSession();
        if (sessionString != "")
        {
            housesFromUserInput = GetHousesDataSetFromDb("SELECT * FROM Houses WHERE HouseNo LIKE '%" + sessionString + "%' OR StreetName LIKE '%" + sessionString + "%' OR Area LIKE '%" + sessionString + "%' OR PostCode LIKE '%" + sessionString + "%' OR NoOfBeds LIKE '%" + sessionString + "%'");
        }        
    }

    private string checkSession()
    {
        string userSearchInput = string.Empty;
        if ((Session["userInput"]) != null)
        {
            userSearchInput = (string)(Session["userInput"]);
            //Session.Remove("userInput");            
        }
        return userSearchInput;
    }

    public DataSet GetHousesDataSetFromDb(string command)
    {    
        //function returns all houses that match the users input
        string connString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand();

        string houseID = string.Empty;
        string reviewTitle = string.Empty;
        DataSet housesFromUserInput = new DataSet();   
               
        try
        {
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.CommandText = command;
            
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            conn.Open();
            da.Fill(housesFromUserInput);

            foreach (DataRow dr in housesFromUserInput.Tables[0].Rows)
            {
                houseID += dr["HouseID"].ToString() + ",";               
            }
            //houseid of all returned houses in a string
            houseID = houseID.TrimEnd(',');

            if (houseID == "")
            {
                searchResultsEmpty.Text = "Sorry, no results have been found. Please try again.";
                searchResultsEmpty.Visible = true;
            }            
            else
            {               
                searchResultsEmpty.Visible = false;            
                populateRepeaterWithReturnedHouseIDs(houseID);
            }
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
        return housesFromUserInput;        
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        // Find current page
        int SelectedPage = 0;
        if (ViewState["SelectedPage"] != null)
            SelectedPage = (int)ViewState["SelectedPage"];

        // Find next page index
        SelectedPage += 1;
        BindData(SelectedPage, string.Empty);
    }

    protected void btnPrevious_Click(object sender, EventArgs e)
    {
        // Find current page
        int SelectedPage = 0;
        if (ViewState["SelectedPage"] != null)
            SelectedPage = (int)ViewState["SelectedPage"];

        // Find previous page index
        SelectedPage -= 1;
        BindData(SelectedPage, string.Empty);
    }

    private void BindData(int SelectedPage, string houseID)
    {
       //// Step 1: Connect to database and load data
       //string connString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
       //SqlConnection conn = new SqlConnection(connString);       
       //conn.Open();
       //DataTable dt = new DataTable();
       //string SqlQuery = "SELECT * FROM Houses INNER JOIN Review on Houses.HouseID=Review.HouseID INNER JOIN Image_Uploads on Review.HouseID=Image_Uploads.HouseID WHERE Houses.HouseID IN (" + houseID + ") ORDER BY StreetName asc";
       //SqlDataAdapter da = new SqlDataAdapter(SqlQuery, conn);
       //da.Fill(dt);
 
       //// Step 2: Create PagedDataSource instance and set its properties
       //PagedDataSource pds = new PagedDataSource();
       //pds.DataSource = dt.DefaultView;
       //pds.AllowPaging = true;
       //pds.PageSize = 10;
       //if (SelectedPage > (pds.PageCount - 1))
       //  SelectedPage = pds.PageCount - 1;
       // if (SelectedPage < 0)
       //  SelectedPage = 0;
       //pds.CurrentPageIndex = SelectedPage;
 
       //// Step 3: Bind PagedDataSource to Repeater and set LinkButtons' behavior
       //repeaterControl.DataSource = pds;

       //if (pds.IsLastPage)
       //{
       //    btnNext.Enabled = false;
       //}
       //else
       //{
       //    btnNext.Enabled = true;
       //}

       //if (pds.IsFirstPage)
       //{
       //    btnPrev.Enabled = false;
       //}
       //else
       //{
       //    btnPrev.Enabled = true;
       //}
    }

    private void populateRepeaterWithReturnedHouseIDs(string houseID)
    {
        //BindData(0, houseID);
        string connString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand();

        DataSet allInfoFromDBForResults = new DataSet();

        try
        {
            cmd.CommandText = "SELECT * FROM Houses INNER JOIN Review on Houses.HouseID=Review.HouseID INNER JOIN Image_Uploads on Review.HouseID=Image_Uploads.HouseID WHERE Houses.HouseID IN (" + houseID + ") ORDER BY StreetName asc";
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            conn.Open();

            SqlDataAdapter derp = new SqlDataAdapter(cmd);
            derp.Fill(allInfoFromDBForResults);

            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = allInfoFromDBForResults.Tables[0].DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = 3;
           
            // Step 3: Bind PagedDataSource to Repeater and set LinkButtons' behavior
            repeaterControl.DataSource = pds;
            repeaterControl.DataBind();

            if (SelectedPage > (pds.PageCount - 1))
                SelectedPage = pds.PageCount - 1;
            if (SelectedPage < 0)
                SelectedPage = 0;
            pds.CurrentPageIndex = SelectedPage;

            if (pds.IsLastPage)
            {
                btnNext.Enabled = false;
            }
            else
            {
                btnNext.Enabled = true;
            }

            if (pds.IsFirstPage)
            {
                btnPrev.Enabled = false;
            }
            else
            {
                btnPrev.Enabled = true;
            }
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
    } 
}




//foreach(DataRow row in YourDataTable.Rows)
// { 
//     string name = row["name"].ToString();
//     string description = row["description"].ToString();
//     string icoFileName = row["iconFile"].ToString();
//     string installScript = row["installScript"].ToString();

// }



