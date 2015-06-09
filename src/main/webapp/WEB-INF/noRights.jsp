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


<div class="container">



	<header id="navtop">

		
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
	

        <div id="signup-inner">
        
        	<div class="clearfix" id="header">
        	
        		<img id="signup-icon" src="./images/signup.png" alt="" />
        
                <h1>You can not view this page!</h1>
                <p><h3>You have no rights to view this page. 
                When you were going, we were coming...<h3></p>
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
