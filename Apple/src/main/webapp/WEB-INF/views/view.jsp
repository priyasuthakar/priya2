<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@include file="/WEB-INF/views/AdminHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Catagory Admin</title>
</head>
<body ng-app="catagoryapp" ng-controller="catagoryCtrl">
	<br>
	<br>

	<font face="Harlow Solid Italic">
		<center>
			<h1>Catagory List</h1>
		</center>
	</font>
	<div class="row">
		<br>
		<center>
			<div ng-repeat="clist in catagory | filter:searchbox">
				<div class="col-sm-4">

					<br> <b width="200">ID
						&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b>
					{{clist.id}} <br> <br> <b width="200">NAME
						&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b>
					{{clist.name}} <br> <br> <b width="100">DISCRIPTION
						&nbsp&nbsp&nbsp&nbsp&nbsp </b> {{clist.discription}} <br> <br>
					<a href="<c:url value="/editc{{clist.id}}"/>"
						ng-click="enableEditor()">Edit</a> <br> <br> 
					<a href="<c:url value="/{{clist.id}}"/>" ng-click="remove()">Delete</a>
					<br> <br>
				</div>
			</div>
		</center>
	</div>

	<script type="text/javascript">
		var c = ${list};
		var catagoryapp = angular.module("catagoryapp", []);
		catagoryapp.controller("catagoryCtrl", function($scope, $http) {
			$scope.catagory = c;
		});
	</script>
	<br>
	<%@include file="Footer.jsp"%>
</body>
</html>