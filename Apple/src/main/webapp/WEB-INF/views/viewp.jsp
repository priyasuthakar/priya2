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
<title>Product Admin</title>
</head>
<body ng-app="productapp" ng-controller="productCtrl">
	<br>
	<font face="Harlow Solid Italic"><h1>${addproduct}</h1></font>
	<font face="Harlow Solid Italic"><h1>${editproduct}</h1></font>
	<font face="Harlow Solid Italic"><h1>Product List</h1></font>

	<table class="table table-striped">
		<thead>
			<tr>
				<center>
					<th width="120">ID</th>
					<th width="120">NAME</th>
					<th width="120">COLOR</th>
					<th width="120">PRICE</th>
					<th width="120">CAT_ID</th>
					<th width="120">SUP_ID</th>
					<th width="120">QUANTITY</th>
					<th width="120">DiSCRIPTION</th>
					<th width="120">EDIT</th>
					<th width="120">DELETE</th>
					<center>
			</tr>
		</thead>
		<tbody>
			<tr ng-repeat="plist in product | filter:searchbox ">
				<center>
					<td>{{plist.id}}</td>
					<td>{{plist.name}}</td>
					<td>{{plist.color}}</td>
					<td>{{plist.price}}</td>
					<td>{{plist.cat.id}}</td>
					<td>{{plist.sup.id}}</td>
					<td>{{plist.quantity}}</td>
					<td>{{plist.discription}}</td>
					<td><a href="<c:url value="/edit2{{plist.id}}"/>"
						ng-click="enableEditor()">Edit</a></td>
					<td><a href="<c:url value="/p{{plist.id}}"/>"
						ng-click="remove()">Delete</a></td>
				</center>
			</tr>
		</tbody>
	</table>

	<script type="text/javascript">
		var p = ${listp};
		var productapp = angular.module("productapp", []);
		productapp.controller("productCtrl", function($scope, $http) {
			$scope.product = p;
		});
	</script>
	<%@include file="Footer.jsp"%>
</body>
</html>
