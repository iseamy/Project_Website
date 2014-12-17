 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Guide.aspx.cs" Inherits="Home" MasterPageFile="~/Master_Pages/Default.master" %>
<%@ Register Src="~/User_Controls/GoogleMapsAPI.ascx" TagPrefix="uc1" TagName="GoogleMapsAPI" %>
<asp:Content ID="Home_Main" ContentPlaceHolderID="Main" Runat="Server">
    <script src="../scripts/Scrolling.js" language="javascript" type="text/javascript"></script>

<div id="homeWrapper" style="display:inline-block; width:100%; text-align:center;">
    <div id="guideWrapper">
<div id="topofpage" style="display:inline-block; width:100%; background-color:#fefdfd">
<h1>JustRate's guide for House-hunting, Student Living and Keeping Safe</h1>

<ul class="img-list1">
  <li>
    <a href="#tophotspots">
      <img src="../Images/door_red.png" style="height:400px; width:200px; border-radius:15px;" />
      <span class="text-content1"><span>Student Areas</span></span>
    </a>
  </li>
    <li>
    <a href="#checklist">
      <img src="../Images/teal_door.png" style="height:400px; width:200px; border-radius:15px;" />
      <span class="text-content1"><span>Checklist for house-hunting</span></span>
    </a>
  </li>
  <li>
    <a href="#yourrights">
      <img src="../Images/yellow_door.png" style="height:400px; width:200px; border-radius:15px;" />
      <span class="text-content1"><span>Your Rights</span></span>
    </a>
  </li>
    <li>
    <a href="#keepingsafe">
      <img src="../Images/purple_door.png" style="height:400px; width:200px; border-radius:15px;" />
      <span class="text-content1"><span>Keeping Safe</span></span>
    </a>
  </li>
</ul>
    <br/>
    <br/>

</div>


<!--hotspots section-->
<div class="guidetable" style="background-color:#019a95; display:inline-block; width:100%; border-radius:15px; align-content:center; color:#fefdfd; font-size:xx-large; font-size-adjust:inherit;">

<div id="tophotspots"><h1>JustRate's Belfasts Student Area Hotspots Guides</h1></div>
<a href="#topofpage">return to top</a><br /><br />

<p>Moving out of Elms? <br />Become too much of a stereotypical grumpy 3rd year for the Holylands? <br /><br /> Here’s JustRate's guide to Belfast student housing:</p>

<p>Click on the links to go straight to a particular area:</p> 
    <ul class="hotspot">
        <li id="#holylands"><a href="#holylands">
            <div class="wp-caption-text">
            <img src="../Images/Guide_areas/Holylands.png" onmouseover="this.src='../Images/Guide_areas/Holylands_Shadow.png'" 
            onmouseout=" this.src='../Images/Guide_areas/Holylands.png'" alt="Map of the Holylands, Belfast"/></a>
            <img src="../Images/Guide_areas/holylandsbanner.png" alt="Holylands" />
            </div>
        </li>
            
        <li id="#botanic"><a href="#botanic">
            <div class="wp-caption-text">
            <img src="../Images/Guide_areas/Botanic.png" onmouseover="this.src='../Images/Guide_areas/Botanic_shadow.png'" 
            onmouseout=" this.src='../Images/Guide_areas/Botanic.png'" alt="Map of Botanic, Belfast"/></a>
           <img src="../Images/Guide_areas/botanicbanner.png" alt="Botanic" />   
            </div> 
        </li>
        <li id="#lisburnroad"><a href="#lisburnroad">
            <div class="wp-caption-text">
            <img src="../Images/Guide_areas/LBR.png" onmouseover="this.src='../Images/Guide_areas/LBR_shadow.png'" 
            onmouseout=" this.src='../Images/Guide_areas/LBR.png'" alt="Map of the Lisburn Road, Belfast"/></a>
            <img src="../Images/Guide_areas/lisburnroadbanner.png" alt="Lisburn Road" />
            </div>
        </li>

        <li><a href="#stranmillis">
            <div class="wp-caption-text">
            <img src="../Images/Guide_areas/Stranmillis.png" onmouseover="this.src='../Images/Guide_areas/Stranmillis_shadow.png'" 
            onmouseout=" this.src='../Images/Guide_areas/Stranmillis.png'" alt="Map of Stranmillis, Belfast"/></a>
            <img src="../Images/Guide_areas/stranmillisbanner.png" alt="Stranmillis" />
            </div>
        </li>
        <li><a href="#malone">
            <div class="wp-caption-text">
            <img src="../Images/Guide_areas/MaloneRoad.png" onmouseover="this.src='../Images/Guide_areas/MaloneRoad_shadow.png'" 
            onmouseout=" this.src='../Images/Guide_areas/MaloneRoad.png'" /></a>
            <img src="../Images/Guide_areas/malonebanner.png" alt="Malone" />
            </div>
        </li>
    </ul>
 </div>

 <!--malone road -->
