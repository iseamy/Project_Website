<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Rate.aspx.cs" Inherits="Home" MasterPageFile="~/Master_Pages/Default.master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/User_Controls/GoogleMapsAPI.ascx" TagPrefix="uc1" TagName="GoogleMapsAPI" %>

<asp:Content ID="Home_Main" ContentPlaceHolderID="Main" style="align-content:center" Runat="Server">

<div id="reviewFormWrapper">   <br /> 
           <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
            <asp:Accordion ID="Accordion1" runat="server" RequireOpenedPane="true" AutoSize="None">
                <Panes>                    
                    <asp:AccordionPane id="AccordionPaneMain" runat="server">
                       <Header><a href="#" class="accordionlink" onclick="ToggleAccordionPane(0);"><h1>JustRate it!</h1><br /></a></Header>
                     
                        <Content>  
                           <div class="first"><center>
                            </center>
    
<div class="ui-widget">
                              <%--  <center><label for="tags">Select the rental you wish to rate: </label></center> --%>
                                <center><asp:TextBox ID="tags" runat="server" class="searchbar" placeholder="Type address here.."></asp:TextBox><br /><asp:Label id="errorLabel2" runat="server" visible="false"></asp:Label></center>
                            </div>
                            <asp:Label ID="accordion1ErrorLabel" Visible="false" runat="server" ForeColor="Red"></asp:Label>
                            <p class="label">Can't find your rental above? Scroll down to add it to our database and JustRate it!</p>    </div> 
                           <asp:Label ID="errorLabel" Visible="false" runat="server" style="color:green; font-size:24px; font-weight:bold;"></asp:Label>
                            <div id="sandt">
                            
                            <div class="third">
                            <br />
                           <center><label for="TitleReview">Title of your review</label></center>
                            <asp:TextBox ID="TitleReview" runat="server" class="reviewmessage" placeholder="Give your review a title" Visible="true"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator5" Visible="true" ValidationGroup="accordion1" ForeColor="Red" controltovalidate="TitleReview" errormessage="Please give your review a title" />
                            <center><label for="TitleReview">Your Review</label></center>
                            <asp:TextBox ID="ReviewMessage" placeholder="Type Review Here (200 character maximum)" MaxLength="200"  class="reviewmessage" runat="server" Visible="true" TextMode="MultiLine" height="100px" font-family="arial" align="CENTER"></asp:TextBox>                                                            
                            <asp:RequiredFieldValidator runat="server" ID="ReqFieldVal6" Visible="true" ValidationGroup="accordion1" ForeColor="Red" ControlToValidate="ReviewMessage" ErrorMessage="Please enter a maximum of 200 characters"></asp:RequiredFieldValidator>
                            
                            <center><label for="rating">Overall rating of accommodation</label></center>                                                                         
                            <ul class="rating">    <li>           
                        <asp:Label ID="lblLandlordRelationship" runat="server" class="label" Visible="true">Landlord Relationship</asp:Label>    
                        <asp:Label ID="rating1Value" runat="server" Visible="false"></asp:Label>                     
                        <asp:Rating ID="Rating1" runat="server"
                            MaxRating="5" CurrentRating="0" class="rating" AutoPostBack="true" StarCssClass="blankstar" WaitingStarCssClass="waitingstar" 
                            FilledStarCssClass="shiningstar" EmptyStarCssClass="blankstar" OnChanged="Rating1_Changed">
                        </asp:Rating>  </li>                          
                       
                       <li><asp:Label ID="lblHouseCondition" runat="server" class="label" Visible="true">House Condition</asp:Label>
                        <asp:Label ID="rating2Value" runat="server" Visible="false"></asp:Label>
                       <asp:Rating ID="Rating2" runat="server"
                            CurrentRating="0" MaxRating="5" AutoPostBack="true" class="rating" StarCssClass="blankstar" WaitingStarCssClass="waitingstar" 
                            FilledStarCssClass="shiningstar" EmptyStarCssClass="blankstar" OnChanged="Rating2_Changed">
                        </asp:Rating></li> 
                       <li><asp:Label ID="lblParking" runat="server" class="label" Visible="true">Nearby Parking</asp:Label>
                        <asp:Label ID="rating3Value" runat="server" Visible="false"></asp:Label>
                        <asp:Rating ID="Rating3" runat="server"
                            CurrentRating="0" MaxRating="5" class="rating"  AutoPostBack="true" StarCssClass="blankstar" WaitingStarCssClass="waitingstar" 
                            FilledStarCssClass="shiningstar" EmptyStarCssClass="blankstar" OnChanged="Rating3_Changed">
                        </asp:Rating></li> 

                        <li><asp:Label ID="lblClosebyAmenities" runat="server" class="label" Visible="true">Closeby Amenities</asp:Label>
                        <asp:Label ID="rating4Value" runat="server" Visible="false"></asp:Label>
                        <asp:Rating ID="Rating4" runat="server"
                            CurrentRating="0" MaxRating="5" class="rating" AutoPostBack="true" StarCssClass="blankstar" WaitingStarCssClass="waitingstar" 
                            FilledStarCssClass="shiningstar" EmptyStarCssClass="blankstar" OnChanged="Rating4_Changed">
                        </asp:Rating></li><br />
                        <li><asp:label ID="lblUniLevel0" runat="server" class="label" Visible="true" >University Level</asp:label>
                        <asp:DropDownList ID="UniLevel0" class="button"  AppendDataBoundItems="true" runat="server" Visible="true">
                            <asp:ListItem Value="" Selected="True">Please choose</asp:ListItem>
                            <asp:ListItem Value="1">1</asp:ListItem> 
                            <asp:ListItem Value="2">2</asp:ListItem>
                            <asp:ListItem Value="3">3</asp:ListItem>
                            <asp:ListItem Value="4">4</asp:ListItem>
                            <asp:ListItem Value="5">Post Graduate</asp:ListItem>
                            <asp:ListItem Value="Other">Other</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator3" Visible="true" ValidationGroup="accordion1" ForeColor="Red" controltovalidate="UniLevel0" errormessage="Please select an option for University level" />
                  </li>
                        <li><asp:label ID="lblLeaseLength0" runat="server" class="label" Visible="true" >Lease Length</asp:label>
                        <asp:DropDownList ID="LeaseLength0" class="button"  AppendDataBoundItems="true" runat="server" Visible="true">
                            <asp:ListItem Value="" Selected="True">Please choose</asp:ListItem>
                            <asp:ListItem Value="6 Months">6 Months</asp:ListItem> 
                            <asp:ListItem Value="10 Months">10 Months</asp:ListItem>
                            <asp:ListItem Value="12 Months">12 Months</asp:ListItem>                              
                            <asp:ListItem Value="Other">Other</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator4" Visible="true" ValidationGroup="accordion1" ForeColor="Red" controltovalidate="LeaseLength0" errormessage="Please select an option for lease length" />
