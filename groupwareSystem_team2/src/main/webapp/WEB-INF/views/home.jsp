<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="http://bootswatch.com/flatly/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>Home</title>
</head>
<body>
	<nav class="navbar navbar-default">
  		<div class="container-fluid">
    		<div class="navbar-header">
      			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        			<span class="sr-only">Toggle navigation</span>
        			<span class="icon-bar"></span>
        			<span class="icon-bar"></span>
        			<span class="icon-bar"></span>
      			</button>
      			<a class="navbar-brand" href="#">GruopwareSystem</a>
    		</div>

    		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      			<ul class="nav navbar-nav navbar-right">
        			<li><a href="#">DatabaseSystem Team Project</a></li>
      			</ul>
    		</div>
  		</div>
	</nav>
	
	<form class="form-horizontal" action="${pageContext.request.contextPath}/LoginController/login.do"
			method="POST">
		
			<h2>LOGIN</h2>
			<div class="form-group">
				<label for="inputid" class="col-lg-2 control-label">ID</label>
				<div class="col-lg-10">
					<input type="text" class="form-control" style="width:200px;" name="user_id" placeholder="user_id">
				</div>	
			</div>			
			<div class="form-group">
      			<label for="inputPassword" class="col-lg-2 control-label">PW</label>
      			<div class="col-lg-10">
        			<input type="password" class="form-control" style="width:200px;" name="user_password" placeholder="user_password">
        		</div>
    		</div>
			<div class="form-group">
      			<div class="col-lg-10 col-lg-offset-2">
        			<button type="submit" class="btn btn-primary" style="width:100px;">Login</button>
       			</div>
    		</div>
  		
	</form>
			
	<form action="${pageContext.request.contextPath}/LoginController/signupPage" method="POST">
		<input type="hidden" name="joincat" value="common"> 
		<button type="submit" class="btn btn-primary">Join</button>
	</form>
	<form action="${pageContext.request.contextPath}/LoginController/signupPage" method="POST">
		<input type="hidden"  name="joincat" value="developer"> 
		<button type="submit" class="btn btn-primary">Developer Join</button>
	</form>
	<div class = "well well-sm">
		<p>The time on the server is ${serverTime}.</p> 
		<p>ID/PW 찾기 사내 번호 010 4906 4215</p>
	</div>
</body>
</html>