<div id="malone" style="background-image:url(../Images/map-bg.jpg); display:inline-block; width:100%; border-radius:15px; align-content:center"><h2>Malone/Eglantine</h2> <a href="#top">Return to top</a>
<table style="width:98%; margin:2%;">
<tr>
    <td rowspan="2">
        <a href="#malone" id="maloneverdict">
            <img src="../Images/Guide_areas/justrateverdict.png" onmouseover="this.src='../Images/Guide_areas/Malone_verdict.png'" onmouseout=" this.src='../Images/Guide_areas/justrateverdict.png'" />
        </a>
     </td>
    <td>
    <p>
        If you ever  had to do the painful walk to and from Elms in the rain, with a hangover, 
        or after turning your legs to jelly in the gym, halving that journey and turning into
        Malone or Eglantine will feel like absolute, total bliss and more than enough reason to say
        "Yes! We'll take it!"
    </p>
    </td>
    </tr>
    <tr>
        <td>
        <p>It’s also just around the corner from The Eg and The Bot, the obvious choice to start any pub golf/
        bar crawl and write off any plans you had to go spend the day in the McClay like a good student.
        Centra, Dr:nk and Gilgamesh supply everything a student needs: 
        the weekly low budget food shop, the last minute carry out before a night out and the greasy end to a good night.
        </td>
    </tr>
</table>
 <!--malone road -->

  <!--lisburn road -->
<div id="lisburnroad"  style="background-color:lightblue; display:inline-block; width:100%; border-radius:15px;"><h2>Lisburn Road</h2> <a href="#top">Return to top</a>

<table style="margin:2%; width:98%">
    <tr>
        <th>
            <a href="#lisburnroad" id="lisburnroadverdict">
                <img src="../Images/Guide_areas/justrateverdict.png" onmouseover="this.src='../Images/Guide_areas/LisburnRoad_verdict.png'" 
                    onmouseout=" this.src='../Images/Guide_areas/justrateverdict.png'" />
            </a>
          </th>
        <th>
            <p>Running almost parallel with Malone Road, Lisburn Road is just close enough and far away enough! For that reason, students don&rsquo;t really venture that way except for popular bars, restaurants and a Tesco&rsquo;s to fill your kitchen with everything you could need.</p>            
            <p>And honestly, except for Little Wing, the big Tesco and Cuckoo, Lisburn Road is pretty much like the Shadowlands in The Lion King for me, I don&rsquo;t know anything about it, however it&rsquo;s much more likely to be because of the distance x my laziness, than of elephant graveyards and creepy laughing hyenas.</p>
        </th>
    </tr>
    <tr>
        <td colspan="2" style="text-align:center;">
        <div id="attachment_2811" class="wp-caption alignnone">
        <img class="size-full wp-image-2811" alt="It's got jamjar cocktails, beer pong and ping pong tables you say?!" src="http://cdnbelfast.tab.co.uk//files/2013/12/the-cuckoo-bar.jpg" style="width: 40%; align-content:center; margin-left:28%; margin-right:28%;" /><p class="wp-caption-text">It&rsquo;s got jamjar cocktails, beer pong and ping pong tables you say?!</p>
        </div>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <p>Despite that, the amount of shopping you could do on that one stretch of road is a scary scary thought for a girl with a student loan to waste! It also has enough takeaways to make a drunk guy with munchies start a fight with himself!</p>
        </td>
    </tr>
    <tr>
        <td colspan="2">
        <p>The City hospital and Health centre are extremely close (in case of any health disasters, drunken or otherwise), while the shiny Domino&rsquo;s sign beams up the road. If you live on Lisburn road you&rsquo;re spoilt for choice!</p> 
        </td>
     </tr>
    </table>
</div>
 <div id="line"> </div>

   <!--lisburn road -->

   <!--stranmillis -->

