<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header.ascx.cs" Inherits="User_Controls_Header" %>
<%@ Register Src="~/User_Controls/Google_Analytics.ascx" TagPrefix="uc1" TagName="Google_Analytics" %>
<%@ Register Src="~/User_Controls/Login.ascx" TagPrefix="uc1" TagName="Login" %>
<%@ Register Src="~/User_Controls/Search.ascx" TagPrefix="uc1" TagName="Search" %>
<%@ Register Src="~/User_Controls/ActiveUser.ascx" TagPrefix="uc1" TagName="ActiveUser" %>
<%--<uc1:Google_Analytics runat="server" ID="Google_Analytics" />--%>
<script src="/Website/scripts/jquery/jquery-1.10.2.js"></script>
<script src="/Website/scripts/jquery/jquery-ui-1.10.4.custom.js"></script>
<link href="/Website/CSS_Stylesheets/JQuery.css" rel="stylesheet" />
   
<br />

<div id="headerWrapper" style="margin:0PX; border:0PX;"/>
    <div class="headerContent">
        <div class="headerContentLeft">
            <a href="home.aspx"><img src="../Images/JUST RATE LOGO_NoWhiteSpace.png" style="height:140px; align-content:center;"/></a>
      
            <%--<div class="sponsoredby">
                <img src="../Images/homepage/sponsoredby_transparent.png" style="height:30px;"/>          
                <a href="http://www.milestonerathfriland.com" target="_blank"><img src="../Images/homepage/milestonesupermarket.png" style="height:60px;"/></a>
            </div>--%>
        </div>
        <div class="headerContentRight">
            <div class="logincontent">
                <uc1:Login runat="server" id="Login" />
                <uc1:ActiveUser runat="server" id="ActiveUser" Visible="false" />
            </div>
       </div>   
   </div>   

   <div class="Navigation">
        <div class="holder"> 
            <ul>
                <li id="nav_home"><a href="Home.aspx"><img src="../Images/HOUSE.png" height=25px width=25px /></a></li>
                <li id="nav_rate"><a href="Rate.aspx"><b>Rate</b></a></li>                    
                <li id="nav_guide"><a href="Guide.aspx"><b>Guide</b></a></li>
                <li id="nav_aboutus"><a href="Aboutus.aspx"><b>About Us</b></a></li>
                <li id="nav_faq"><a href="FAQ.aspx"><b>FAQ</b></a></li>                
            </ul>
        </div>
       <div class="searchForm">
            <uc1:Search runat="server" id="Search1" />
       </div>          
    </div>
       
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5340687d0a9e5f3b"></script>                   
<meta name="google-translate-customization" content="6ca04d27505c9e39-43c7c7fc053178a5-g74fda1c01d96ff04-12"/>
