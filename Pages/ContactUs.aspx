<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="Home" MasterPageFile="~/Master_Pages/Default.master" %>
<%@ Register Src="~/User_Controls/GoogleMapsAPI.ascx" TagPrefix="uc1" TagName="GoogleMapsAPI" %>

<asp:Content ID="Home_Main" ContentPlaceHolderID="Main" Runat="Server">
<div id="contactWrapper" style="display:inline-block">
<div id="contactcontent">
<h1>Contact Us</h1>
<p>Check out our <a href="FAQ.aspx">FAQs page</a>, your question may have already been answered.
If not, fill in the form below and we will get back to you as soon as possible.</p>
        
                    <table class="contactfields">                                 
                <tr>
                <td><asp:Label ID="FirstName" runat="server" Visible="true">First Name</asp:Label></td>
                <td><asp:TextBox ID="First_Name" Class="field" Visible="true" runat="server" placeholder= "  First Name" Width="50%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="FirstNameRequired" ControlToValidate="First_Name" Text="First Name Required" runat="server"></asp:RequiredFieldValidator></td>              
            </tr>
                <tr>
                <td><asp:Label ID="LastName" runat="server" Visible="true">Last Name</asp:Label></td>
                <td><asp:TextBox ID="Last_Name" Class="field" placeholder="  Last Name" Visible="true" runat="server" Width="50%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="LastNameRequired" ControlToValidate="Last_Name" Text="Last Name Required" runat="server"></asp:RequiredFieldValidator></td>              
            </tr>
            <tr>
                <td><asp:Label ID="EmailAddress" runat="server" Visible="true" Width="150px">Email Address</asp:Label></td>
                <td><asp:TextBox ID="Email_Address" Class="field"  Visible="true" runat="server" placeholder="  Enter your Email Address" Width="50%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="EmailAddressRequired" ControlToValidate="Email_Address" Text="Email Address Required" runat="server"></asp:RequiredFieldValidator></td>              
            </tr>  
                        <tr>
                <td><asp:Label ID="Titleofquery" runat="server" Visible="true" Width="150px">Question Summary</asp:Label></td>
                <td><asp:TextBox ID="Titleof_query" Class="field"  Visible="true" runat="server" placeholder="  Enter a summary here"  Width="50%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="Titleof_query" Text="Summary required" runat="server"></asp:RequiredFieldValidator></td>              
            </tr> 
            <tr>
                <td><asp:Label ID="Comment" runat="server" Visible="true">Comment</asp:Label></td>
                <td><asp:TextBox ID="Comment_" Class="field" Visible="true" runat="server" placeholder="  Enter comment here" Width="80%" Height="100px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="CommentRequired" ControlToValidate="Comment_" Text="Comment Required" runat="server" TextMode="multiline"></asp:RequiredFieldValidator></td>              
            </tr>  

                        <tr>
                <td></td>
               <td> <asp:TextBox ID="Time" Visible="false" runat="server"></asp:TextBox>
                <asp:Button ID="Submit_Registration" class="submitregistrationquery" Visible="true" text="Submit" runat="server"/><br />
                <asp:Label ID="errorLabel" Visible="false" runat="server"></asp:Label>
                </td>
            </tr>
        
         </table>
         </div>
    </div>
</asp:Content>