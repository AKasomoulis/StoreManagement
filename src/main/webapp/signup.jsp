<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="gr.uoa.di.storemanagement.datalayer.entities.user.User"%>
<%@page import="gr.uoa.di.storemanagement.datalayer.entities.role.dao.RoleDaoImpl"%>
<%@page import="java.lang.String"%>
<%@page import="java.util.List"%>

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
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/style.css">


</head>

<body>

	<div class="container">

		<header id="navtop"> <a href="<%=request.getContextPath()%>/Index" class="logo fleft">
			<img src="img/logo2.png" alt="Designa Studio">
		</a> <nav class="fright">
		<ul>
			<li><a href="<%=request.getContextPath()%>/Index" class="navactive">Home</a></li>
			<li><a href="about.jsp">Our Company</a></li>
		</ul>
		<ul>
			<li><a href="services.html">Services</a></li>
			<li><a href="contact.jsp">Contact</a></li>
		</ul>
		<ul>

			<li><a href="register.html">Register</a></li>
		</ul>
		</nav> </header>

		<div id="signup-form">

			<div id="signup-inner">

				<div class="clearfix" id="header">

					<img id="signup-icon" src="./images/signup.png" alt="" />

					<h1>Sign up free</h1>


				</div>
				<p>Please complete the fields below, ensuring you use a valid
					email address as you will be sent a validation code which you will
					need the first time you login to the site.</p>


				<div class="clear padding20"></div>
				<%
					String results, username, firstname, lastname, email, role;
					results = null;
					username = firstname = lastname = email = role = "";
				%>

				<%
					results = (String) request.getAttribute("error");
					if (results != null) {
						if (results.equals("null value"))
							out.print("<font color='red'><div class='error_box none' style='display: block;width:200px; '> There is/are empty field/fields </div></font>");

						username = (String) request.getAttribute("username");
						firstname = (String) request.getAttribute("firstname");
						lastname = (String) request.getAttribute("lastname");
						email = (String) request.getAttribute("email");
						role = (String) request.getAttribute("role");
					}
				%>
				
				<script>
				function checkPass()
				{
				    //Store the password field objects into variables ...
				    var pass1 = document.getElementById('password');
				    var pass2 = document.getElementById('rpassword');
				    //Store the Confimation Message Object ...
				    var message = document.getElementById('confirmMessage');
				    //Set the colors we will be using ...
				    var goodColor = "#66cc66";
				    var badColor = "#ff6666";
				    //Compare the values in the password field
				    //and the confirmation field
				    if(pass1.value == pass2.value){
				        //The passwords match.
				        //Set the color to the good color and inform
				        //the user that they have entered the correct password
				    //   pass2.style.backgroundColor = goodColor;
				        message.style.color = goodColor;
				        message.innerHTML = "Passwords Match!"
				    }else{
				        //The passwords do not match.
				        //Set the color to the bad color and
				        //notify the user.
				    //    pass2.style.backgroundColor = badColor;
				        message.style.color = badColor;
				        message.innerHTML = "Passwords Do Not Match!"
				    }
				}  



				
					function suppCode(selected) {
 						if (selected == "Supplier representative") {
 							if(document.getElementById("suppPass").getAttribute("type") == "hidden")
								document.getElementById("suppPass").setAttribute("type", "text");
 						}
							else
 								document.getElementById("suppPass").setAttribute("type", "hidden");
					}

					function clearText(field) {
						if (field.defaultValue == field.value)
							field.value = '';
						else if (field.value == '')
							field.value = field.defaultValue;
					}				
				</script>

				<form action="Signup" method="post">

					<p>
						<%
							out.print("<label for='username'>Username *</label> <input id='username'type='text' maxlength='45' name='username' value='"
									+ username + "' />");
						%>

					</p>

					<%
						if (results == "username exists") {
							out.print("<font color='red'><div class='error_box none' style='display: block;width:300px; '> This username already exists</div></font>");
						}
					%>

					<p>
						<label for="password">Password *</label> <input id="password"
							type="password" name="password" maxlength="45" id="password" value="" />
					</p>

					<%
						if (results == "trying to signup with different passwords") {
							out.print("<font color='red'><div class='error_box none' style='display: block;width:300px; '> These passwords don't match </div></font>");
						}
					%>

					<p>
						<label for="rpassword">Retype Password *</label> <input
							id="rpassword" type="password" name="rpassword" maxlength="45" id="rpassword" value="" onkeyup="checkPass(); return false;"/>
							<span id="confirmMessage" class="confirmMessage"></span>
					</p>

					<p>
						<%
							out.print("<label for='firstname'>First name *</label> <input id='firstname'type='text' maxlength='45' name='firstname' value='"
									+ firstname + "' />");
						%>
					</p>

					<p>
						<%
							out.print("<label for='lastname'>Last name *</label> <input id='lastname'type='text' maxlength='45' name='lastname' value='"
									+ lastname + "' />");
						%>
					</p>

					<p>
						<%
							out.print("<label for='email'>E-mail *</label> <input id='email'type='text' maxlength='45' name='email' value='"
									+ email + "' />");
						%>
					</p>

					<p>
						<%
							if (results == "invalid email address") {
								out.print("<font color='red'><div class='error_box none' style='display: block;width:300px; '> Invalid E-mail address</div></font>");
							}
						%>

					</p>

				<label for="role">Role *</label>

						<%
						
						List<String> roles = null;
						RoleDaoImpl roleDao = new RoleDaoImpl();

						roles = roleDao.getAllRoles();

						
						if (roles != null) {
							out.print("<select name='role' onchange='suppCode(this.value)'>");
							out.print("<option value='");
							out.print(role);
							out.print("'>");
							out.print(role);
							out.print("</option>");
							for (int i = 0; i != roles.size(); ++i) {
								if (!roles.get(i).equals(role)) {
									out.print("<option value='");
									out.print(roles.get(i));
									out.print("'>");
									out.print(roles.get(i));
									out.print("</option>");
								}
							}
							out.print("</select>");
						}
						%>
				
					
					
					<p>
						 <input type="hidden" id="suppPass" name="suppPass" value="Supplier's verification code" onfocus="clearText(this)" onblur="clearText(this)"> 
					</p>
					
					<p>
					
					<p>
						<button id="submit" type="submit">Submit</button>
					</p>


				</form>


				<div id="required">
					<p>
						* Required Fields<br /> NOTE: You must activate your account
						after sign up!
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
			<li><a href="about.html">Our Company</a></li>
			<li><a href="services.html">Services</a></li>
			<li><a href="contact.html">Contact</a></li>
			<li><a href="register.html">Register</a></li>

		</ul>
		</nav> </footer>
	</div>


</body>

</html>