</li></ul>
        </div>
                    <div class="second">     
                    <br />
                       <center><label for="fileupload">Add Some Images</label></center>
                       <p class="label" style="margin-left:5%">Adding Images makes your review even more impressionable for other JustRate users - every little helps! </p>                               
                        <ul class="fileupload"> 
                        <li class="horizontal"><asp:FileUpload ID="fileUpload1" class="button" runat="server" Visible="true" /></li>
                        <li class="horizontal"><asp:FileUpload ID="fileUpload2" class="button" runat="server" Visible="true" /></li>
                        <li class="horizontal"><asp:FileUpload ID="fileUpload3" class="button" runat="server" Visible="true" /></li>
                        <li class="horizontal"><asp:FileUpload ID="fileUpload4" class="button" runat="server" Visible="true" /></li>
                        <li class="horizontal"><asp:FileUpload ID="fileUpload5" class="button" runat="server" Visible="true" /></li></ul>  
                        <asp:Label ID="help" class="label" Visible="true" runat="server">Tip: Hover over the Post Review button to see a list of supported file types</p></asp:Label>  
                    <div class="labelcheckbox"><asp:Label ID="lblformVerification" runat="server" Visible="true">I certify that this rating is based on my own experience and is my genuine opinion whilst staying in this rented accommodation, and that I have no personal or business relationship with this establishment. I have also not been offered any incentive or payment originating from the establishment to write this review and have no intention of deliberately affecting the owners future business within the market. I understand that JustRate has a zero-tolerance policy on fake reviews and if found to be infringing against this policy I will be removed from the site.
