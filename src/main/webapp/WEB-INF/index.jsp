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

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width">
<meta name="description"
	content="Designa Studio, a HTML5 / CSS3 template.">
<meta name="author"
	content="Sylvain Lafitte, Web Designer, sylvainlafitte.com">
<title>HOME // e-Warehouse</title>
<link rel="shortcut icon" type="image/x-icon" href="favicon.ico">
<link rel="shortcut icon" type="image/png" href="favicon.png">
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/style.css">

<script language="javascript" type="text/javascript">
	function clearText(field) {
		if (field.defaultValue == field.value)
			field.value = '';
		else if (field.value == '')
			field.value = field.defaultValue;
	}
</script>

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


		<div class="home-page main">
			<section class="grid-wrap">
				<header class="grid col-full">
					<hr>
<!-- 					<p class="fleft">Home</p> -->
					<a href="about.jsp" class="arrow fright">see more infos</a>
				</header>

				<div class="grid col-one-half mq2-col-full">
					<h1>
						e-Warehouse<br> project
					</h1><br></br>
					
					<p>E-Warehouse is a revolutionary way to manage your inventory and control your warehouse operations using the power of the internet and wireless technology to make significant improvements to your warehouse and logistics problems.Unlike our competitors, with e-Warehouse there is nothing to download or install. Open your web browser and log on...anywhere, anytime. There is no 200 MB download that you need to install on every PC that you want to use the application on. There is no databases to setup, no software to buy, no license keys or dongles to setup or install.</p>
				</div>


				<div class="slider grid col-one-half mq2-col-full">
					<div class="flexslider">
						<div class="slides">
							<div class="slide">
								<figure>
									<img src="img/image2.jpg" alt="">
									<figcaption>
										<div>
											<h5>Caption 1</h5>
											<p>
												Strictest confidentiality.
											</p>
										</div>
									</figcaption>
								</figure>
							</div>

							<div class="slide">
								<figure>
									<img src="img/image1.jpg" alt="">
									<figcaption>
										<div>
											<h5>Caption 2</h5>
											<p>Consistent and timely cooperation.</p>
										</div>
									</figcaption>
								</figure>
							</div>
							
							<div class="slide">
								<figure>
									<img src="img/image3.jpg" alt="">
									<figcaption>
										<div>
											<h5>Caption 3</h5>
											<p>With experience and technical knowledge</p>
										</div>
									</figcaption>
								</figure>
							</div>
							
							<div class="slide">
								<figure>
									<img src="img/image33.jpg" alt="">
									<figcaption>
										<div>
											<h5>Caption 4</h5>
											<p>Advanced facilities.</p>
										</div>
									</figcaption>
								</figure>
							</div>
						</div>
					</div>
				</div>

			</section>

			<section class="services grid-wrap">
				<header class="grid col-full">
					<hr>
					<p class="fleft">Our Services!</p>
					<a href="services.jsp" class="arrow fright">see more about our services</a>
				</header>

				<article class="grid col-one-third mq3-col-full">
					<aside>01</aside>
					<h5>Professional Services</h5>
					<p>E-Warehouse's Professional Services division is a team
												of highly experienced individuals providing industry leading
												support and service for all data collection needs. Utilizing
												leading technology our team of experienced professionals
												produce accurate results &ndash; every time.</p>

											<p>E-Warehouse is your sole source for support &ndash;
												from the initial draft of a project plan through end user
												training. We offer on-time, on-budget implementation of your
												solution along with the following services:</p>
				</article>

				<article class="grid col-one-third mq3-col-full">
					<aside>02</aside>
					<h5>Managed Services</h5>
					<p>The suite of services that Barcoding has developed will
									provide you with efficient management of your network,
									software, and hardware devices, resulting in less down time and
									more productivity from your workers.</p>
				</article>

				<article class="grid col-one-third mq3-col-full">
					<aside>03</aside>
					<h5>Software Services</h5>
					<p>With more than 10 years of experience, it is a
							proven software services leader. Our in-house software engineers
							are experts in integrating applications designed to complement
							your business environment &ndash; from basic to full-scale,
							enterprise rollouts. We work closely with industry-leading ISV's
							to ensure our solutions are delivered on time and to your
							specifications.</p>
				</article>
			</section>

			<section class="works grid-wrap">
				<header class="grid col-full">
					<hr>
					<p class="fleft">Take a look at our work!</p>
					<a  class="arrow fright">Login to see more works</a>
				</header>

				<figure class="grid col-one-quarter mq2-col-one-half">
					<a href="img/Screenshot1.png"> <img src="img/Screenshot1.png" alt=""> <span
						class="zoom"></span>
					</a>
					<figcaption>
						<a  class="arrow">New product form!</a>
						<p></p>
					</figcaption>
				</figure>

				<figure class="grid col-one-quarter mq2-col-one-half">
					<a href="img/Screenshot2.png"> <img src="img/Screenshot2.png" alt=""> <span
						class="zoom"></span>
					</a>
					<figcaption>
						<a  class="arrow">Add to cart!</a>
						<p></p>
					</figcaption>
				</figure>

				<figure class="grid col-one-quarter mq2-col-one-half">
					<a href="img/Screenshot3.png"> <img src="img/Screenshot3.png" alt=""> <span
						class="zoom"></span>
					</a>
					<figcaption>
						<a  class="arrow">About our company!</a>
						<p></p>
					</figcaption>
				</figure>

				<figure class="grid col-one-quarter mq2-col-one-half">
					<a href="img/Screenshot4.png"> <img src="img/Screenshot4.png" alt=""> <span
						class="zoom"></span>
					</a>
					<figcaption>
						<a  class="arrow">My cart!</a>
						<p></p>
					</figcaption>
				</figure>
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
						<li><a href="services.jsp">Services</a></li>
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

	<script src="js/jquery.flexslider-min.js"></script>
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