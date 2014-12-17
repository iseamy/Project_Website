using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    public string houseDetailsList = "";
    public string userIDString = "";
    public string houseIdToInsert = "";
    public string reviewID = "";
    public string reviewIDAccordion2 = "";
    //public string houseIDNewlyAddedToInsert = "";
    public string houseIDNewlyInserted = "";
    public object accordion1ReviewExists;
    public object accordion2ReviewExists;       
        
    protected void Page_Load(object sender, EventArgs e)
    {
        checkSession();
        userIDString = getUserLoginDetails();
        loadImageExtListAndToolTip();
        DataSet ds = new DataSet();
        ds = getHousesFromDB("SELECT * FROM Houses");
       
    }
        
    private string getUserLoginDetails()
    {
        string userID = string.Empty;
        if ((Session["userDetails"]) != null)
        {
            List<string> uDList = Session["userDetails"] as List<string>;
            userID = uDList[2];
        }
        return userID;
    }

    private void checkSession()
    {
        if ((Session["userLoggedIn"]) != null)
        {
            string userLoggedIn = (string)(Session["userLoggedIn"]);
            userLoggedIn = "true";
        }
        else 
        {
            Response.Redirect("LoginMain.aspx?Login=False");            
        }
    }

    public DataSet getHousesFromDB(string command)
    {
        string connString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand();

        DataSet ds = new DataSet();

        List<string> houseList = new List<string>();

        try
        {
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.CommandText = command;

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            conn.Open();
            da.Fill(ds);

            foreach (DataRow item in ds.Tables[0].Rows)
            {
                string houseNo = item["HouseNo"].ToString();
                string streetName = item["StreetName"].ToString();
                string area = item["Area"].ToString();
                string postCode = item["PostCode"].ToString();
                string noOfBeds = item["NoOfBeds"].ToString();
                //string universityLevel = item["LevelInUni"].ToString();

                if (houseDetailsList == "")
                {
                    houseDetailsList = "\"" + houseNo + " " + streetName + ", " + area + ", " + postCode + "\"";
                }
                else
                {
                    houseDetailsList += ", \"" + houseNo + " " + streetName + ", " + area + ", " + postCode + "\"";
                }
                houseList.Add(houseDetailsList);
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
        return ds;
    }    

    public void loadImageExtListAndToolTip()
    {
        var acceptedFileExtList = new List<string>();
            acceptedFileExtList.Add(".jpg"); acceptedFileExtList.Add(".JPG"); acceptedFileExtList.Add(".jpeg"); acceptedFileExtList.Add(".JPEG"); acceptedFileExtList.Add(".gif"); 
            acceptedFileExtList.Add(".GIF"); acceptedFileExtList.Add(".bmp");  acceptedFileExtList.Add(".BMP"); acceptedFileExtList.Add(".png"); acceptedFileExtList.Add(".PNG");

        string fileExtToString = string.Join(", ", acceptedFileExtList.ToArray());
        buttonUploadReview.ToolTip = "Accepted file types are " + fileExtToString;
        submitHouseDetailsForm.ToolTip = "Accepted file types are " + fileExtToString;
    }
    
    private string getHouseID_FromSearchBoxToInsert()
    {        
        string connString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
        string getHouseID = "SELECT HouseID FROM Houses WHERE HouseNo LIKE @houseNo OR StreetName LIKE @streetName";
        string searchForAHouse = tags.Text;
        string houseNo = "%" + searchForAHouse.Substring(0, 3).Trim() + "%";
        string streetName = "%" + searchForAHouse.Substring(4, 9) + "%";
        DataSet ds = new DataSet(); 

        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand(getHouseID, conn);
        SqlParameter[] par = new SqlParameter[2];
        par[0] = new SqlParameter("@houseNo", System.Data.SqlDbType.VarChar, 3);
        par[1] = new SqlParameter("@streetName", System.Data.SqlDbType.VarChar, 100);
        par[0].Value = houseNo;
        par[1].Value = streetName;

        for (int i = 0; i < par.Length; i++)
        {
            cmd.Parameters.Add(par[i]);
        }

        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(cmd);

        try
        {
            da.Fill(ds);
            houseIdToInsert = ds.Tables[0].Rows[0][0].ToString();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        conn.Close();

        return houseIdToInsert;
    }

    protected void Rating1_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        rating1Value.Text = e.Value;      
    }

    protected void Rating2_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        rating2Value.Text = e.Value;       
    }

    protected void Rating3_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        rating3Value.Text = e.Value;        
    }

    protected void Rating4_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        rating4Value.Text = e.Value;        
    }

    protected void Rating5_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        rating5Value.Text = e.Value;
    }

    protected void Rating6_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        rating6Value.Text = e.Value;
    }

    protected void Rating7_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        rating7Value.Text = e.Value;
    }

    protected void Rating8_Changed(object sender, AjaxControlToolkit.RatingEventArgs e)
    {
        rating8Value.Text = e.Value;
    }

    private void insertReviewToDBAccordion1()
    {
        string insertReview = "INSERT INTO Review (HouseID,User_ID,TitleOfReview,ReviewMessage,LevelInUni,LengthLease,CreationDate,LandlordRelationship,HouseCondition,ParkingCloseby,Amenities) VALUES " + " (@HouseID,@User_ID,@TitleOfReview,@ReviewMessage,@LevelInUni,@LengthLease,@CreationDate,@LandlordRelationship,@HouseCondition,@Parking,@Amenities)";
        string connString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection conn = new SqlConnection(connString);
        DateTime regComplete = DateTime.Now;

        SqlCommand cmd2 = new SqlCommand(insertReview, conn);
        SqlParameter[] par2 = new SqlParameter[11];

        par2[0] = new SqlParameter("@HouseID", System.Data.SqlDbType.Int, 5);
        par2[1] = new SqlParameter("@User_ID", System.Data.SqlDbType.Int, 5);
        par2[2] = new SqlParameter("@TitleOfReview", System.Data.SqlDbType.VarChar, 200);
        par2[3] = new SqlParameter("@ReviewMessage", System.Data.SqlDbType.VarChar, 200);
        par2[4] = new SqlParameter("@LevelInUni", System.Data.SqlDbType.VarChar, 200);
        par2[5] = new SqlParameter("@LengthLease", System.Data.SqlDbType.VarChar, 200);
        par2[6] = new SqlParameter("@CreationDate", System.Convert.ToString(regComplete));
        par2[7] = new SqlParameter("@LandlordRelationship", System.Convert.ToDouble(rating1Value.Text));
        par2[8] = new SqlParameter("@HouseCondition", System.Convert.ToDouble(rating2Value.Text));
        par2[9] = new SqlParameter("@Parking", System.Convert.ToDouble(rating3Value.Text));
        par2[10] = new SqlParameter("@Amenities", System.Convert.ToDouble(rating4Value.Text));

        par2[0].Value = houseIdToInsert;
        par2[1].Value = userIDString;
        par2[2].Value = TitleReview.Text;
        par2[3].Value = ReviewMessage.Text;
        par2[4].Value = UniLevel0.SelectedValue;
        par2[5].Value = LeaseLength0.SelectedValue;
        par2[6].Value = regComplete;
        par2[7].Value = rating1Value.Text;
        par2[8].Value = rating2Value.Text;
        par2[9].Value = rating3Value.Text;
        par2[10].Value = rating4Value.Text;

        for (int i = 0; i < par2.Length; i++)
        {
            cmd2.Parameters.Add(par2[i]);
        }
        conn.Open();
        cmd2.CommandType = System.Data.CommandType.Text;
        cmd2.ExecuteNonQuery();
        conn.Close();

        getReviewIDToInsert();
        calculateOverallRatingAndInsertToDBAccordion1(rating1Value.Text, rating2Value.Text, rating3Value.Text, rating4Value.Text);        
    }

    private void insertReviewToDBAccordion2()
    {
        string insertReview = "INSERT INTO Review (HouseID,User_ID,TitleOfReview,ReviewMessage,LevelInUni,LengthLease,CreationDate,LandlordRelationship,HouseCondition,ParkingCloseby,Amenities) VALUES " + " (@HouseID,@User_ID,@TitleOfReview,@ReviewMessage,@LevelInUni,@LengthLease,@CreationDate,@LandlordRelationship,@HouseCondition,@Parking,@Amenities)";
        string connString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection conn = new SqlConnection(connString);
        DateTime regComplete = DateTime.Now;

        SqlCommand cmd2 = new SqlCommand(insertReview, conn);
        SqlParameter[] par2 = new SqlParameter[11];

        par2[0] = new SqlParameter("@HouseID", System.Data.SqlDbType.Int, 5);
        par2[1] = new SqlParameter("@User_ID", System.Data.SqlDbType.Int, 5);
        par2[2] = new SqlParameter("@TitleOfReview", System.Data.SqlDbType.VarChar, 200);
        par2[3] = new SqlParameter("@ReviewMessage", System.Data.SqlDbType.VarChar, 200);
        par2[4] = new SqlParameter("@LevelInUni", System.Data.SqlDbType.VarChar, 200);
        par2[5] = new SqlParameter("@LengthLease", System.Data.SqlDbType.VarChar, 200);       
        par2[6] = new SqlParameter("@CreationDate", System.Convert.ToString(regComplete));
        par2[7] = new SqlParameter("@LandlordRelationship", System.Convert.ToDouble(rating5Value.Text));
        par2[8] = new SqlParameter("@HouseCondition", System.Convert.ToDouble(rating6Value.Text));
        par2[9] = new SqlParameter("@Parking", System.Convert.ToDouble(rating7Value.Text));
        par2[10] = new SqlParameter("@Amenities", System.Convert.ToDouble(rating8Value.Text));

        par2[0].Value = houseIDNewlyInserted;
        par2[1].Value = userIDString;
        par2[2].Value = TitleOfReview2.Text;
        par2[3].Value = ReviewContent2.Text;
        par2[4].Value = UniLevel2.SelectedValue;
        par2[5].Value = LengthLease2.SelectedValue;
        par2[6].Value = regComplete;
        par2[7].Value = rating5Value.Text;
        par2[8].Value = rating6Value.Text;
        par2[9].Value = rating7Value.Text;
        par2[10].Value = rating8Value.Text;
        
        for (int i = 0; i < par2.Length; i++)
        {
            cmd2.Parameters.Add(par2[i]);
        }
        conn.Open();
        cmd2.CommandType = System.Data.CommandType.Text;
        cmd2.ExecuteNonQuery();
        conn.Close();

        getReviewIDFromAccordion2ToInsert();      
    }

    private void insertHouseToDB()
    {
        string insertHouse = "INSERT INTO Houses (HouseNo,StreetName,Area,PostCode,NoOfBeds) VALUES " + " (@HouseNo,@StreetName,@Area,@PostCode,@NoOfBeds)";
        string connString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection conn = new SqlConnection(connString);
        
        SqlCommand cmd2 = new SqlCommand(insertHouse, conn);
        SqlParameter[] par = new SqlParameter[5];
        par[0] = new SqlParameter("@HouseNo", System.Data.SqlDbType.VarChar, 10);
        par[1] = new SqlParameter("@StreetName", System.Data.SqlDbType.VarChar, 200);
        par[2] = new SqlParameter("@Area", System.Data.SqlDbType.VarChar, 100);
        par[3] = new SqlParameter("@PostCode", System.Data.SqlDbType.VarChar, 10);
        par[4] = new SqlParameter("@NoOfBeds", System.Data.SqlDbType.VarChar, 10);
                        
        par[0].Value = HouseNo.Text;
        par[1].Value = Street.Text;
        par[2].Value = AreaDL.SelectedValue;
        par[3].Value = PostCode.Text;
        par[4].Value = NoOfBeds.SelectedValue;
        
        for (int i = 0; i < par.Length; i++)
        {
            cmd2.Parameters.Add(par[i]);
        }
        conn.Open();
        cmd2.CommandType = System.Data.CommandType.Text;
        cmd2.ExecuteNonQuery();
        conn.Close();

        getHouseID_FromNewlyInsertedHouse();
    }

    private string getHouseID_FromNewlyInsertedHouse()
    {
        string getReviewIDToInsertInImage_Uploads = "SELECT HouseID FROM Houses WHERE HouseNo = @HouseNo AND StreetName = @StreetName AND Area = @Area AND PostCode = @PostCode";
        string connString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection connReg = new SqlConnection(connString);
        DataSet ds = new DataSet();

        SqlCommand cmd4 = new SqlCommand(getReviewIDToInsertInImage_Uploads, connReg);
        SqlParameter[] par5 = new SqlParameter[5];
        par5[0] = new SqlParameter("@HouseNo", System.Data.SqlDbType.VarChar, 10);
        par5[1] = new SqlParameter("@StreetName", System.Data.SqlDbType.VarChar, 200);
        par5[2] = new SqlParameter("@Area", System.Data.SqlDbType.VarChar, 100);
        par5[3] = new SqlParameter("@PostCode", System.Data.SqlDbType.VarChar, 10);
        par5[4] = new SqlParameter("@NoOfBeds", System.Data.SqlDbType.VarChar, 10);
        par5[0].Value = HouseNo.Text;
        par5[1].Value = Street.Text;
        par5[2].Value = AreaDL.SelectedValue;
        par5[3].Value = PostCode.Text;
        par5[4].Value = NoOfBeds.SelectedValue;        

        for (int i = 0; i < par5.Length; i++)
        {
            cmd4.Parameters.Add(par5[i]);
        }

        cmd4.CommandType = System.Data.CommandType.Text;
        connReg.Open();
        cmd4.ExecuteNonQuery();

        SqlDataAdapter da2 = new SqlDataAdapter(cmd4);
        da2.Fill(ds);
        houseIDNewlyInserted = ds.Tables[0].Rows[0][0].ToString();
        connReg.Close();
        
        return houseIDNewlyInserted;
    }

    private string getReviewIDToInsert()
    {
        string getReviewIDToInsertInImage_Uploads = "SELECT ReviewID FROM Review WHERE TitleOfReview = @TitleOfReview AND ReviewMessage = @ReviewMessage ORDER BY CreationDate desc";
        string connString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection connReg = new SqlConnection(connString);
        DataSet ds = new DataSet();

        SqlCommand cmd4 = new SqlCommand(getReviewIDToInsertInImage_Uploads, connReg);
        SqlParameter[] par4 = new SqlParameter[2];
        par4[0] = new SqlParameter("@TitleOfReview", System.Data.SqlDbType.VarChar, 200);
        par4[1] = new SqlParameter("@ReviewMessage", System.Data.SqlDbType.VarChar, 200);
        par4[0].Value = TitleReview.Text;
        par4[1].Value = ReviewMessage.Text;

        for (int i = 0; i < par4.Length; i++)
        {
            cmd4.Parameters.Add(par4[i]);
        }

        cmd4.CommandType = System.Data.CommandType.Text;
        connReg.Open();
        cmd4.ExecuteNonQuery();

        SqlDataAdapter da2 = new SqlDataAdapter(cmd4);
        da2.Fill(ds);
        reviewID = ds.Tables[0].Rows[0][0].ToString();
        connReg.Close();

        return reviewID;
    }

    private string getReviewIDFromAccordion2ToInsert()
    {
        string getReviewIDToInsertInImage_Uploads = "SELECT ReviewID FROM Review WHERE TitleOfReview = @TitleOfReview AND ReviewMessage = @ReviewMessage ORDER BY CreationDate desc";
        string connString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection connReg = new SqlConnection(connString);
        DataSet ds = new DataSet();

        SqlCommand cmd4 = new SqlCommand(getReviewIDToInsertInImage_Uploads, connReg);
        SqlParameter[] par4 = new SqlParameter[2];
        par4[0] = new SqlParameter("@TitleOfReview", System.Data.SqlDbType.VarChar, 200);
        par4[1] = new SqlParameter("@ReviewMessage", System.Data.SqlDbType.VarChar, 200);
        par4[0].Value = TitleOfReview2.Text;
        par4[1].Value = ReviewContent2.Text;

        for (int i = 0; i < par4.Length; i++)
        {
            cmd4.Parameters.Add(par4[i]);
        }

        cmd4.CommandType = System.Data.CommandType.Text;
        connReg.Open();
        cmd4.ExecuteNonQuery();

        SqlDataAdapter da2 = new SqlDataAdapter(cmd4);
        da2.Fill(ds);
        reviewIDAccordion2 = ds.Tables[0].Rows[0][0].ToString();
        connReg.Close();

        return reviewIDAccordion2;
    }

    protected void checkUploadControlForFile()
    {
        //// need to add a check for duplicate images being added ////////
        string fileExt1 = System.IO.Path.GetExtension(fileUpload1.FileName);
        string fileExt2 = System.IO.Path.GetExtension(fileUpload2.FileName);
        string fileExt3 = System.IO.Path.GetExtension(fileUpload3.FileName);
        string fileExt4 = System.IO.Path.GetExtension(fileUpload4.FileName);
        string fileExt5 = System.IO.Path.GetExtension(fileUpload5.FileName);

        var acceptedFileExtList = new List<string>(); acceptedFileExtList.Add(".jpg"); acceptedFileExtList.Add(".JPG"); acceptedFileExtList.Add(".jpeg"); acceptedFileExtList.Add(".JPEG"); acceptedFileExtList.Add(".gif"); acceptedFileExtList.Add(".GIF"); acceptedFileExtList.Add(".bmp"); acceptedFileExtList.Add(".BMP"); acceptedFileExtList.Add(".png"); acceptedFileExtList.Add(".PNG");

        if (fileUpload1.HasFile & acceptedFileExtList.Contains(fileExt1))
        {
            insertUploadedImagesToDB1();
        }
        else if (fileUpload1.HasFile & acceptedFileExtList.Contains(fileExt1) == false)
        {
            errorLabel.Text = "Upload failed. Please make sure the image type is supported.";
            errorLabel.Visible = true;
        }
        if (fileUpload2.HasFile & acceptedFileExtList.Contains(fileExt2))
        {
            insertUploadedImagesToDB2();
        }
        else if (fileUpload2.HasFile & acceptedFileExtList.Contains(fileExt2) == false)
        {
            errorLabel.Text = "Upload failed. Please make sure the image type is supported.";
            errorLabel.Visible = true;
        }
        if (fileUpload3.HasFile & acceptedFileExtList.Contains(fileExt3))
        {
            insertUploadedImagesToDB3();
        }
        else if (fileUpload3.HasFile & acceptedFileExtList.Contains(fileExt3) == false)
        {
            errorLabel.Text = "Upload failed. Please make sure the image type is supported.";
            errorLabel.Visible = true;
        }
        if (fileUpload4.HasFile & acceptedFileExtList.Contains(fileExt4))
        {
            insertUploadedImagesToDB4();
        }
        else if (fileUpload4.HasFile & acceptedFileExtList.Contains(fileExt4) == false)
        {
            errorLabel.Text = "Upload failed. Please make sure the image type is supported.";
            errorLabel.Visible = true;
        }
        if (fileUpload5.HasFile & acceptedFileExtList.Contains(fileExt5))
        {
            insertUploadedImagesToDB5();
        }
        else if (fileUpload5.HasFile & acceptedFileExtList.Contains(fileExt5) == false)
        {
            errorLabel.Text = "Upload failed. Please make sure the image type is supported.";
            errorLabel.Visible = true;
        }
        if (fileUpload1.HasFile == false || fileUpload2.HasFile == false || fileUpload3.HasFile == false || fileUpload4.HasFile == false || fileUpload5.HasFile == false)
        {
            errorLabel.Text = "The review has been posted successfully.";
            errorLabel.Visible = true;
        }        
    }

    protected void checkUploadControlAccordion2ForFile()
    {
        //// need to add a check for duplicate images being added ////////
        string fileExt6 = System.IO.Path.GetExtension(fileUpload6.FileName);
        string fileExt7 = System.IO.Path.GetExtension(fileUpload7.FileName);
        string fileExt8 = System.IO.Path.GetExtension(fileUpload8.FileName);
        string fileExt9 = System.IO.Path.GetExtension(fileUpload9.FileName);
        string fileExt10 = System.IO.Path.GetExtension(fileUpload10.FileName);

        var acceptedFileExtList = new List<string>(); acceptedFileExtList.Add(".jpg"); acceptedFileExtList.Add(".JPG"); acceptedFileExtList.Add(".jpeg"); acceptedFileExtList.Add(".JPEG"); acceptedFileExtList.Add(".gif"); acceptedFileExtList.Add(".GIF"); acceptedFileExtList.Add(".bmp"); acceptedFileExtList.Add(".BMP"); acceptedFileExtList.Add(".png"); acceptedFileExtList.Add(".PNG");

        if (fileUpload6.HasFile & acceptedFileExtList.Contains(fileExt6))
        {
            insertUploadedImagesToDB6();
        }
        else if (fileUpload6.HasFile & acceptedFileExtList.Contains(fileExt6) == false)
        {
            errorLabelHouseDetails.Text = "Upload failed. Please make sure the image type is supported.";
            errorLabelHouseDetails.Visible = true;
        }
        if (fileUpload7.HasFile & acceptedFileExtList.Contains(fileExt7))
        {
            insertUploadedImagesToDB7();
        }
        else if (fileUpload7.HasFile & acceptedFileExtList.Contains(fileExt7) == false)
        {
            errorLabelHouseDetails.Text = "Upload failed. Please make sure the image type is supported.";
            errorLabelHouseDetails.Visible = true;
        }
        if (fileUpload8.HasFile & acceptedFileExtList.Contains(fileExt8))
        {
            insertUploadedImagesToDB8();
        }
        else if (fileUpload8.HasFile & acceptedFileExtList.Contains(fileExt8) == false)
        {
            errorLabelHouseDetails.Text = "Upload failed. Please make sure the image type is supported.";
            errorLabelHouseDetails.Visible = true;
        }
        if (fileUpload9.HasFile & acceptedFileExtList.Contains(fileExt9))
        {
            insertUploadedImagesToDB9();
        }
        else if (fileUpload9.HasFile & acceptedFileExtList.Contains(fileExt9) == false)
        {
            errorLabelHouseDetails.Text = "Upload failed. Please make sure the image type is supported.";
            errorLabelHouseDetails.Visible = true;
        }
        if (fileUpload10.HasFile & acceptedFileExtList.Contains(fileExt10))
        {
            insertUploadedImagesToDB10();
        }
        else if (fileUpload10.HasFile & acceptedFileExtList.Contains(fileExt10) == false)
        {
            errorLabelHouseDetails.Text = "Upload failed. Please make sure the image type is supported.";
            errorLabelHouseDetails.Visible = true;
        }
        if (fileUpload6.HasFile == false || fileUpload7.HasFile == false || fileUpload8.HasFile == false || fileUpload9.HasFile == false || fileUpload10.HasFile == false)
        {
            errorLabelHouseDetails.Text = "The review has been posted successfully.";
            errorLabelHouseDetails.Visible = true;
        }
    }
       
    private void insertUploadedImagesToDB1()
    {        
        string sqlSubmitImg = "INSERT INTO Image_Uploads (ImageName, ImageFile, HouseID, ReviewID) VALUES " + " (@ImageName, @ImageFile, @HouseID, @ReviewID)";  
        string connString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection connReg = new SqlConnection(connString);
        SqlCommand cmd3 = new SqlCommand(sqlSubmitImg, connReg);
              
        string imgName = fileUpload1.PostedFile.FileName;
        int imgFileLength = fileUpload1.PostedFile.ContentLength;

        byte[] imageBytes = new byte[imgFileLength];
        fileUpload1.PostedFile.InputStream.Read(imageBytes, 0, imgFileLength);
        
        SqlParameter[] par3 = new SqlParameter[4];
        par3[0] = new SqlParameter("@ImageName", System.Data.SqlDbType.VarChar, 50);
        par3[1] = new SqlParameter("@ImageFile", System.Data.SqlDbType.Image);
        par3[2] = new SqlParameter("@HouseID", System.Data.SqlDbType.Int, 5);
        par3[3] = new SqlParameter("@ReviewID", System.Data.SqlDbType.Int, 5);
        par3[0].Value = imgName;
        par3[1].Value = imageBytes;
        par3[2].Value = houseIdToInsert;
        par3[3].Value = reviewID;

        for (int i = 0; i < par3.Length; i++)
        {
            cmd3.Parameters.Add(par3[i]);
        }

        cmd3.CommandType = System.Data.CommandType.Text;
        connReg.Open();
        cmd3.ExecuteNonQuery();
        connReg.Close();

        {
            string Img_name = fileUpload1.FileName;
            string folder_path = Server.MapPath("~\\Pages\\ImageUploads\\");
            fileUpload1.SaveAs(folder_path + Img_name);           
        }
        
        errorLabel.Text = "The review has been posted successfully";
        errorLabel.Visible = true;
    }

    private void insertUploadedImagesToDB2()
    {
        string sqlSubmitImg = "INSERT INTO Image_Uploads (ImageName, ImageFile, HouseID, ReviewID) VALUES " + " (@ImageName, @ImageFile, @HouseID, @ReviewID)";
        string connString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection connReg = new SqlConnection(connString);
        SqlCommand cmd3 = new SqlCommand(sqlSubmitImg, connReg);

        string imgName = fileUpload2.PostedFile.FileName;
        int imgFileLength = fileUpload2.PostedFile.ContentLength;

        byte[] imageBytes = new byte[imgFileLength];
        fileUpload2.PostedFile.InputStream.Read(imageBytes, 0, imgFileLength);

        SqlParameter[] par3 = new SqlParameter[4];
        par3[0] = new SqlParameter("@ImageName", System.Data.SqlDbType.VarChar, 50);
        par3[1] = new SqlParameter("@ImageFile", System.Data.SqlDbType.Image);
        par3[2] = new SqlParameter("@HouseID", System.Data.SqlDbType.Int, 5);
        par3[3] = new SqlParameter("@ReviewID", System.Data.SqlDbType.Int, 5);
        par3[0].Value = imgName;
        par3[1].Value = imageBytes;
        par3[2].Value = houseIdToInsert;
        par3[3].Value = reviewID;

        for (int i = 0; i < par3.Length; i++)
        {
            cmd3.Parameters.Add(par3[i]);
        }
               
        cmd3.CommandType = System.Data.CommandType.Text;
        connReg.Open();
        cmd3.ExecuteNonQuery();
        connReg.Close();

        //{
        //    string Img_name = fileUpload2.FileName;
        //    string folder_path = Server.MapPath("~\\Pages\\ImageUploads\\");
        //    fileUpload2.SaveAs(folder_path + Img_name);
        //}

        errorLabel.Text = "The review has been posted successfully";
        errorLabel.Visible = true;
    }

    private void insertUploadedImagesToDB3()
    {
        string sqlSubmitImg = "INSERT INTO Image_Uploads (ImageName, ImageFile, HouseID, ReviewID) VALUES " + " (@ImageName, @ImageFile, @HouseID, @ReviewID)";
        string connString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection connReg = new SqlConnection(connString);
        SqlCommand cmd3 = new SqlCommand(sqlSubmitImg, connReg);

        string imgName = fileUpload3.PostedFile.FileName;
        int imgFileLength = fileUpload3.PostedFile.ContentLength;

        byte[] imageBytes = new byte[imgFileLength];
        fileUpload3.PostedFile.InputStream.Read(imageBytes, 0, imgFileLength);

        SqlParameter[] par3 = new SqlParameter[4];
        par3[0] = new SqlParameter("@ImageName", System.Data.SqlDbType.VarChar, 50);
        par3[1] = new SqlParameter("@ImageFile", System.Data.SqlDbType.Image);
        par3[2] = new SqlParameter("@HouseID", System.Data.SqlDbType.Int, 5);
        par3[3] = new SqlParameter("@ReviewID", System.Data.SqlDbType.Int, 5);
        par3[0].Value = imgName;
        par3[1].Value = imageBytes;
        par3[2].Value = houseIdToInsert;
        par3[3].Value = reviewID;

        for (int i = 0; i < par3.Length; i++)
        {
            cmd3.Parameters.Add(par3[i]);
        }
                
        cmd3.CommandType = System.Data.CommandType.Text;
        connReg.Open();
        cmd3.ExecuteNonQuery();
        connReg.Close();

        //{
        //    string Img_name = fileUpload3.FileName;
        //    string folder_path = Server.MapPath("~\\Pages\\ImageUploads\\");
        //    fileUpload3.SaveAs(folder_path + Img_name);
        //}

        errorLabel.Text = "The review has been posted successfully";
        errorLabel.Visible = true;
    }

    private void insertUploadedImagesToDB4()
    {
        string sqlSubmitImg = "INSERT INTO Image_Uploads (ImageName, ImageFile, HouseID, ReviewID) VALUES " + " (@ImageName, @ImageFile, @HouseID, @ReviewID)";
        string connString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection connReg = new SqlConnection(connString);
        SqlCommand cmd3 = new SqlCommand(sqlSubmitImg, connReg);

        string imgName = fileUpload4.PostedFile.FileName;
        int imgFileLength = fileUpload4.PostedFile.ContentLength;

        byte[] imageBytes = new byte[imgFileLength];
        fileUpload4.PostedFile.InputStream.Read(imageBytes, 0, imgFileLength);

        SqlParameter[] par3 = new SqlParameter[4];
        par3[0] = new SqlParameter("@ImageName", System.Data.SqlDbType.VarChar, 50);
        par3[1] = new SqlParameter("@ImageFile", System.Data.SqlDbType.Image);
        par3[2] = new SqlParameter("@HouseID", System.Data.SqlDbType.Int, 5);
        par3[3] = new SqlParameter("@ReviewID", System.Data.SqlDbType.Int, 5);
        par3[0].Value = imgName;
        par3[1].Value = imageBytes;
        par3[2].Value = houseIdToInsert;
        par3[3].Value = reviewID;

        for (int i = 0; i < par3.Length; i++)
        {
            cmd3.Parameters.Add(par3[i]);
        }

        cmd3.CommandType = System.Data.CommandType.Text;
        connReg.Open();
        cmd3.ExecuteNonQuery();
        connReg.Close();

        //{
        //    string Img_name = fileUpload4.FileName;
        //    string folder_path = Server.MapPath("~\\Pages\\ImageUploads\\");
        //    fileUpload4.SaveAs(folder_path + Img_name);
        //}

        errorLabel.Text = "The review has been posted successfully";
        errorLabel.Visible = true;
    }

    private void insertUploadedImagesToDB5()
    {
        string sqlSubmitImg = "INSERT INTO Image_Uploads (ImageName, ImageFile, HouseID, ReviewID) VALUES " + " (@ImageName, @ImageFile, @HouseID, @ReviewID)";
        string connString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection connReg = new SqlConnection(connString);
        SqlCommand cmd3 = new SqlCommand(sqlSubmitImg, connReg);

        string imgName = fileUpload5.PostedFile.FileName;
        int imgFileLength = fileUpload5.PostedFile.ContentLength;

        byte[] imageBytes = new byte[imgFileLength];
        fileUpload5.PostedFile.InputStream.Read(imageBytes, 0, imgFileLength);

        SqlParameter[] par3 = new SqlParameter[4];
        par3[0] = new SqlParameter("@ImageName", System.Data.SqlDbType.VarChar, 50);
        par3[1] = new SqlParameter("@ImageFile", System.Data.SqlDbType.Image);
        par3[2] = new SqlParameter("@HouseID", System.Data.SqlDbType.Int, 5);
        par3[3] = new SqlParameter("@ReviewID", System.Data.SqlDbType.Int, 5);
        par3[0].Value = imgName;
        par3[1].Value = imageBytes;
        par3[2].Value = houseIdToInsert;
        par3[3].Value = reviewID;

        for (int i = 0; i < par3.Length; i++)
        {
            cmd3.Parameters.Add(par3[i]);
        }

        cmd3.CommandType = System.Data.CommandType.Text;
        connReg.Open();
        cmd3.ExecuteNonQuery();
        connReg.Close();

        //{
        //    string Img_name = fileUpload5.FileName;
        //    string folder_path = Server.MapPath("~\\Pages\\ImageUploads\\");
        //    fileUpload5.SaveAs(folder_path + Img_name);
        //}

        errorLabel.Text = "The review has been posted successfully";
        errorLabel.Visible = true;
    }

    private void insertUploadedImagesToDB6()
    {
        string sqlSubmitImg = "INSERT INTO Image_Uploads (ImageName, ImageFile, HouseID, ReviewID) VALUES " + " (@ImageName, @ImageFile, @HouseID, @ReviewID)";
        string connString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection connReg = new SqlConnection(connString);
        SqlCommand cmd3 = new SqlCommand(sqlSubmitImg, connReg);

        string imgName = reviewIDAccordion2 + "_" + fileUpload6.PostedFile.FileName;
        int imgFileLength = fileUpload6.PostedFile.ContentLength;

        byte[] imageBytes = new byte[imgFileLength];
        fileUpload6.PostedFile.InputStream.Read(imageBytes, 0, imgFileLength);

        SqlParameter[] par3 = new SqlParameter[4];
        par3[0] = new SqlParameter("@ImageName", System.Data.SqlDbType.VarChar, 50);
        par3[1] = new SqlParameter("@ImageFile", System.Data.SqlDbType.Image);
        par3[2] = new SqlParameter("@HouseID", System.Data.SqlDbType.Int, 5);
        par3[3] = new SqlParameter("@ReviewID", System.Data.SqlDbType.Int, 5);
        par3[0].Value = imgName;
        par3[1].Value = imageBytes;
        par3[2].Value = houseIDNewlyInserted;
        par3[3].Value = reviewIDAccordion2;

        for (int i = 0; i < par3.Length; i++)
        {
            cmd3.Parameters.Add(par3[i]);
        }

        cmd3.CommandType = System.Data.CommandType.Text;
        connReg.Open();
        cmd3.ExecuteNonQuery();
        connReg.Close();

        {
            string Img_name = reviewIDAccordion2 + "_" + fileUpload6.FileName;
            string folder_path = Server.MapPath("~\\Pages\\ImageUploads\\");
            fileUpload6.SaveAs(folder_path + Img_name);
        }

        errorLabel.Text = "The review has been posted successfully";
        errorLabel.Visible = true;
    }

    private void insertUploadedImagesToDB7()
    {
        string sqlSubmitImg = "INSERT INTO Image_Uploads (ImageName, ImageFile, HouseID, ReviewID) VALUES " + " (@ImageName, @ImageFile, @HouseID, @ReviewID)";
        string connString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection connReg = new SqlConnection(connString);
        SqlCommand cmd3 = new SqlCommand(sqlSubmitImg, connReg);

        string imgName = fileUpload7.PostedFile.FileName;
        int imgFileLength = fileUpload7.PostedFile.ContentLength;

        byte[] imageBytes = new byte[imgFileLength];
        fileUpload7.PostedFile.InputStream.Read(imageBytes, 0, imgFileLength);

        SqlParameter[] par3 = new SqlParameter[4];
        par3[0] = new SqlParameter("@ImageName", System.Data.SqlDbType.VarChar, 50);
        par3[1] = new SqlParameter("@ImageFile", System.Data.SqlDbType.Image);
        par3[2] = new SqlParameter("@HouseID", System.Data.SqlDbType.Int, 5);
        par3[3] = new SqlParameter("@ReviewID", System.Data.SqlDbType.Int, 5);
        par3[0].Value = imgName;
        par3[1].Value = imageBytes;
        par3[2].Value = houseIDNewlyInserted;
        par3[3].Value = reviewIDAccordion2;

        for (int i = 0; i < par3.Length; i++)
        {
            cmd3.Parameters.Add(par3[i]);
        }

        cmd3.CommandType = System.Data.CommandType.Text;
        connReg.Open();
        cmd3.ExecuteNonQuery();
        connReg.Close();

        //{
        //    string Img_name = fileUpload7.FileName;
        //    string folder_path = Server.MapPath("~\\Pages\\ImageUploads\\");
        //    fileUpload7.SaveAs(folder_path + Img_name);
        //}

        errorLabel.Text = "The review has been posted successfully";
        errorLabel.Visible = true;
    }

    private void insertUploadedImagesToDB8()
    {
        string sqlSubmitImg = "INSERT INTO Image_Uploads (ImageName, ImageFile, HouseID, ReviewID) VALUES " + " (@ImageName, @ImageFile, @HouseID, @ReviewID)";
        string connString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection connReg = new SqlConnection(connString);
        SqlCommand cmd3 = new SqlCommand(sqlSubmitImg, connReg);

        string imgName = fileUpload8.PostedFile.FileName;
        int imgFileLength = fileUpload8.PostedFile.ContentLength;

        byte[] imageBytes = new byte[imgFileLength];
        fileUpload8.PostedFile.InputStream.Read(imageBytes, 0, imgFileLength);

        SqlParameter[] par3 = new SqlParameter[4];
        par3[0] = new SqlParameter("@ImageName", System.Data.SqlDbType.VarChar, 50);
        par3[1] = new SqlParameter("@ImageFile", System.Data.SqlDbType.Image);
        par3[2] = new SqlParameter("@HouseID", System.Data.SqlDbType.Int, 5);
        par3[3] = new SqlParameter("@ReviewID", System.Data.SqlDbType.Int, 5);
        par3[0].Value = imgName;
        par3[1].Value = imageBytes;
        par3[2].Value = houseIDNewlyInserted;
        par3[3].Value = reviewIDAccordion2;

        for (int i = 0; i < par3.Length; i++)
        {
            cmd3.Parameters.Add(par3[i]);
        }

        cmd3.CommandType = System.Data.CommandType.Text;
        connReg.Open();
        cmd3.ExecuteNonQuery();
        connReg.Close();

        //{
        //    string Img_name = fileUpload8.FileName;
        //    string folder_path = Server.MapPath("~\\Pages\\ImageUploads\\");
        //    fileUpload8.SaveAs(folder_path + Img_name);
        //}

        errorLabel.Text = "The review has been posted successfully";
        errorLabel.Visible = true;
    }

    private void insertUploadedImagesToDB9()
    {
        string sqlSubmitImg = "INSERT INTO Image_Uploads (ImageName, ImageFile, HouseID, ReviewID) VALUES " + " (@ImageName, @ImageFile, @HouseID, @ReviewID)";
        string connString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection connReg = new SqlConnection(connString);
        SqlCommand cmd3 = new SqlCommand(sqlSubmitImg, connReg);

        string imgName = fileUpload9.PostedFile.FileName;
        int imgFileLength = fileUpload9.PostedFile.ContentLength;

        byte[] imageBytes = new byte[imgFileLength];
        fileUpload9.PostedFile.InputStream.Read(imageBytes, 0, imgFileLength);

        SqlParameter[] par3 = new SqlParameter[4];
        par3[0] = new SqlParameter("@ImageName", System.Data.SqlDbType.VarChar, 50);
        par3[1] = new SqlParameter("@ImageFile", System.Data.SqlDbType.Image);
        par3[2] = new SqlParameter("@HouseID", System.Data.SqlDbType.Int, 5);
        par3[3] = new SqlParameter("@ReviewID", System.Data.SqlDbType.Int, 5);
        par3[0].Value = imgName;
        par3[1].Value = imageBytes;
        par3[2].Value = houseIDNewlyInserted;
        par3[3].Value = reviewIDAccordion2;

        for (int i = 0; i < par3.Length; i++)
        {
            cmd3.Parameters.Add(par3[i]);
        }

        cmd3.CommandType = System.Data.CommandType.Text;
        connReg.Open();
        cmd3.ExecuteNonQuery();
        connReg.Close();

        //{
        //    string Img_name = fileUpload9.FileName;
        //    string folder_path = Server.MapPath("~\\Pages\\ImageUploads\\");
        //    fileUpload9.SaveAs(folder_path + Img_name);
        //}

        errorLabel.Text = "The review has been posted successfully";
        errorLabel.Visible = true;
    }

    private void insertUploadedImagesToDB10()
    {
        string sqlSubmitImg = "INSERT INTO Image_Uploads (ImageName, ImageFile, HouseID, ReviewID) VALUES " + " (@ImageName, @ImageFile, @HouseID, @ReviewID)";
        string connString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection connReg = new SqlConnection(connString);
        SqlCommand cmd3 = new SqlCommand(sqlSubmitImg, connReg);

        string imgName = fileUpload10.PostedFile.FileName;
        int imgFileLength = fileUpload10.PostedFile.ContentLength;

        byte[] imageBytes = new byte[imgFileLength];
        fileUpload10.PostedFile.InputStream.Read(imageBytes, 0, imgFileLength);

        SqlParameter[] par3 = new SqlParameter[4];
        par3[0] = new SqlParameter("@ImageName", System.Data.SqlDbType.VarChar, 50);
        par3[1] = new SqlParameter("@ImageFile", System.Data.SqlDbType.Image);
        par3[2] = new SqlParameter("@HouseID", System.Data.SqlDbType.Int, 5);
        par3[3] = new SqlParameter("@ReviewID", System.Data.SqlDbType.Int, 5);
        par3[0].Value = imgName;
        par3[1].Value = imageBytes;
        par3[2].Value = houseIDNewlyInserted;
        par3[3].Value = reviewIDAccordion2;
                
        for (int i = 0; i < par3.Length; i++)
        {
            cmd3.Parameters.Add(par3[i]);
        }

        cmd3.CommandType = System.Data.CommandType.Text;
        connReg.Open();
        cmd3.ExecuteNonQuery();
        connReg.Close();

        //{
        //    string Img_name = fileUpload10.FileName;
        //    string folder_path = Server.MapPath("~\\Pages\\ImageUploads\\");
        //    fileUpload10.SaveAs(folder_path + Img_name);
        //}

        errorLabel.Text = "The review has been posted successfully";
        errorLabel.Visible = true;
    }

    private object checkAccordion1ReviewDoesntExist()
    {
        string checkIfReviewExists = "SELECT * FROM Review WHERE TitleOfReview = @TitleOfReview AND ReviewMessage = @ReviewMessage AND User_ID = @UserID";
        string connString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection connReg = new SqlConnection(connString);
        
        SqlCommand cmd4 = new SqlCommand(checkIfReviewExists, connReg);
        SqlParameter[] par4 = new SqlParameter[3];
        par4[0] = new SqlParameter("@TitleOfReview", System.Data.SqlDbType.VarChar, 200);
        par4[1] = new SqlParameter("@ReviewMessage", System.Data.SqlDbType.VarChar, 200);
        par4[2] = new SqlParameter("@UserID", System.Convert.ToInt32(userIDString));
        par4[0].Value = TitleReview.Text;
        par4[1].Value = ReviewMessage.Text;
        par4[2].Value = userIDString;

        for (int i = 0; i < par4.Length; i++)
        {
            cmd4.Parameters.Add(par4[i]);
        }

        cmd4.CommandType = System.Data.CommandType.Text;
        connReg.Open();
        accordion1ReviewExists = cmd4.ExecuteScalar();
        
        connReg.Close();
        return accordion1ReviewExists;
    }

    private object checkAccordion2ReviewDoesntExist()
    {
        string checkIfReviewExists = "SELECT * FROM Review WHERE TitleOfReview = @TitleOfReview AND ReviewMessage = @ReviewMessage AND User_ID = @UserID";
        string connString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection connReg = new SqlConnection(connString);

        SqlCommand cmd4 = new SqlCommand(checkIfReviewExists, connReg);
        SqlParameter[] par4 = new SqlParameter[3];
        par4[0] = new SqlParameter("@TitleOfReview", System.Data.SqlDbType.VarChar, 200);
        par4[1] = new SqlParameter("@ReviewMessage", System.Data.SqlDbType.VarChar, 200);
        par4[2] = new SqlParameter("@UserID", System.Data.SqlDbType.Int, 5);
        par4[0].Value = TitleOfReview2.Text;
        par4[1].Value = ReviewContent2.Text;
        par4[2].Value = userIDString;

        for (int i = 0; i < par4.Length; i++)
        {
            cmd4.Parameters.Add(par4[i]);
        }

        cmd4.CommandType = System.Data.CommandType.Text;
        connReg.Open();
        accordion2ReviewExists = cmd4.ExecuteScalar();

        connReg.Close();
        return accordion2ReviewExists;
    }
        
    protected void buttonUploadReview_Click(object sender, EventArgs e)
    {
        checkAccordion1ReviewDoesntExist();

        if (rating1Value.Text == "" || rating2Value.Text == "" || rating3Value.Text == "" || rating4Value.Text == "")
        {
            errorLabelRatings.Text = "Please ensure the 4 ratings have been chosen";
            errorLabelRatings.Visible = true;
        }
        else if (formVerification2.Checked == false)
        {
            errorLabelReg2.Text = "Please check the box and click submit to send your registration";
            errorLabelReg2.Visible = true;
        }
        else if (formVerification2.Checked == true & rating1Value.Text == "" || rating2Value.Text == "" || rating3Value.Text == "" || rating4Value.Text == "")
        {
            errorLabelRatings.Text = "Please ensure the 4 ratings have been chosen";
            errorLabelRatings.Visible = true;
        }
        else if (rating1Value.Text != "" & rating2Value.Text != "" & rating3Value.Text != "" & rating4Value.Text != "" & formVerification2.Checked == true)
        {
            if (tags.Text != "")
            {
                getHouseID_FromSearchBoxToInsert();

                try
                {
                    if (accordion1ReviewExists != null)
                    {
                        errorLabel.Visible = false;
                        accordion1ErrorLabel.Text = "This review has already been submitted";
                        accordion1ErrorLabel.Visible = true;
                    }
                    else
                    {
                        insertReviewToDBAccordion1();                
                        checkUploadControlForFile();
                        if (accordion1ErrorLabel.Visible == true)
                        {
                            accordion1ErrorLabel.Visible = false;
                        }
                        errorLabelRatings.Visible = false;
                        checkboxAccordion2.Visible = false;
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
            else
            {
                errorLabel2.Text = "You have not searched for an address.";
                errorLabel2.Visible = true;
            }
        }
    }

    protected void buttonUploadHouseDetails_Click(object sender, EventArgs e)
    {
        checkAccordion2ReviewDoesntExist();

        if (rating5Value.Text == "" || rating6Value.Text == "" || rating7Value.Text == "" || rating8Value.Text == "")
        {
            errorLabelRating.Text = "Please ensure the 4 ratings have been chosen";
            errorLabelRating.Visible = true;
        }        
        
        if (CheckBox2.Checked == true)
        {
            insertHouseToDB();
            insertReviewToDBAccordion2();
            checkUploadControlAccordion2ForFile();

            errorLabelRating.Visible = false;
            checkboxAccordion2.Visible = true;
            checkboxAccordion2.Text = "Review submitted succesfully";            
        }         

        if (CheckBox2.Checked == false)
        {
            checkboxAccordion2.Text = "Please check the box and click submit to send your registration";
            checkboxAccordion2.Visible = true;            
        }        

        if (accordion2ReviewExists != null)
        {
            errorLabelHouseDetails.Visible = false;
            accordion2ErrorLabel.Text = "This review has already been submitted";
            accordion2ErrorLabel.Visible = true;
            errorLabelRating.Visible = false;
        }  
      
    }

    protected void calculateOverallRatingAndInsertToDBAccordion1(string rating1Value, string rating2Value, string rating3Value, string rating4Value)
    {
        if (rating1Value == "" || rating2Value == "" || rating3Value == "" || rating4Value == "")
        {
            //do nothing
        }
        else
        {
            double a = Convert.ToInt32(rating1Value);
            double b = Convert.ToInt32(rating2Value);
            double c = Convert.ToInt32(rating3Value);
            double d = Convert.ToInt32(rating4Value);
            double overallRatingResult = a + b + c + d;

            string insertOverallRating = "UPDATE Review SET OverallHouseRating='"+overallRatingResult+"' WHERE ReviewID = '"+reviewID+"'";                        
            string connString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
            SqlConnection conn = new SqlConnection(connString);

            SqlCommand cmd2 = new SqlCommand(insertOverallRating, conn);
            SqlParameter[] par2 = new SqlParameter[1];

            par2[0] = new SqlParameter("@OverallRating", System.Data.SqlDbType.Float, 5);            
            par2[0].Value = overallRatingResult;            

            for (int i = 0; i < par2.Length; i++)
            {
                cmd2.Parameters.Add(par2[i]);
            }
            conn.Open();
            cmd2.CommandType = System.Data.CommandType.Text;
            cmd2.ExecuteNonQuery();
            conn.Close();

            updateAverageOfOverallRatingForHouseAccordion1();
        }
    }

    private void updateAverageOfOverallRatingForHouseAccordion1()
    {        
        double averageOfRatings = 0;
        double overallRatingPercentageForHouse = 0;

        string command = "SELECT * FROM Review WHERE HouseID = '" + houseIdToInsert + "'";
        string connString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand();

        DataSet houseRatings = new DataSet();

        try
        {
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.CommandText = command;

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            conn.Open();
            da.Fill(houseRatings);

            foreach (DataRow dr in houseRatings.Tables[0].Rows)
            {
                averageOfRatings += Int32.Parse(dr["OverallHouseRating"].ToString());
            }

            averageOfRatings = averageOfRatings / houseRatings.Tables[0].Rows.Count;
            overallRatingPercentageForHouse = (averageOfRatings / 20) * 100;
            Math.Round(overallRatingPercentageForHouse, 0);

            insertRatingPercentageForHouseAccordion1(overallRatingPercentageForHouse, houseIdToInsert);                                 
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

    private void insertRatingPercentageForHouseAccordion1(double overallRatingPercentageForHouse, string houseIdToInsert )
    {
        string command = "UPDATE Houses SET HouseRating='"+overallRatingPercentageForHouse+"' WHERE HouseID = '" + houseIdToInsert + "'";
        string connString = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand cmd = new SqlCommand();

        try
        {
            cmd.CommandType = CommandType.Text;
            cmd.Connection = conn;
            cmd.CommandText = command;
            conn.Open();
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }

    //protected void ReviewMessage_TextChanged(object sender, EventArgs e)
    //{
    //    int Answer;

    //    Answer = Convert.ToInt32(ReviewMessage.Text);
    //    ReviewMessageLbl.Text = Answer.ToString();
    //}
}
