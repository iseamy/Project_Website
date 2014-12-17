<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Search_Results_Details.aspx.cs" Inherits="Home" MasterPageFile="~/Master_Pages/Default.master" %>

<asp:Content ID="SearchResults_Main" ContentPlaceHolderID="Main" Runat="Server">   

   <div id="ResultsMainWrapper">   
   <div id="detailscontent">   

   <h1>Further Details</h1><br />
<%-- <br />  Return to search results --%>

       <div class="images">
       <!-- Main house picture -->
       <img src="/Website/Images/house1.jpg" height="300px" width="310px"/><br />

       <!-- Additional Thumbnail House Images -->
       <img src="/Website/Images/house3.jpg" height="70px" width="75px"/>
       <img src="/Website/Images/house4.jpg" height="70px" width="75px"/>
       <img src="/Website/Images/house5.jpg" height="70px" width="75px"/>
       <img src="/Website/Images/house10.jpg" height="70px" width="75px"/>
       <br />
       <br />
</div>

<div class="header">
   <h2>
              <b>32 Ridgeway Street Stranmillis BT8 6LG</b>
   </h2>
             <b>House Rating</b>: 83%<br />
       <b>House Condition</b>: 7/10<br />       
       <b>Type of student home</b>: Level 3 or Graduates<br />
       <b>No. Of Bedrooms</b>: 4<br />
       <b>Parking</b>: On Street<br />
       <br />
              <b>Amenities:</b><br />
       - Shops<br />
       - Fast food<br />
       - Hair dressers<br />
       - Bank<br />
       - Chemist
       <br />
       <br />
       <b>Close To University:</b><br />
       - Queens<br />
       - Stranmillis Teaching<br />
</div> 

<br />
<br />
<br />
    <div class="text">
      <b><u>This is one of the best students houses in Belfast!</u></b> <br />
       This house is superb. It has large bedrooms and two bathrooms. There are no damp or mould patches with very little heat loss.
       It is in a quiet area of Stranmillis located close to the Lyric Theatre and PEC.<br />
       <br />
 
       <div class="button"><a href="../Pages/Rate.aspx">Click here to rate this house</a></div> 
    <br />
</div>
     <br /> 
       </div>
      

 
 <br />


 <br />


   </div></div>
</asp:Content>