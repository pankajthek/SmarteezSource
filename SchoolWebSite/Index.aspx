<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="SchoolWebSite.Index" %>

<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        
        <title>Smarteez- A Play School & Day Boarding</title>
        <meta name="description" content="">
        <meta name="keyword" content="Play school in Lucknow, Preschool in lucknow, Daycare School, Education, Best Preschool in Lucknow, Play School for Kids, Kids School, Daycare in lucknow, Best Daycare in lucknow">
        <meta name="author" content="Virendra">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/animations.min.css">
        <link rel="stylesheet" href="css/main.css">
        <script src="js/MailSend.js"></script>
        <script src="js/vendor/modernizr-2.6.2.min.js"></script>
	    <link id="layer-slider" rel="stylesheet"  href="css/layerslider.css" media="all" />

    </head>
    <body>

        <script>
            (function (i, s, o, g, r, a, m) {
                i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date(); a = s.createElement(o),
                m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
            })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

            ga('create', 'UA-66492271-1', 'auto');
            ga('send', 'pageview');

        </script>
         <script language="javascript" type="text/javascript">

             //window.onload = function () {
             //    Captcha();
             //}

             // <![CDATA[
             function onCheckUserName() {
                 unamemsg.innerHTML = "";
                 var objName = document.getElementById("name").value;
                 if (document.getElementById("name").value == "" || document.getElementById("name").value == "Name") {
                     unamemsg.innerHTML = "<span style='color:blue;font-size:12px';>Please enter your name！</span>";
                     document.getElementById("name").focus;
                     return false;
                 }
                 var objEmail = document.getElementById("email").value;

                 if (document.getElementById("email").value == "" || document.getElementById("email").value == "Email") {
                     unamemsg.innerHTML = "<span style='color:blue;font-size:12px';>Email can not be blank！</span>";
                     document.getElementById("email").focus;
                     return false;
                 }
                 var filter = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                 if (!filter.test(objEmail)) {
                     unamemsg.innerHTML = "<span style='color:blue;font-size:12px';>Please enter valid email id！</span>";
                     document.getElementById("email").focus;
                     return false;
                 }
                 var objContact = document.getElementById("phone").value;

                 if (document.getElementById("phone").value == "" || document.getElementById("phone").value == "Contact Number") {
                     unamemsg.innerHTML = "<span style='color:blue;font-size:12px';>Please enter valid contact number！</span>";
                     document.getElementById("phone").focus;
                     return false;
                 }
                 var mob = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/;
                 if (!mob.test(objContact)) {
                     unamemsg.innerHTML = "<span style='color:blue;font-size:12px';>Please enter valid 10 digit mobile number or landline number without 0.！</span>";
                     document.getElementById("phone").focus;
                     return false;
                 }
                 var objQuery = document.getElementById("message").value;
                 if (document.getElementById("message").value == "" || document.getElementById("message").value == "Message") {
                     unamemsg.innerHTML = "<span style='color:blue;font-size:12px';>Please fill your query！</span>";
                     document.getElementById("message").focus()
                     return;
                 }

                 if (document.getElementById("CapchaEntered").value == "") {
                     unamemsg.innerHTML = "<span style='color:blue;font-size:12px';>Please enter value displayed in textbox above ！</span>";
                     document.getElementById("CapchaEntered").focus()
                     return;
                 }

                 var objCapcha = document.getElementById("Capcha").value;
                 var objCapchaEntered = document.getElementById("CapchaEntered").value;
                 if (objCapcha.split(' ').join('') != objCapchaEntered) {
                     unamemsg.innerHTML = "<span style='color:blue;font-size:12px';>Please enter correct value displayed in textbox above ！</span>";
                     document.getElementById("Capcha").focus()
                     return;
                 }
                 else {
                     unamemsg.innerHTML = "<span style=';color:#F00;font-size:12px';></span>";
                 }
                 PageMethods.set_path(PageMethods.get_path());
                 PageMethods.GenerateCapcha(objName, objEmail, objContact, objQuery, onSuccess, onFailure);
             }

             function onSuccess(result) {
                 document.getElementById("name").value = "";
                 document.getElementById("email").value = "";
                 document.getElementById("phone").value = "";
                 document.getElementById("Capcha").value = "";
                 document.getElementById("message").value = "";
                 document.getElementById("CapchaEntered").value = "";
                 document.getElementById("Capcha").value = result;
                 unamemsg.innerHTML = "<span style='color:blue;font-size:12px'>Thank you. We will get in touch with you.</span>";
             }

             function onFailure(result) {
                 document.getElementById("name").value = "";
                 document.getElementById("email").value = "";
                 document.getElementById("phone").value = "";
                 document.getElementById("Capcha").value = "";
                 document.getElementById("message").value = "";
                 document.getElementById("CapchaEntered").value = "";
                 unamemsg.innerHTML = "<span style='color:blue;font-size:12px'>Thank you. We will get in touch with you.</span>";
             }

             // ]]>
                 </script>