</asp:Label><br />
                    <asp:CheckBox ID="formVerification2" Checked="false" runat="server" Visible="true" />
                    <asp:Label ID="errorLabelReg2" Visible="false" runat="server" ForeColor="Red"></asp:Label></div>   </br>                                  
                        <asp:Button ID="buttonUploadReview" Class="buttonUploadReview" Visible="true" runat="server" CausesValidation="true" ValidationGroup="accordion1" Text="Post Review" OnClick="buttonUploadReview_Click" ToolTip=""/>
                        <br />
                        <input type="reset" value="Clear form" class="clearform"/> 
                        <br />
                        <asp:ValidationSummary ID="validSummary" Visible="true" runat="server" DisplayMode="List" ValidationGroup="accordion1" ForeColor="Red" />                            
                        <br /> 
                        <asp:Label runat="server" Visible="false" ID="errorLabelRatings" ForeColor="Red"></asp:Label><br />                                     
                        </div>
                        </div>
                        </Content>
                    </asp:AccordionPane>  
                    
                    
                    
                    <asp:AccordionPane runat="server" ID="AccordionPane1">
                        <Header><a href="#" class="accordionlink" onclick="ToggleAccordionPane(1)";><p >Cant find your house? Click here to add it to our database</p></a>
                        <br />
                        <br />
                        <asp:Label ID="errorLabelHouseDetails" Visible="false" runat="server" style="color:green; font-size:24px; font-weight:bold;"></asp:Label>                         


                        </Header>
                        
                        <Content>  
                            <asp:Label ID="accordion2ErrorLabel" Visible="false" runat="server" ForeColor="Red"></asp:Label>
                           <div class="first"><label for="newhouse">Add the details below</label></center><br /><br />
                            <table id="newhouse" class="newhouse">
                                <tr>
                                    <td><asp:label ID="lblHouseNo" runat="server" Visible="true" >House number</asp:label></td>
                                    <td><asp:TextBox ID="HouseNo" runat="server" class="textarea" Visible="true"></asp:TextBox></br>
                                    <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator7" controltovalidate="HouseNo" ValidationGroup="accordion2" ForeColor="Red" errormessage="Please enter a house number" Visible="true" />
                                    </td>
                                </tr>
                                <tr>
                                    <td><asp:label ID="lblStreet" runat="server" Visible="true" >Street</asp:label></td>
                                    <td><asp:TextBox ID="Street" runat="server" class="textarea" Visible="true"></asp:TextBox></br>
                                    <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator8" controltovalidate="Street" ValidationGroup="accordion2" ForeColor="Red" errormessage="Please enter a street" Visible="true" />
                                    </td>
                                </tr>
                                <tr>
                                    <td><asp:label ID="lblArea" runat="server" Visible="true" >Area</asp:label></td>
                                    <td><asp:DropDownList ID="AreaDL" class="dropdown" AppendDataBoundItems="true" runat="server" Visible="true" >
                                            <asp:ListItem Value="" Selected="True">Please choose</asp:ListItem>
                                            <asp:ListItem Value="Stranmillis">Stranmillis</asp:ListItem> 
                                            <asp:ListItem Value="Holylands">Holylands</asp:ListItem>
                                            <asp:ListItem Value="Malone Road">Malone Road</asp:ListItem>
                                            <asp:ListItem Value="Lisburn Road">Lisburn Road</asp:ListItem>
                                            <asp:ListItem Value="Botanic">Botanic</asp:ListItem>
                                            <asp:ListItem Value="Other">Other</asp:ListItem>
                                        </asp:DropDownList></br>
                                        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator9" controltovalidate="AreaDL" ValidationGroup="accordion2" ForeColor="Red" errormessage="Please select an area" Visible="true" />
                                    </td>
                                </tr>
                                <tr>
                                    <td><asp:label ID="lblPostcode" runat="server" Visible="true" >Post Code</asp:label></td>
                                    <td><asp:TextBox ID="PostCode" runat="server" class="textarea" Visible="true"></asp:TextBox></br>
                                        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator10" controltovalidate="Street" ValidationGroup="accordion2" ForeColor="Red" errormessage="Please enter a postcode" Visible="true" />
                                    </td>
                                </tr>
                                <tr>
                                    <td><asp:label ID="lblNoBeds" runat="server" Visible="true" >No Of Beds</asp:label></td>
                                    <td><asp:DropDownList ID="NoOfBeds" class="dropdown" AppendDataBoundItems="true" runat="server" Visible="true">
                                            <asp:ListItem Value="" Selected="True">Please choose</asp:ListItem>
                                            <asp:ListItem Value="1">1</asp:ListItem> 
                                            <asp:ListItem Value="2">2</asp:ListItem>
                                            <asp:ListItem Value="3">3</asp:ListItem>
                                            <asp:ListItem Value="4">4</asp:ListItem>
                                            <asp:ListItem Value="5">5</asp:ListItem>
                                            <asp:ListItem Value="Other">Other</asp:ListItem>
                                        </asp:DropDownList></br>
                                        <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator11" controltovalidate="NoOfBeds" ValidationGroup="accordion2" ForeColor="Red" errormessage="Please select the number of beds" Visible="true" />
                                    </td>
                                </tr>
                            </table>
                            <br />
                            </div> 

                            <div id="sandt">
                           
                            <div class="third">
                            <br />
                           <center><label for="TitleReview2">Title of your review</label></center>
                            <asp:TextBox ID="TitleOfReview2" runat="server" class="reviewmessage" placeholder="Give your review a title" Visible="true"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator14" Visible="true" ValidationGroup="accordion2" ForeColor="Red" controltovalidate="TitleOfReview2" errormessage="Please give your review a title" />
                            <center><label for="TitleReview2">Your Review</label></center>
                            <asp:TextBox ID="ReviewContent2" MaxLength="200" placeholder="Type Review Here (200 character maximum)" class="reviewmessage" runat="server" Visible="true" TextMode="MultiLine" height="100px" font-family="arial" align="CENTER"></asp:TextBox>                                
                            <br />
                            <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator15" Visible="true" ValidationGroup="accordion2" ForeColor="Red" controltovalidate="ReviewContent2" errormessage="Please enter review content" />
                            
                            <center><label for="rating">Overall rating of accommodation</label></center>                                                                         
                            <ul class="rating">    <li>           
                         <asp:Label ID="lblLandlordRelationship2" class="label" runat="server" Visible="true">Landlord Relationship</asp:Label>    
                            <asp:Label ID="rating5Value" runat="server" Visible="false"></asp:Label>                     
                            <asp:Rating ID="Rating5" runat="server"
                                MaxRating="5" CurrentRating="0" AutoPostBack="true" class="rating" StarCssClass="blankstar" WaitingStarCssClass="waitingstar" 
                                FilledStarCssClass="shiningstar" EmptyStarCssClass="blankstar" OnChanged="Rating5_Changed">
                            </asp:Rating></li>                          
                       
                       <li>  <asp:Label ID="lblHouseCondition2" class="label" runat="server" Visible="true">House Condition</asp:Label>
                            <asp:Label ID="rating6Value" runat="server" Visible="false"></asp:Label>
                            <asp:Rating ID="Rating6" runat="server"
                                CurrentRating="0" MaxRating="5" AutoPostBack="true" class="rating" StarCssClass="blankstar" WaitingStarCssClass="waitingstar" 
                                FilledStarCssClass="shiningstar" EmptyStarCssClass="blankstar" OnChanged="Rating6_Changed">
                            </asp:Rating></li> 

                       <li> <asp:Label ID="lblParking2" runat="server" class="label" Visible="true">Nearby Parking</asp:Label>
                            <asp:Label ID="rating7Value" runat="server" Visible="false"></asp:Label>
                            <asp:Rating ID="Rating7" runat="server"
                                CurrentRating="0" MaxRating="5" AutoPostBack="true" class="rating" StarCssClass="blankstar" WaitingStarCssClass="waitingstar" 
                                FilledStarCssClass="shiningstar" EmptyStarCssClass="blankstar" OnChanged="Rating7_Changed">
                            </asp:Rating></li> 

                        <li><asp:Label ID="lblamenities2" runat="server" class="label" Visible="true">Closeby Amenities</asp:Label>
                            <asp:Label ID="rating8Value" runat="server" Visible="false"></asp:Label>
                            <asp:Rating ID="Rating8" runat="server"
                                CurrentRating="0" MaxRating="5" AutoPostBack="true" StarCssClass="blankstar" WaitingStarCssClass="waitingstar" 
                                FilledStarCssClass="shiningstar" EmptyStarCssClass="blankstar" class="rating" OnChanged="Rating8_Changed">
                            </asp:Rating></li></ul>
                                <asp:Label runat="server" Visible="false" ID="errorLabelRating" ForeColor="Red"></asp:Label>
                            <br />


                        <ul class="rating"><li><asp:label ID="lblUniLevel" runat="server" class="label"  Visible="true" >University Level</asp:label>
                            <asp:DropDownList ID="UniLevel2" class="button" AppendDataBoundItems="true" runat="server" Visible="true">
                                <asp:ListItem Value="" Selected="True">Please choose</asp:ListItem>
                                <asp:ListItem Value="1">1</asp:ListItem> 
                                <asp:ListItem Value="2">2</asp:ListItem>
                                <asp:ListItem Value="3">3</asp:ListItem>
                                <asp:ListItem Value="4">4</asp:ListItem>
                                <asp:ListItem Value="5">Post Graduate</asp:ListItem>
                                <asp:ListItem Value="Other">Other</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" controltovalidate="UniLevel2" ValidationGroup="accordion2" ForeColor="Red" errormessage="Please select an option for university level" Visible="true" />
                            </li>

                        <li><asp:label ID="lblLengthLease" runat="server" class="label" Visible="true" >Lease Length</asp:label>
                            <asp:DropDownList ID="LengthLease2" class="button" AppendDataBoundItems="true" runat="server" Visible="true">
                                <asp:ListItem Value="" Selected="True">Please choose</asp:ListItem>
                                <asp:ListItem Value="6 Months">6 Months</asp:ListItem> 
                                <asp:ListItem Value="10 Months">10 Months</asp:ListItem>
                                <asp:ListItem Value="12 Months">12 Months</asp:ListItem>                              
                                <asp:ListItem Value="Other">Other</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator16" controltovalidate="LengthLease2" ValidationGroup="accordion2" ForeColor="Red" errormessage="Please select an option for lease length" Visible="true" />
                           </li></ul>
        </div>

                       <div class="second">  
                       <br />   
                       <center><label for="fileupload">Add Some Images</label></center>   
                       <p class="label" style="margin-left:5%">Adding Images makes your review even more impressionable for other JustRate users - every little helps! </p>                                                           
                        <ul class="fileupload"> 
                        <li class="horizontal"><asp:FileUpload ID="fileUpload6" class="button" runat="server" Visible="true" /></li>
                        <li class="horizontal"><asp:FileUpload ID="fileUpload7" class="button" runat="server" Visible="true" /></li>
                        <li class="horizontal"><asp:FileUpload ID="fileUpload8" class="button" runat="server" Visible="true" /></li>
                        <li class="horizontal"><asp:FileUpload ID="fileUpload9" class="button" runat="server" Visible="true" /></li>
                        <li class="horizontal"><asp:FileUpload ID="fileUpload10" class="button" runat="server" Visible="true" /></li></ul>  
                        <asp:Label ID="tip2" class="label" Visible="true" runat="server">Tip: Hover over the Post Review button to see a list of supported file types</p></asp:Label>  
                    <div class="labelcheckbox"><asp:Label ID="Label6" runat="server" Visible="true">I certify that this review is based on my own experience and is my genuine opinion of this rental, and that I have no personal or business relationship with this establishment, and have not been offered any incentive or payment originating from the establishment to write this review. I understand that JustRate has a zero-tolerance policy on fake reviews.
