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

<!-- Remove this line if you use the .htaccess -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<meta name="viewport" content="width=device-width">

<meta name="description"
	content="Designa Studio, a HTML5 / CSS3 template.">
<meta name="author"
	content="Sylvain Lafitte, Web Designer, sylvainlafitte.com">

<title>SERVICES // Designa Studio</title>

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


		<div class="services-page main grid-wrap">

			<header class="grid col-full">
				<hr>
				<p class="fleft">Services</p>
			</header>


			<aside class="grid col-one-quarter mq2-col-full">
				<p class="mbottom">Lorem ipsum dolor sit amet, consectetuer
					adipiscing elit. Morbi commodo, ipsum sed pharetra gravida, orci
					magna rhoncus neque, id pulvinar odio lorem non turpis.</p>
<!-- 				<menu> -->
<!-- 					<ul> -->
<!-- 						<li><a href="#navbutton" class="arrow">Buttons</a></li> -->
<!-- 						<li><a href="#navtogg" class="arrow">Toggles</a></li> -->
<!-- 						<li><a href="#navtabs" class="arrow">Tabs</a></li> -->
<!-- 					</ul> -->
<!-- 				</menu> -->
			</aside>

			<section class="grid col-three-quarters mq2-col-full">



				<div class="grid-wrap">

					<article id="navbutton" class="grid col-full">
						
					</article>

					

					<article id="navtabs" class="grid col-full">
					
						<div class="">
							<ul class="tabs clearfix">
								<li><a style="border-color:grey; background:#282a2b; color:white;" href="#tab1">Professional Services</a></li>
								<li><a style="border-color:grey; background:#282a2b; color:white;" href="#tab2">Managed Services</a></li>
								<li><a style="border-color:grey; background:#282a2b; color:white;" href="#tab3">Software Services</a></li>
							</ul>
							<div class="tab_container">
								<article id="tab1" class="tab_content">
									<article id="navtogg" class="grid col-full">
										<ul class="toggle-view">

											<h4>
												<b class="solutions">E-Warehouse's Professional Services</b>
											</h4>
											<p>E-Warehouse's Professional Services division is a team
												of highly experienced individuals providing industry leading
												support and service for all data collection needs. Utilizing
												leading technology our team of experienced professionals
												produce accurate results &ndash; every time.</p>

											<p>E-Warehouse is your sole source for support &ndash;
												from the initial draft of a project plan through end user
												training. We offer on-time, on-budget implementation of your
												solution along with the following services:</p>


											<li>
												<h5 class="toggle-title">
													Site Surveys<span class="toggle-title-detail"></span>
												</h5>
												<div class="toggle">
													<p>
													<ul>
														<li>State-of-the-art equipment is utilized to assess
															the physical characteristics of the site</li>
														<li>A thorough and detailed site survey report of
															your facility is delivered</li>
														<li>Radio propagation and other key factors are
															measured to ensure a successful project</li>
													</ul>
													</p>
												</div>
											</li>
											<li>
												<h5 class="toggle-title">
													Network Design <span class="toggle-title-detail"></span>
												</h5>
												<div class="toggle">
													<p>
													<ul>
											</li>
											<li>Built on research, our site survey assessment,
												existing systems, and the facility's infrastructure</li>
											<li>Wireless network recommendations are provided that
												meet the highest standards for quality, cost, performance,
												and reliability</li>
										</ul>
										</p>
							</div>
							</li>
							<li>
								<h5 class="toggle-title">
									Network Installation <span class="toggle-title-detail"></span>
								</h5>
								<div class="toggle">

									<ul>
										<li>Conducted by a team of highly-experienced wireless
											network professionals who have extensive industry
											certification and accreditation</li>
										<li>Incorporates the latest technologies and network
											installation practices</li>
									</ul>

									</p>
								</div>
							</li>
							<li>
								<h5 class="toggle-title">
									Wireless Network Optimization Services <span
										class="toggle-title-detail"></span>
								</h5>
								<div class="toggle">
									<p>
									<ul>
										<li>Develop a complete wireless strategy that includes
											all mobile computers, laptops, and access points in your
											network</li>
										<li>Understand why interruptions in connectivity, dead
											spots, and/or unnecessary redundancies are occurring or have
											the potential to occur</li>
										<li>Address any risks to the network that changes to the
											physical infrastructure of the facility, un-installed
											firmware, and software upgrades may have had</li>
									</ul>
									</p>

								</div>
							</li>
							<li>
								<h5 class="toggle-title">
									Wireless Network Security Analysis & Services <span
										class="toggle-title-detail"></span>
								</h5>
								<div class="toggle">
									<p>
									<ul>
										<li>Respond to and eliminate a variety of threats, which
											may include hackers, bandwidth theft, and exposure of your
											documents and data</li>
									</ul>
									</p>
								</div>
							</li>
							<li>
								<h5 class="toggle-title">
									Project Management <span class="toggle-title-detail"></span>
								</h5>
								<div class="toggle">
									<p>
									<ul>
										<li>Identify, minimize, and eliminate the potential for
											costly problems before the project begins</li>
										<li>Provided by a team of professionals with
											multi-industry and technical experience, who will ensure a
											successful rollout, regardless of the size or scope of your
											project</li>
									</ul>
									</p>

								</div>
							</li>
							<li>
								<h5 class="toggle-title">
									Staging/ Configuration/ Kitting/ Shipping <span
										class="toggle-title-detail"></span>
								</h5>
								<div class="toggle">
									<p>
									<ul>
										<li>Enables us to streamline all stages of deployment</li>
										<li>Ensures that the project is delivered on a timely and
											cost-effective basis</li>
									</ul>
									</p>

								</div>
							</li>
							<li>
								<h5 class="toggle-title">
									Equipment Repair & Post Implementation Support <span
										class="toggle-title-detail"></span>
								</h5>
								<div class="toggle">
									<p>
									<ul>
										<li>Gain non-warranty service and support from some of
											the industry's most experienced repair and technical support
											teams</li>
										<li>Work with certified technicians who can diagnose
											hardware, software, and firmware issues associated with your
											wireless network as well as offer repair services for the
											industry's leading brands of equipment</li>
									</ul>
									</p>
								</div>
							</li>
							<li>
								<h5 class="toggle-title">
									Training &amp; Education <span class="toggle-title-detail"></span>
								</h5>
								<div class="toggle">
									<p>
									<p>A wide range of training and educational instruction if
										offered &ndash; from written documentation to on-site training</p>
									</p>

								</div>
							</li>
							</ul>
					</article>
					</article>

					<article id="tab2" class="tab_content">

						<article id="navtogg" class="grid col-full">

							<ul class="toggle-view">
								<h4>
									<b class="solutions">Managed Services</b>
								</h4>



								<p>The suite of services that E-Warehouse has developed will
									provide you with efficient management of your network,
									software, and hardware devices, resulting in less down time and
									more productivity from your workers.</p>


								<li>
									<h5 class="toggle-title">
										Technical Support/Help Desk <span class="toggle-title-detail"></span>
									</h5>
									<div class="toggle">
										<p>
										<p>E-Warehouse's Technical Support Team is dedicated to
											resolving issues as efficiently as possible.</p>
										<p>Our ability to troubleshoot software, hardware,
											network, or communication issues is paramount to ensuring the
											delivered solution provides the highest possible return on
											investment.</p>
										</p>

									</div>
								</li>
								<li>
									<h5 class="toggle-title">
										Remote Device Management <span class="toggle-title-detail"></span>
									</h5>
									<div class="toggle">
										<p>
										<p>Remote device management allows our technicians to
											monitor your devices &quot;from afar&quot;. This efficient
											means of support enables us to perform firmware updates and
											software upgrades, document high-risk issues, uncover
											potential problems before they arise, and &quot;control&quot;
											a device, if necessary, in order to resolve any issues that
											your workers may be experiencing.</p>
										</p>

									</div>
								</li>
								<li>
									<h5 class="toggle-title">
										WWAN Activations <span class="toggle-title-detail"></span>
									</h5>
									<div class="toggle">
										<p>
										<p>Barcoding can also manage the activations of your
											deployed devices by serving as an intermediary between your
											organization and your cellular providers, to include
											AT&T/Cingular, Sprint/Nextel, Verizon, and T-Mobile. This
											complete service consists of activating, deactivating, and
											managing these plans as part of your roll-out.</p>
										</p>

									</div>
								</li>
								<li>
									<h5 class="toggle-title">
										RMA Issue &amp; Tracking <span class="toggle-title-detail"></span>
									</h5>
									<div class="toggle">
										<p>
										<p>Barcoding provides you with the ability to open cases,
											generate RMA's, and track their progress as they move through
											our system. This option is typically used after the normal
											troubleshooting process has been exhausted and it is
											determined to be a hardware failure.</p>
										</p>

									</div>
								</li>
								<li>
									<h5 class="toggle-title">
										Spare Pool Management (Hot Swap) <span
											class="toggle-title-detail"></span>
									</h5>
									<div class="toggle">
										<p>
										<p>Barcoding houses a spare pool inventory to accurately
											and quickly respond to replacement as well as additional user
											requests.</p>
										<p>Having a pool of spare devices at your fingertips gives
											you payment flexibility for lengthy repairs while still
											having the convenience of next-day replacement service. When
											an RMA is issued to either replace or fix a defective device,
											a &quot;Hot Swap&quot; spare will be shipped overnight to
											your facility to minimize downtime. This device is not only
											preloaded with your software applications, but it is also
											configured to your network, making it &quot;ready to go&quot;
											upon delivery.</p>
										</p>

									</div>
								</li>
								<li>
									<h5 class="toggle-title">
										Provisioning <span class="toggle-title-detail"></span>
									</h5>
									<div class="toggle">
										<p>
										<p>An image of your device that contains the loaded
											software applications and user-configured settings will be
											kept on file at Barcoding to expedite repairs and equipment
											returns to your location.</p>
										</p>

									</div>
								</li>
							</ul>
						</article>

					</article>

					<article id="tab3" class="tab_content" >
						<h4><b class="solutions">E-Warehouse's Software Services</b></h4>

						<p>With more than 10 years of experience, it is a
							proven software services leader. Our in-house software engineers
							are experts in integrating applications designed to complement
							your business environment &ndash; from basic to full-scale,
							enterprise rollouts. We work closely with industry-leading ISV's
							to ensure our solutions are delivered on time and to your
							specifications.</p>

						<p>Our software solutions include, but are not limited to:</p>
						<ul>
							<li>Fully-customizable mobile applications</li>
							<li>Web-based applications</li>
							<li>GPS-enabled tracking software applications</li>
						</ul>
						<p>While our services consist of:</p>
						<ul>
							<li>GUI design and implementation</li>
							<li>Integration with existing software</li>
							<li>Push-to-Talk technology</li>
							<li>And more!</li>
						</ul>
					</article>
				</div>
		</div>
		</article>

	</div>
	<!-- 100%articles-->

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
