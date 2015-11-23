<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>
	<h1>Login</h1>
	<table class = "container">
		<form
			action="${pageContext.request.contextPath}/LoginController/login.do"
			method="POST">

			<tr>
				<td width="70">ID</td>
				<td width="150"><input type="text" name="user_id"></td>
			</tr>
			<tr>
				<td width="70">PW</td>
				<td width="150"><input type="password" name="user_password"></td>

			</tr>
			<tr>
				<td width="70">
					<button type="submit">Login</button>
		</form>
		</td>
		<td><form
				action="${pageContext.request.contextPath}/LoginController/signupPage"
				method="POST">

				<button type="submit">Join</button>
			</form></td>
		</tr>



	</table>
	<P>
		The time on the server is ${serverTime}. </br> ID/PW 찾기 사내 번호 010 4906 4215
	</P>
</body>
</html>