<section id="header" class="bg-color0">
    <div class="container"><div class="row">

      <a class="navbar-brand" href="#top"><img src="image/logo.png" alt=""></a>

      <div class="col-sm-12 mainmenu_wrap"><div class="main-menu-icon visible-xs"><span></span><span></span><span></span></div>
        <ul id="mainmenu" class="nav menu sf-menu responsive-menu superfish">
          <li class="">
            <a href="#mainslider">Home</a>
          </li>
	  <li class=""><a href="#about">About</a>
		<ul>
			<li class=""><a href="#about">About Us</a> </li>
          		<li class=""><a href="#about">Vision/Mission</a></li>
          		
		</ul>
	  </li>
          <li class="">
            <a  href="#why">Parents</a>
		<ul>
			<li class=""><a href="#why">Why Smarteez</a></li>
			<li class=""><a href="#testi">From Parents</a></li>
          		<li class=""><a href="#why">FAQs</a></li>
		</ul>
          </li>
          <li class="">
            <a href="#courses">Courses</a>
          </li>
          <li class="">
            <a href="#portfolio">Infrastructure</a>
          </li>
          <li class="">
            <a href="#gallery">Gallery</a>
          </li>
          <li class="">
            <a href="#contact">Contact</a>
          </li>
		<li class="">
           <a href = "login.html" target="_blank">Login</a>
          </li>

        </ul>
      </div>
      
    </div></div>
</section>


<section id="mainslider">
  <div class="slider-wrapper">
      <div class="responisve-container">
        
       <div class="banner">
                <!-- **Slider Section** -->
                <div id="layerslider_9" class="ls-wp-container" style="width:100%;height:645px;max-width:1920px;margin:0 auto;margin-bottom: 0px;">
                    <div class="ls-slide" data-ls="slidedelay:10000;transition2d:4;">
                        <img  data-src="image/04.jpg" class="ls-bg" alt="bg3" />
                        <div align="center" class="ls-l" style="top:350px;left:170px;font-weight:300; z-index:5;padding-left:0px;font-family:'Lato', 'Open Sans', sans-serif;font-size:59px;line-height:46px;color:#ffffff;white-space: nowrap;" data-ls="offsetxin:0;offsetyin:200;durationin:200;delayin:200;transformoriginin:left 50% 0;offsetxout:0;"><br/><br/>Welcome to <br /> the wonderful world of Smarteez</div>
                      
                    </div>
                    <div class="ls-slide" data-ls="slidedelay:10000;transition2d:4;">
                        <img src="images/sliders/blank.gif" data-src="image/03.jpg" class="ls-bg" alt="bg3" />
                        <div align="center" class="ls-l" style="top:350px;left:170px;font-weight:300; z-index:5;padding-left:0px;font-family:'Lato', 'Open Sans', sans-serif;font-size:59px;line-height:46px;color:#ffffff;white-space: nowrap;" data-ls="offsetxin:0;offsetyin:200;durationin:200;delayin:200;transformoriginin:left 50% 0;offsetxout:0;"><br/><br/>Children must be taught <br />how to think, not what to think</div>
                      
                    </div>
                    <div class="ls-slide" data-ls="slidedelay:10000;transition2d:4;">
                        <img src="images/sliders/blank.gif" data-src="image/02.jpg" class="ls-bg" alt="bg3" />
                        <div align="center" class="ls-l" style="top:350px;left:90px;font-weight:300; z-index:5;padding-left:0px;font-family:'Lato', 'Open Sans', sans-serif;font-size:59px;line-height:46px;color:#ffffff;white-space: nowrap;" data-ls="offsetxin:0;offsetyin:200;durationin:200;delayin:200;transformoriginin:left 50% 0;offsetxout:0;"><br/><br/>Tell me, I forget. Show me, I remember. <br />Involve me and I understand.</div>
                      
                    </div>
			<div class="ls-slide" data-ls="slidedelay:10000;transition2d:4;">
                        <img src="images/sliders/blank.gif" data-src="image/01.jpg" class="ls-bg" alt="bg3" />
                        <div align="center" class="ls-l" style="top:350px;left:110px;font-weight:300; z-index:5;padding-left:0px;font-family:'Lato', 'Open Sans', sans-serif;font-size:59px;line-height:46px;color:#ffffff;white-space: nowrap;" data-ls="offsetxin:0;offsetyin:200;durationin:200;delayin:200;transformoriginin:left 50% 0;offsetxout:0;"><br/><br/>Education is the most <br /> powerful weapon to change the world.</div>
                       </div>

                </div>
            </div>
       
      </div>
    </div>
