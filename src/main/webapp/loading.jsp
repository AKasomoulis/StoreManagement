<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="gr.uoa.di.storemanagement.datalayer.entities.user.User"%>
<%@page import="gr.uoa.di.storemanagement.datalayer.entities.role.Role"%>
<%@page import="gr.uoa.di.storemanagement.rights.Rights"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>loading user</title>

<!-- Code within Head Tag -->
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript">
	$(window).load(function() {
		$("#loading").hide();
	})
</script>
<!-- Code within Head Tag -->

<style type="text/css">
/* Document Styles */
body {
	background: #efefef;
	font: normal 9pt arial;
}

/* Loadign Div Style */
#loading {
	position: absolute;
	width: 300px;
	top: 0px;
	left: 50%;
	margin-left: -150px;
	text-align: center;
	padding: 7px 0 0 0;
	font: bold 11px Arial, Helvetica, sans-serif;
}
</style>

</head>
<body>
	<!-- Loading Div -->
	<div id="loading">


		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		
		<% 	
			User user = new User();
			user = (User) session.getAttribute("user");
			String username = user.getUsername();
			int rights = user.getRole().getRights(); %>
		<br> Loading, <% out.print(username); %> please wait.. <img src="img/loading.png"
			alt="loading.." />
	</div>
	<!-- Loading Div -->

	<%-- <% Thread.sleep(3000);  --%>
	<%-- response.sendRedirect("<%=request.getContextPath()%>/adminGeneral.jsp");%> --%>

<%-- 	<% if (user.getUsername().equals("admin") ) {%> --%>
	<% if (user.getRole().getRoleName().equals("Admin")) {%>
		<META http-equiv="refresh" content="2;url=<%=request.getContextPath()%>/General">
	<% } 
		else {%>
			<META http-equiv="refresh" content="2;url=<%=request.getContextPath()%>/userGeneral.jsp">
	<% } %>
	
</body>


</html>