<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.lang.String"%>
<%@page import="gr.uoa.di.storemanagement.datalayer.entities.store.Store"%>
<%@page import="gr.uoa.di.storemanagement.datalayer.entities.product.Product"%>
<%@page import="gr.uoa.di.storemanagement.datalayer.entities.product.LastMovements"%>
<%@page import="gr.uoa.di.storemanagement.datalayer.entities.productstore.ProductStore"%>
<%@page import="gr.uoa.di.storemanagement.datalayer.entities.productsupplier.ProductSupplier"%>

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
					<% if (Rights.getInstance().canWriteProduct(user.getRole().getRights())) { %>	
<!-- 					<button type="button" onclick="setRights()">Edit Fields</button> <br><br> -->
<!-- 					<a id="apply" type="submit" onclick="submitUpdate()"><img src="img/apply-product.png">Update Product</a> -->
<button id="apply2" type="submit" onclick="submitUpdate()">Update Product</button>

					<br>
					<hr />
<!-- 					<button id="delete" type="submit" onclick="submitDelete()">Delete Product</button> -->
<!-- 					<a id="delete" type="submit" onclick="submitDelete()"><img src="img/delete-product.png">Delete Product</a> -->
						<button id="delete2" type="submit" onclick="submitDelete()">Delete Product</button>
					<br>
					<hr />
<!-- 					<button id="addtocart" type="submit" onclick="submitAddToCart()">Add to cart</button> -->
						<a onclick="submitAddToCart()" id="addtocart"><img src="img/64_64_add-to-cart-dark.png">Add to Cart</a>					
					<br>
					<% } %>
			</aside>

			<section class="grid col-three-quarters mq2-col-full">
				<div class="work-page main grid-wrap">

