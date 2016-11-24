<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@include file="/WEB-INF/views/Header.jsp"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Product</title>
</head>
<body  style="background-color:#FFCCCC" ng-app="productapp" ng-controller="productCtrl">
	<br>
	<br>
	<br>
	<div align="center">
		<label>Search:</label><input type="text" ng-model="searchbox"><span
			class="glypicon glypicon-search"></span> <br> <br> <font
			face="Harlow Solid Italic"><h1>List</h1></font>
			<center>
		<table class="table table-center">
			<thead>
				<tr>
					<th width="120">NAME</th>
					<th width="120">COLOR</th>
					<th width="120">PRICE</th>
					<th width="120">DISCRIPTION</th>
					<th width="120">INFO</th>
				</tr>
			</thead>
			<tbody>
				<tr ng-repeat="plist in product | filter:searchbox ">
					<td>{{plist.name}}</td>
					<td>{{plist.color}}</td>
					<td>{{plist.price}}</td>
					<td>{{plist.discription}}</td>
					<td><a href="productinfo?pdid={{plist.id}}">Details</a></td>
				</tr>
			</tbody>
		</table>
		</center>
		<script type="text/javascript">
		var p = ${listp};
		var productapp = angular.module("productapp", []);
		productapp.controller("productCtrl", function($scope, $http) {
			$scope.product = p;
		});
	</script>
	</div>
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
	<%@include file="Footer.jsp"%>
</body>
</html>