<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ActiveUser.ascx.cs" Inherits="User_Controls_ActiveUser" %>
<div id="loggedin">

<a href="/Website/Pages/UserProfile.aspx">
<asp:Label ID="UserProfile" Class="userprofile" runat="server" ToolTip="User profile"><img src="../Images/barrym.jpg" style="width:15px; height:15px; border:1px solid #019a9f; border-radius:5px; margin-top:2px"/></asp:Label></a> 
       
<asp:Label ID="Label_UserNameLoggedIn" class="usernameloggedin" runat="server" Text="You are logged in as " ></asp:Label>
<asp:Label ID="Lbl_Name" class="name" runat="server" Visible="true" style="color:white"></asp:Label>

<asp:Button ID="LogOut" Class="logout" runat="server" Text="Log Out" OnClick="LogOut_Click" />
<%--  --%>
</div>