<div id="stranmillis" style="background-image:url(../Images/map-bg.jpg); display:inline-block; width:100%; margin-bottom:1%; margin-top:1%">
    <h2>Stranmillis</h2>
    <a href="#top">Return to top</a>
<table style="tab-size:inherit; margin:1%;">
    <tr>
        <th rowspan="2">
        <a href="#stranmillis" id="stranmillisverdict">
        <img src="../Images/Guide_areas/justrateverdict.png" onmouseover="this.src='../Images/Guide_areas/stranmillis_verdict.png'" onmouseout=" this.src='../Images/Guide_areas/justrateverdict.png'" />
        </a>
        </th>
        <th style="align-content:center; width:inherit;">
<p>Probably one of the most popular students areas in Belfast is Stranmillis. It&rsquo;s close to the Botanical Gardens and the PEC, just up the round from Maggie May&rsquo;s and has a list of takeaways longer than the complete history of time.</p>
        </th> 
    </tr>
    <tr>
        <th style="width:inherit">
        <p>Stranmillis has everything you need, from grabbing a drink at Cinnamon or Got Milkshake before a lecture, to convenience stores, Winemark and it&rsquo;s own taxi rank. Birdcage has got you covered for any date, meal with the family or any excuse to celebrate and cover your table in chicken goodness!</p>
        </th>
    </tr>
</table>

<table style="text-align:center; width:90%; margin:1%; margin-left:auto; margin-right:auto;">
    <tr>
         <th>
            <div id="Div1" class="wp-caption alignnone">
            <img class="size-full wp-image-2813" alt="Stranmillis' House Bar" src="http://cdnbelfast.tab.co.uk//files/2013/12/The-house-pub-and-kitchen1.jpg"  style="width: 100%" /><p class="wp-caption-text">Stranmillis&rsquo; House Bar</p>
            </div>
        </th>
        <th style="width:inherit;">
            <div id="Div2" class="wp-caption alignnone">
            <img class="size-large wp-image-2812" alt="yummy yummy yummy" src="http://cdnbelfast.tab.co.uk//files/2013/12/filename-sunny-birdcage-530x397.jpg"  style="width: 100%;" /><p class="wp-caption-text">yummy yummy yummy</p>
            </div>
        </th>
</table>
<p>The atmosphere is probably the best too, apart from the nightlife in the Holylands. Dominated by students it&rsquo;s basically Elms without the annoying security guards.</p>
</div>
 <div id="line"> </div>

   <!--end stranmillis -->

   <!--holylands -->

<div id="holylands" style="background-color:lightblue; display:inline-block; width:100%"><h2>Holylands</h2> <a href="#top">Return to top</a>
    
<table style="margin:2%; width:98%">
    <tr>
    <td style="width: 279px">
        <a href="#holylands" id="holylandsverdict">
        <img src="../Images/Guide_areas/justrateverdict.png" onmouseover="this.src='../Images/Guide_areas/Holylands_verdict.png'" onmouseout=" this.src='../Images/Guide_areas/justrateverdict.png'" />
        </a>
    </td>
    <td>
        <p>Try and walk past the Spar without realising you want/need something. I dare you.</p>
        <p>Similarly to Botanic, the Holylands is 5 minutes away from the McClay library, Lanyon Building, Student&rsquo;s Union and Botanical Gardens, and only 20 minutes away from the city centre, if you ever make it that far.</p>
        <p>The Holylands is known for it&rsquo;s residents liking a night out or two.. or five or six nights a week.</p>        
    </td>
    </tr>
</table>
<table style="width:98%; margin:2% ">        
    <tr>
    <td>
        <div id="Div3" class="wp-caption alignnone">
        <img class=" wp-image-2814 " alt="It's rumoured to be the busiest Spar in Europe!?" src="http://cdnbelfast.tab.co.uk//files/2013/12/Screen-shot-2013-12-17-at-22.39.11.png"  style="width: 95%; height:100%" /><p class="wp-caption-text">It&rsquo;s rumoured to be the busiest Spar in Europe!?</p>
        </div>
    </td>
    <td>
        <div id="attachment_2816" class="wp-caption alignnone">
        <img class=" wp-image-2816 " alt="Hatfield House on the Ormeau Road" src="http://cdnbelfast.tab.co.uk//files/2013/12/Screen-shot-2013-12-17-at-22.44.39.png"  style="width: 95%; height:100%;" /><p class="wp-caption-text">Hatfield House on the Ormeau Road</p>
        </div>
    </td>
