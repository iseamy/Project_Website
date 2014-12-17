<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Search_Results.aspx.cs" Inherits="Search_Results" MasterPageFile="~/Master_Pages/Default.master" %>

<asp:Content ID="SearchResults_Main" ContentPlaceHolderID="Main" Runat="Server">   

    <div id="ResultsMainWrapper">
    <div class="filters">RESULT FILTERS</div>    
   
   <div id="searchresults">     <div id="title"><h1>Search Results</h1></div>
    <%--Address of house
    Title of most recent comment (use houseid/reviewid to get latest review)
    Rating of house    
    Images of house from most recent comment (get images attached to the houseid)

    Filters for searches include:
        -Area: Botanic Stran Holylands Malone LBR
        -No rooms
        -Rating
        -Uni
        -Degree level
        -Course
    <br />
    <br />--%>
    <div class="results">
    <asp:Label ID="searchResultsEmpty" class="noresults" runat="server" Visible="false"></asp:Label>

    <asp:Repeater ID="repeaterControl" runat="server" >
         <ItemTemplate>
            <table class="tableresults">
            <tr>
                <td>
                    <img id="image" src='ImageUploads/<%# DataBinder.Eval(Container.DataItem, "ImageName") %>' width="150px" height="150px" /><br />
                </td>
                <td><b><u><%# DataBinder.Eval(Container.DataItem, "HouseNo") %> <%# DataBinder.Eval(Container.DataItem, "StreetName") %>, <%# DataBinder.Eval(Container.DataItem, "Area") %><br /></u></b>            
                <%# DataBinder.Eval(Container.DataItem, "TitleOfReview") %><br />
                <b><u>House Rating:</u></b> <%# DataBinder.Eval(Container.DataItem, "HouseRating") %>%<br />
                
<%--                Click here to read the review message<br />--%>
               <%-- <%# DataBinder.Eval(Container.DataItem, "ImageFile") %><br /></td>--%>
                <td>
                <asp:Button ID="RatePageButton" runat="server" Class="mustlogin" Text="Rate This Rental"/>
                <br />
                <asp:Button ID="ReadMoreReview" PostBackUrl="Search_Results_Details.aspx" runat="server" Class="mustlogin" Text="Read More"/>
                </td>
            </tr>
            <br />      
            </table>
         </ItemTemplate>        
     </asp:Repeater>     
         </div>
         
        </div>         
    </div>
    <asp:Button ID="btnNext" Text="Next Page" runat="server" OnClick="btnNext_Click" Visible="true" />  
                <asp:Button ID="btnPrev" Text="Previous Page" runat="server" OnClick="btnPrevious_Click" Visible="true"  />
</asp:Content>