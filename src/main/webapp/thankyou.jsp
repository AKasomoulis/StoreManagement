<%@page import="gr.uoa.di.storemanagement.datalayer.entities.user.UserForApproval"%>
<%@page import="gr.uoa.di.storemanagement.datalayer.entities.role.Role"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>


<!DOCTYPE html>


<html class="no-js" lang="en"> <!--<![endif]-->

<head>
	<meta charset="UTF-8">
	
	<!-- Remove this line if you use the .htaccess -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width">
	<meta name="description" content="Designa Studio, a HTML5 / CSS3 template.">
	<meta name="author" content="Sylvain Lafitte, Web Designer, sylvainlafitte.com">
	<title>Thank you! // e-Warehouse</title>
	<link rel="shortcut icon" type="image/x-icon" href="favicon.ico">
	<link rel="shortcut icon" type="image/png" href="favicon.png">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,700' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="css/style.css">
	
	<!--[if lt IE 9]>
	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
</head>

<body>
					<%
							UserForApproval user = new UserForApproval();
							user = (UserForApproval) session.getAttribute("user");
							String username = user.getUsername();
							String firstName = user.getFirstName();
							String lastName = user.getLastName();
							String roleName = user.getRole().getRoleName();
					%>


<div class="container">

		<section class="container">
			<div class="user">
				<img src="img/avatar.png">
				<h5>
					<% out.print(firstName + " " + lastName); %> <small><% out.print(roleName); %></small>
				</h5>
				<ul>
					<li><a href='<%=request.getContextPath()%>/Signout'>Sign out</a></li>
					<li class="sep"><%
						Date dNow = new Date( );
				      	SimpleDateFormat ft = 
				      	new SimpleDateFormat ("yyyy.MM.dd - hh:mm:ss a zzz");
				      	out.print(ft.format(dNow));
					%></li>
				</ul>
			</div>
		</section>

	<header id="navtop">

		
		<header id="navtop">
			<a href="<%=request.getContextPath()%>/Index" class="logo fleft"> <img src="img/logo2.png"
				alt="Designa Studio">
			</a>

			<nav class="fright">
				<ul>
					<li><a href="<%=request.getContextPath()%>/Index" class="navactive">Home</a></li>
					<li><a href="about.html">Our Company</a></li>
				</ul>
				<ul>
					<li><a href="services.html">Services</a></li>
					<li><a href="works.html">Works</a></li>
				</ul>
				<ul>
					<li><a> .</a></li>
					<li><a> .</a></li>
				</ul>
				<ul></ul>

			</nav>
		</header>
	

        

        <div id="signup-inner">
        
        	<div class="clearfix" id="header">
        	
        		<img id="signup-icon" src="./images/signup.png" alt="" />
        
                <h1>Thank you for your registration!</h1>
                <p><h3>We will check your settings and will inform you.</h3></p>
           </div>
            
        

        </div>
        



<div class="divide-top">
	<footer class="grid-wrap">
		<ul class="grid col-one-third social">
			
			<li><a href="https://www.facebook.com">Facebook</a></li>
			<li><a href="https://www.twitter.com">Twitter</a></li>
			<li><a href="https://plus.google.com">Google+</a></li>
			<li><a href="https://www.flickr.com">Flickr</a></li>
		</ul>
	
		<div class="up grid col-one-third ">
			<a href="#navtop" title="Go back up">&uarr;</a>
		</div>
		
		<nav class="grid col-one-third ">
			<ul>
				<li><a href="<%=request.getContextPath()%>/Index">Home</a></li>
				<li><a href="about.html">Our Company</a></li>
				<li><a href="services.html">Services</a></li>
				<li><a href="works.html">Works</a></li>
				<li><a href="contact.html">Contact</a></li>
				<li><a href="register.html">Register</a></li>
			
			</ul>
		</nav>
	</footer>
</div>
	
	
</body>
</html>
