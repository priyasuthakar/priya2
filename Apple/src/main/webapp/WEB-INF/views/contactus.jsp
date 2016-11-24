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
	<!-- Container (Contact Section) -->
	<div id="contactus" class="container-fluid">
		<h2 class="text-center">CONTACT</h2>
		<br> <br>
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
						<span class="glyphicon glyphicon-envelope"></span>
						appleproduct@apple.com
					</p>
				</h4>
			</div>
		</div>
		<br> <br>
		<div class="col-sm-7 ">
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

			<div class="col-sm-12 form-group">
				<button class="btn btn-success pull-right" type="submit">Send</button>
			</div>
		</div>
	</div>

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
	<br>
	<br>
	<%@include file="Footer.jsp"%>

</body>
</html>
