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
	<h4>${successbuy}</h4>
	<br>
	<div class="container">
		<div align="left">
			<h4>
				<center>
					<b>${BuyList}</b>
				</center>
			</h4>
		</div>
		<br> <br>
		<div class="row">
			<c:forEach items="${buyList}" var="buy">
				<div class="col-sm-6">
					<div class="col-sm-6">
							<img src="resource/images/${buy.id}.jpg" style="height: 200px" 
								class="img-responsive">
					</div>
					<div style="background-color: #FFCCCC;">
					<br> 
					<b>NAME</b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					${buy.productname} <br><b>COLOR </b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					${buy.color} <br><b>PRICE </b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					${buy.total} <br><b>DISCRIPTION </b>
					${buy.discription} <br> <br> 
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<%@include file="Footer.jsp"%>
</body>
</html>