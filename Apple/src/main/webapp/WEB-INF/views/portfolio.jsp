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
<body style="background-image: url(resource/images/a.jpg)">
	<!-- Container (Portfolio Section) -->
	<div id="portfolio" class="container-fluid text-center">
		<h2>Portfolio</h2>
		<br>
		<div class="container">
			<div class="img-responsive">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
						<li data-target="#myCarousel" data-slide-to="3"></li>
						<li data-target="#myCarousel" data-slide-to="4"></li>
						<li data-target="#myCarousel" data-slide-to="5"></li>
					</ol>
					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src=<c:url value="/resource/images/desktop.jpg"/>
								style="width: 100%; height: 450px" class="img-responsive"
								alt="Desktop">
							<div class="carousel-caption">
								<a href="product1" data-toggle="tooltip" title="Desktop!">Desktop</a>
							</div>
						</div>
						<div class="item">
							<img src=<c:url value="/resource/images/laptop.jpg"/>
								style="width: 100%; height: 450px" class="img-responsive"
								alt="Laptop">
							<div class="carousel-caption">
								<a href="product1" data-toggle="tooltip" title="Laptop!">Laptop</a>
							</div>
						</div>
						<div class="item">
							<img src=<c:url value="/resource/images/iphone.jpg"/>
								style="width: 100%; height: 450px" class="img-responsive"
								alt="IPhone">
							<div class="carousel-caption">
								<a href="product1" data-toggle="tooltip" title="Iphone!">Iphone</a>
							</div>
						</div>
						<div class="item">
							<img src=<c:url value="/resource/images/ipad.jpg"/>
								style="width: 100%; height: 450px" class="img-responsive"
								alt="IPad">
							<div class="carousel-caption">
								<a href="product1" data-toggle="tooltip" title="Ipad!">Ipad</a>
							</div>
						</div>
						<div class="item">
							<img src=<c:url value="/resource/images/ipod.jpg"/>
								style="width: 100%; height: 450px" class="img-responsive"
								alt="IPod">
							<div class="carousel-caption">
								<a href="product1" data-toggle="tooltip" title="Ipod!">Ipod</a>
							</div>
						</div>
						<div class="item">
							<img src=<c:url value="/resource/images/accesories.jpg"/>
								style="width: 100%; height: 450px" class="img-responsive"
								alt="Accesories">
							<div class="carousel-caption">
								<a href="product1" data-toggle="tooltip" title="Accesories!">Accesories</a>
							</div>
						</div>
					</div>
					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel" role="button"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel" role="button"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<%@include file="Footer.jsp"%>

</body>
</html>