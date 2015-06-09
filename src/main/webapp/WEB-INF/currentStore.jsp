<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.lang.String"%>
<%@page import="gr.uoa.di.storemanagement.datalayer.entities.store.Store"%>
<%@page import="gr.uoa.di.storemanagement.datalayer.entities.user.User"%>
<%@page import="gr.uoa.di.storemanagement.datalayer.entities.role.Role"%>
<%@page import="gr.uoa.di.storemanagement.datalayer.entities.product.LastMovements"%>
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

<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/style.css">

<!--[if lt IE 9]>
	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
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
					<li><a href="contact.jsp">contact</a></li>
				</ul>
				<ul>
					<li><a> .</a></li>
					<li><a> .</a></li>
				</ul>
				<ul></ul>

			</nav>
		</header>
		
		
	<script>
	function getMyID(idname,idserial){
		var ID = idname;
		var ID1 = idserial;
		document.getElementById("hidden").value = ID;
		document.getElementById("hidden1").value = ID1;
		document.getElementById("hiddenform").submit();
	}
	</script>


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
				<br>
				<hr />
				
				<p>
						<br>
						
						<%
							Store storeInfo = null;
							String name = null;
							String location = null;
							String status = null;
							int isOpen = -1;
							String description = null;
						%>

						<%
							storeInfo = (Store) request.getAttribute("storeinfo");
							name = storeInfo.getName();
							location = storeInfo.getLocation();
							isOpen = storeInfo.getIsOpen();
							if (isOpen == 1)
								status = "isOpen";
							else if (isOpen == 0)
								status = "isNotOpen";
							description = storeInfo.getDescription();
						%>
						
						
					<% if (Rights.getInstance().canWriteStore(user.getRole().getRights())) { %>	
<%-- 					<a href="<%=request.getContextPath()%>/AddProductB?storename=<%out.print(name);%>" id = "koumpi" ><img src="img/add-product.png">Add Product</a><br> --%>
					<a class="button" href="<%=request.getContextPath()%>/AddProductB?storename=<%out.print(name);%>" id = "koumpi" >Add Product</a><br>
					<br>
					<hr />
<!-- 					<button type="button" onclick="setRights()">Edit Fields</button> <br><br> -->
					<a class="button" type="button" id="apply3" type="submit" onclick="submitUpdate()">Update Warehouse</a>
					<br>
					<hr />
<!-- 					<a id="delete" type="submit" onclick="submitDelete()"><img src="img/a8.png">Delete Warehouse</a> -->
						<a class="button" id="delete2" type="button" onclick="submitDelete()">Delete Warehouse</a>
					<br>
					<hr />
					
					<% } %>
					
				<form action="ProductInfo" method="post" id="hiddenform">
					<input type="hidden" name="hidden" id="hidden" value="">
					<input type="hidden" name="hidden1" id="hidden1" value="">
				</form>
				
				</p>
				
			</aside>
			


			<section class="grid col-three-quarters mq2-col-full">
				<div class="work-page main grid-wrap">

<!-- 					<header class="grid col-full"> -->
<!-- 						<hr> -->
<!-- 						<p class="fleft">Project</p> -->
<!-- 					</header> -->


					<aside class="grid col-one-quarter mq2-col-one-third mq3-col-full">

						<!--  			<form action="StoreInfo" method="post">-->
					
						<script>
							function setRights() {
								if (document.getElementById("stlocation").readOnly == true)
									document.getElementById("stlocation").readOnly = false;
								//	document.getElementById("locationbutton").value = "Done";
								else
									document.getElementById("stlocation").readOnly = true;
								//	document.getElementById("locationbutton").value = "Edit";	

								if (document.getElementById("ststatus").disabled == true)
									document.getElementById("ststatus").disabled = false;
								else
									document.getElementById("ststatus").disabled = true;

								if (document.getElementById("stdescription").readOnly == true)
									document.getElementById("stdescription").readOnly = false;
								else
									document.getElementById("stdescription").readOnly = true;
							}

							function submitDelete() {
								  var x = confirm("Are you sure you want to delete this store?");
								  if (x) {
									  document.getElementById("DeleteStore").submit();
								      return true;
								  }
								  else
								    return false;
							}

							function submitUpdate() {
								document.getElementById("UpdateStore").submit();
							}
						</script>

						<form action="UpdateStore" method="post" id="UpdateStore">
						<table border="1" cellpadding="35" cellspacing="0" style="width: 750px; border: solid 3px; margin-left: 0px; text-align: center; vertical-align: middle; background: #F3F0F0 ; color: black;">

						<td height="500px" width="270" colspan="2" style="text-align: left;">
							<p class="mbottom">
							<h4><b>WareHouse Info</b></h4>
							</p>
							<p><b><font  size="2" color="black">Name: </font></b>
<!-- 							<ul class="halfmbottom"> -->
								
									<%
										out.print(name);
									%></p>
									
								
<!-- 							</ul> -->
						
							
							<h6><b>Location</b></h6>