</section>


<div id="box_wrap">

<section id="about" style="background-color:#ffffff">
  <div class="container">
    <div class="row">
      <div class="col-sm-12 text-center">
        <h2 class="block-header">About Us</h2>

    
        <p style="font-weight:400" align="justify">Smarteez began its journey in 2015 with young and energetic IT professionals along with educationists with intention of providing world class education to the society at affordable cost. We are perfect blend of education and technology. We have 18 person years of IT experience along with 40 person years of teaching experience. 
<br /><br />We strongly believe that every child is naturally curious, enthusiastic, ambitious, creative and eager to acquire new experiences and knowledge. It is our responsibility as educators to foster these feelings and in doing so, to provide an educational experience to maximize each child's potential. Our philosophy is to address each child's academic, social, and physical needs.</p>
      </div>
    </div>
    
      <br /><br />
    <div class="row">
      <div class="col-sm-8">
		<h2 class="block-header">Mission & Vision</h2>
         		 <p align="justify" style="font-weight:400">Every child is special with his/her own personality, strength, need and learning style. Our <strong>mission</strong> is to understand how a particular child learns and develop strategies to help the child master all basic skills.
                                                            We aim to make parenting experience more richer, joyful and rewarding along with emphasaing on value based education.</p>
          
          <p align="justify" style="font-weight:400">Our <strong>vision</strong> is to provide world class education at affordable cost along with becoming known institution for leveraging latest technology in education system making learning easier for kids. We aim is to generate future leaders.</p>

      </div>      
      
        <div class="col-sm-4">
	 
          <div class="carousel slide widget_testimonials block" id="carousel-testimonials">
          <img src="image/vision.jpg">
          </div>
        </div>

      </div>      

    </div>
  
</section>

    </div>
<section id="why" class="color_section">
  <div class="container">
    <div class="row">
      <div class="col-sm-12 text-center"><br><br><br>
        <h2 class="block-header">Parent Section</h2>
      </div>
    </div>
    <div class="row">
      <div class="col-sm-12">

      <!-- Horizontal Slider --> 

        <div class="horizontal_slider_list_wrapper related-posts">
          <ul class="nav nav-tabs">
          <li class="active">
            <a data-toggle="tab" href="#4">Why Smarteez</a>
          </li>
          <li class="">
            <a data-toggle="tab" href="#5">FAQs</a>
          </li>
          
        </ul>
        <div class="tab-content">
          <div id="4" class="tab-pane fade active in">
<div class="col-sm-12"> <p>We  designed our school to set young scholars up for future academic, emotional,  and social success. <br /> 
  There  are many great reasons to join our school.  </p></div>