<%--    <td>
        <div id="attachment_2815" class="wp-caption alignnone">
        <img class=" wp-image-2815 " alt="just a normal day in the Holylands..." src="http://cdnbelfast.tab.co.uk//files/2013/12/Pacema_16.jpg"  style="width: 90%; height:20%;" /><p class="wp-caption-text">Just a normal day in the Holylands&hellip;</p>
        </div>
    </td>--%>
    </tr>
</table>

<p>There&rsquo;s a WineFlair and Winemark at either end for your carry outs as well as enough takeaways and convenience stores on Ormeau Road, while the Menagerie and Hatfield House are in walking distance! Try to avoid going to the Hatfield for an after hours carry out on a night out. It&rsquo;s impossible.</p>
<br />
<p>It&rsquo;s definitely not quiet on a night out, and amazing on St. Paddy&rsquo;s (despite it being heavily policed by frazzled uni security nowadays, thanks to antics of national days past), but it&rsquo;s definitely fun.&nbsp;It even had it&rsquo;s own Harlem Shake video! And it was during the five minutes that Harlem Shake <em>wasn&rsquo;t&nbsp;</em>annoying, so you know it was good.</p>
<p>You can&rsquo;t get from your taxi to your front door without meeting someone, seeing a fire engine or police cars blocking your way up the almost one-way street.</p>
<br />
<!-- Vixy YouTube Embed v3.1 -->
<iframe frameborder="0" style="border: 0; margin:1%;" class="youtube-player" width="560" height="340" src="http://www.youtube.com/embed/0NVm6OjYGUU?enablejsapi=1&amp;modestbranding=1&amp;fs=0&amp;rel=0&amp;wmode=window"></iframe>
<!-- End of YouTube Embed code -->
</div>
 <div id="line"> </div>

    <!--end holylands -->

    <!--botanic -->

<div id="botanic" style="background-image:url(../Images/teal-bg.jpg); display:inline-block"><h2>Botanic</h2> <a href="#top">Return to top</a>

<table style="width:98%; margin:2%;">
    <tr>
        <td>
            <a href="#botanic" id="botanicverdict">
            <img src="../Images/Guide_areas/justrateverdict.png" onmouseover="this.src='../Images/Guide_areas/botanic_verdict.png'" onmouseout=" this.src='../Images/Guide_areas/justrateverdict.png'" />
            </a>
        </td>
        <td>
            <p>This place has so many plus points I&rsquo;m just going to list them, Botanic doesn&rsquo;t need no fancy rhetoric to woo you.</p>
            <br />
            <p>It&rsquo;s a 15-minute walk to the city centre and takes barely 5 minutes to the McClay library, Lanyon Building, Student&rsquo;s Union and the Botanical Gardens. It&rsquo;s home to Build a Burger (<a href="http://belfast.tab.co.uk/2013/12/03/the-tab-takes-on-the-big-lad/" target="_blank">site of our Build a Burger Tab challenge&nbsp;</a>), Boojum, Subway, Chip Company and Maggie May&rsquo;s. The list seriously goes on and on.</p>

        </td>
    </tr>
</table>    

<table style="width:98%; margin-bottom:1%; margin-top:1%; margin-left:2%; margin-right:2%; table-layout:fixed;">
    <tr>
        <td>
            <div id="attachment_2817" class="wp-caption alignnone">
            <img class=" wp-image-2817 " alt="my two favourites. nom." src="http://cdnbelfast.tab.co.uk//files/2013/12/001.jpg"  style="width: 95%" /><p class="wp-caption-text">My two favourites. Nom.</p>
            </div>
        </td>
        <td>
            <div id="attachment_2819" class="wp-caption alignnone">
            <img class=" wp-image-2819 " alt="" src="http://cdnbelfast.tab.co.uk//files/2013/12/The-Empire-Belfast-Image-4-H1.jpg"  style="width: 95%" /><p class="wp-caption-text">And there&rsquo;s The Empire</p>
            </div>
        </td>
        <td>
            <div id="attachment_2818" class="wp-caption alignnone">
            <img class=" wp-image-2818 " alt="Madison's Cocktail bar!" src="http://cdnbelfast.tab.co.uk//files/2013/12/P1240009.jpg"  style="width: 95%" /"><p class="wp-caption-text">Madison&rsquo;s Cocktail bar! Many a happy, blurry evening spent here</p>
            </div>
        </td>
    </tr>
