<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" MasterPageFile="~/Master_Pages/Default.master" %>
<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>

<asp:Content ID="Register_Main" ContentPlaceHolderID="Main" Runat="Server">  
    <div id="registerWrapper" style="display:inline-block;">
       <div id="registerContent">
           <h1> Registration </h1>

            <table class="registerfields">            
            <tr>
                <td><asp:Label ID="UserName" runat="server" Visible="true">  Username</asp:Label></td>
                <td><asp:TextBox ID="User_Name" Visible="true" Class="field"  Width="50%" runat="server" placeholder="  Enter a Username"></asp:TextBox>
                <asp:RequiredFieldValidator ID="UserNameRequired" ValidationGroup="regForm" ForeColor="Red" ControlToValidate="User_Name" Text="Username Required" runat="server"></asp:RequiredFieldValidator></td>              
            </tr>                         
                <tr>
                <td><asp:Label ID="FirstName" runat="server" Visible="true">  First Name</asp:Label></td>
                <td><asp:TextBox ID="First_Name" Visible="true" Class="field" runat="server" Width="50%" placeholder= "  First Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="FirstNameRequired" ValidationGroup="regForm" ControlToValidate="First_Name" ForeColor="Red" Text="First Name Required" runat="server"></asp:RequiredFieldValidator></td>              
            </tr>
                <tr>
                <td><asp:Label ID="LastName" runat="server" Visible="true">  Last Name</asp:Label></td>
                <td><asp:TextBox ID="Last_Name" placeholder="  Last Name" Class="field" Visible="true" Width="50%" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="LastNameRequired" ValidationGroup="regForm" ControlToValidate="Last_Name" ForeColor="Red" Text="Last Name Required" runat="server"></asp:RequiredFieldValidator></td>              
            </tr>
            <tr>
                <td><asp:Label ID="EmailAddress" runat="server" Visible="true">  Email Address</asp:Label></td>
                <td><asp:TextBox ID="Email_Address" Visible="true" Class="field" runat="server" Width="50%" placeholder="  Enter your Email Address"></asp:TextBox>
                <asp:RequiredFieldValidator ID="EmailAddressRequired" ValidationGroup="regForm" ControlToValidate="Email_Address" ForeColor="Red" Text="Email Address Required" runat="server"></asp:RequiredFieldValidator></td>              
            </tr>            
            <tr>
                <td><asp:Label ID="Password" runat="server" Visible="true">  Password</asp:Label></td>
                <td><asp:TextBox ID="Password_Enter" Visible="true" Class="field" runat="server" Width="50%" placeholder="  Enter Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PasswordRequired" ControlToValidate="Password_Enter" ValidationGroup="regForm" ForeColor="Red" Text="Password Required" runat="server"></asp:RequiredFieldValidator></td>              
            </tr>
            <tr>
                <td><asp:Label ID="PasswordVerify" runat="server" Visible="true">  Re-enter Password</asp:Label></td>
                <td><asp:TextBox ID="Password_Verification" Visible="true" Class="field" runat="server" Width="50%" placeholder="  Re-enter your Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PasswordVerification" ValidationGroup="regForm" ControlToValidate="Password_Verification" ForeColor="Red" Text="Password Verification Required" runat="server"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td> </td>
                    <td><asp:Label ID="lblformVerification" runat="server" Visible="true"><i>Check the box to submit your registration</i></asp:Label>
                    <asp:CheckBox ID="formVerification" Checked="false" runat="server" Visible="true" />
                    <asp:Label ID="errorLabelReg" Visible="false" runat="server" ForeColor="Red"></asp:Label>                                     
               
                
                <asp:TextBox ID="Time" Visible="false" runat="server"></asp:TextBox>
                <asp:Button ID="Submit_Registration" class="submitregistration" Visible="true" text="Submit" runat="server" OnClick="Submit_Registration_Click" CausesValidation="true" ValidationGroup="regForm" />
               <br /> <asp:Label ID="errorLabel" Visible="false" runat="server"></asp:Label>
                </td>
            </tr>
            </table>
          
        </div>
    </div>
</asp:Content>  
 