<div class="col-sm-6">
           
<ul>
  <li>Special attention on kid&rsquo;s safety, security and health.  The only school with <strong>Mobile App</strong> to view  child's activities live.</li>
  <li>Best in class designed curriculum by experts having years of  educational experience. </li>
  <li>Spacious, air-conditioned, child-friendly environment with  the following facilities:</li>
  <ul>
    <li>Nap room</li>
    <li>Audio Visual room</li>
    <li>Activity Room</li>
    <li>Ball room / Play room /  Splash Pool</li>
    <li>Dining room</li>
    <li>Modern Teaching Aids</li>
  </ul>
  
</ul>
</div>
<div class="col-sm-6">
            <ul><li>Low  child teacher  ratio</li>
  <li>Separate Yoga &amp; Meditation class.</li>
  <li>Computer basics for 3+ yrs.</li>
  <li>Regular health check-ups with our reputed doctors.</li>
  <li>Regular tips for parents on positive parenting.</li>
  <li>Intensive teachers training program </li>
  <li>Celebrations(B&rsquo;days/festivals)</li>
  <li>Children&rsquo;s photograph book</li>
  <li>Educated maids (Ayas).</li>
  <li>Transport facility</li>
  <li>Stage exposure</li>
  <li>Excursions / picnics</li>
  <li>RO Pure drinking water</li></ul>
</div>

          </div>
          <div id="5" class="tab-pane fade">
<div class="col-sm-14">
<!-- <p >-->
    <div class="col-sm-6">
<dl class="accordion">
<dt><a href="" style="color:#fff;">What are the eligibility criteria for admission? </a></dt>
<dd>Toddler: from ages 1 ½ years to 2 ½ years of age. <br>
Preschoolers: from ages 2 ½ years to 3 ½ years. <br>
Nursery: from ages 3 ½ years to 4 ½ years. <br>
Day Care: 18 Months +<br><br>&nbsp;</dd>
<br>

<dt><a href="" style="color:#fff;">What is the curriculum of Smarteez? </a></dt>
<dd>Our method of learning is child centric method (best of Play Way and Montessori) where the method of teaching is informal and caters to suit the child's interests. We make teaching more lively and interesting through activities like games, songs, free play, gardening, construction activities etc. We provide not just the cognitive development, but overall development of the child.<br><br>&nbsp;</dd>
<br>

<dt><a href="" style="color:#fff;">Is outdoor play supervised?</a></dt>
<dd>Yes, each and every activity is supervised by our trained staff.<br><br>&nbsp;</dd>
<br>

<dt><a href="" style="color:#fff;">What are the timings at Smarteez?</a></dt>
<dd>School Timing:<br>
Office Hours: 8.30 AM to 2.00 PM <br>
Toddler, PreGroup and Nursery: 9:00 AM to 12:00 PM.<br>
Day Care: 12:00 PM to 5:30 PM<br><br>&nbsp;</dd>
<br>

<dt><a href="" style="color:#fff;">Is there regular parent teacher meets?</a></dt>
<dd>We follow an open communication policy where parents can meet the teachers with prior appointments.<br>
We organize parents teacher meet every month where your child's work is displayed. <br>
Teachers also maintain a portfolio of your child's progress which will be shared with you. <br><br>&nbsp;</dd>
<br>

<dt><a href="" style="color:#fff;">Does Housekeeping staff trained in first aid?</a></dt>
<dd>Our Housekeeping staff has specialized in early childhood education and development and is well-trained in providing first-aid.<br><br>&nbsp;</dd>
<br>
    </dl>
    </div>
    <div class="col-sm-6">
<dl class="accordion">
<dt><a href="" style="color:#fff;">What is the quality of the teachers in your school? </a></dt>
<dd>Main qualification of our teacher is her positive attitude towards children and her passion about teaching kids. She should be convent educated having graduation degree.<br><br>&nbsp;</dd>
<br>

