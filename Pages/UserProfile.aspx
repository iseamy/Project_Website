<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="Home" MasterPageFile="~/Master_Pages/Default.master" %>

<asp:Content ID="Home_Main" ContentPlaceHolderID="Main" Runat="Server">
    <div id="UserMainWrap">

    <div id="userProfileWrapper">
    <h1>User Profile</h1><br />
        <table id="userInfo" class="userinfo">
            <tr>
                <td><b>User Name:</b> </td>
                <td><asp:Label ID="lbl_UserName" runat="server" Visible="true"></asp:Label></td>
            </tr>
            <tr>
                <td><b>Name: </b></td>
                <td><asp:Label ID="lbl_Name" runat="server" Visible="true"></asp:Label></td>
            </tr>
            <tr>
                <td><b>Sex:</b></td>
                <td></td>
            </tr>
            <tr>
                <td><b>DOB:</b></td>
                <td></td>
            </tr>
            <tr>
                <td><b>Email Address:</b> </td>
                <td><asp:Label ID="lbl_EmailAddress" runat="server" Visible="true"></asp:Label></td>
            </tr>
            <tr>
                <td><b>University Details:</b></td><!-- (Dropdown) This will need db editing and further form fields -->
                <td></td>
            </tr>
            <tr>
                <td><b>Recently viewed:</b></td><!-- User can see last three properties viewed on the site -->
                <td><%--11 Landseer Street, Stranmillis--%></td>
            </tr>
            <tr>
                <td><b>Recent Posts:</b></td><!-- user can look at the last 3 houses they have rated -->
                <td></td>
            </tr>            
            <tr>
                <td><b>No. Posts since created:</b></td>
                <td></td>
            </tr>
            <tr><td>       <br />
             <div class="button"><b><u>Edit my profile</u></b></div></td></tr>
        </table>

                <img src="../Images/barrym.jpg" style="width:280px; height:250px; border-radius:15px; margin-left:2%;/*padding-right:2%;*/ padding-left:2%;"/>

    </div>

</div>
</asp:Content>