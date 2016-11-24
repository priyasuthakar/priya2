<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<%@page isELIgnored="false"%>
<%@include file="/WEB-INF/views/AdminHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Supplier Admin</title>
</head>
<body>
	<center>
		<font face="Harlow Solid Italic"><h1>Add Supplier</h1></font>

		<div class="container">
			<form:form action="supplier" method="post" commandName="supplier">
				<br>
				<br>
				<div class="form-group">
					<form:label class="col-lg-4 control-label" path="name">
						<spring:message text="Name" />
					</form:label>
					<div class="col-lg-4 ">
						<form:input path="name" class="form-control"
							placeholder="Enter name" />
						<form:errors style="color:red" path="id" />
					</div>
				</div>
				<br>
				<br>
				<div class="form-group">
					<form:label class="col-lg-4 control-label" path="discription">
						<spring:message text="Discription" />
					</form:label>
					<div class="col-lg-4 ">
						<form:input path="discription" class="form-control"
							placeholder="Enter discription..." />
						<form:errors style="color:red" path="discription" />
					</div>
				</div>
				<br>
				<br>
				<br>
				<br>
				<br>
				<div>
					<form:button onclick="myFunction()" class="btn btn-success">
						<spring:message text="Add Supplier" />
					</form:button>
					<form:button type="reset" class="btn btn-info">
						<spring:message text="Reset" />
					</form:button>
				</div>
			</form:form>
		</div>
		<script>
function myFunction() {
	  var x = confirm("Are you sure you want to add the supplier?");
      if (x)
          return true;
      else
        return false;

}
</script>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br>
	</center>
	<%@include file="Footer.jsp"%>
</body>
</html>