<dt><a href="" style="color:#fff;">Is there any exams/interview for the admission process? </a></dt>
<dd>There is no exam/interview for admission. We believe in education to every child and help child growth in every span of life.<br><br>&nbsp;</dd>
<br>

<dt><a href="" style="color:#fff;">What is teacher – kid’s ratio in the class? </a></dt>
<dd>To ensure optimum learning in the classrooms low teacher kids’ ratio is maintained.<br><br>&nbsp;</dd>
<br>

<dt><a href="" style="color:#fff;">Do I have to provide snack? </a></dt>
<dd>We recommend parents to send snacks to develop habit in child of eating home healthy food. We will provide diet chart prepared by our dietitian.<br><br>&nbsp;</dd>
<br>


<dt><a href="" style="color:#fff;">Does admission to the programs open throughout the year? </a></dt>
<dd>Toddler and Pre Nursery admissions are open for most part of the year.<br><br>&nbsp;</dd>
<br>


<dt><a href="" style="color:#fff;">What is the procedure for enrolment?</a></dt>
<dd>Our Pre-schools adopts a first- come- first-admit policy for enrolment to its programs.</a>
<br />The documentation requirements are as given below: <br>
Photocopy of the birth certificate. <br>
3 recent photographs of the child, one photograph of parent(s). <br>
Duly filled admission form.<br><br>&nbsp;</dd>

</dl>

        </p>
          </div>

<!--<div class="col-sm-4">
            <img src="icons/why.png">
</div>-->
          </div>
          
        </div>
      </div>

    <!--EOF Horizontal Slider --> 
         
        </div>
      </div>
    
  </div><br><br>
</div>
</section>



<section id="courses" class="">
  <div class="container">
  	 <div class="row"><br><br>


	<div class="col-sm-12">
		<div class="col-sm-12 text-center">
          <h2 class="block-header">Courses</h2><br><br>
          
       		 </div>
        <ul class="nav nav-tabs">
          <li class="active">
            <a data-toggle="tab" href="#1"> Toddler</a>
          </li>
          <li class="">
            <a data-toggle="tab" href="#2">Pre-Nursery</a>
          </li>
          <li class="">
            <a data-toggle="tab" href="#3">Nursery</a>
          </li>
		<li class="">
            <a data-toggle="tab" href="#6">Day Care</a>
          </li>
        </ul>
        <div class="tab-content">
          <div id="1" class="tab-pane fade active in">
		<div class="col-sm-6"> <strong>Toddler (Ages: 1 ½ years to 2 ½)</strong><br><br><img src="icons/tod.png"></div>
          
		<div class="col-sm-6"><br><br>
           <p align="justify">During  this age, children face new challenge from  crawling, walking and running and they require stimulation to help them learn.  Children learn best when they are in a safe and stimulating environment. We  provide appropriate stimulation through music, educational toys, story time,  gross and fine motor skills, outdoor play and a very cheerful and spacious room  to help our toddlers explore. We provide parental daily report of child's  activity. This includes any milestones achieved, activities child participated  in, as well as a record of meal and toilet training. </p>

          </div>
          </div>
          <div id="2" class="tab-pane fade">
             <div class="col-sm-6"> <strong>Pre-Nursery (Ages: 2 ½  years to 3 ½)</strong><br><br><img src="icons/nurs.png"><span></span><br> </div>
             <div class="col-sm-6"><br><br><p align="justify">A  good preschool can make a difference in a child's future school years. At this  stage, children are learning to be more independent and to develop social  skills. Children who feel secure and appreciated in their surroundings gain  confidence. We provide them with the perfect developmental toys, games, books  and activities to occupy their curious, eager and energetic minds in the areas  of science, math, language, sensory, creative arts, dramatic play, and music as  well as in developing gross and fine motor skills. </p>
            
          </div>
          </div>
          <div id="3" class="tab-pane fade">
		<div class="col-sm-6"> <strong>Nursery (Ages: 3 ½  years to 4 ½)</strong><br><br><img src="icons/pre.png"><span></span><br> </div>
           	<div class="col-sm-6"><br><br><p align="justify">Every child begins reading, reasoning, problem-solving, and effective communication through active participatory learning. Each child receives an unparalleled level of individual  attention, to ensure success in reading, writing, math, as well as drama, music  and art, while bolstering a sense of self-confidence and accomplishment. By  offering small group and one-on-one academic attention, Creative Learning  offers the best foundation in preparing child for the elementary school years.</p>
            
          </div>
          </div>
		<div id="6" class="tab-pane fade">
		<div class="col-sm-6"> <strong>Day Care (After School)</strong><br><br><img src="icons/day.png"><span></span><br> </div>
           	<div class="col-sm-6"><br><br><p align="justify">We  understand needs of working parent so we provide day care facility. Day cart  Timing is from 12 noon to 5.30 pm.   Activities include indoor &amp; outdoor play, nutritious &amp; tasty  meals (optional). Children can explore all our learning centers and our outdoor  facilities every day. Pick and drop times are based on individual needs. <br>
