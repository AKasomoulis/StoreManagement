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
<%@ page import="java.util.ArrayList" %>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<!DOCTYPE html>

<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->

<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->

<head>
	<meta charset="UTF-8">
	
	<!-- Remove this line if you use the .htaccess -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<meta name="viewport" content="width=device-width">
	
	<meta name="description" content="Designa Studio, a HTML5 / CSS3 template.">
	<meta name="author" content="Sylvain Lafitte, Web Designer, sylvainlafitte.com">
	
	<title>PRODUCTS // e-Warehouse</title>
	
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
					<li><a href="services.html">Services</a></li>
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
	function computeAmmount() {
		var price = document.getElementById("hiddenPrice").value;
		var quantity = document.getElementById("q").value;
		var ammount = price*quantity;
		document.getElementById("ammount").value = ammount;
	}


	function checkIt(evt) {
	    evt = (evt) ? evt : window.event;
	    var charCode = (evt.which) ? evt.which : evt.keyCode;
	    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
		        status = "This field accepts numbers only.";
				alert(status);
		        return false;
	    }
	    status = "";
	    return true;
}
	</script>


	<div class="works-page main grid-wrap">

		<header class="grid col-full">
			<hr>
			<p class="fleft">Warehouses</p>
		</header>


		<aside class="grid col-one-quarter mq2-col-full">
			<p class="mbottom">Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi commodo, ipsum sed pharetra gravida, orci magna rhoncus neque, id pulvinar odio lorem non turpis.

			</p>

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

			<hr />


			<br><menu>
				<a  id="work_all" class="arrow buttonactive">All</a><br>
				<a  id="work_1" class="arrow">Furnitures</a><br>
				<a  id="work_2" class="arrow">Cars</a><br>
				<a  id="work_3" class="arrow">Clothes</a>
			</menu></br>
			
			<hr /><br>
			
			
				<p>
				<% if (Rights.getInstance().canWriteProduct(user.getRole().getRights())) { %>	
				<a href="<%=request.getContextPath()%>/AddProductA" id = "koumpi" >Add Product</a><br>
<%-- 					<a href="<%=request.getContextPath()%>/AddProductA" class="button">Add Product</a><br> --%>
<!-- 					<a href="addProduct.jsp" class="button">Add Product</a> -->
				<% } %>
				</p>
				
				<form action="ProductInfo" method="post" id="hiddenform">
					<input type="hidden" name="hidden" id="hidden" value="">
					<input type="hidden" name="hidden1" id="hidden1" value="">
				</form>
				
			
		</aside>
		
		
		<section class="grid col-three-quarters mq2-col-full">
	
<!-- 				<div class="grid-wrap works"> -->
		
			<%
				Product product = null;
				product = (Product) request.getAttribute("product");
				
				String name = product.getName();
				String serial = product.getSerialNumber();
				String description = product.getDescription();
				ArrayList<Object[]> cartList = null;
				double price = product.getPrice();
				double ammount = price;
				
				cartList = (ArrayList<Object[]>)session.getAttribute("cartList");
				if (cartList == null)
					cartList = new ArrayList<Object[]>();
			%>
			
			
			<form action="ProductInCart" method="post" id="ProductInCart">
				<p><h4> <img src="img/64_64_full-cart-dark.png">Add to my Cart</h4></p>
			<br><br>	
			<table border="1" cellpadding="5" cellspacing="0" style="width: 810px; border: solid 2px; margin-left: 0px; text-align: center; vertical-align: middle; color: black;">
	        <tr style="background: url(../Images/0/basketHeader.png)">
	            <td height="30px" width="300" colspan="2" style="text-align: left; vertical-align: middle;">
	                <span class="headerBasketSystem"><h6>PRODUCT</h6></span>
	            </td>
	            <td width="125" style="vertical-align: middle;">
	                <span class="headerBasketSystem"><h6>QUANTITY</h6></span>
	            </td>
	            <td width="110" style="vertical-align: middle;">
	                <span class="headerBasketSystem"><h6>DESCRIPTION</h6></span>
	            </td>
	            <td width="115" style="vertical-align: middle;">
	                <span class="headerBasketSystem"><h6>PRICE</h6></span>
	            </td>
			</tr>
			
	        <tr style="background: url(../Images/0/basketHeader.png)">
	            <td height="100px" width="300" colspan="2" style="text-align: left; vertical-align: middle;">
	            		 <span class="productSku"><%out.print(serial); %></span> <span class="basketProductDescription"><br>
	                	<a id="productName" href="javascript:history.back()"><h6><%out.print(name); %></h6></a></span> <span class="productTimiTemaxiou">
	            </td>
	            <td width="125" style="vertical-align: middle;">
	                <span class="headerBasketSystem">
	                  <h6>  X .<input name="q" type="text" value="1" maxlength="3" id="q" style="width: 60px; border: 2px solid #780000;"  onkeyup="computeAmmount();" onkeypress='return checkIt(event)'/></h6>
	                </span>
	            </td>
	            <td width="110" style="vertical-align: middle;">
	                <span class="headerBasketSystem"><% out.print(description); %></span>
	            </td>
	            <td width="115" style="vertical-align: middle;">
	                <span class="headerBasketSystem"><%out.print(price+"€"); %></span>
	            </td>
			</tr>
			</table>
			
			
	    <table style="width: 810px; margin-left: 0px; border: 1px solid black; border-top: none">
	        <tr style="border-bottom: 1px solid black;">
	            <td height="40" class="Basketdetail" colspan="2" rowspan="3" align="left" style="background: none repeat scroll 0 0 white;
	                display: block; height: 50px; padding: 13px; vertical-align: middle;">&nbsp;
	                
	            </td>
	            <td width="245" class="Basketdetail2" colspan="1" valign="middle" style="text-align: right;">
	                <span class="basketSumDetails">
	                    <br />
	                    <h6> Amount.<input type="text"
										value='<%out.print(ammount);%>' name="ammount" id="ammount"
										readonly="readonly" style="width: 100px; border: 2px solid #780000 ;"> €</h6> 
	            </td>
	        </tr>
	        <tr>
	    </table>
	    <div style="position: relative; display: block; height: 35px;">
	    
	    <%
	    Object[] line = new Object[3];
	    line[0] = product;
	    line[1] = null;
	    line[2] = null;
	    cartList.add(line);
	    session.setAttribute("cartList", cartList);
	    %>
	    
	    
	    <br>
<!-- 	    <button id="continue" type="submit" style="float: right;">Continue shopping</button> -->
	    <a id="continue" onclick="$(this).closest('form').submit()"  style="float: right;"><img src="img/continue2.gif"></a>
	
	<!-- 				</div> -->
	
			</section>	
			<input type="hidden" name="hiddenPrice" id="hiddenPrice" value="<%out.print(price);%> ">
			
			
		</div> <!--main-->
		
	</form>
	
	<br></br>
	<p style="float: right;" > <img src="img/free-delivery.png"></p>

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
<script>window.jQuery || document.write('<script src="js/jquery-1.7.2.min.js"><\/script>')</script>

<!--[if (gte IE 6)&(lte IE 8)]>
<script src="js/selectivizr.js"></script>
<![endif]-->

<script src="js/scripts.js"></script>

<!-- Asynchronous Google Analytics snippet. Change UA-XXXXX-X to be your site's ID. -->
<script>
  var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
  (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
  g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
  s.parentNode.insertBefore(g,s)}(document,'script'));
</script>
</body>
</html>