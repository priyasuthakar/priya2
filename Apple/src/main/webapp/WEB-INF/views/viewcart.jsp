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
<title>My Shopping</title>
</head>

<body>
	<br>
	<div class="container">
		<div align="left">
			<h4>
				<center>
					<b>${CartList}</b>
				</center>
			</h4>
		</div>
		<br> <br>
		<div class="row">
			<c:forEach items="${cartList}" var="cart">
				<div class="col-sm-4" style="background-color:#FFCCCC;">
					<div class="col-sm-4">
							<img src="resource/images/${cart.id}.jpg" style="height: 200px"
								class="img-responsive">
					</div>
					<br> 
					<b width="200">NAME</b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					${cart.pname} <br> <br> <b width="200">QUANTITY </b>&nbsp&nbsp&nbsp&nbsp
					${cart.quantity} <br> <br> <b width="100">PRICE </b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					${cart.price} <br> <br> <b width="100"> <a href=" <c:url value="/del${cart.id}"/>"> DELETE &nbsp&nbsp&nbsp&nbsp</a>  </b>
				<b width="100"><a href="<c:url value= '/buy${cart.id}'/>"><button
							onclick="myFunction()" class="btn btn-success">BUY NOW</button></a> </b> <br> <br> 
				</div>
			</c:forEach>
		</div>
	</div>
	<%@include file="Footer.jsp"%>
</body>
</html>