</table>
    
<p>There&rsquo;s charity shops, fancy dress shops, bookshops, barbers and hairdressers, beauticians and tattoo shops and two convenience stores.</p>
<br />
<p>It&rsquo;s got Madison&rsquo;s, where it&rsquo;s not even happy hour, but happy evening (5-9pm every single night) &pound;3 cocktails! I said &pound;3 cocktails! There&rsquo;s the Empire&rsquo;s famous Comedy night and The Fly waiting for you (more &pound;3 cocktails) just down the next side road.</p>
<br />

<p>Villa Italia sits around the corner so you can casually swing past when your parents suggest taking you to eat somewhere proper. That&rsquo;s hoping they don&rsquo;t spot the ridiculously good value China China across the road.</p>

<br />

<p>Botanic is probably the best place to live as a lazy student. It has everything you need it a 5-minute proximity and the closeness to the city centre is amazing if you want to skip lectures now your loan is in and go shopping.</p>

<br />
</div>
</div>
 <div id="line"> </div>

  <!--end botanic -->


<!--end hotspots sections -->

<!--keeping safe section -->
 <div id="keepingsafe" style="background-image:url(../Images/map-bg.jpg); display:inline-block; width:100%"><h1>Tips for keeping safe</h1>
    <br /><a href="#topofpage">back to top</a><br /><br />
