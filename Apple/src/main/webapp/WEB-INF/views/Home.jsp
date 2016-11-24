<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>My Shopping</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<!-- <link href="http://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
body {
	font: 400 15px Helvetica, sans-serif;
	line-height: 1.8;
	color: #818181;
}

h1 {
	font-size: 24px;
	color: #303030;
	font-weight: 600;
	margin-bottom: 30px;
	font-size: 24px;
}

h2 {
	font-size: 24px;
	text-transform: uppercase;
	color: #303030;
	font-weight: 600;
	margin-bottom: 30px;
}

h4 {
	font-size: 19px;
	line-height: 1.375em;
	color: #303030;
	font-weight: 400;
	margin-bottom: 30px;
}

.bg-grey {
	background-color: #FFCCCC;
	color: black;
	font-family: Montserrat, sans-serif;
}

.logo {
	color: #660033;
	font-size: 200px;
}

.thumbnail {
	padding: 0 0 15px 0;
	border: none;
	border-radius: 0;
}

.thumbnail img {
	width: 100%;
	height: 100%;
	margin-bottom: 10px;
}

.carousel-control.right, .carousel-control.left {
	background-image: none;
	color: #660033;
}

.carousel-indicators li {
	border-color: #660033;
}

.carousel-indicators li.active {
	background-color: #660033;
}

.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 250%;
	margin: auto;
}

.tales {
	width: 200%;
}

.carousel-inner {
	max-height: 600px !important;
}

.item h4 {
	font-size: 19px;
	line-height: 1.375em;
	font-weight: 400;
	font-style: italic;
	margin: 70px 0;
}

.item span {
	font-style: normal;
}

