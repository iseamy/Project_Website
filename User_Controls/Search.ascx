<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Search.ascx.cs" Inherits="User_Controls_Search" %>
         
<asp:TextBox id="searchCriteria" class="searchcriteria" runat="server" Visible="true" placeholder= "  Search for a rental here:"></asp:TextBox>
<asp:imageButton src="../Images/homepage/magnifier_transparent.png" Width="40px" Height="40px" id="beginSearch" class="beginsearch" runat="server" Visible="true" Text="Search" OnClick="beginSearch_Click"/> 
 