Our  day care program is more than just caring child. We </p>
<ul>
  <li>provide the children with a rich, interesting learning  environment which they can explore with all their senses.</li>
  <li>encourage the development of positive social skills.</li>
  <li>encourage the children's feelings of competence by giving them opportunities to experiment, problem solving and enhance their abilities.</li>
  <li>develop the children's self-esteem by ensuring that they  feel valued and cared for as individuals.</li>
  <li>foster a sense of autonomy by ensuring flexibility and  choice</li>
</ul>

          </div>
		
        </div>
      </div>
	<div class="col-sm-2"></div>

      </div>
      </div>
      </div>
<br><br>
</section>

<section id="testi" class="color_section"><br><br>
<div class="container"><div class="row"><strong><br><br></strong>

	<div class="col-sm-12 text-center">
          <h2 class="block-header">Testimonial</h2>
      </div>
	<div>
         
         <iframe src="carousel2.html"   width="100%" height="300px"></iframe>
      </div>
      </div>
      </div>
</section>


<section id="portfolio">
    <div class="container">
      <div class="col-sm-12 text-center">
          <h2 class="block-header">Our Infrastructure</h2>
      </div>
<div id="portfolio_wrapper" class="row">
    
      <!-- Items -->
      
      <ul class="items-row row cols-3 portfolio filtrable clearfix isotope" id="portfolioContainer">
        <li class="item col-sm-6 col-md-4 isotope-item graphicdesign webdesign"> 
          
          <!-- Image  --> 
          
          <div class="portfolio_item_image">
            <img alt="" src="icons/fac1.jpg">
            <div class="portfolio_links">
              <a class="p-view prettyPhoto" title="" rel="prettyPhoto[pp_gal]" href="icons/fac1.jpg"></a>
             
            </div>
          </div>
          <div class="item_title">
            <h4>
              <a>Audio Visual Room</a>
            </h4>
          </div>
        </li>
        
        <li class="item col-sm-6 col-md-4 isotope-item photography webdesign"> 
          
          <!-- Image  --> 
          
          <div class="portfolio_item_image">
            <img alt="" src="icons/fac2.jpg">
            <div class="portfolio_links">  
              <a class="p-view prettyPhoto" title="" rel="prettyPhoto[pp_gal]" href="icons/fac2.jpg"></a>
             
            </div>
          </div>
          <div class="item_title">
            <h4>
              <a >Activity Room</a>
            </h4>
          </div>     
        </li>
        
        <li class="item col-sm-6 col-md-4 isotope-item photography webdesign"> 
          
          <!-- Image  --> 
          
          <div class="portfolio_item_image">
            <img alt="" src="icons/fac3.jpg">
            <div class="portfolio_links">  
              <a class="p-view prettyPhoto" title="" rel="prettyPhoto[pp_gal]" href="icons/fac3.jpg"></a>
             
            </div>
          </div>
          <div class="item_title">
            <h4>
              <a>Splash Pool</a>
            </h4>
          </div>
        </li>
        
        <li class="item col-sm-6 col-md-4 isotope-item"> 
          
          <!-- Image  --> 
          
          <div class="portfolio_item_image">
            <img alt="" src="icons/fac4.jpg">
            <div class="portfolio_links">  
              <a class="p-view prettyPhoto" title="" rel="prettyPhoto[pp_gal]" href="icons/fac4.jpg"></a>
              
            </div>
          </div>
          <div class="item_title">
            <h4>
              <a>Yoga</a>
            </h4>
          </div>               
        </li>
        
        <li class="item col-sm-6 col-md-4 isotope-item graphicdesign webdesign"> 
          
          <!-- Image  --> 
          
          <div class="portfolio_item_image">
            <img alt="" src="icons/fac5.jpg">
            <div class="portfolio_links">  
              <a class="p-view prettyPhoto" title="" rel="prettyPhoto[pp_gal]" href="icons/fac5.jpg"></a>
             
            </div>
          </div>
          <div class="item_title">
            <h4>
              <a>Dining Room</a>
            </h4>
          </div>               
        </li>
        
        <li class="item col-sm-6 col-md-4 isotope-item"> 
          
          <!-- Image  --> 
          
          <div class="portfolio_item_image">
            <img alt="" src="icons/fac6.jpg">
            <div class="portfolio_links">  
              <a class="p-view prettyPhoto" title="" rel="prettyPhoto[pp_gal]" href="icons/fac6.jpg"></a>
              
            </div>
          </div>
          <div class="item_title">
            <h4>
              <a>Play Area</a>
            </h4>
          </div>          
        </li>
        
      </ul>
    </div> <!--eof portfolio_wrapper-->