<img src="../Images/keepingsafe.png" style="height:30%; width:40%; margin-left:30%; margin-right:30%;"/>
<!--end keeping safe section --> </center>
<p style="text-align:center; color:black;"><a href="#top"><span></span>Back to Top</a></p>
 </div>

 <!--your rights section -->
  <div id="yourrights" style="background-color:#019a95; display:inline-block; width:100%"><h1>Your Rights</h1>
    <br /><a href="#topofpage">back to top</a><br /><br />
      <p style="font:bold; color:#F5BE33; font-size:x-large;">You have certain rights throughout your tenancy to protect you and your housemates.</p>
      <table style="width:98%; margin:2%; vertical-align:top; text-align:left; table-layout:fixed; padding-left:2%; padding-right:2%;" class="yourrights">
          <tr>
              <td>
                    <h3>Building Condition/Dampness</h3>
                    <p>The landlord has certain responsibilities regarding the upkeep of the building. The building and surrounding area should:</p>
                    <ul>
                        <li>Withstand normal use by tenants and guests.</li>
                        <li>Withstand the weather.</li>
                        <li>Be reasonable inside and out, including no damp penetrating the interior from the outside. Damp can be a big problem, and will usually be blamed on tenants. If ventilation isn’t adequate, it could be your landlord’s problem! Showers/Bathrooms need good ventilation – make sure you check that the fans are working correctly.</li>
                    </ul>
              </td>
              <td>
                  <h3>Privacy and Landlord Entry</h3>
                  <p>The landlord or people acting on his/her behalf cannot enter to check the property or make repairs when they please. 
                     This must be agreed beforehand.This is called the ‘tenants right of quiet enjoyment’ and means the landlord cannot 
                     disturb you. But, this only remains in force if you do not breach the tenancy agreement.To view the accommodation 
                     and the ‘state of damage’ reported, 24 hours notice must be given. If you refuse entry you have no right to complain about the state of 
                     damage or any injury caused.If the tenants are out when the visit is scheduled, and the landlord wants to continue with his 
                     visit, he must be accompanied by a witness.</p> 
             </td>
          </tr>
          <tr>
              <td>
                  <h3>Harassment</h3>
                  <p>The landlord can sometimes be accused of, or be responsible for, harassment of the tenants when they want to enter the property. Acts of harassment include:</p>
                  <ul>
                      <li>Threats of violence or unlawful eviction.</li>
                      <li>Disconnecting gas, electricity or water.</li>
                      <li>Breaking keys off in locks.</li>
                      <li>Deliberately disruptive repair works.</li>
                      <li>Frequent visits at unreasonable hours.</li>
                      <li>Entering the property without the tenants permission.</li>
                  </ul>
              </td>
              <td>
                  <h3>Damage</h3>
                  <p>The cost of any damage caused by the tenants will be passed onto them and they have no right to complain if 
                      they breach the agreement for repair. If damage is reported by the tenants they must inform the landlord in 
                      writing using an ‘early notification letter’. In order to view the damage reported, the Landlord must give 24 
                      hours’ notice. If you are out or refuse admission, you have no right to complain about the lack of damage 
                      repair, or claim for any accident that may arise from the damage. The Landlord may usually enter the premises 
                      if accompanied by a witness. Check your Tenancy Agreement for Landlord entry rules. Court orders and damage 
                      compensation is rare but it is good to be aware that these procedures exist.</p>
              </td>
          </tr>
          <tr>
              <td>
                  <h3>Smoking</h3>
                  <p>Smoking can be considered as damage to the property, as it is not general wear and tear. Given the smell can 
                      penetrate carpets and curtains, and smoke can even stain walls and ceilings, it counts as damage given they 
                      need to be replaced.</p>
                  
                  <p>It is the landlord’s choice as to whether smoking is allowed or not in the property, and it will be written 
                      into your tenancy agreement. The landlord should provide smoke alarms in areas where it is permitted or at 
                      least a safe number throughout areas.</p>
              </td>
              <td>
                  <h3>Landlord responsibilities</h3>
                  <p>These include exterior and structural and all other elements of dwelling, including access, amenity spaces, 
                      the common parts in landlord’s control, associated outbuildings, garden, walls etc</p>                      
                   <p>Supply water, electricity, gas, personal hygiene faculties, drainage and sanitation, heating and heated water</p>
                   <p>Fittings and fixtures but excluded moveable appliances unless they were provided by the landlord.</p>
              </td>
          </tr>
          <tr>
              <td style="vertical-align:top">
              <h3>Houses in multiple occupation (HMO) landlord responsibilities</h3>
              <p>In accommodation containing more than 4 people, 3 or more storey’s, bedsits or individual rooms, the 
                  Landlord needs to have a HM0 certificate which is issued by the local council.</p>
              <p>For further information please visit <a href="www.directgov.uk">Direct Gov.Uk</a>
              </td>
              <td>
                  <h3>Safety</h3>
                  <p>All appliances provided by the landlord must be checked for safety by a registered installer within 12 months 
                     of their installation, and again 12 months after that.</p>
                  <p>Gas pipes must be inspected for leaks. If a gas appliance is deemed unsafe the installer must make sure that it 
                      is left in a safe condition. New tenants must receive a gas certificate for all appliances within 28 days of 
                      moving in. Signs of gas appliance being faulty are:</p>
                  <ul>
                      <li>Yellow orange flame on a gas indicator or gas fire.</li>
                      <li>Stains, soot, discolouring around the gas appliance, flue or chimney is blocked which means Carbon Monoxide can 
                          be building up in a room.</li>
                  </ul>
                  <p>We would strongly advise you get a carbon monoxide monitor for peace of mind, no matter if your appliances look like 
                      they are working correctly.</p>
                  <p>All furniture provided must adhere to fire safety regulations and must pass the cigarette test (the furniture fire safety act 1988), 
                      this test does not apply to carpets or curtains.</p>
                  <p>All portable appliances supplied by the landlord must have an annual PAT test.</p>
              </td>
          </tr>
      </table>
<!--end your rights section --> </center>
<p style="text-align:center; color:black;"><a href="#top"><span></span>Back to Top</a></p>
 </div>

 <!--checklist section --> 
  <div id="checklist" style="background-image:url(../Images/map-bg.jpg); display:inline-block; width:100%"><h1>Checklist for house hunting</h1>
    <br /><a href="#topofpage">back to top</a><br /><br />
