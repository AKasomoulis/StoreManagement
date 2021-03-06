<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.lang.String"%>
<%@page import="gr.uoa.di.storemanagement.datalayer.entities.user.User"%>
<%@page import="gr.uoa.di.storemanagement.datalayer.entities.role.Role"%>
<%@page import="gr.uoa.di.storemanagement.rights.Rights"%>
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

<meta name="description" content="Designa Studio, a HTML5 / CSS3 template.">
<meta name="author" content="Sylvain Lafitte, Web Designer, sylvainlafitte.com">

<title>WAREHOUSES-general // e-Warehouse</title>

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
							user = (User) session.getAttribute("user");
							String userName = user.getUsername();
							String firstname = user.getFirstName();
							String lastname = user.getLastName();
							String rolename = user.getRole().getRoleName();
					%>

	<div class="container">
		<section class="container">
			<div class="user">
				<img src="img/avatar.png">
				<h5>
					<% out.print(firstname + " " + lastname); %> <small><% out.print(rolename); %></small>
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

		<div class="services-page main grid-wrap">

			<header class="grid col-full">
				<hr>
				<p class="fleft">
					<%
						out.print(session.getAttribute("username") + " home page");
					%>
				</p>
			</header>


			<aside class="grid col-one-quarter mq2-col-full">
				<p class="mbottom">Lorem ipsum dolor sit amet, consectetuer
					adipiscing elit. Morbi commodo, ipsum sed pharetra gravida, orci
					magna rhoncus neque, id pulvinar odio lorem non turpis.</p>
				<menu>
					<ul>
						
						<% if (user.getUsername().equals("admin")) { %>
							<a href="adminGeneral.jsp">General</a><br>
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
						
						<% if (user.getUsername().equals("admin")) { %>
							<a href="<%=request.getContextPath()%>/AllRoles">Roles</a><br>
						<% } %>
					</ul>
				</menu>
				
					<br>
					<hr />
					<% if (Rights.getInstance().canWriteUser(user.getRole().getRights())) { %>	
<!-- 						<button type="button" onclick="setRights()">Edit Fields</button> <br><br> -->
						<button type="button" id="apply2" type="submit" onclick="submitUpdate()">Update User</button>
						
						<hr />
						<button id="delete4" type="submit" onclick="submitDelete()">Delete User</button><hr />
					<% } %>
			</aside>

			<section class="grid col-three-quarters mq2-col-full">
				<div class="work-page main grid-wrap">

<!-- 					<header class="grid col-full"> -->
<!-- 						<hr> -->
<!-- 						<p class="fleft">Project</p> -->
<!-- 					</header> -->

					<%
						User user1 = null;
						String username = null;
						String password = null;
						String firstName = null;
						String lastName = null;
						String email = null;
						Role role = null;
						String roleName = null;
						List<String> roleNames = null;
					%>

					<%
						user1 = (User) request.getAttribute("user1");
						username = user1.getUsername();
						password = user1.getPassword();
						firstName = user1.getFirstName();
						lastName = user1.getLastName();
						email = user1.getEmail();
						role = user1.getRole();
						roleName = role.getRoleName();
						roleNames = (List<String>) request.getAttribute("rolenames");
					%>


					<script>
						function setRights() {
							if (document.getElementById("firstname").readOnly == true)
								document.getElementById("firstname").readOnly = false;
							else
								document.getElementById("firstname").readOnly = true;

							if (document.getElementById("lastname").readOnly == true)
								document.getElementById("lastname").readOnly = false;
							else
								document.getElementById("lastname").readOnly = true;

							if (document.getElementById("password").readOnly == true)
								document.getElementById("password").readOnly = false;
							else
								document.getElementById("password").readOnly = true;

							if (document.getElementById("email").readOnly == true)
								document.getElementById("email").readOnly = false;
							else
								document.getElementById("email").readOnly = true;

							if (document.getElementById("role").disabled == true)
								document.getElementById("role").disabled = false;
							else
								document.getElementById("role").disabled = true;
						}

						function submitDelete() {
							  var x = confirm("Are you sure you want to delete this user?");
							  if (x) {
								  document.getElementById("DeleteUser").submit();
							      return true;
							  }
							  else
							    return false;
						}

						function submitUpdate() {
							document.getElementById("UpdateUser").submit();
						}
					</script>


					<form action="UpdateUser" method="post" id="UpdateUser">
					<table border="1" cellpadding="35" cellspacing="0" style="width: 730px; border: solid 3px; margin-left: 30px; text-align: center; vertical-align: middle; background: #F3F0F0 ; color: black;">
						<td height="120px" width="730" colspan="2" style="text-align: center;">
						
						<p class="mbottom">
						<h4><b>User Information</b></h4>
						</p><br></br>
						
						<figure class="grid col-one-third mq1-col-one-half mq2-col-one-third mq3-col-full work_1">
						<b><font  size="2" color="black">Username</font></b><p>
							
								<%
									out.print(username);
								%>
							</p>
						</figure>

						<figure class="grid col-one-third mq1-col-one-half mq2-col-one-third mq3-col-full work_1">
						<b><font  size="2" color="black">First name</font></b><p>
						<% 
						if (roleName.equals("Admin") || Rights.getInstance().canReadUser(user.getRole().getRights()))
							out.print(firstName);
						else {
						%>
<%-- 								<input type="text" id="firstname" value='<%out.print(firstName);%>' --%>
<%-- 								value='<%out.print(firstName);%>' name="firstname" readonly="readonly" --%>
<!-- 								class="field left"> -->
								<input type="text" id="firstname" value='<%out.print(firstName);%>'
								value='<%out.print(firstName);%>' name="firstname" maxlength="45"
								class="field left">

						<%
						}
						%></p>
						</figure>

						<figure class="grid col-one-third mq1-col-one-half mq2-col-one-third mq3-col-full work_1">
						<b><font  size="2" color="black">Last name</font></b><p>
						<% 
						if (roleName.equals("Admin") || Rights.getInstance().canReadUser(user.getRole().getRights()))
							out.print(lastName);
						else {
						%>
<%-- 								<input type="text" id="lastname" value='<%out.print(lastName);%>' --%>
<%-- 								value='<%out.print(lastName);%>' name="lastname" readonly="readonly" --%>
<!-- 								class="field left"> -->
								<input type="text" id="lastname" value='<%out.print(lastName);%>'
								value='<%out.print(lastName);%>' name="lastname" maxlength="45"
								class="field left">

						<%
						}
						%></p>
						</figure>
						
						<figure class="grid col-one-third mq1-col-one-half mq2-col-one-third mq3-col-full work_1">
						<b><font  size="2" color="black">Password</font></b><p>
						<% 
						if (roleName.equals("Admin") || Rights.getInstance().canReadUser(user.getRole().getRights()))
							out.print(password);
						else {
						%>
<%-- 								<input type="text" id="password" value='<%out.print(password);%>' --%>
<%-- 								value='<%out.print(password);%>' name="password" readonly="readonly" --%>
<!-- 								class="field left"> -->
								<input type="text" id="password" value='<%out.print(password);%>'
								value='<%out.print(password);%>' name="password" maxlength="45"
								class="field left">

						<%
						}
						%></p>
						</figure>

						<figure class="grid col-one-third mq1-col-one-half mq2-col-one-third mq3-col-full work_1">
						<b><font  size="2" color="black">E-mail</font></b><p>
						<% 
						if (roleName.equals("Admin") || Rights.getInstance().canReadUser(user.getRole().getRights()))
							out.print(email);
						else {
						%>
<%-- 								<input type="text" id="email" value='<%out.print(email);%>' --%>
<%-- 								value='<%out.print(email);%>' name="email" readonly="readonly" --%>
<!-- 								class="field left"> -->
								<input type="text" id="email" value='<%out.print(email);%>'
								value='<%out.print(email);%>' name="email" maxlength="45"
								class="field left">

						<%
						}
						%></p>
						</figure>


						<p>
						<figure class="grid col-one-third mq1-col-one-half mq2-col-one-third mq3-col-full work_1">
						<b><font  size="2" color="black">Role</font></b><p>
					<%
					if (roleName.equals("Admin") || Rights.getInstance().canReadUser(user.getRole().getRights()))
						out.print(roleName);
					else {
						if (roleNames != null) {
							out.print("<select name='role' id='role' >");
							out.print("<option value='");
							out.print(roleName);
							out.print("'>");
							out.print(roleName);
							out.print("</option>");
							for (int i = 0; i != roleNames.size(); ++i) {
								if (!roleNames.get(i).equals(roleName)) {
									out.print("<option value='");
									out.print(roleNames.get(i));
									out.print("'>");
									out.print(roleNames.get(i));
									out.print("</option>");
								}
							}
							out.print("</select>");
						}
					}
						%></p>
						</select>
<!-- 						<button type="button" onclick="setRights()">Edit</button> -->
						</figure>
						</td>
						
						</p>
						<% 
							if (!roleName.equals("Admin")) {
						%>
<!--  						<button type="button" onclick="setRights()">Edit</button> -->
<!-- 						<button id="apply" type="submit">Apply</button> -->
						<%
							}						
						%>
						
						<input type="hidden" name="hidden1" id="hidden1" value='<%out.print(username);%>'>
						
						</table>
					</form>



					<%
							if (!roleName.equals("Admin")) {
					%>

					<form action="DeleteUser" method="post" id="DeleteUser">
						<input type="hidden" name="hidden" id="hidden" value='<%out.print(username);%>'>
						</p>

					</form>
					
					<%
							}
					%>


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
</html>