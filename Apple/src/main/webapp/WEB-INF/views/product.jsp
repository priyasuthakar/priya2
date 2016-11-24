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
<title>Product Admin</title>
</head>
<body>
	<center>
		<font face="Harlow Solid Italic"><h1>Add Product</h1></font> <br>
		<div class="container">
			<form:form action="product" method="post" modelAttribute="product"
				enctype="multipart/form-data">
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
					<form:label class="col-lg-4 control-label" path="color">
						<spring:message text="Color" />
					</form:label>
					<div class="col-lg-4 ">
						<form:input path="color" class="form-control"
							placeholder="Enter color" />
					</div>
				</div>
				<br>
				<br>
				<div class="form-group">
					<form:label class="col-lg-4 control-label" path="price">
						<spring:message text="Price" />
					</form:label>
					<div class="col-lg-4 ">
						<form:input type="number" path="price" class="form-control"
							placeholder="Enter price" />
						<form:errors style="color:red" path="price" />
					</div>
				</div>
				<br>
				<br>
				<div class="form-group">
					<form:label class="col-lg-4 control-label" path="image">
						<spring:message text="Image" />
					</form:label>
					<div class="col-lg-4 ">
						<form:input type="file" path="image" />
					</div>
				</div>
				<br>
				<br>
				<div class="form-group">
					<form:label class="col-lg-4 control-label" path="cat">
						<spring:message text="Catagory" />
					</form:label>
					<div class="col-lg-4 ">
						<form:select path="cat.name" class="form-control"
							items="${catagoryList}" itemLabel="name" itemValue="name"
							placeholder="Enter catagory" />
					</div>
				</div>
				<br>
				<br>
				<div class="form-group">
					<form:label class="col-lg-4 control-label" path="sup">
						<spring:message text="Supplier" />
					</form:label>
					<div class="col-lg-4 ">
						<form:select path="sup.name" items="${supplierList}"
							itemLabel="name" itemValue="name" class="form-control"
							placeholder="Enter supplier" />
					</div>
				</div>
				<br>
				<br>
				<div class="form-group">
					<form:label class="col-lg-4 control-label" path="quantity">
						<spring:message text="QUANTITY" />
					</form:label>
					<div class="col-lg-4 ">
						<form:input type="number" path="quantity" class="form-control"
							placeholder="Enter quantity" />
					</div>
				</div>
				<br>
				<br>
				<div class="form-group">
					<form:label class="col-lg-4 control-label" path="discription">
						<spring:message text="DISCRIPTION" />
					</form:label>
					<div class="col-lg-4 ">
						<form:textarea type="text" rows="6" max="500" path="discription"
							class="form-control" placeholder="Enter discription" />
						<form:errors style="color:red" path="discription" />
					</div>
				</div>
				<br>
				<div>
					<form:button onclick="myFunction()" class="btn btn-success">
						<spring:message text="Add Product" />
					</form:button>
					<form:button type="reset" class="btn btn-info">
						<spring:message text="Reset" />
					</form:button>
				</div>
			</form:form>
		</div>
		<script>
function myFunction() {
	  var x = confirm("Are you sure you want to add the product?");
      if (x)
          return true;
      else
        return false;

}
</script>
	</center>
	<center>
		<%@include file="Footer.jsp"%>
	</center>
</body>
</html>
