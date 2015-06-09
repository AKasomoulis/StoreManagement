<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="gr.uoa.di.storemanagement.datalayer.entities.store.Store"%>
<%@page import="java.util.List"%>
<%@page import="java.lang.String"%>

<%@page import="gr.uoa.di.storemanagement.datalayer.entities.user.User"%>
<%@page import="gr.uoa.di.storemanagement.datalayer.entities.role.Role"%>
<%@page import="gr.uoa.di.storemanagement.rights.Rights"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<!DOCTYPE html>


<head>
<meta charset="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<meta name="viewport" content="width=device-width">

<meta name="description" content="Designa Studio, a HTML5 / CSS3 template.">
<meta name="author" content="Sylvain Lafitte, Web Designer, sylvainlafitte.com">

<title>STORES // e-Warehouse</title>

<link rel="shortcut icon" type="image/x-icon" href="favicon.ico">
<link rel="shortcut icon" type="image/png" href="favicon.png">

<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,700' rel='stylesheet' type='text/css'>
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
						
						<% if (user.getRole().getRoleName().equals("Admin")) { %>
							<a href="<%=request.getContextPath()%>/General">General</a><br>
						<% } 
							else {%>
								<a href="userGeneral.jsp">General</a><br>
						<% 	} %>
						<%if (Rights.getInstance().canReadStore(user.getRole().getRights()) || Rights.getInstance().canWriteStore(user.getRole().getRights())) {%>
							<a href="<%=request.getContextPath()%>/AllStores">Stores</a><br>
						<% } %>
						
						<%if (Rights.getInstance().canReadUser(user.getRole().getRights()) || Rights.getInstance().canWriteUser(user.getRole().getRights())) {%>
							<a href="<%=request.getContextPath()%>/AllUsers">Users</a><br>
						<% } %>
						
						<%if (Rights.getInstance().canReadProduct(user.getRole().getRights()) || Rights.getInstance().canWriteProduct(user.getRole().getRights())) {%>
							<a href="<%=request.getContextPath()%>/AllProducts">Products</a><br>
						<% } %>
						
						<% if (user.getRole().getRoleName().equals("Admin")) { %>
							<a href="<%=request.getContextPath()%>/AllRoles">Roles</a><br>
						<% } %>
					</ul>
				</menu>

				<hr />


				<br>
				<menu>
					<a id="work_all" class="arrow buttonactive">All</a>
					<br>
					<a id="work_1" class="arrow">Athens</a>
					<br>
					<a id="work_2" class="arrow">Thessaloniki</a>
					<br>
					<a id="work_3" class="arrow">Other cities</a>
				</menu>
				</br>
				
				<hr /><br>
				
				
				<p>
					<% if (Rights.getInstance().canWriteStore(user.getRole().getRights())) { %>
<!-- 					<a href="addStore.jsp" class="button">Add Store</a> -->
<%-- 					<a href="<%=request.getContextPath()%>/AddStore" id= "koumpi2"><img src="img/a9.png"> Add Warehouse</a> --%>
					<a class="button" href="<%=request.getContextPath()%>/AddStore" id= "koumpi2">Add Warehouse</a><br><br><hr />
					<% } %>
					<form action="StoreInfo" method="post" id="hiddenform">
						<input type="hidden" name="hidden" id="hidden" value="">
					</form>
				</p>
				
				

				
			</aside>

			<section class="grid col-three-quarters mq2-col-full">

				<div class="grid-wrap works">

					<form action="AllStores" method="post">
					
						<%
							List<Object[]> stores = null;
							int i = 0;	
						%>

						<%
							stores = (List<Object[]>) request.getAttribute("stores");							
						%>

						<%
							if (stores != null)
								for (Object[] resultElement : stores) {
									if (resultElement[1].equals("Athens")) {
										out.print("<figure class='grid col-one-third mq1-col-one-half mq2-col-one-third mq3-col-full work_1'>");
									}
									else if (resultElement[1].equals("Thessaloniki")) {
										out.print("<figure class='grid col-one-third mq1-col-one-half mq2-col-one-third mq3-col-full work_2'>");
									}
									else {
										out.print("<figure class='grid col-one-third mq1-col-one-half mq2-col-one-third mq3-col-full work_3'>");
									}
						%>						
						
						<a href='<%=request.getContextPath()%>/StoreInfo'>
						<%
									out.print("<img src='img/img.jpg' alt=''>");
									out.print("<span class='zoom'></span></a>");
									out.print("<figcaption>");
									String id = (String) resultElement[0];
									%>
									 	<a href='#' id='<%out.print((String)resultElement[0]);%>' onclick='getMyID(this.id);'><%out.print((String)resultElement[0]);%></a> 					
										
									<%
									out.print("</a>");
									out.print("<p>");
									out.print((String) resultElement[1]);
									out.print("</p>");
									out.print("</figcaption>");
									out.print("</figure>");
									out.println();
								}
						%>
						
					</form>

				</div>

		</section>

		</div>
		<!--main-->


		<p style="float: right;" > <img src="img/9.jpg"></p>

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
</html>