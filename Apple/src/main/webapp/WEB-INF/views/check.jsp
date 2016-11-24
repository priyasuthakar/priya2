<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>check</title>
</head>
<body>

	<security:authorize access="hasRole('ROLE_USER')">
		<%@include file="Home.jsp"%>
	</security:authorize>

	<security:authorize access="hasRole('ROLE_ADMIN')">
		<%@include file="admin.jsp"%>
	</security:authorize>

</body>
</html>