<div id="checklisttable">
    <div class="filepage"></div>
    <table>
        <tr>
            <td class="tick"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img36"/></td>
            <td class="wordingchecklist">Is the property in an area convenient for your studies and social life?</td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img37"/></td>
            <td class="wordingchecklist">Is the property within a suitable distance to local public transport and local amenities?</td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img1"/></td>
            <td class="wordingchecklist">Would you feel sufficiently safe walking around the area during the day or in the evening?</td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img2"/></td>
            <td class="wordingchecklist">Does the exterior of the property appear well maintained? This would include no broken guttering, 
                no damage to the roof e.g. missing roof tiles, no cracked windows panes and solid front and back 
                doors 
            </td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img3"/></td>
            <td class="wordingchecklist">Are all boundary walls are in good condition e.g. no missing sections or crumbling bricks? </td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img4"/></td>
            <td class="wordingchecklist">Are there sufficient bins for the property, including recycling?</td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img5"/></td>
            <td class="wordingchecklist">Is the garden is well maintained and clear of any rubbish? </td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img6"/></td>
            <td class="wordingchecklist">Is the landlord/agent is clear about who is responsible for the maintenance of the garden?</td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img7"/></td>
            <td class="wordingchecklist">Is there sufficient communal living space? </td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img8"/></td>
            <td class="wordingchecklist">Do bedroom sizes meet the household’s expectations?</td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img9"/></td>
            <td class="wordingchecklist">Does the interior of the property appear well maintained? This includes no signs of damp, hot 
                water and heating work, décor and furniture in good condition, no outstanding issues of disrepair 
                and all the appliances and lights work (speak to the current tenants)</td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img10"/></td>
            <td class="wordingchecklist">Are there enough facilities (e.g. kitchen appliances and cupboard space, bathrooms) for the 
                number of tenants? 
            </td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img11"/></td>
            <td class="wordingchecklist">Is there sufficient heating (radiators etc) throughout the property? (Ask to turn this on when you 
            arrive)</td>
        </tr>
         <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img12"/></td>
            <td class="wordingchecklist">Does the landlord possess a current gas safety certificate that has been provided by a Safe Gas 
                registered engineer within the past 12 months?</td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img13"/></td>
            <td class="wordingchecklist">Does the property have working smoke alarms? </td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img14"/></td>
            <td class="wordingchecklist">Are plug sockets free from cracks and other damage?</td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img15"/></td>
            <td class="wordingchecklist">Are there sufficient plug sockets in each room in the property? </td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img16"/></td>
            <td class="wordingchecklist">Are all windows are lockable? </td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img17"/></td>
            <td class="wordingchecklist">Are there suitably strong locks on front and back doors, in line with regulations? </td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img18"/></td>
            <td class="wordingchecklist">Is the landlord or letting agency is part of an accreditation scheme, which is run or approved of 
                by your students’ union or local council? 
            </td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img19"/></td>
            <td class="wordingchecklist">Do you have the landlord’s full contact name and address?</td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img20"/></td>
            <td class="wordingchecklist">Do you know you are renting from the landlord and not subletting from another tenant? (If not, 
            advice before signing) 
            </td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img21"/></td>
            <td class="wordingchecklist">Have you seen a copy of the HMO license (if property is five or people or more)?</td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img22"/></td>
            <td class="wordingchecklist">Have you seen at least three other properties with other landlords and compared rent levels with 
                other properties? </td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img23"/></td>
            <td class="wordingchecklist">Has the landlord provided details of which deposit scheme they will use to protect your money?</td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img24"/></td>
            <td class="wordingchecklist">Have you taken the contract to your students’ union or local advice centre for checking? We 
                strongly recommend you do so if not</td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img25"/></td>
            <td class="wordingchecklist">Do you know how much the weekly rent is? And when rent payments are due? </td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img26"/></td>
            <td class="wordingchecklist">Are you on a joint or individual contract?</td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img27"/></td>
            <td class="wordingchecklist">Do you know if things are included within the rent? E.g. bills, broadband etc?</td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img28"/></td>
            <td class="wordingchecklist">Have you got all plans for refurbishments / promised changes / dates of completion confirmed in 
                writing?</td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img29"/></td>
            <td class="wordingchecklist">Are they happy with the state of the property?</td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img30"/></td>
            <td class="wordingchecklist">Do they consider the landlord to be professional and get repairs done quickly? </td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img31"/></td>
            <td class="wordingchecklist">Does the heating work sufficiently? </td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img32"/></td>
            <td class="wordingchecklist">Is there a working burglar alarm, and is it easy to operate? </td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img33"/></td>
            <td class="wordingchecklist">Do they like living in the property? </td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img34"/></td>
            <td class="wordingchecklist">Why are they leaving? </td>
        </tr>
        <tr>
            <td class="tick" style="width: 8%"><img src="../Images/Guide_areas/tick_checklist.png" alt="tickbox" id="Img35"/></td>
            <td class="wordingchecklist">Any outstanding issues?</td>
        </tr>
    </table>
</div>
<!--end checklist section --> </center>

<p style="text-align:center; color:black;"><a href="#top"><span></span>Back to Top</a></p>
 </div>

</div>
</div>
    
</asp:Content>