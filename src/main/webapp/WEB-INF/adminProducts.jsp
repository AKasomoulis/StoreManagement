<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page
	import="gr.uoa.di.storemanagement.datalayer.entities.product.Product"%>
<%@page
	import="gr.uoa.di.storemanagement.datalayer.entities.product.ProductPK"%>
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

<meta name="description"
	content="Designa Studio, a HTML5 / CSS3 template.">
<meta name="author"
	content="Sylvain Lafitte, Web Designer, sylvainlafitte.com">

<title>PRODUCTS // e-Warehouse</title>

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
					<%
						out.print(firstName + " " + lastName);
					%>
					<small>
						<%
							out.print(roleName);
						%>
					</small>
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


		<script>
			function getMyID(idname, idserial) {
				var ID = idname;
				var ID1 = idserial;
				document.getElementById("hidden").value = ID;
				document.getElementById("hidden1").value = ID1;
				document.getElementById("hiddenform").submit();
			}
		</script>


		<div class="works-page main grid-wrap">

			<header class="grid col-full">
				<hr>
				<p class="fleft">Warehouses</p>
			</header>


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
						<a href="userGeneral.jsp">General</a><br>
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
						<a href="<%=request.getContextPath()%>/AllRoles">Roles</a><br>
						<%
							}
						%>
					</ul>
				</menu>

				<hr />


				<br>
				<menu>
					<a id="work_all" class="arrow buttonactive">All</a>
					<br>
					<a id="work_1" class="arrow">Furnitures</a>
					<br>
					<a id="work_2" class="arrow">Cars</a>
					<br>
					<a id="work_3" class="arrow">Clothes</a>
				</menu>
				</br>

				<hr />
				<br>


				<p>
					<%
						if (Rights.getInstance().canWriteProduct(user.getRole().getRights())) {
					%>
					<a href="<%=request.getContextPath()%>/AddProductA" id = "koumpi" >Add Product</a><br>
					<!-- 					<a href="addProduct.jsp" class="button">Add Product</a> -->
					<%
						}
					%>
					
					<%
					double fee, otherFee, discount;
					
					fee = (Double) request.getAttribute("fee");
					discount = (Double) request.getAttribute("discount");
					otherFee = (Double) request.getAttribute("otherFee");
					
					%>
					<br></br>
					
					<p><label>For new Prices click above!</label>
					<label><input type="checkbox" name="a" id="a" value="1" onclick="showBox(this, 'priceFee')"/>
					
					<ul class="halfmbottom" id="priceFee" style="display:none">
					
					<table border="1" cellpadding="35" cellspacing="0" style="width: 320px; border: solid 3px; margin-left: 0px; text-align: center; vertical-align: middle; background: #F3F0F0 ; color: black;">
	        								
	        			<td  width="320" colspan="2" style="text-align: right;">
					<form action="NewPrices" method="post" id="priceFree">
					<label>Fee: <input type="text" name="fee" id="fee" value="<%out.print(fee);%>"></label>				
					<label>Discount: <input type="text" name="discount" id="discount" value="<%out.print(discount);%>"></label>					
					<label>Other fees: <input type="text" name="otherFee" id="otherFee" value="<%out.print(otherFee);%>"></label>					
					<hr></hr>
					<div id="radioFee">
								<label for="searchSite" id="siteNameLabel" style="position:absolute;">apply changes: </label>
								<br></br>
								<input type="radio" name="from" value="fromNowOn" id="f" checked /> 
								<label for="searchSite" id="siteNameLabel">from now on.</label>

								<input type="radio" name="from" value="forEveryProduct" id="h" />
								<label for="searchSite">for every product</label> 
							</div>
							<br></br>
					
					<button type="submit" id="koumpi" >Apply new prices!</button>
					</form>
					</td>
					</table>
					</ul>
					</p>
												
						
						


					
				</p>

				<form action="ProductInfo" method="post" id="hiddenform">
					<input type="hidden" name="hidden" id="hidden" value=""> <input
						type="hidden" name="hidden1" id="hidden1" value="">
				</form>

		
						<script type="text/javascript"> 
						function showBox(elem, id){
						// document.getElementById("fb").style.display=elem.checked?"block":"none";
						document.getElementById(id).style.display=elem.checked?"block":"none";
						}
						</script>
						

			</aside>

			<section class="grid col-three-quarters mq2-col-full">

				<div id="page">

					<form action="AllProducts" id="searchForm" method="post">
						<fieldset>

							<input id="searchText" name="searchText" value="" type="text" /> 

							<input type="submit" value="Submit" id="submitButton" />

							<div id="searchInContainer">
								<label for="searchSite" id="siteNameLabel">Search by </label>

								<input type="radio" name="search" value="searchByName" id="searchByName" checked /> 
								<label for="searchSite" id="siteNameLabel">name</label>

								<input type="radio" name="search" value="searchByDescription" id="searchByDescription" />
								<label for="searchSite">description</label> 
								
								<input type="radio"	name="search" value="searchBySerialNumber" id="searchBySerialNumber" /> 								
								<label	for="searchSite">serial number</label> 
								
								<input type="radio"	name="search" value="searchBySupplier" id="searchBySupplier" /> 
								<label	for="searchSite">supplier</label>
							</div>

						</fieldset>
					</form>

				</div>

				<div class="grid-wrap works">


					<form action="AllProducts" method="post">
						<%
							List<Object[]> products = null;
											int i = 0;
						%>

						<%
							products = (List<Object[]>) request.getAttribute("products");
						%>

						<%
							if (products != null)
												for (Object[] resultElement : products) {
													out.print("<figure class='grid col-one-third mq1-col-one-half mq2-col-one-third mq3-col-full city_all'>");
													out.print("<a href='work1.html'> <img src='img/img.jpg' alt=''>");
													out.print("<span class='zoom'></span></a>");
													out.print("<figcaption>");
						%>

						<a href='#' id='<%out.print((String)resultElement[0]);%>'
							name='<%out.print((String)resultElement[1]);%>'
							onclick='getMyID(this.id,this.name);'>
							<%
								out.print((String)resultElement[0]);
							%>
						</a> <br>
						<%
							out.print("<p>");
													out.print((String) resultElement[1]);
													out.print("</p>");
													out.print("<p>");
													out.print("</figcaption>");
													out.print("</figure>");
												}
						%>
						</br> </br> </br>
					</form>



				</div>


			</section>



		</div>
		<!--main-->
		
		
		<p style="float: right;" > <img src="img/fork2.png"></p>

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