<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Admin</title>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!--Angularjs library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.7/angular.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

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
	margin-bottom: 10px;
	font-size: 24px;
}

.navbar {
	margin-bottom: 0;
	background-color: #622569;
	z-index: 9999;
	border: 0;
	font-size: 18px !important;
	line-height: 1.42857143 !important;
	letter-spacing: 2px;
	border-radius: 0;
	font-family: Montserrat, sans-serif;
}

.navbar .navbar-brand {
	color: #FFFFFF !important;
}

.navbar .li a {
	color: #FFF !important;
}

.navbar-nav li a:hover, .navbar-nav li.active a {
	color: #622569 !important;
	background-color: violet !important;
}

.navbar-default .navbar-toggle {
	border-color: transparent;
	color: #FFCCCC !important;
}

footer .glyphicon {
	font-size: 24px;
	margin-bottom: 20px;
	color: #622569;
}

.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 100%;
	margin: auto;
}
</style>
	<c:choose>
		<c:when test="${empty loggedInUser}">
			<font face="Harlow Solid Italic"><h1>Welcome Guest...!!!</h1></font>
		</c:when>
		<c:when test="${not empty loggedInUser}">
			<font face="Harlow Solid Italic"><h1>Welcome
					${loggedInUser}...!!!</h1></font>
		</c:when>
	</c:choose>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand"> <font face="Script MT Bold">Shopping
					Site</font></a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="admin">Home</a></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> Catagory <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="catagory">Add Catagory</a></li>
					<li><a href="viewcatagory">View Catagory</a></li>
				</ul></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> Supplier<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="supplier">Add Supplier</a></li>
					<li><a href="viewsupplier">View Supplier</a></li>
				</ul></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#"> Product <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="product">Add Product</a></li>
					<li><a href="viewproduct">View Product</a></li>
				</ul></li>
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
					<li><a href="#"> <input type="text" ng-model="searchbox"
							size="20" placeholder="searching..." /></a></li>
					<li><a href="logout"><span
							class="glyphicon glyphicon-user"></span> Logout</a></li>
				</c:when>
			</c:choose>
		</ul>
	</div>
	</nav>
</body>
</html>