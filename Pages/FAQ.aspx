<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FAQ.aspx.cs" Inherits="Home" MasterPageFile="~/Master_Pages/Default.master" %>
<%@ Register Src="~/User_Controls/GoogleMapsAPI.ascx" TagPrefix="uc1" TagName="GoogleMapsAPI" %>

<asp:Content ID="Home_Main" ContentPlaceHolderID="Main" Runat="Server">
    <div id="faqWrapper"><br />
    <div id="faqcontent">
    <h1>FAQ's</h1>

    
<p>If your query has not been answered below, send us a message through our <a href="ContactUs.aspx">Contact page</a><br /> and we will get back to you as soon as possible.</p>
<p>In the meantime, check out our <a href="Guide.aspx">useful Guide</a> for some useful tips when living in and choosing the perfect student accommodation.</p>


   <script src="http://code.jquery.com/jquery-1.9.1.js"   type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
 $('.faqBtn').click(function () {

            var id = $(this).attr('id');
            var tag = id.replace("toggleButton", "");
            //alert(tag);
            $('.panels p').hide();
            $('#panelDiv' + tag + ' p').show()
        });

        $('.panels p').hide();
    });

</script><br />
<div class="faq2">

   <div  class="panels" id="panelDiv0">
	  <a href="#" class="faqBtn" onclick="return false;" id="toggleButton0" style="display:inline-block">What if the house I wish to rate is not already on the site?</a>
	<p>
On our rating page, there is a link that takes the user to a page that enables them to add a new house to our database. In the same way as our rating service, the user can then provide feedback and rate the property.
	</p>
    </div>
    <br />
	  <div class="panels" id="panelDiv1">
	  <a href="" class="faqBtn" onclick="return false;" id="toggleButton1" style=" display:inline-block; color:#fefdfd;">What if I feel uncomfortable about posting negative feedback?</a>

	<p>
In order for students to improve the standard of student accommodation, this will sometimes be necessary. Our service is about not only pointing students to the best properties, but also pushing for improvement in properties that are sub-standard.	
	</p>
    </div>
          <br />  
	  <div class="panels" id="panelDiv2">
	  <a href="" class="faqBtn" onclick="return false;" id="toggleButton2" style ="display:inline-block; color:#fefdfd">Is this service just available for Belfast students?
</a>
	<p>
At the moment, yes. However, in the future we will be expanding to the rest of Northern Ireland, and student areas in the UK. We want a nation-wide change in student accommodation.	
	</p>
    </div>
            <br />
	  <div class="panels" id="panelDiv3">
	  <a href="" class="faqBtn"  onclick="return false;" id="toggleButton3" style="display:inline-block; color:#fefdfd">My email and password don’t work?</a>
	<p>
If you are having trouble logging in, you should contact the system administrator at ……
	</p>
    </div>
            <br />
	  <div class="panels" id="panelDiv4">
	  <a href="" class="faqBtn"  onclick="return false;" id="toggleButton4" style=" display:inline-block; color:#fefdfd">Can I post a review without any images?</a>

	<p>
Yes you can post a review as long as you fill in the required fields – i.e. address, feedback and rating. However, we would strongly encourage uploading images as it backs up the feedback you provide. For example, if a house is immaculate, show us! However, if there is damp all over, show us also!	
	</p>
    </div>
            <br />
	  <div class="panels" id="panelDiv5">
	  <a href="" class="faqBtn"  onclick="return false;" id="toggleButton5" style=" display:inline-block; color:#fefdfd">Is this service legal and protected?</a>

	<p>
Our service is perfectly legal, and as long as the review is not targeting an individual unfairly, there are no issues. The site has a number of disclaimers to make you aware of what will happen when you post a review, as well as a general disclaimer for the service.	
	</p>
 </div>
 <br />
 	  <div class="panels" id="panelDiv6">
	  <a href="" class="faqBtn"  onclick="return false;" id="toggleButton6" style=" display:inline-block; color:#fefdfd">Can I post a review without any images?</a>

	<p>
Yes you can post a review as long as you fill in the required fields – i.e. address, feedback and rating. However, we would strongly encourage uploading images as it backs up the feedback you provide. For example, if a house is immaculate, show us! However, if there is damp all over, show us also!	
	</p>
    </div>
            <br />

            	  <div class="panels" id="panelDiv7">
	  <a href="" class="faqBtn"  onclick="return false;" id="toggleButton7" style=" display:inline-block; color:#fefdfd">What happens when I post my review?</a>

	<p>
Your review will not be posted immediately. It will go to our admin team who will look at your review and ensure that it is acceptable and not offensive or inappropriate in any way. 
	</p>
    </div>
            <br />

            	  <div class="panels" id="panelDiv8">
	  <a href="" class="faqBtn"  onclick="return false;" id="toggleButton8" style=" display:inline-block; color:#fefdfd">What happens if my review is deemed unacceptable or inappropriate?</a>

	<p>
If the review you have posted is inappropriate, it will not be posted! 
	</p>
    </div>
            <br />

                        	  <div class="panels" id="panelDiv9">
	  <a href="" class="faqBtn"  onclick="return false;" id="toggleButton9" style=" display:inline-block; color:#fefdfd">Is this service endorsed by universities and student bodies?<br />
</a>

	<p>
Yes, our service has received the backing of a number of universities and student bodies.
	</p>
    </div>
            <br />

                        	  <div class="panels" id="panelDiv10">
	  <a href="" class="faqBtn"  onclick="return false;" id="toggleButton10" style=" display:inline-block; color:#fefdfd">Does this service have an app?<br />
</a>

	<p>
Yes! Our app is free to download and gives you the ability to JustRate on the go. 
	</p>
    </div>
            <br />

                        	  <div class="panels" id="panelDiv11">
	  <a href="" class="faqBtn"  onclick="return false;" id="toggleButton11" style=" display:inline-block; color:#fefdfd">What if a house I am interested in is not on your site, and I have not lived in it either?<br />
</a>

	<p>
This may happen on occasion and can’t be avoided, however, we have a long list of houses of all sizes rated on our site. Why not take a look and see if any take your fancy?!
	</p>
    </div>
            <br />
    </div>
  </div></div>
</asp:Content>