<!-- 					<header class="grid col-full"> -->
<!-- 						<hr> -->
<!-- 						<p class="fleft">Project</p> -->
<!-- 					</header> -->


					<aside class="grid col-one-quarter mq2-col-one-third mq3-col-full">

						<%
							Product product = null;
							String name = null;
							String serialNumber = null;
							int dimensions;
							String description = null;
							int mass;
							String type = null;
							int weight;
						%>

						<%
							product = (Product) request.getAttribute("productinfo");
							name = product.getName();
							serialNumber = product.getSerialNumber();
							description = product.getDescription();
							dimensions = product.getDimensions();
							mass = product.getMass();
							type = product.getType();
							weight = product.getWeight();
						%>

						<script>
							function setRights() {

								var j = document.getElementById("hidden").value;
								var i = 0;
								for (i = 0 ; i < j ; i++) {
									if (document.getElementById("checkbox" + i) != null) {
										if (document.getElementById("checkbox" + i).disabled == true) 
											document.getElementById("checkbox" + i).disabled = false;
										else {
											if (document.getElementById("checkbox" + i).checked == true)
												document.getElementById("checkbox" + i).checked = false;
											document.getElementById("checkbox" + i).disabled = true;
										}
									}
								}
								
								if (document.getElementById("prdescription").readOnly == true)
									document.getElementById("prdescription").readOnly = false;
								else
									document.getElementById("prdescription").readOnly = true;

								if (document.getElementById("prdimension").readOnly == true)
									document.getElementById("prdimension").readOnly = false;
								else
									document.getElementById("prdimension").readOnly = true;	

								if (document.getElementById("prmass").readOnly == true)
									document.getElementById("prmass").readOnly = false;
								else
									document.getElementById("prmass").readOnly = true;

								if (document.getElementById("prtype").readOnly == true)
									document.getElementById("prtype").readOnly = false;
								else
									document.getElementById("prtype").readOnly = true;
								
								if (document.getElementById("prweight").readOnly == true)
									document.getElementById("prweight").readOnly = false;
								else
									document.getElementById("prweight").readOnly = true;
																
								if (document.getElementById("prquantity").readOnly == true)
									document.getElementById("prquantity").readOnly = false;
								else
									document.getElementById("prquantity").readOnly = true;


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

							function submitDelete() {
								  var x = confirm("Are you sure you want to delete this product?");
								  if (x) {
									  document.getElementById("DeleteProduct").submit();
								      return true;
								  }
								  else
								    return false;
							}

							function submitUpdate() {
								document.getElementById("UpdateProduct").submit();
							}

							function submitAddToCart() {
								document.getElementById("AddToCart").submit();
							}
						</script>

						<form action="UpdateProduct" method="post" id="UpdateProduct">
						<table border="1" cellpadding="35" cellspacing="0" style="width: 750px; border: solid 3px; margin-left: 0px; text-align: center; vertical-align: middle; background: #F3F0F0 ; color: black;">
	        								
	        			<td height="30px" width="270" colspan="2" style="text-align: left;">
							<p class="mbottom">
							<h4><b>Product Information</b></h4>
							</p>
							
							<p><b><font  size="2" color="black">Name: </font></b>
<!-- 							<ul class="halfmbottom"> -->
								<%out.print(name);%></p>
								<input type="text" id="prname" style="display:none"
									value='<%out.print(name);%>' name="prname"
									readonly="readonly" class="field left">
<!-- 							</ul> -->
					
							<p><b><font  size="2" color="black">Serial Number: </font></b>
<!-- 							<ul class="halfmbottom"> -->
								<%out.print(serialNumber);%></p>
								<input type="text" id="prserialnumber" style="display:none"
									value='<%out.print(serialNumber);%>' name="prserialnumber"
									readonly="readonly" class="field left">
<!-- 							</ul> -->

							<h6><b>Description</b></h6>
<!-- 							<ul class="halfmbottom"> -->
<%-- 							<% if (Rights.getInstance().canWriteProduct(user.getRole().getRights()) || user.getUsername().equals("admin")) { %> --%>
<!-- 								<input type="text" id="prdescription" -->
<%-- 									value='<%out.print(description);%>' name="prdescription" --%>
<!-- 									readonly="readonly" class="field left"> -->
<%-- 							<% } else { %> --%>
<%-- 									<h6><%out.print(description);%></h6> --%>
<%-- 							<% } %> --%>
<!-- 							</ul> -->
							<ul class="halfmbottom">
							<% if (Rights.getInstance().canWriteProduct(user.getRole().getRights()) || user.getUsername().equals("admin")) { %>
<!-- 								<input type="text" id="prdescription" -->
<%-- 									value='<%out.print(description);%>' name="prdescription" --%>
<!-- 									class="field left"> -->
						<%
							out.print("<textarea id='prdescription' maxlength='255' name='prdescription' style='width: 130px;'>"
									+ description + "</textarea>");	
						%>
							<% } else { %>
									<h6><%out.print(description);%></h6>
							<% } %>
							</ul>
							
							<h6><b>Dimensions</b></h6>
<!-- 							<ul class="halfmbottom"> -->
<%-- 							<% if (dimensions != -1) {%> --%>
<%-- 								<% if (Rights.getInstance().canWriteProduct(user.getRole().getRights()) || user.getUsername().equals("admin")) { %> --%>
<!-- 									<input type="text" id="prdimension" -->
<%-- 										value='<%out.print(dimensions);%>' name="prdimension" --%>
<!-- 										readonly="readonly" class="field left" onkeypress='return checkIt(event)'> -->
<%-- 								<% } else { %> --%>
<%-- 										<h6><%out.print(dimensions);%></h6> --%>
<%-- 								<% } %> --%>
<%-- 							<% } else { %> --%>
<!-- 									<input type="text" id="prdimension" -->
<!-- 									value="" name="prdimension" -->
<!-- 									readonly="readonly" class="field left" onkeypress='return checkIt(event)'> -->
<%-- 							<% } %> --%>
<!-- 							</ul> -->
							<ul class="halfmbottom">
							<% if (dimensions != -1) {%>
								<% if (Rights.getInstance().canWriteProduct(user.getRole().getRights()) || user.getUsername().equals("admin")) { %>
									<input type="text" id="prdimension"
										value='<%out.print(dimensions);%>' name="prdimension"
										class="field left" onkeypress='return checkIt(event)'>		
								<% } else { %>
										<h6><%out.print(dimensions);%></h6>
								<% } %>
							<% } else { %>
									<input type="text" id="prdimension"
									value="" name="prdimension"
									class="field left" onkeypress='return checkIt(event)'>
							<% } %>
							</ul>
						
							
							<h6><b>Mass</b></h6>
<!-- 							<ul class="halfmbottom"> -->
<%-- 							<% if (mass != -1) {%> --%>
<%-- 								<% if (Rights.getInstance().canWriteProduct(user.getRole().getRights()) || user.getUsername().equals("admin")) { %> --%>
<!-- 									<input type="text" id="prmass" -->
<%-- 										value='<%out.print(mass);%>' name="prmass" --%>
<!-- 										readonly="readonly" class="field left" onkeypress='return checkIt(event)'> -->
<%-- 								<% } else { %> --%>
<%-- 										<h6><%out.print(mass);%></h6> --%>
<%-- 								<% } %> --%>
<%-- 							<% } else { %> --%>
<!-- 									<input type="text" id="prmass" -->
<!-- 										value="" name="prmass" -->
<!-- 										readonly="readonly" class="field left" onkeypress='return checkIt(event)'> -->
<%-- 							<% } %> --%>
<!-- 							</ul> -->
							<ul class="halfmbottom">
							<% if (mass != -1) {%>
								<% if (Rights.getInstance().canWriteProduct(user.getRole().getRights()) || user.getUsername().equals("admin")) { %>
									<input type="text" id="prmass"
										value='<%out.print(mass);%>' name="prmass"
										class="field left" onkeypress='return checkIt(event)'>
								<% } else { %>
										<h6><%out.print(mass);%></h6>
								<% } %>
							<% } else { %>
									<input type="text" id="prmass"
										value="" name="prmass"
										class="field left" onkeypress='return checkIt(event)'>
							<% } %>
							</ul>
							
							<h6><b>Type</b></h6>
<!-- 							<ul class="halfmbottom"> -->
<%-- 							<% if (type != null) {%> --%>
<%-- 								<% if (Rights.getInstance().canWriteProduct(user.getRole().getRights()) || user.getUsername().equals("admin")) { %> --%>
<!-- 									<input type="text" id="prtype" -->
<%-- 										value='<%out.print(type);%>' name="prtype" --%>
<!-- 										readonly="readonly" class="field left"> -->
<%-- 								<% } else { %> --%>
<%-- 										<h6><%out.print(type);%></h6> --%>
<%-- 							<% } %> --%>
<%-- 							<% } else { %> --%>
<!-- 								<input type="text" id="prtype" -->
<!-- 									value="" name="prtype" -->
<!-- 									readonly="readonly" class="field left"> -->
<%-- 							<% } %>	 --%>
<!-- 							</ul> -->
							<ul class="halfmbottom">
							<% if (type != null) {%>
								<% if (Rights.getInstance().canWriteProduct(user.getRole().getRights()) || user.getUsername().equals("admin")) { %>
									<input type="text" id="prtype" maxlength='45'
										value='<%out.print(type);%>' name="prtype"
										class="field left">
								<% } else { %>
										<h6><%out.print(type);%></h6>
							<% } %>
							<% } else { %>
								<input type="text" id="prtype" maxlength='45'
									value="" name="prtype"
									class="field left">
							<% } %>	
							</ul>
							
							<h6><b>Weight</b></h6>
<!-- 							<ul class="halfmbottom"> -->
<%-- 							<% if (weight != -1) {%> --%>
<%-- 								<% if (Rights.getInstance().canWriteProduct(user.getRole().getRights()) || user.getUsername().equals("admin")) { %> --%>
<!-- 									<input type="text" id="prweight" -->
<%-- 										value='<%out.print(weight);%>' name="prweight" --%>
<!-- 										readonly="readonly" class="field left" onkeypress='return checkIt(event)'> -->
<%-- 								<% } else { %> --%>
<%-- 										<h6><%out.print(weight);%></h6> --%>
<%-- 								<% } %> --%>
<%-- 							<% } else { %> --%>
<!-- 								<input type="text" id="prweight" -->
<!-- 									value="" name="prweight" -->
<!-- 									readonly="readonly" class="field left" onkeypress='return checkIt(event)'> -->
<%-- 							<% } %>							 --%>
<!-- 							</ul> -->
							<ul class="halfmbottom">
							<% if (weight != -1) {%>
								<% if (Rights.getInstance().canWriteProduct(user.getRole().getRights()) || user.getUsername().equals("admin")) { %>
									<input type="text" id="prweight"
										value='<%out.print(weight);%>' name="prweight"
										class="field left" onkeypress='return checkIt(event)'>
								<% } else { %>
										<h6><%out.print(weight);%></h6>
								<% } %>
							<% } else { %>
								<input type="text" id="prweight"
									value="" name="prweight"
									class="field left" onkeypress='return checkIt(event)'>
							<% } %>							
							</ul>
							
<!-- 							<h6><b>Retail price:</b></h6> -->
<%-- 							<%out.print(product.getPrice());%> --%>
							<p><b><font  size="2" color="black">Retail price: </font></b><%out.print(product.getPrice());%></p>
							

							<p><b><font  size="2" color="black">Total quantity: </font></b><%out.print(product.getQuantity());%></p>

							</ul>
							</td>

					</aside>

					<section
						class="grid col-three-quarters mq2-col-two-thirds mq3-col-full">

						
						<td height="30px" width="500" colspan="2" style="text-align: left; ">
						<p class="mbottom">
						<h4><b>WareHouses with this product </b></h4>
						
						<%
						List<ProductStore> storeLink;
						List<ProductSupplier> supplierLink;
						List<String> stores;
						List<String> suppliers;
						List<LastMovements> lastMovements;
						String myStore = null;
						
						storeLink = (List<ProductStore>) request.getAttribute("storeproducts");
						supplierLink = (List<ProductSupplier>) request.getAttribute("supplierproducts");
						stores = (List<String>) request.getAttribute("stores");
						suppliers = (List<String>) request.getAttribute("suppliers");
						lastMovements = (List<LastMovements>) request.getAttribute("lastmovements");
						
						
						Iterator i = storeLink.iterator();
						String text = null;
						
						int j = 0;
						for (ProductStore st : storeLink) {

						%>

<%-- 							<label><input type="checkbox" name="<%out.print("checkbox" + st.getStoreName());%>" id="<%out.print("checkbox" + j);%>" disabled="disabled" value="1" onclick="showBox(this, '<%out.print(st.getStoreName());%>')"/> --%>
							<label><input type="checkbox" name="<%out.print("checkbox" + st.getStoreName());%>" id="<%out.print("checkbox" + j);%>" value="1" onclick="showBox(this, '<%out.print(st.getStoreName());%>')"/>
							<%out.print("Store: " + st.getStoreName() + " - Quantity: " + st.getQuantity() + " - Supplier: " + st.getSupplierName());%></label>
							<% j++; %>
						
							<ul class="halfmbottom" id="<%out.print(st.getStoreName());%>" style="display:none">
								<h6 id="2">Move to</h6>
								<select name="<%out.print("selectNewStore" + st.getStoreName());%>" id="<%out.print("selectNewStore" + st.getStoreName());%>"">
								<%
										for (String st1 : stores) {
											if (st1.equals(st.getStoreName())) {
												// do nothing
											}
											else {
												for (ProductStore st2 : storeLink) {

													// checking for another store than st
													if (!st2.equals(st)) {
														if (st1.equals(st2.getStoreName())) {
															text = st1 + " - contains already (" + st2.getQuantity() + ") products.";
															out.print("<option value='" + st1 + "'>" + text + "</option>");
															break;
														}
													}
												}

												if (text == null) { 
													out.print("<option value='" + st1 + "'>" + st1 + "</option>");
												}
												else text = null;
											}
										}
									%>
								</select>
								<h6 id="3">Quantity</h6>
								<input type="text" name="<%out.print("newQuantity" + st.getStoreName()); %>" id="<%out.print("newQuantity" + st.getStoreName()); %>" maxlength="5" onkeyup="this.value = minmax(this.value, 0, <%out.print(st.getQuantity());%>)"/>
							</ul>
							
							
						<%
						}
						%>

						<br></br>
						<br></br>
						<hr>
						
						<h4><b>Suppliers of this product </b></h4>
							
						<%
						
						for (ProductSupplier ps : supplierLink ) {
												
						%>
<%-- 								<h6 id="2"><%out.print("Supplier ' " + ps.getSupplierName() + "' with price: ");%></h6> --%>
								<p><b><font id="2"><%out.print("Supplier ' " + ps.getSupplierName() + "' with price: ");%></font></b>
<!-- 								<p><b><font  size="2" color="black">price: </font></b> -->
<!-- 								<ul class="halfmbottom"> -->
									<%out.print(ps.getPrice());%></p>

<%-- 							<% if (Rights.getInstance().canWriteProduct(user.getRole().getRights()) || user.getUsername().equals("admin")) { %> --%>
<%-- 										<input type="text" id="<%out.print("priceOf" + ps.getSupplierName()); %>" --%>
<%-- 											value='<%out.print(ps.getPrice());%>' name="<%out.print("priceOf" + ps.getSupplierName()); %>" --%>
<!-- 											readonly="readonly" class="field left" onkeypress='return checkIt(event)'> -->
<%-- 									<% } else { %> --%>
<%-- 											<h6><%out.print(ps.getPrice());%></h6> --%>
<%-- 									<% } %> --%>

						<%
												
						} // for (ProductSupplier)
												
						%>
						
						</hr>
										
						
						<hr>
						
						<h4><b>Last movements </b></h4>
							
						<%
						
						for (LastMovements lm : lastMovements) {
						
						%>
							
							<h6><%out.print("time: " + lm.getTime() + " - from store: " + lm.getFromStore() + " to store: " + lm.getToStore() +
								" quantity: " + lm.getQuantity() + " kind of movement: " + lm.getKindOfMovement()); %></h6>
						
						<%
												
						} // for (LastMovements)
												
						%>
						
						</hr>
						
						</td>
						</table>
						
						<input type="hidden" name="hidden" id="hidden" value="<%out.print(j);%>">
						</form>
						
						<form action="AddToCart" method="post" id="AddToCart">
							<input type="hidden" name="hiddenname" id="hiddenname" value="<%out.print(name);%>">
							<input type="hidden" name="hiddenserial" id="hiddenserial" value="<%out.print(serialNumber);%>">
						</form>
							
							
<script type="text/javascript">
function minmax(value, min, max) 
{
    if(parseInt(value) < 0 || isNaN(value)) {
        return 0; 
    }
    else if(parseInt(value) > max) {
        return max; 
    }
    else return value;
}
</script>
							
<script type="text/javascript"> 
function showBox(elem, id){
// document.getElementById("fb").style.display=elem.checked?"block":"none";
document.getElementById(id).style.display=elem.checked?"block":"none";
}
</script>
						
					</section>
	
						<form action="DeleteProduct" method="post" id="DeleteProduct">
							<p>
							<input type="text" id="prname" style="display:none"
									value='<%out.print(name);%>' name="prname2"
									readonly="readonly" class="field left">
									
							<input type="text" id="prserialnumber" style="display:none"
									value='<%out.print(serialNumber);%>' name="prserialnumber2"
									readonly="readonly" class="field left">

							</p>
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