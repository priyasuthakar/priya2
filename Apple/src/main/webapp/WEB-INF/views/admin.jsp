<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Shopping Admin</title>
</head>
<body>
	<%@include file="AdminHeader.jsp"%>
	<div id="admin">
		<div class="container">
			<br> <img src=<c:url value="/resource/images/apple.jpg"/>
				width="2000" height="550" class="img-responsive">
		</div>
	</div>
	<%@include file="Footer.jsp"%>
</body>
</html>