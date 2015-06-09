<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="gr.uoa.di.storemanagement.datalayer.entities.user.User"%>
	<%@page import="gr.uoa.di.storemanagement.datalayer.entities.user.UserForApproval"%>
	<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<!DOCTYPE html>

<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->

<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->

<script language="javascript" type="text/javascript">
	function clearText(field) {
		if (field.defaultValue == field.value)
			field.value = '';
		else if (field.value == '')
			field.value = field.defaultValue;
	}
</script>

<head>
<meta charset="UTF-8">

<!-- Remove this line if you use the .htaccess -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<meta name="viewport" content="width=device-width">

<meta name="description"
	content="Designa Studio, a HTML5 / CSS3 template.">
<meta name="author"
	content="Sylvain Lafitte, Web Designer, sylvainlafitte.com">

<title>ABOUT // Designa Studio</title>

<link rel="shortcut icon" type="image/x-icon" href="favicon.ico">
<link rel="shortcut icon" type="image/png" href="favicon.png">

<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/style.css">

<!--[if lt IE 9]>
	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
</head>
<body>


					<%
							User user = new User();
							UserForApproval userfa = new UserForApproval();
							user = (User) session.getAttribute("user");
							userfa = (UserForApproval) session.getAttribute("user1");
							String userName = null;
							String firstName = null;
							String lastName = null;
							String pass = null;
							String roleName = null;
							String email = null;
							if (user != null) {
								userName = user.getUsername();
								firstName = user.getFirstName();
								lastName = user.getLastName();
								pass = user.getPassword();
								email = user.getEmail();
								roleName = user.getRole().getRoleName();
							}
							if (userfa != null) {
								userName = userfa.getUsername();
								firstName = userfa.getFirstName();
								lastName = userfa.getLastName();
								pass = userfa.getPassword();
								email = userfa.getEmail();
								roleName = userfa.getRole().getRoleName();								
							}
					%>
					
					
	<!-- Prompt IE 7 users to install Chrome Frame -->
	<!--[if lt IE 8]><p class=chromeframe>Your browser is <em>ancient!</em> <a href="http://browsehappy.com/">Upgrade to a different browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to experience this site.</p><![endif]-->

	<div class="container">
	
	<% if (user == null && userfa == null) {%>

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
					<li><a href="signup.jsp">Register</a></li>
					<nav>

						<li id="login"><a id="login-trigger" href="#"> Log in <span>▼</span>
						</a>
							<div id="login-content">
								<%
									String result, username, password;
									result = null;
									username = "username";
									password = "*****";
								%>

								<%
									result = (String) request.getAttribute("error");
								%>
								<form action="Login" method="post">
									<fieldset id="inputs">
										<%
											if (result != null) {
												if (result.equals("null value"))
													out.print("<font color='red'><div class='error_box none' style='display: block;width:200px; '> There is an empty field </div></font>");
												out.print("<font color='red'><div class='error_box none' style='display: block;width:200px; '> Invalid username or password </div></font>");
												//			if (result.equals("invalid password")) {
												//				username = (String) request.getAttribute("username");
												//				out.print("<font color='red'><div class='error_box none' style='display: block;width:200px; '> Invalid password </div></font>");
												//			}
												//			else if (result.equals("unknown user")) {
												//				out.print("<font color='red'><div class='error_box none' style='display: block;width:200px; '> Unknown user </div></font>");
												//			}
											}
										
											username = (String) request.getAttribute("username");
											if (username == null) username = "username";
											else password = "*";
										%>



										<%
											//	out.print("<label> <input type='text' value='" + username + "' name='username' size='10' id='username' title='username' onfocus='clearText(this)' onblur='clearText(this)' class='txt_field' /></label> ");
										%>
<!-- 										<input id="username" type="text" name="username" -->
<!-- 											placeholder="Username" required> <input id="password" -->
<!-- 											type="password" name="Password" placeholder="Password" -->
<!-- 											required> -->
											<input type="text" value="<%out.print(username); %>"
										name="username" size="10" id="username" title="username"
										onfocus="clearText(this)" onblur="clearText(this)"
										class="txt_field" />
										<input type="password" value="password"
										name="password" size="10" id="password" title="password"
										onfocus="clearText(this)" onblur="clearText(this)"
										class="txt_field" />
										
									</fieldset>
									<fieldset id="actions">
										<input type="submit" id="submit" value="Log in"> 
										<label><input type="checkbox" name="signedInChecked" checked="checked">Keep me signed in</label>
									</fieldset>
								</form>



							</div></li>


					</nav>
				</ul>
			</nav>
		</header>
		<% } else if (user != null){%>
		
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
		
		<% } else if (userfa != null) {%>
		
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
		
		<% } %>
		<div class="about-page main grid-wrap">

			<header class="grid col-full">
				<hr>
				<p class="fleft">About us</p>
			</header>



			<aside class="grid col-one-quarter mq2-col-full">
				<p class="mbottom">We take pride in our knowledge and abilities and are mindful that we may falter at times. Recognizing humility is a key component to our growth and development. If we are to be progressive in our industry, we must educate ourselves with the knowledge and opinion of others.</p>
				<menu>
					<ul>
						<li><a href="#navteam" class="arrow">Our Company</a></li>
						<li><a href="#navphilo" class="arrow">Our philosophy</a></li>
						<li><a href="#navplace" class="arrow">Our partners</a></li>
