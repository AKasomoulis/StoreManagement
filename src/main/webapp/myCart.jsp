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

	function keepi(i) {
		document.getElementById("hiddeni").value = i;
		document.getElementById("red").submit();
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
					<a href="<%=request.getContextPath()%>/AddProductA" class="button" id="koumpi">Add Product</a><br>
<!-- 					<a href="addProduct.jsp" class="button">Add Product</a> -->
				<% } %>
				</p>
				
				<form action="ProductInfo" method="post" id="hiddenform">
					<input type="hidden" name="hidden" id="hidden" value="">
					<input type="hidden" name="hidden1" id="hidden1" value="">
				</form>
				
				<form action="DeleteFromCart" method="post" id="red">
					<input type="hidden" name="hiddeni" id="hiddeni" value="">
				</form>
			
		</aside>
		
		
		<section class="grid col-three-quarters mq2-col-full">
	
<!-- 				<div class="grid-wrap works"> -->
		
			<%
				ArrayList<Object[]> cartList = null;
				cartList = (ArrayList<Object[]>)session.getAttribute("cartList");
				Product product = null;
				String name = null;
				String serial = null;
				String description = null;
				String ammount = null;
				String quantity = null;
				double price = 0;
			%>
			
			<% if (cartList == null)  {
					out.print("<h2>My Cart</h2><br><br><br>");
					out.print("<h6>Empty</h6>");
					out.print("</div>");
			} else {
				if (!cartList.isEmpty() && cartList.get(cartList.size()-1)[1] == null && cartList.get(cartList.size()-1)[2] == null)
					cartList.remove(cartList.size()-1);
				
				if (cartList.isEmpty()) {
					out.print("<h2>My Cart</h2><br><br><br>");
					out.print("<h6>Empty</h6>");
					out.print("</div>");					
				}
				else {%>
			    	<form action="MyCart" method="post">
					<p><h4> <img src="img/64_64_full-cart-dark.png">My Cart</h4></p>
					<br><br>	
					<table border="1" cellpadding="5" cellspacing="0" style="width: 810px; border: solid 2px; margin-left: 0px; text-align: center; vertical-align: middle; color: black; ">
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
	            	<td width="115" style="vertical-align: middle;">
	                	<span class="headerBasketSystem"><h6>AMOUNT</h6></span>
	            	</td>
	           		<td width="115" style="vertical-align: middle;">
	                	<span class="headerBasketSystem"><h6>DELETE</h6></span>
	           		</td>
				</tr>
				
					<% 
					int i = 0;
					double intammount = 0;
					double total = 0;
					for (i = 0 ; i != cartList.size() ; i++) {
						product = (Product)cartList.get(i)[0];
						name = product.getName();
						serial = product.getSerialNumber();
						description = product.getDescription();
						quantity = (String) cartList.get(i)[2];
						ammount = (String) cartList.get(i)[1];
						if (ammount != null && quantity != null)
							price = Double.parseDouble(ammount)/Integer.parseInt(quantity);
					%>
					
						<tr style="background: url(../Images/0/basketHeader.png)">
			            <td height="100px" width="300" colspan="2" style="text-align: left; vertical-align: middle;">
			            		 <span class="productSku"><%out.print(serial); %></span> <span class="basketProductDescription"><br>
			                	<a id="productName" href="javascript:history.back()"><h6><%out.print(name); %></h6></a></span> <span class="productTimiTemaxiou">
			            </td>
			            <td width="125" style="vertical-align: middle;">
			                <span class="headerBasketSystem">
			                    X  <span class="productSku"><%out.print(quantity); %></span>
			                </span>
			            </td>
			            <td width="110" style="vertical-align: middle;">
			                <span class="headerBasketSystem"><% out.print(description); %></span>
			            </td>
			            <td width="115" style="vertical-align: middle;">
			                <span class="headerBasketSystem"><%out.print(price+"€"); %></span>
			            </td>
			            <td width="115" style="vertical-align: middle;">
			                <span class="headerBasketSystem"><%out.print(ammount+"€"); %></span>
			            </td>
			            <td width="115" style="vertical-align: middle;">
	<%-- 		                 < id=<%out.print(i);%> type="button" onclick='keepi(this.id);'>Remove</button> --%>
			                 <a id=<%out.print(i);%>  onclick='keepi(this.id);'><img src="img/64_64_remove-from-cart-dark.png"></a>
			            </td>
						</tr>
						
						<% 
						if (ammount != null) {
							intammount = Double.parseDouble(ammount);
							total += intammount; 
						}
					}	
					%>
					</table>
					<table style="width: 810px; margin-left: 0px; border: 1px solid black; border-top: none">
		       			<tr style="border-bottom: 1px solid black;">
		            	<td height="40" class="Basketdetail" colspan="2" rowspan="3" align="left" style="background: none repeat scroll 0 0 white ;
		                	display: block; height: 50px; padding: 13px; vertical-align: middle;">&nbsp;
		                
		            	</td>
		         	   	<td width="245" class="Basketdetail2" colspan="1" valign="middle" style="text-align: right;">
		            	    <span class="basketSumDetails">
		                	    <br />
		                	    <% if (total != 0) %>
		                  			<h6> Total Amount: 	<span class="headerBasketSystem"><%out.print(total+"€"); %></span></h6>
		                  	</span>
		            	</td>
		       			</tr>
		    		</table>
			</form>
			<form action="CartCheckout" method="post" id="CartCheckout">
<!-- 			<button id="checkout" type="submit" style="float: right;">Checkout</button> -->
		 		<a id="checkout" style="float: right;" onclick="$(this).closest('form').submit()">Checkout<img src="img/64_64_checkout-dark.png"></a>
		 	</form>
		</section>
		</div>
				<br></br>
		 <p style="float: right;" > <img src="img/free-delivery.png"></p>
				
				
					
	<%	}
	}
	%>
	
	

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