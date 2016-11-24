<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@include file="/WEB-INF/views/Header.jsp"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>My Shopping</title>
</head>
<body style="background-image: url(resource/images/a.jpg)"
	data-spy="scroll" data-target=".navbar" data-offset="60">
	<!-- Container (About Section) -->
	<div id="about" class="container-fluid">
		<div class="row">
			<div class="col-sm-8">
				<h2>About Us</h2>
				<br> <br>
				<h2>
					<p>This Website exclusively contains for purchasing apple
						product.</p>
				</h2>
			</div>
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-stats logo"></span>
			</div>
		</div>
	</div>
	<br>
	<br>
	<div class="container-fluid ">
		<div class="row">
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-globe logo slideanim"></span>
			</div>
			<div class="col-sm-8">

				<h2>Our Values</h2>
				<br> <br>
				<h2>
					<strong>MISSION: </strong>To deliver an exceptional shopping
					experience by offering the best service, value, quality, and
					freshest products while being good stewards of our environment and
					giving back to the communities we serve.
				</h2>
				<br>
				<h2>
					<strong>VISION: </strong>Become the #1 supermarket in our
					communities by offering the most inviting buying environment in the
					industry while saving our customer time and money and building our
					brand to premier status.
				</h2>
			</div>
		</div>
	</div>

	<%@include file="Footer.jsp"%>
</body>
</html>