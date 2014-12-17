<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginMain.aspx.cs" Inherits="Home" MasterPageFile="~/Master_Pages/Default.master" %>
<%@ Register Src="~/User_Controls/GoogleMapsAPI.ascx" TagPrefix="uc1" TagName="GoogleMapsAPI" %>

<asp:Content ID="LoginMain_Main" ContentPlaceHolderID="Main" Runat="Server">
   <div id="top"></div>
    <div id="homeWrapper">
   <div id="LoginMainWrapper">
   <br />
<div id="ratelogin">
<h1>Login to Rate</h1>       <br />
<asp:Label ID="errorLabel" class="errorlabel" Visible="false" runat="server"></asp:Label>
<br /><i>Haven't registered yet? Click the register button!</i>
<table class="mainlogin">

   <tr>
   <td class="td1"><asp:Label ID="Label_Email" class="label_email" runat="server" Text="Email"></asp:Label></td>
   <td class="td"><asp:TextBox ID="Email_Address" class="label_email1" runat="server" TextMode="SingleLine"></asp:TextBox></td>  
   </tr>   
        
   <tr>
   <td class="td1"><asp:Label ID="Label_Password" runat="server"  class="label_password" Text="Password" ></asp:Label></td>
   <td class="td"><asp:TextBox ID="Password" runat="server" TextMode="Password"  class="label_password1"></asp:TextBox></td>
   </tr>

   <tr>
   <td></td>
   <td><asp:Button ID="LoginButton" runat="server" Class="mustlogin" Text="Login"  OnClick="LoginButton_Click" />
       <asp:Button ID="RegisterPageButton" runat="server" Class="mustlogin" Text="Register" PostBackUrl="/Website/Pages/Register.aspx"/></td>
   
   </tr>
</table>
<br />

 
    </div>   <br /><br /></div>
</asp:Content>