.container-fluid {
	padding: 20px 50px;
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

.slideanim {
	visibility: hidden;
}

.slide {
	animation-name: slide;
	-webkit-animation-name: slide;
	animation-duration: 1s;
	-webkit-animation-duration: 1s;
	visibility: visible;
}

@media screen and (max-width: 768px) {
	.col-sm-4 {
		text-align: center;
		margin: 25px 0;
	}
	.btn-lg {
		width: 100%;
		margin-bottom: 35px;
	}
}

@media screen and (max-width: 480px) {
	.logo {
		font-size: 150px;
	}
}
</style>

</head>

<body id="myPage" data-spy="scroll" data-target=".navbar"
	data-offset="60">
	<c:choose>
		<c:when test="${empty loggedInUser}">
			<font face="Harlow Solid Italic"><h1>Welcome Guest...!!!</h1></font>
		</c:when>
		<c:when test="${!empty loggedInUser}">
			<font face="Harlow Solid Italic"><h1>Welcome
					${loggedInUser}...!!!</h1></font>
		</c:when>
	</c:choose>

	<div class="responsive">
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand"> <span
						class="glyphicon glyphicon-apple"></span> <font
						face="Script MT Bold"> Shopping Site </font>
					</a>
				</div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="Home"><span
							class="glyphicon glyphicon-home"></span>Home</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"> Catagory <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="product1?catname=Desktop">Desktop</a></li>
							<li><a href="product1?catname=Laptop">Laptop</a></li>
							<li><a href="product1?catname=Iphone">Iphone</a></li>
							<li><a href="product1?catname=Ipad">Ipad</a></li>
							<li><a href="product1?catname=Ipod">Ipod</a></li>
							<li><a href="product1?catname=Accessories">Accessories</a></li>
						</ul></li>
					<li><a href="#about"><span
							class="glyphicon glyphicon-stats"></span>About Us</a></li>
					<li><a href="#contactus"><span
							class="glyphicon glyphicon-earphone"></span>Contact Us</a></li>
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
	</div>

	<font face="Harlow Solid Italic"><h1>${logoutsuccess}</h1></font>
	<font face="Harlow Solid Italic"><h1>${successbuy}</h1></font>

	<!-- Container (Portfolio Section) -->
	<div id="portfolio" class="container-fluid text-center">
		<br>
		<div class="container-responsive">
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
							style="height: 420px" class="img-responsive" alt="Desktop">
						<div class="carousel-caption">
							<a href="product1?catname=Desktop" data-toggle="tooltip"
								title="Desktop!">Desktop</a>
						</div>
					</div>

					<div class="item">
						<img src=<c:url value="/resource/images/laptop.jpg"/>
							style="height: 420px" class="img-responsive" alt="Laptop">
						<div class="carousel-caption">
							<a href="product1?catname=Laptop" data-toggle="tooltip"
								title="Laptop!">Laptop</a>
						</div>
					</div>

					<div class="item">
						<img src=<c:url value="/resource/images/iphone.jpg"/>
							style="height: 420px" class="img-responsive" alt="IPhone">
						<div class="carousel-caption">
							<a href="product1?catname=Iphone" data-toggle="tooltip"
								title="Iphone!">Iphone</a>
						</div>
					</div>

					<div class="item">
						<img src=<c:url value="/resource/images/ipad.jpg"/>
							style="height: 420px" class="img-responsive" alt="IPad">
						<div class="carousel-caption">
							<a href="product1?catname=Ipad" data-toggle="tooltip"
								title="Ipad!">Ipad</a>
						</div>
					</div>

					<div class="item">
						<img src=<c:url value="/resource/images/ipod.jpg"/>
							style="height: 420px" class="img-responsive" alt="IPod">
						<div class="carousel-caption">
							<a href="product1?catname=Ipod" data-toggle="tooltip"
								title="Ipod!">Ipod</a>
						</div>
					</div>
					<div class="item">
						<img src=<c:url value="/resource/images/accesories.jpg"/>
							style="height: 420px" class="img-responsive" alt="Accesories">
						<div class="carousel-caption">
							<a href="product1?catname=Accessories" data-toggle="tooltip"
								title="Accessories!">Accessories</a>
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
	<br>
	<!-- Container (About Section) -->
	<div id="about" class="container-fluid bg-grey ">
		<div class="row">
			<div class="col-sm-8">
				<h2>About Us</h2>
				<br>
				<h4>
					<p>This Website exclusively contains for purchasing apple
						product.</p>
				</h4>
			</div>
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-stats logo"></span>
			</div>
		</div>
	</div>

	<div class="container-fluid ">
		<div class="row">
			<div class="col-sm-4">
				<span class="glyphicon glyphicon-globe logo slideanim"></span>
			</div>
			<div class="col-sm-8">
				<h2>Our Values</h2>
				<br>
				<h4>
					<strong>MISSION:</strong> To deliver an exceptional shopping
					experience by offering the best service, value, quality, and
					freshest products while being good stewards of our environment and
					giving back to the communities we serve.
				</h4>
				<br>
				<h4>
					<strong>VISION:</strong>Become the #1 supermarket in our
					communities by offering the most inviting buying environment in the
					industry while saving our customer time and money and building our
					brand to premier status.
				</h4>
			</div>
		</div>
	</div>
	<!-- Container (Contact Section) -->
	<div id="contactus" class="container-fluid bg-grey">
		<h2 class="text-center">CONTACT</h2>
		<div class="row">
			<div class="col-sm-5">
				<h4>
					<p>Contact us and we'll get back to you within 24 hours.</p>
				</h4>
				<h4>
					<p>
						<span class="glyphicon glyphicon-map-marker"></span> Chicago, US
					</p>
				</h4>
				<h4>
					<p>
						<span class="glyphicon glyphicon-phone"></span> +00 1515151515
					</p>
				</h4>
				<h4>
					<p>
						<span class="glyphicon glyphicon-envelope"></span>appleproduct@apple.com
					</p>
				</h4>
			</div>
			<div class="col-sm-7 slideanim">
				<div class="row">
					<div class="col-sm-6 form-group">
						<input class="form-control" id="name" name="name"
							placeholder="Name" type="text" required>
					</div>
					<div class="col-sm-6 form-group">
						<input class="form-control" id="email" name="email"
							placeholder="Email" type="email" required>
					</div>
				</div>
				<textarea class="form-control" id="comments" name="comments"
					placeholder="Comment" rows="5"></textarea>
				<br>
				<div class="row">
					<div class="col-sm-12 form-group">
						<button class="btn btn-default pull-right" type="submit">Send</button>
					</div>
				</div>
			</div>
		</div>
	</div>


	<footer class="container-fluid text-center">
		<a href="#myPage" title="To Top"> <span
			class="glyphicon glyphicon-chevron-up"></span>
		</a>
	</footer>

	<script>
		$(document).ready(
				function() {
					// Add smooth scrolling to all links in navbar + footer link
					$(".navbar a, footer a[href='#myPage']").on('click',
							function(event) {
								// Make sure this.hash has a value before overriding default behavior
								if (this.hash !== "") {
									// Prevent default anchor click behavior
									event.preventDefault();

									// Store hash
									var hash = this.hash;

									// Using jQuery's animate() method to add smooth page scroll
									// The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
									$('html, body').animate({
										scrollTop : $(hash).offset().top
									}, 900, function() {

										// Add hash (#) to URL when done scrolling (default click behavior)
										window.location.hash = hash;
									});
								} // End if
							});

					$(window).scroll(function() {
						$(".slideanim").each(function() {
							var pos = $(this).offset().top;

							var winTop = $(window).scrollTop();
							if (pos < winTop + 600) {
								$(this).addClass("slide");
							}
						});
					});
				})
	</script>
	<%@include file="Footer.jsp"%>
</body>
</html>



