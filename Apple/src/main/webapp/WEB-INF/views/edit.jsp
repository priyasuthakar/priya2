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
<title>Catagory Admin</title>
</head>
<body>
	<center>
		<font face="Harlow Solid Italic"><h1>${editcatagory}</h1></font>

		<div class="container">
			<form:form action="edit" method="post" modelAttribute="catagory"
				class="form-horizontal" role="form">
				<br>
				<br>
				<div class="form-group">
					<form:label class="col-lg-4 control-label" path="id">
						<spring:message text="ID" />
					</form:label>
					<div class="col-lg-4 ">
						<form:input class="form-control" path="id" disabled="true"
							readonly="true" />
					</div>
				</div>
				<br>
				<br>
				<div class="form-group">
					<form:label class="col-lg-4 control-label" path="name">
						<spring:message text="NAME" />
					</form:label>
					<div class="col-lg-4 ">
						<form:input path="name" class="form-control"
							placeholder="Enter name" />
						<form:errors style="color:red" path="name" />
					</div>
				</div>
				<br>
				<br>
				<div class="form-group">
					<form:label class="col-lg-4 control-label" path="discription">
						<spring:message text="DISCRIPTION" />
					</form:label>
					<div class="col-lg-4 ">
						<form:input path="discription" class="form-control"
							placeholder="Enter discription" />
						<form:errors style="color:red" path="discription" />
					</div>
				</div>
				<br>
				<br>
				<div>
					<c:if test="${!empty catagory.name }">
						<form:button type="submit" class="btn btn-success">
							<spring:message text="Edit" />
						</form:button>
						<form:button type="reset" class="btn btn-info">
							<spring:message text="Reset" />
						</form:button>
					</c:if>
				</div>
			</form:form>
		</div>
	</center>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<center>
		<%@include file="Footer.jsp"%>
	</center>
</body>
</html>