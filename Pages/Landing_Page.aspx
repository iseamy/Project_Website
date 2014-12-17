<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Landing_Page.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<meta name="viewport" content="width=device-width, intial-scale=1.0" />
<br />
<link href="/Website/CSS_Stylesheets/Main.css" rel="stylesheet" />
<div id="Wrapper_LandingPage">        
     <div id="Content_LandingPage">    
     
            <img class="LOGO" src="/Website/Images/JUST RATE LOGO_NoWhiteSpace.png" /><br />             
            <img src="/Website/Images/under_construction.jpg" style="height:auto; width:70%" />    
            <form id="SignUpByEmail" runat="server">                                    
            <asp:TextBox ID="EmailAddress" Visible="true" runat="server" placeholder="Enter Email address here"></asp:TextBox><asp:Button ID="Submit_EmailAddress" Visible="true" text="Submit" OnClick="Submit_EmailAddress_Click" runat="server" /><br />
            <asp:TextBox ID="Time" Visible="false" runat="server"></asp:TextBox>
            <asp:Label ID="errorLabel" Visible="false" runat="server"></asp:Label>
            </form>


        <!-- AddThis Follow BEGIN -->
    <p>Follow Us</p>
    <div class="addthis_toolbox addthis_32x32_style addthis_default_style">

        <a class="addthis_button_facebook_follow" addthis:userid="Just-Rate"></a>
        <a class="addthis_button_twitter_follow" addthis:userid="Just_Rate"></a></div>

        <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-53318b0213f957ef"></script>
        <!-- AddThis Follow END -->                                                                 
    </div>
    <br />
</div>  
</body>
</html>