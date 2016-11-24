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
<title>Purchase</title>
</head>
<body style="background-image: url(resource/images/a.jpg)">
	<font color="white">
		<center>
			<font face="Harlow Solid Italic"><h1>Shipment Details</h1></font>
			<div class="container">
				<form:form action="buy" method="post" commandName="buy"
					class="form-horizontal" role="form">
					<div class="form-group">
						<form:label class="col-lg-4 control-label" path="productname">
							<spring:message text="Product Name" />
						</form:label>
						<div class="col-lg-4 ">
							<form:input path="productname" class="form-control"
								readonly="true" />
						</div>
					</div>
					<br>
					<br>
					<div class="form-group">
						<form:label class="col-lg-4 control-label" path="username">
							<spring:message text="Name" />
						</form:label>
						<div class="col-lg-4 ">
							<form:input path="username" class="form-control" readonly="true" />
						</div>
					</div>
					<br>
					<br>
					<div class="form-group">
						<form:label class="col-lg-4 control-label" path="address">
							<spring:message text="Address" />
						</form:label>
						<div class="col-lg-4 ">
							<form:input path="address" class="form-control" readonly="true" />
						</div>
					</div>
					<br>
					<br>
					<div class="form-group">
						<form:label class="col-lg-4 control-label" path="city">
							<spring:message text="City" />
						</form:label>
						<div class="col-lg-4 ">
							<form:input path="city" class="form-control" readonly="true" />
						</div>
					</div>
					<br>
					<br>
					<div class="form-group">
						<form:label class="col-lg-4 control-label" path="state">
							<spring:message text="State" />
						</form:label>
						<div class="col-lg-4 ">
							<form:input path="state" class="form-control" readonly="true" />
						</div>
					</div>
					<br>
					<br>
					<div class="form-group">
						<form:label class="col-lg-4 control-label" path="mobileno">
							<spring:message text="Mobileno" />
						</form:label>
						<div class="col-lg-4 ">
							<form:input path="mobileno" class="form-control" readonly="true" />
						</div>
					</div>
					<br>
					<br>
					<div class="form-group">
						<form:label class="col-lg-4 control-label" path="total">
							<spring:message text="Total" />
						</form:label>
						<div class="col-lg-4 ">
							<form:input path="total" class="form-control" readonly="true" />
						</div>
					</div>
					<br>
					<br>
					<div>
						<a href="vieworder"><form:button type="submit"
								class="btn btn-success">
								<spring:message text="Proceed" />
							</form:button></a>
						<form:button type="reset" class="btn btn-info">
							<spring:message text="Reset" />
						</form:button>
					</div>
				</form:form>
			</div>
		</center>
	</font>
</body>
</html>
