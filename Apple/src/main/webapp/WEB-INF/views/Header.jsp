<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Shopping</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!--Angularjs library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.7/angular.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
	<style>
h1 {
	font-size: 24px;
	color: #303030;
	font-weight: 600;
	margin-bottom: 30px;
	font-size: 24px;
}

.navbar {
	background-color: #660033;
	font-size: 16px !important;
}

.navbar .navbar-brand {
	color: #FFFFFF !important;
}

.navbar .li a {
	color: #FFF !important;
}

.navbar-nav li a:hover, .navbar-nav li.active a {
	color: #660033 !important;
	background-color: #FFCCCC !important;
}

.navbar-default .navbar-toggle {
	border-color: transparent;
	color: #FFCCCC !important;
}

footer .glyphicon {
	font-size: 24px;
	color: #660033;
}

table, th, td, tr {
	border: 2px solid grey;
	border-collapse: collapse;
	padding-left: 50%
}
</style>

	<c:choose>
		<c:when test="${empty loggedInUser}">
			<h1><font face="Harlow Solid Italic" color="green">Welcome
					Guest...!!!</font></h1>
		</c:when>
		<c:when test="${not empty loggedInUser}">
			<h1><font face="Harlow Solid Italic" color="green">Welcome
					${loggedInUser}...!!!</font></h1>
		</c:when>
	</c:choose>

	<div class="responsive">
		<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand"> <span class="glyphicon glyphicon-apple"></span>
					<font face="Script MT Bold"> Shopping Site </font>
				</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="Home"><span
						class="glyphicon glyphicon-home"></span> Home</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> Catagory <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="product1?catname=Desktop"> Desktop</a></li>
						<li><a href="product1?catname=Laptop"> Laptop</a></li>
						<li><a href="product1?catname=Iphone"> Iphone</a></li>
						<li><a href="product1?catname=Ipad"> Ipad</a></li>
						<li><a href="product1?catname=Ipod"> Ipod</a></li>
						<li><a href="product1?catname=Accessories"> Accessories</a></li>
					</ul></li>
				<li><a href="contactus"><span
						class="glyphicon glyphicon-earphone"></span> Contact Us</a></li>
				<li><a href="about"><span class="glyphicon glyphicon-stats"></span>
						About Us</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test="${empty loggedInUser}">
						<li><a href="login"><span
								class="glyphicon glyphicon-log-in"></span> Login</a></li>
						<li><a href="reg"><span class="glyphicon glyphicon-user"></span>
								Sign Up</a></li>
					</c:when>
					<c:when test="${not empty loggedInUser}">
						<li><a href="vieworder"><span
									class="glyphicon glyphicon-shopping-cart"></span> Order Summary <font color="red"><span
									class="badge">${buySize}</span></font></a></li>
							<li><a href="viewcart"><span
									class="glyphicon glyphicon-shopping-cart"></span> Cart <font color="red"><span
									class="badge" >${cartSize}</span></font></a></li>
							<li><a href="logout"><span
								class="glyphicon glyphicon-user"></span> Logout</a></li>
					</c:when>
				</c:choose>
			</ul>
		</div>
		</nav>
</body>
</html>