</asp:Label><br />
                    <asp:CheckBox ID="CheckBox2" Checked="false" runat="server" Visible="true" />
                    <asp:Label ID="checkboxAccordion2" Visible="false" runat="server" style="color:green; font-size:24px; font-weight:bold;"></asp:Label></div>     <br />                                
                        <asp:Button ID="submitHouseDetailsForm" Class="buttonUploadReview" Visible="true" runat="server" CausesValidation="true" ValidationGroup="accordion2" Text="Post Review" OnClick="buttonUploadHouseDetails_Click" ToolTip=""/>
                        <br />
                        <input type="reset" value="Clear form" class="clearform"/>
                        <br />
                        <asp:ValidationSummary ID="ValidationSummary2" Visible="true" runat="server" DisplayMode="List" ValidationGroup="accordion2" ForeColor="Red" />                            
                        <br />                                                              
                        </div>
                  
                        </Content>
                    </asp:AccordionPane>  


                </Panes>
            </asp:Accordion>       
    </div>

<script>
    $(function () {
        var availableTags = [ <%= houseDetailsList %> ];
        $("#Main_tags").autocomplete({
            source: availableTags
        });
    });
</script>
<script>
    function ToggleAccordionPane(paneno) {

        $find('Accordion1_AccordionExtender')._changeSelectedIndex(-1);
        if ($find('Accordion1_AccordionExtender').get_Pane(paneno).content.style.display == "block") {
            $find('Accordion1_AccordionExtender').get_Pane(paneno).content.style.display = "none";
            $find('Accordion1_AccordionExtender')._changeSelectedIndex(paneno);
        }
        else {
            $find('Accordion1_AccordionExtender').get_Pane(paneno).content.style.display = "block";
        }

        return false;
    }
</script>


</asp:Content>