</div>        
</section>

<section id="gallery" class="color_section">
    <div class="container">
      <div class="col-sm-12 text-center">
          <h2 class="block-header"><br><br>Gallery</h2>
          
     
  </div>
<div id="Div1" class="row" >
    
      <!-- Items -->
      
       <iframe src="gallery.html" width="100%;" height="650px;"></iframe>
   
    </div> <!--eof portfolio_wrapper-->

</div>        
</section>




<section id="contact" style="background-color:#ffffff">
  <div class="container">
    <div class="row">
      <div class="col-sm-12 text-center">
        <h2 class="block-header">Contact Us</h2>
       
      </div>
    </div>

       <%--<div class="row" align="center">
         <p id="unamemsg" style="font-family: Arial, Helvetica, sans-serif; font-size: 18px;font-weight: lighter"></p>
       </div>--%>
      <div class="row">
          <div class="col-sm-12">

              <div class="contact-form">
                  <form class="contact-form" method="post" runat="server">
                      <asp:ScriptManager ID="ScriptMgr" runat="server" EnablePageMethods="true">
                        </asp:ScriptManager>
                      <p class="contact-form-name">
                          <input type="text" aria-required="true" size="30" value="" name="name" id="name" class="form-control" placeholder="Name">
                      </p>
                      <p class="contact-form-email">
                          <input type="text" aria-required="true" size="30" value="" name="email" id="email" class="form-control" placeholder="Email">
                      </p>
                      <p class="contact-form-number">
                          <input type="text" aria-required="true" size="30" value="" name="number" id="phone" class="form-control" placeholder="Contact Number">
                      </p>

                      <p class="contact-form-message">
                          <textarea aria-required="true" rows="8" cols="45" name="message" id="message" class="form-control" placeholder="Message"></textarea>
                      </p>

                      <p class="contact-form-name">
                           <input type="text" size="30" value="" id="Capcha" class="form-control, col-xs-3" style="font-weight:bold; font-style:italic" runat="server" disabled="disabled" oncopy="return false" onpaste="return false" oncut="return false" ondelete="return false"/>
                            <br />
                            <br />
                            <span style="text-align:left">Please enter value displayed in textbox above</span> <br />
                          <input type="text" size="30" value="" name="CapchaEntered" id="CapchaEntered" class="form-control, col-xs-3" runat="server" oncopy="return false" onpaste="return false" oncut="return false" ondelete="return false"/>
                      </p>

                      <p class="contact-form-submit text-left vertical-margin-60">
                          <input type="button" value="Send" id="contact_form_submit" name="contact_submit" class="theme_btn inverse" onclick="onCheckUserName()">
                          <span id="unamemsg"></span>
                      </p>
                  </form>
              </div>
          </div>
      </div>
  </div>
