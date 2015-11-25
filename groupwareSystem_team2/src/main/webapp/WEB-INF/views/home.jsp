<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script language="javascript">
   // history.go(1);
</script> 
<%
response.setHeader("pragma", "no-cache");              
response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");             
response.setHeader("Expires", "0"); 
%> 	
	
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
      			<a class="navbar-brand" href="${pageContext.request.contextPath}/LoginController/logout.do">GruopwareSystem</a>
    		</div>

    		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      			<ul class="nav navbar-nav navbar-right">
        			<li><a href="https://tahiti.mju.ac.kr/moodle/">메뉴</a></li>
      			</ul>
    		</div>
  		</div>
	</nav>
		
	<form class="form-horizontal" action="${pageContext.request.contextPath}/LoginController/login.do"
			method="POST">
		<fieldset>
		<legend><h2><label class="col-sm-3 control-label">LOGIN</label></h2></legend>
			<div class="form-group"></div>
			<div class="form-group"></div>
			<div class="form-group"></div>
			<div class="form-group"></div>
			<div class="form-group">
				<label for="inputid" class="col-sm-4 control-label">ID</label>
				<input type="text" class="col-sm-5 form-control" style="width:200px;" name="user_id" placeholder="user_id">
			</div>			
			<div class="form-group">
      			<label for="inputPassword" class="col-sm-4 control-label">PW</label>
        		<input type="password" class="col-sm-5 form-control" style="width:200px;" name="user_password" placeholder="user_password">
    		</div>
			<div class="form-group">
        			<label class="col-sm-2 control-label"></label>
        			<button type="submit" class="btn btn-primary" style="width:100px;">Login</button>
        			<label class="col-sm-1 control-label"></label>
        			<button type="button" class="btn btn-default" onclick="location.replace('${pageContext.request.contextPath}/LoginController/signupPage?joincat=common')">일반직원 가입</button>
        			<label class="col-sm-1 control-label"></label>
        			<button type="button" class="btn btn-default" onclick="location.replace('${pageContext.request.contextPath}/LoginController/signupPage?joincat=developer')">개발자 가입</button>
    		</div>
  		</fieldset>
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
