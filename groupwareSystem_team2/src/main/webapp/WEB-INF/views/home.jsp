<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>Home</title>
</head>
<body padding-top="40px" background="f5f5f5" margin="0">

	<div class="container" style="display: inline-block;text-align: center;">
		<form
			action="${pageContext.request.contextPath}/LoginController/login.do"
			method="POST">
			
			<h1>Groupware System Login </h1>
			
			<div class="form-group">
			<label class="form-label" for="user_id" >ID </label>
			<input type="text" name="user_id" placeholder="ID">
			</div>
			
			<div class="form-group">
			<label class="form-label" for="user_password">Password </label>
			<input type="password" name="user_password" placeholder="Password">
			</div>
			
			<div class="form-actions" >
				<button type="submit" class="btn btn-success" style="margin-right: 5px;">Login</button>
			</div>
		</form>
			<form
				action="${pageContext.request.contextPath}/LoginController/signupPage"
				method="POST">
				<button type="submit" class="btn btn-primary" style="margin-left: 5px;">Join</button>				
			</form>
			
	<P>
		The time on the server is ${serverTime}. </br> ID/PW 찾기 사내 번호 010 4906 4215
	</P>
	</div>
</body>
</html>