</section>

<section id="copyright" class="dark_section">
  <div class="container"><div class="row">
    	
	<div class="col-sm-3">
	<p style="font-weight:400; text-align:justify"><strong>Address: </strong>HIG-17, Sector E, <br />
        Opp PNB ATM, Near Radhe Lal Sweet<br> Aliganj, Lucknow<br>
			<strong>Contact No.: </strong> 9889300297
		</p>
	</div>

    	<div class="col-sm-5">
	<p>
		
                       <a href="https://twitter.com/SmarteezSchool" target="_bank" > <img src="icons/tw.png"></a>
                       <a href="https://www.linkedin.com/company/9322319?trk=tyah&trkInfo=clickedVertical%3Acompany%2CclickedEntityId%3A9322319%2Cidx%3A1-1-1%2CtarId%3A1438323472271%2Ctas%3Asmarteez" target="_bank"> <img src="icons/li.png"></a>
                       <a href="https://www.facebook.com/pages/Smarteez-Play-School/1075649012461705?ref=bookmarks" target="_bank"> <img src="icons/fb.png"></a>
                       <a href="https://plus.google.com/u/0/b/114671795311246433135/114671795311246433135/about/p/pub" target="_bank"> <img src="icons/Google.png"></a>
                
	</p>
	</div>

	<div class="col-sm-4" style="text-align:right">
            Total Visits:   <%=Application["UserCount"] %>
	</div>

  </div>

</div>
</section>

<!-- EOF #box_wrap -->



<div id="gallery_container"></div>


        <script src="js/vendor/respond.min.js"></script>
        <script src="js/vendor/placeholdem.min.js"></script>
        <script src="js/vendor/jquery-1.10.2.min.js"></script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/vendor/hoverIntent.js"></script>
        <script src="js/vendor/superfish.js"></script>
        <script src="js/vendor/jquery.actual.min.js"></script>
        <script src="js/vendor/jquery.elastislide.js"></script>
        <script src="js/vendor/jquery.flexslider-min.js"></script>
        <script src="js/vendor/jquery.prettyPhoto.js"></script>
        <script src="js/vendor/jquery.easing.1.3.js"></script>
        <script src="js/vendor/jquery.ui.totop.js"></script>
        <script src="js/vendor/jquery.isotope.min.js"></script>
        <script src="js/vendor/jquery.easypiechart.min.js"></script>
        <script src='js/vendor/jflickrfeed.min.js'></script>
        <script src="js/vendor/jquery.sticky.js"></script>
        <script src='js/vendor/owl.carousel.min.js'></script>
        <script src='js/vendor/jquery.nicescroll.min.js'></script>
        <script src='js/vendor/jquery.fractionslider.min.js'></script>
        <script src='js/vendor/jquery.scrollTo-min.js'></script>
        <script src='js/vendor/jquery.localscroll-min.js'></script>
        <script src='js/vendor/jquery.parallax-1.1.3.js'></script>
        <script src='twitter/jquery.tweet.min.js'></script>
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>

         <!-- Map Scripts -->
        
   <script src="js/layerslider.transitions.js"></script> 
    <script src="js/layerslider.kreaturamedia.jquery.js"></script> 
    <script src="js/greensock.js"></script> 
    
        
    <script data-cfasync="false" type="text/javascript">var lsjQuery = jQuery;</script><script data-cfasync="false" type="text/javascript">        lsjQuery(document).ready(function () { if (typeof lsjQuery.fn.layerSlider == "undefined") { lsShowNotice('layerslider_9', 'jquery'); } else { lsjQuery("#layerslider_9").layerSlider({ responsiveUnder: 1240, layersContainer: 1170, startInViewport: false, pauseOnHover: false, forceLoopNum: false, autoPlayVideos: false, skinsPath: 'js/layerslider/skins/' }) } }); </script>
    
    </body>
</html>