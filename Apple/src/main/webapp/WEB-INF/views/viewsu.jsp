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
<title>Supplier Admin</title>
</head>
<body ng-app="supplierapp" ng-controller="supplierCtrl">
	<br>
	<font face="Harlow Solid Italic">
		<center>
			<h1>Supplier List</h1>
		</center>
	</font>

	<div class="row">
		<center>
			<div ng-repeat="slist in supplier | filter:searchbox">
				<br>
				<div class="col-sm-4">
					<br>
					<div class="container-fluid">
						<b width="200">ID
							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b>
						{{slist.id}} <br> <br> &nbsp&nbsp&nbsp<b width="200">NAME
							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</b>
						{{slist.name}} <br> <br> <b width="200">DISCRIPTION
							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp </b> {{slist.discription}} <br>
						<br>  <a href="<c:url value="/edit1{{slist.id}}"/>"
							ng-click="enableEditor()">Edit</a> <br> <br> 
						<a href="<c:url value="/s{{slist.id}}"/>" ng-click="remove()">Delete</a>
						<br> <br>
					</div>
				</div>
			</div>
		</center>
	</div>

	<script type="text/javascript">
		var s = ${lists};
		var supplierapp = angular.module("supplierapp", []);
		supplierapp.controller("supplierCtrl", function($scope, $http) {
			$scope.supplier = s;
		});
	</script>
	<%@include file="Footer.jsp"%>
</body>
</html>