<!-- 						<li><a href="#navother" class="arrow">Our lorem</a></li> -->
					</ul>
				</menu>
			</aside>

			<section class="grid col-three-quarters mq2-col-full">
				<img src="img/team.jpg" alt="">

				<article id="navteam">
					<h2>Our Company</h2>
					<p>E-Warehouse is the leading supply chain execution software provider focused on solutions for logistics service providers and small and medium sized business (SMB).  E-Warehouse provides a robust suite of supply chain applications, a unifying technology architecture and service from a team with deep operational and technology expertise.</p>
					<p>E-Warehouse was formed with the idea that logistics service providers and SMBs were too limited in their options for supply chain software.  With a core focus on these industry sectors, E-Warehouse developed a comprehensive suite of products that is widely deployed in trucking companies, 3PLs and small and medium sized distribution-focused companies.  E-Warehouse applications are built on best-practice based functionality designed by subject matter experts, many of whom have real-world experience working in supply chain operations.</p>
				</article>

				<article id="navphilo">
					<h2>Our philosophy</h2>
					<p>E-Warehouse was founded on a simple idea:  Supply chain companies deserve robust technology solutions that are easy and inexpensive to implement and maintain.

E-Warehouse provides powerful supply-chain execution solutions that are easy to customize and implement, allowing our customers to enjoy more innovation for less investment.</p>
					<p>Our aim is to strike the perfect balance among customer satisfaction, employee fulfillment and stakeholder value.

Through a combination of strategic acquisitions, carefully-crafted partnerships and industry-leading investments in research, development and customer care, E-Warehouse aims to become the clear choice for supply chain companies worldwide.</p>
				</article>

				<article id="navplace">
					<h2>Our partners</h2>
					<p>E-Warehouse values its network of certified partners who deliver products across the globe. E-Warehouse partners have been selected because they share our commitment to excellence in service, implementation, training and support.  E-Warehouse partners are experts in the fields of logistics, material handling, warehousing and distribution, and they understand that every distribution center is different. E-Warehouse partners offer local, personal service and support to make sure that you receive the E-Warehouse solution that meets your unique needs.</p>
					
				</article>

				<article id="navother">
					
				</article>

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
						<li><a href="signup.jsp">Register</a></li>

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

	<script>
		$(document).ready(function() {
			$('#login-trigger').click(function() {
				$(this).next('#login-content').slideToggle();
				$(this).toggleClass('active');

				if ($(this).hasClass('active'))
					$(this).find('span').html('&#x25B2;')
				else
					$(this).find('span').html('&#x25BC;')
			})
		});
	</script>

</body>
</html>

