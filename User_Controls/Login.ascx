<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Login.ascx.cs" Inherits="User_Controls_Login" %>

<div id="loginheader">   
    <asp:Label ID="Label_Email" Class="headeremail" runat="server" Text="Email"></asp:Label>
    <asp:TextBox ID="Email_Address" Class="headeremail1" runat="server" TextMode="SingleLine"></asp:TextBox>  
 
    <asp:Label ID="Label_Password" runat="server" Class="headerpassword" Text="Password" style="text-align: left"></asp:Label>
    <asp:TextBox ID="Password" runat="server" Class="headerpassword1" TextMode="Password"></asp:TextBox>

    <asp:Button ID="LoginButton" runat="server" Text="Login" Class="headerloginbutton" OnClick="LoginButton_Click" />
    <asp:Label ID="errorLabel" Visible="false" Class="headererror" runat="server"></asp:Label>

    <asp:Button ID="RegisterPageButton" runat="server" Class="headerregisterbutton" Text="Register" PostBackUrl="/Website/Pages/Register.aspx"/>
</div>