<!-- 							<ul class="halfmbottom"> -->
<%-- 							<% if (Rights.getInstance().canWriteStore(user.getRole().getRights()) || user.getUsername().equals("admin")) { %> --%>
<!-- 									<input type="text" id="stlocation" -->
<%-- 									value='<%out.print(location);%>' name="stlocation" --%>
<!-- 									readonly="readonly" class="field left" style="color: black; background: white;"> -->
<%-- 							<% } else {%> --%>
<%-- 									<h6><%out.print(location);%></h6> --%>
<%-- 							<% } %> --%>
<!-- 							</ul> -->
							<ul class="halfmbottom">
							<% if (Rights.getInstance().canWriteStore(user.getRole().getRights()) || user.getUsername().equals("admin")) { %>
									<input type="text" id="stlocation" maxlength='45'
									value='<%out.print(location);%>' name="stlocation"
									class="field left" style="color: black; background: white;">
							<% } else {%>
									<h6><%out.print(location);%></h6>
							<% } %>
							</ul>

							
							<h6><b>Status</b></h6>
							<ul class="halfmbottom">
							<% if (Rights.getInstance().canWriteStore(user.getRole().getRights()) || user.getUsername().equals("admin")){%>
								<select name="ststatus" id="ststatus" style="color: black; background: white;">
									<%
										if (isOpen == 1) {
											out.print("<option value='isOpen' selected>Opened</option>");
											out.print("<option value='isNotOpen'>Closed</option>");
										} else if (isOpen == 0) {
											out.print("<option value='isNotOpen' selected>Closed</option>");
											out.print("<option value='isOpen'>Opened</option>");
										}
									%>
								</select>
							<% } 
							else {
								if (isOpen == 1) {
									out.print("<h6>Opened</h6>");	
								}
								else {
									out.print("<h6>Closed</h6>");
								}
							}%>
							</ul>
		



						
						 	<h6><b>Description</b></h6>
<!-- 							<ul class="halfmbottom"> -->
<%-- 							<% if (Rights.getInstance().canWriteStore(user.getRole().getRights()) || user.getUsername().equals("admin")) { %> --%>
<!-- 									<input type="text" id="stdescription" -->
<%-- 									value='<%out.print(description);%>' name="stdescription" --%>
<!-- 									readonly="readonly" class="field left" style="color: black; background: white;"> -->
<%-- 							<% } else {%> --%>
<%-- 									<h6><%out.print(description);%></h6> --%>
<%-- 							<% } %> --%>
<!-- 							</ul> -->

							<ul class="halfmbottom">
							<% if (Rights.getInstance().canWriteStore(user.getRole().getRights()) || user.getUsername().equals("admin")) { %>
<!-- 									<input type="text" id="stdescription" -->
<%-- 									value='<%out.print(description);%>' name="stdescription" --%>
<!-- 									class="field left" style="color: black; background: white;"> -->
							<%
								out.print("<textarea id='stdescription' maxlength='255' name='stdescription' style='width: 130px;'>"
										+ description + "</textarea>");	
						%>
							<% } else {%>
									<h6><%out.print(description);%></h6>
							<% } %>
							</ul>
							
							<input type="hidden" name="hidden3" id="hidden3" value='<%out.print(name);%>'>	
						</td>
						</form>

						<form action="DeleteStore" method="post" id="DeleteStore">
							<p>
							<input type="text" id="stname" value='<%out.print(name);%>' name="stname"
									readonly="readonly" style="display:none">
<!-- 								<button id="delete" type="submit">Delete</button> -->
							</p>

						</form>

						
					</aside>
					
					
					<% if ((Rights.getInstance().canWriteProduct(user.getRole().getRights())) || (Rights.getInstance().canReadProduct(user.getRole().getRights()))) { %>

						<%
							List<Object[]> products = null;
							List<LastMovements> lastMovements;
						%>

						<%
							products = (List<Object[]>) request.getAttribute("storeproducts");
							lastMovements = (List<LastMovements>) request.getAttribute("lastmovements");
						%>

						
						<section
							class="grid col-three-quarters mq2-col-two-thirds mq3-col-full">

						<td height="500px" width="800" colspan="2" style="text-align: center; ">

							<p class="mbottom">
							<b><h4>WareHouse Products</h4></b>

						</section>

						<%
							if (products != null)
								for (Object[] resultElement : products) {
									out.print("<figure class='grid col-one-third mq1-col-one-half mq2-col-one-third mq3-col-full work_1'>");
									out.print("<a href='work1.html'> <img src='img/img.jpg' alt=''>");
									out.print("<span class='zoom'></span></a>");
									out.print("<figcaption>");
						%>
							 <a style="color:  	#FF3333;" href='#' id='<%out.print((String)resultElement[0]);%>' name='<%out.print((String)resultElement[1]);%>' onclick='getMyID(this.id,this.name);'><%out.print((String)resultElement[0]);%></a>
							 <br> 
						<%
							out.print((String) resultElement[1]);
									out.print("</figcaption>");
									out.print("</figure>");
								}
						%>
	
<br></br><br></br>
						<hr>
						
						<h4><b>Last movements </b></h4>
							
						<%
						
						for (LastMovements lm : lastMovements) {
						
						%>
							
							<h6><%out.print("time: " + lm.getTime() + " - from store: " + lm.getFromStore() + " to store: " + lm.getToStore() +
								" quantity: " + lm.getQuantity() + " kind of movement: " + lm.getKindOfMovement() + 
								" productName: " + lm.getProductName() + " serialNumber: " + lm.getSerialNumber()); %></h6>
					
						<%
												
						} // for (LastMovements)
												
						%>
						
						</hr>
						
					<% } //  if ((Rights.getInstance() %> 


				</div>
			</td>
			</section>
		
			</table>


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