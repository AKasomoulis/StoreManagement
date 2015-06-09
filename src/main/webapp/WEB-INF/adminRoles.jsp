<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="gr.uoa.di.storemanagement.datalayer.entities.role.Role"%>
<%@page import="java.util.List"%>
<%@page import="java.lang.String"%>
<%@page import="gr.uoa.di.storemanagement.datalayer.entities.user.User"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>


<!DOCTYPE html>


<head>
<meta charset="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<meta name="viewport" content="width=device-width">

<meta name="description"
	content="Designa Studio, a HTML5 / CSS3 template.">
<meta name="author"
	content="Sylvain Lafitte, Web Designer, sylvainlafitte.com">

<title>STORES // e-Warehouse</title>

<link rel="shortcut icon" type="image/x-icon" href="favicon.ico">
<link rel="shortcut icon" type="image/png" href="favicon.png">

<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/style.css">


</head>


<body>
					<%
							User user = new User();
							user = (User) session.getAttribute("user");
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
					<li><a href='<%=request.getContextPath()%>/MyProfile.jsp'>View Profile</a></li>
					<li><a href='<%=request.getContextPath()%>/myCart.jsp'>My Cart</a></li>
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
			<a href="<%=request.getContextPath()%>/Index" class="logo fleft"> <img src="img/logo2.png"
				alt="Designa Studio">
			</a>

			<nav class="fright">
				<ul>
					<li><a href="<%=request.getContextPath()%>/Index" class="navactive">Home</a></li>
					<li><a href="about.jsp">Our Company</a></li>
				</ul>
				<ul>
					<li><a href="services.jsp">Services</a></li>
					<li><a href="contact.jsp">Contact</a></li>
				</ul>
				<ul>
					<li><a> .</a></li>
					<li><a> .</a></li>
				</ul>
				<ul></ul>

			</nav>
		</header>


		<div class="works-page main grid-wrap">

			<header class="grid col-full">
				<hr>
				<p class="fleft">Warehouses</p>
			</header>


			<aside class="grid col-one-quarter mq2-col-full">
				<p class="mbottom">Welcome to Warehouse management system of e-Warehouse. Explore its capabilities and regularize your space. Easily, reliably and quickly! </p>
						
				<script>
				function getMyID(id){
						var ID = id;
						document.getElementById("hidden").value = ID;
						document.getElementById("hiddenform").submit();
				}
				</script>

				<menu>
					<ul>
					<a href="<%=request.getContextPath()%>/General">General</a><br>
					<a href="<%=request.getContextPath()%>/AllStores">Stores</a><br>
					<a href="<%=request.getContextPath()%>/AllUsers">Users</a><br>
					<a href="<%=request.getContextPath()%>/AllProducts">Products</a><br>
					<a href="<%=request.getContextPath()%>/AllRoles">Roles</a><br>
					</ul>
				</menu>

				<hr /> <br>

				
				
				<p>
					<a id="koumpi4" href="<%=request.getContextPath()%>/AddRole" class="button">Add Role</a>
					
					<form action="RoleInfo" method="post" id="hiddenform">
						<input type="hidden" name="hidden" id="hidden" value="">
					</form>
				</p>
				
				

				
			</aside>

			<section class="grid col-three-quarters mq2-col-full">

				<div class="grid-wrap works">

					<form action="AllRoles" method="post">
					
						<%
							List<String> roles = null;
							int i = 0;	
						%>

						<%
							roles = (List<String>) request.getAttribute("roles");							
						%>

						<%
							if (roles != null)
								for (String resultElement : roles) {
									out.print("<figure class='grid col-one-third mq1-col-one-half mq2-col-one-third mq3-col-full city_all'>");
						%>						
						
						<a href='<%=request.getContextPath()%>/RoleInfo'>
						<%
									out.print("<img src='img/img.jpg' alt=''>");
									out.print("<span class='zoom'></span></a>");
									out.print("<figcaption>");
									String id = (String) resultElement;
									%>
									 	<a href='#' id='<%out.print((String)resultElement);%>' onclick='getMyID(this.id);'><%out.print((String)resultElement);%></a> 					
										
									<%
									out.print("</a>");
									out.print("</figcaption>");
									out.print("</figure>");
								}
						%>
						
					</form>

				</div>

		</section>

		</div>
		<!--main-->

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
						<li><a href="about.jsp">Our Company</a></li>
						<li><a href="services.html">Services</a></li>
						<li><a href="contact.jsp">Contact</a></li>

					</ul>
				</nav>
			</footer>
		</div>

	</div>

	<!-- Javascript - jQuery -->
	<script src="http://code.jquery.com/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="js/jquery-1.7.2.min.js"><\/script>')
	</script>

	<!--[if (gte IE 6)&(lte IE 8)]>
<script src="js/selectivizr.js"></script>
<![endif]-->

	<script src="js/scripts.js"></script>

	<!-- Asynchronous Google Analytics snippet. Change UA-XXXXX-X to be your site's ID. -->
	<script>
		var _gaq = [ [ '_setAccount', 'UA-XXXXX-X' ], [ '_trackPageview' ] ];
		(function(d, t) {
			var g = d.createElement(t), s = d.getElementsByTagName(t)[0];
			g.src = ('https:' == location.protocol ? '//ssl' : '//www')
					+ '.google-analytics.com/ga.js';
			s.parentNode.insertBefore(g, s)
		}(document, 'script'));
	</script>
</body>
