<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
</head>
<body id="log" style="background-color:  #FFCCCC">
<%@include file="/WEB-INF/views/Header.jsp"%>

<font face="Harlow Solid Italic"><h1>${successMessage}</h1></font>
		<font face="Harlow Solid Italic"><h1>${errorMessage}</h1></font> <font
		face="Harlow Solid Italic"><h1>${logincart}</h1></font> <font
		face="Harlow Solid Italic"><h1>${loginbuy}</h1></font>

		<center>
			<font face="Harlow Solid Italic"><h1>Sign-in</h1></font> <br> <br>
			<br> <br> <br> <br>
			<div class="container">
				<form action="login" method="post" class="form-horizontal"
					role="form">
					<center>
						<div class="form-group">
							<label class="col-lg-4 control-label">User Name</label>
							<div class="col-lg-4 ">
								<input class="form-control" type="text" name="username"
									placeholder="Enter user name as abc@example.com" required="true"
									title="should not be empty" />
							</div>
						</div>
						<br> <br>
						<div class="form-group">
							<label class="col-lg-4 control-label">Password</label>
							<div class="col-lg-4 ">
								<input class="form-control" type="password" name="password"
									placeholder="Enter password" required="true"
									title="should not be empty" />
							</div>
						</div>
						<br> <br>
					</center>
					<div class="checkbox">
						<label><input type="checkbox"> Remember me</label>
					</div>
					<br>
					<div>
						<input type="submit" class="btn btn-success" /> <input
							type="reset" class="btn btn-info" />
					</div>
					<br>
					<div>
						<font size=10><a href="reg"><input type="button"
								class="btn btn-link" />new user?</a></font>
					</div>
					<input type="hidden" name="${_csrf.parameterName }"
						value="${_csrf.token}" />
				</form>
			</div>
		</center>
	</font>
	<%@include file="Footer.jsp"%>
</body>
</html>