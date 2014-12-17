<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Aboutus.aspx.cs" Inherits="Home" MasterPageFile="~/Master_Pages/Default.master" %>
<%@ Register Src="~/User_Controls/GoogleMapsAPI.ascx" TagPrefix="uc1" TagName="GoogleMapsAPI" %>

<asp:Content ID="Home_Main" ContentPlaceHolderID="Main" Runat="Server">
    <div id="homeWrapper">
<center><div id="topaboutus"  style="background-color:#019a95; display:inline-block; width:100%"><h1>About Us</h1>


   <p> Click on the links below to find out more about JustRate - if you have any more questions visit our <a href="FAQ.aspx">FAQ</a> and <a href="ContactUs.aspx">Contact pages.</a></p>
    <ul class="img-list">
  <li>
    <a href="#aboutus">
      <img src="../Images/aboutjustrate.png" style="height:90%; width:70%; border-radius:15px" />
      <span class="text-content"><span>About JustRate</span></span>
    </a>
  </li>
    <li>
    <a href="#ourvalues">
      <img src="../Images/ourvalues.png" style="height:90%;width:70%; border-radius:15px" />
      <span class="text-content"><span>Our Values</span></span>
    </a>
  </li>
  <li>
    <a href="#ourteam1">
      <img src="../Images/theteam.png" style="height:90%; width:70%; border-radius:15px"  />
      <span class="text-content"><span>Our Team</span></span>
    </a>
  </li>
</ul>

</div>
<div id="line"> </div> 
    <!--aboutjustrate section -->
    <div id="aboutus" style="background-image:url(../Images/teal-bg.jpg); width:100%; display:inline-block; text-align:center;">
    <h1>About JustRate</h1>
    <br /><a href="#topaboutus">(Return to top)</a>

    <p>The aim of JustRate is to improve the standard of student accommodation and offer students a new approach to searching for their perfect property.

Students moving into private accommodation for the first time, from home or from Halls of Residence often struggle to find a house to suit their needs.  
<br />From poor living conditions to hidden charges, it can have the potential to taint a student’s university experience - meant to some of the happiest days of their lives.  
<br />Students deserve accurate and up-to-date information, which is sadly often left out by landlords and letting agents. JustRate aims to change this.  
</p>
</div>
  <!--end aboutjustrate section -->
    <div id="line"> </div> 

  <!--values and objectives section -->
<div id="ourvalues" style="background-image:url(../Images/map-bg.jpg); text-align:center; /*display:inline-block;*/ ">
<h1>Our Values and Objectives</h1>
<br /><a href="#topaboutus">(Return to top)</a><br /><br />

<ul class="missionstatement">
<li><img src="../Images/missionstatement.png" style="height:300px; width:300px;"/></li>
<li><img src="../Images/values.png" style="height:300px; width:300px;"/></li>
<li><img src="../Images/objectives.png" style="height:300px; width:300px;"/></li>
</ul>
<br />
<br />

    <div id="line"> </div> 
<!--ourteam section -->
        <div id="ourteam1" style="background-image:url(../Images/teal-bg.jpg);  display:inline-block; width:100%;" ><h1>Our Team</h1>
        <br /><a href="#topaboutus">(Return to top)</a>
        <br />
        <br />
        <ul class="img-list3">
  <li>
    <a href="http://uk.linkedin.com/in/kirstydowney" target="_blank">
      <img src="../Images/Kirsty.jpg" style="height:260px; width:225px; border-radius:15px;" />
      <span class="text-content3"><span><br />Kirsty Downey <br />Managing Director</span></span>
    </a>
  </li>
    <li>
    <a href="http://uk.linkedin.com/in/aoifemcevoy/" target="_blank">
      <img src="../Images/Aoife.jpg" style="height:260px; width:225px; border-radius:15px;" />
      <span class="text-content3"><span><br />Aoife McEvoy<br />Finance Team<br /></span></span>
    </a>
  </li>
  <li>
    <a href="http://uk.linkedin.com/pub/gemma-mulhern/59/516/1ba" target="_blank">
      <img src="../Images/Gemma.jpg" style="height:260px; width:225px; border-radius:15px;"  />
      <span class="text-content3"><span><br />Gemma Mulhern <br />Marketing Manager</span></span>
    </a>
  </li><br />
      <li>
    <a href="#ourvalues">
      <img src="../Images/Ryan.jpg" style="height:260px; width:225px; border-radius:15px;" />
      <span class="text-content3"><span><br />Ryan McIntyre<br />Finance Team</span></span>
    </a>
  </li>
  <li>
    <a href="http://ie.linkedin.com/pub/paul-higgins/38/507/855" target="_blank">
      <img src="../Images/Paul.jpg" style="height:260px; width:225px; border-radius:15px;"  />
      <span class="text-content3"><span><br />Paul Higgins<br />Development Team</span></span>
    </a>
  </li>
      <li>
    <a href="http://uk.linkedin.com/in/seamusmoore" target="_blank">
      <img src="../Images/Seamus.jpg" style="height:260px; width:225px; border-radius:15px;" />
      <span class="text-content3"><span><br />Seamus Moore<br />Legal Team</span></span>
    </a>
  </li>
  <li>
    <a href="#ourteam1">
      <img src="../Images/Jonny.jpg" style="height:260px; width:225px; border-radius:15px;"  />
      <span class="text-content3"><span><br />Jonny Cleland<br />Development Team</span></span>
    </a>
  </li>
</ul>
</div>
<!--end ourteam section -->
          </div>
    </div><%-- closing of homeWrapper tag--%>
</asp:Content>     