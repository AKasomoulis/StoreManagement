<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="gr.uoa.di.storemanagement.datalayer.entities.user.User"%>
<%@page
	import="gr.uoa.di.storemanagement.datalayer.entities.user.dao.UserDaoImpl"%>
<%@page
	import="gr.uoa.di.storemanagement.datalayer.entities.user.UserForApproval"%>
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

<meta name="description"
	content="Designa Studio, a HTML5 / CSS3 template.">
<meta name="author"
	content="Sylvain Lafitte, Web Designer, sylvainlafitte.com">

<title>WAREHOUSES-users // e-Warehouse</title>

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


		<div class="services-page main grid-wrap">

			<header class="grid col-full">
				<hr>
				<p class="fleft">Users</p>
			</header>

			<script>
				function getUserForApprovalID(id) {
					var ID = id;
					document.getElementById("ufahidden").value = ID;
					document.getElementById("ufahiddenform").submit();
				}
			</script>

			<script>
				function getSupplierID(id) {
					var ID = id;
					document.getElementById("supphidden").value = ID;
					document.getElementById("supphiddenform").submit();
				}
			</script>

			<script>
				function getUserID(id) {
					var ID = id;
					document.getElementById("userhidden").value = ID;
					document.getElementById("userhiddenform").submit();
				}
			</script>


			<aside class="grid col-one-quarter mq2-col-full">
				<p class="mbottom">Welcome to Warehouse management system of e-Warehouse. Explore its capabilities and regularize your space. Easily, reliably and quickly! </p>
				<menu>
					<ul>

						<%
							if (user.getRole().getRoleName().equals("Admin")) {
						%>
						<a href="<%=request.getContextPath()%>/General">General</a>
						<br>
						<%
							} 
															else {
						%>
						<a href="userGeneral.jsp">General</a>
						<br>
						<%
							}
						%>
						<%
							if (Rights.getInstance().canReadStore(user.getRole().getRights()) || Rights.getInstance().canWriteStore(user.getRole().getRights())) {
						%>
						<a href="<%=request.getContextPath()%>/AllStores">Stores</a>
						<br>
						<%
							}
						%>

						<%
							if (Rights.getInstance().canReadUser(user.getRole().getRights()) || Rights.getInstance().canWriteUser(user.getRole().getRights())) {
						%>
						<a href="<%=request.getContextPath()%>/AllUsers">Users</a>
						<br>
						<%
							}
						%>

						<%
							if (Rights.getInstance().canReadProduct(user.getRole().getRights()) || Rights.getInstance().canWriteProduct(user.getRole().getRights())) {
						%>
						<a href="<%=request.getContextPath()%>/AllProducts">Products</a>
						<br>
						<%
							}
						%>

						<%
							if (user.getRole().getRoleName().equals("Admin")) {
						%>
						<a href="<%=request.getContextPath()%>/AllRoles">Roles</a>
						<br><br>
						<%
							}
						%>
					</ul>
				</menu>

				<hr />

				<%
					if (Rights.getInstance().canWriteUser(user.getRole().getRights())) {
				%>
<%-- 				<a href="<%=request.getContextPath()%>/AddSupplier" class="button">Add Supplier</a><br> <br> --%>
				<a id="koumpi5" href="<%=request.getContextPath()%>/AddSupplier" class="button">Add Supplier</a><br>
<!-- 				<br> <a href="signup.jsp" class="button">Add User</a> -->
				<hr />
				<a id="koumpi4" href="signup.jsp" class="button">Add User</a><br>
				<hr />
				<%
					}
				%>

				<form action="UserForApprovalInfo" method="post" id="ufahiddenform">
					<input type="hidden" name="ufahidden" id="ufahidden" value="">
				</form>

				<form action="SupplierInfo" method="post" id="supphiddenform">
					<input type="hidden" name="supphidden" id="supphidden" value="">
				</form>

				<form action="UserInfo" method="post" id="userhiddenform">
					<input type="hidden" name="userhidden" id="userhidden" value="">
				</form>

			</aside>


			<%
				if (user.getRole().getRoleName().equals("Admin")) {
			%>

			<section class="grid col-three-quarters mq2-col-full">

				<div class="grid-wrap">

					<article id="navtabs" class="grid col-full">
						<h2>User Categories</h2>
						<div class="">
							<ul class="tabs clearfix">
								<li><a href="#tab1">Not approved</a></li>
								<li><a href="#tab2">Supplier</a></li>
								<%
									List<String> roleNames = null;
																					roleNames = (List<String>)request.getAttribute("rolenames");
																					int i;
																					for (i = 0 ; i != roleNames.size() ; i++) {
																						out.print("<li><a href='#tab"+(i+3)+"'>"+roleNames.get(i)+"</a></li>");		
																					}
								%>
								<!-- 								<li><a href="#tab3">Storekeepers</a></li> -->
								<!-- 								<li><a href="#tab4">Customers</a></li> -->
							</ul>
							<div class="tab_container">

								<article id="tab1" class="tab_content">
									<section class="grid col-three-quarters mq2-col-full">
										<div class="grid-wrap works">
											<form action="AllUsers" method="post">
												<%
													List<Object[]> notApprovedUsers = null;
												%>

												<%
													notApprovedUsers = (List<Object[]>) request
																																			.getAttribute("notApprovedUsers");
												%>

												<%
													if (notApprovedUsers != null)
																																		for (Object[] resultElement : notApprovedUsers) {
																																			out.print("<figure class='grid col-one-third mq1-col-one-half mq2-col-one-third mq3-col-full work_1'>");
																																			out.print("<a href='#'> <img src='img/abc.png' alt=''>");
// 																																			out.print("<span class='zoom'></span></a>");
																																			out.print("<figcaption>");
												%>
												<a href='#' id='<%out.print((String)resultElement[0]);%>'
													onclick='getUserForApprovalID(this.id);'> <%
 	out.print((String) resultElement[1] + " "
  																+ (String) resultElement[2]);
 %>
												</a>
												<%
													out.print("</a>");
																																			out.print("</figcaption>");
																																			out.print("</figure>");
																																		}
												%>
												</br> </br> </br>
											</form>
										</div>
									</section>
								</article>


								<article id="tab2" class="tab_content">
									<section class="grid col-three-quarters mq2-col-full">
										<div class="grid-wrap works">
											<form action="AllUsers" method="post">
												<%
													List<Object[]> suppliers = null;
												%>

												<%
													suppliers = (List<Object[]>) request.getAttribute("suppliers");
												%>

												<%
													if (suppliers != null)
																																		for (Object[] resultElement : suppliers) {
																																			out.print("<figure class='grid col-one-third mq1-col-one-half mq2-col-one-third mq3-col-full work_1'>");
																																			out.print("<a href='#'> <img src='img/abcd.png' alt=''>");
// 																																			out.print("<span class='zoom'></span></a>");
																																			out.print("<figcaption>");
												%>
												<a href='#' id='<%out.print((String)resultElement[0]);%>'
													onclick='getSupplierID(this.id);'> <%
 	out.print((String) resultElement[0]);
 %>
												</a>
												<%
													out.print("</a>");
																																			out.print("</figcaption>");
																																			out.print("</figure>");
																																		}
												%>
												</br> </br> </br>
											</form>
										</div>
									</section>
								</article>


								<%
									List<Object[]> users = null;
																			UserDaoImpl userDao = new UserDaoImpl();
																			for (i = 0 ; i != roleNames.size() ; i++) {
																				out.print("<article id='tab"+(i+3)+"' class='tab_content'>");
								%>
								<section class="grid col-three-quarters mq2-col-full">
									<div class="grid-wrap works">
										<form action="AllUsers" method="post">

											<%
												users = userDao.getUserByRole(roleNames.get(i));
											%>

											<%
												if (users != null)
																																for (Object[] resultElement : users) {
																																	out.print("<figure class='grid col-one-third mq1-col-one-half mq2-col-one-third mq3-col-full work_1'>");
																																	out.print("<a href='#'> <img src='img/aa.png' alt=''>");
// 																																	out.print("<span class='zoom'></span></a>");
																																	out.print("<figcaption>");
											%>
											<a href='#' id='<%out.print((String)resultElement[0]);%>'
												onclick='getUserID(this.id);'> <%
 	out.print((String) resultElement[1] + " "
  																+ (String) resultElement[2]);
 %>
											</a>
											<%
												out.print("</a>");
																																	out.print("</a>");
																																	out.print("</figcaption>");
																																	out.print("</figure>");
																																}
											%>
											</br> </br> </br>
										</form>
									</div>
								</section>
					</article>
					<%
						}
					%>

				</div>

			</section>
			<%
				} 
					
						else {
			%>

			<section class="grid col-three-quarters mq2-col-full">

				<div class="grid-wrap">

					<article id="navtabs" class="grid col-full">
						<h2>User Categories</h2>
						<div class="">
							<ul class="tabs clearfix">
								<li><a href="#tab1">Suppliers</a></li>
								<li><a href="#tab2">Users</a></li>
							</ul>


							<article id="tab1" class="tab_content">
								<section class="grid col-three-quarters mq2-col-full">
									<div class="grid-wrap works">
										<form action="AllUsers" method="post">
											<%
												List<Object[]> suppliers = null;
											%>

											<%
												suppliers = (List<Object[]>) request.getAttribute("suppliers");
											%>

											<%
												if (suppliers != null)
																																for (Object[] resultElement : suppliers) {
																																	out.print("<figure class='grid col-one-third mq1-col-one-half mq2-col-one-third mq3-col-full work_1'>");
																																	out.print("<a href='#'> <img src='img/abcd.png' alt=''>");
// 																																	out.print("<span class='zoom'></span></a>");
																																	out.print("<figcaption>");
											%>
											<a href='#' id='<%out.print((String)resultElement[0]);%>'
												onclick='getSupplierID(this.id);'> <%
 	out.print((String) resultElement[0]);
 %>
											</a>
											<%
												out.print("</a>");
																																	out.print("</figcaption>");
																																	out.print("</figure>");
																																}
											%>
											</br> </br> </br>
										</form>
									</div>
								</section>
							</article>



							<%
								List<Object[]> users = null;
																	UserDaoImpl userDao = new UserDaoImpl();
							%>
							<article id="tab2" class="tab_content">
								<section class="grid col-three-quarters mq2-col-full">
									<div class="grid-wrap works">
										<form action="AllUsers" method="post">

											<%
												users = (List<Object[]>) request.getAttribute("approvedUsers");
											%>

											<%
												if (users != null)
																																for (Object[] resultElement : users) {
																																	if (!resultElement[0].equals("admin")) {
																																	out.print("<figure class='grid col-one-third mq1-col-one-half mq2-col-one-third mq3-col-full work_1'>");
																																	out.print("<a href='#'> <img src='img/abc.png' alt=''>");
// 																																	out.print("<span class='zoom'></span></a>");
																																	out.print("<figcaption>");
											%>
											<a href='#' id='<%out.print((String)resultElement[0]);%>'
												onclick='getUserID(this.id);'> <%
 	out.print((String) resultElement[1] + " "
  																+ (String) resultElement[2]);
 %>
											</a>
											<%
												out.print("</a>");
																																	out.print("</a>");
																																	out.print("</figcaption>");
																																	out.print("</figure>");
																																	}
																																}
											%>
											</br> </br> </br>
										</form>
									</div>
								</section>
							</article>



						</div>
					</article>
				</div>
			</section>

			<%
				}
			%>


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
</html>