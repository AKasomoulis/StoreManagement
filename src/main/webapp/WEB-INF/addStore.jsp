<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="gr.uoa.di.storemanagement.datalayer.entities.store.Store"%>
<%@page import="java.lang.String"%>
<%@page import="gr.uoa.di.storemanagement.datalayer.entities.user.User"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width">
<meta name="description" content="Designa Studio, a HTML5 / CSS3 template.">
<meta name="author" content="Sylvain Lafitte, Web Designer, sylvainlafitte.com">
<title>Registration // e-Warehouse</title>
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

		<div id="signup-form">

			<div id="signup-inner">

				<div class="clearfix" id="header">

					<img id="signup-icon" src="./images/signup.png" alt="" />

					<h1>Add New Store</h1>


				</div>
				<p>Please complete the fields below.</p>


				<div class="clear padding20"></div>
				<%
					String name, description, status, location, results;
					int isOpen;
				%>

				<%
					name = description = status = location = "";
					results = null;
					isOpen = -1;
				%>

				<%
					results = (String) request.getAttribute("error");
					if (results != null) {
						if (results.equals("null value"))
							out.print("<font color='red'><div class='error_box none' style='display: block;width:200px; '> There is/are empty field/fields </div></font>");

						name = (String) request.getAttribute("name");
						description = (String) request.getAttribute("description");
						status = (String) request.getAttribute("status");
						if (status != null) {
							if (status.equals("isOpen"))
								isOpen = 1;
							else if (status.equals("isNotOpen"))
								isOpen = 0;
						}
						location = (String) request.getAttribute("location");
					}
				%>

				<form action="AddStore" method="post">

					<p>
						<%
							out.print("<label for='name'>Name *</label> <input id='name'type='text' maxlength='45' name='name' value='"
									+ name + "' />");
						%>

					</p>

					<%
						if (results == "store exists") {
							out.print("<font color='red'><div class='error_box none' style='display: block;width:300px; '> This store already exists</div></font>");
						}
					%>


					<p>
						<%
							out.print("<label for='description'>Description *</label> <textarea id='description' maxlength='255' name='description' style='width: 300px;'>"
									+ description + "</textarea>");									
						%>
					</p>

					<p>
						<label for="status">Status *</label>

						<%
							if (status == null || status.equals("")) {
								out.print("<input type='radio' name='status' value='isOpen'>Opened<br> ");
								out.print("<input type='radio' name='status' value='isNotOpen'>Closed<br>");
							} else {
								if (isOpen==1) {
									out.print("<input type='radio' name='status' value='isOpen' checked>Opened<br> ");
									out.print("<input type='radio' name='status' value='isNotOpen'>Closed<br>");
								} else {
									out.print("<input type='radio' name='status' value='isOpen'>Opened<br> ");
									out.print("<input type='radio' name='status' value='isNotOpen' checked>Closed<br>");
								}
							}
						%>
					</p>

					<p>
						<%
							out.print("<label for='location'>Location *</label> <input id='location'type='text' maxlength='45' name='location' value='"
									+ location + "' />");
						%>
					</p>



					<p>
						<button id="submit" type="submit">Submit</button>
					</p>


				</form>


				<div id="required">
					<p>
						* Required Fields<br />
					</p>
				</div>


			</div>

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
			<li><a href="about.jsp">Our Company</a></li>
			<li><a href="services.html">Services</a></li>
			<li><a href="contact.jsp">Contact</a></li>

		</ul>
		</nav> </footer>
	</div>


</body>