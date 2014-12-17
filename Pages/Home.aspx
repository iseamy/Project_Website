<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" MasterPageFile="~/Master_Pages/Default.master" %>
<%@ Register Src="~/User_Controls/GoogleMapsAPI.ascx" TagPrefix="uc1" TagName="GoogleMapsAPI" %>

<asp:Content ID="Home_Main" ContentPlaceHolderID="Main" Runat="Server">

<div id="homeWrapper">   
    <div class="contentCenter">
        <div class="searchformHomePage">
            <h2>Find your perfect rental in Belfast</h2>     
            <asp:TextBox id="searchCriteriaHomePage" CssClass="tbSearchCriteria" runat="server" Visible="true" placeholder="Search for a rental here..."></asp:TextBox>
            <asp:imageButton id="beginSearchHomePage" CssClass="btnSearchHomepage" src="/Website/Images/homepage/magnifier_transparent.png"  runat="server" Visible="true" OnClick="beginSearch_Click" />    
        </div>     
    </div>  
</div>

</asp:Content>
