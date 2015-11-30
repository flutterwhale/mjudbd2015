
<%@page import="kr.ac.mju.prompt.model.obtainBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.ac.mju.prompt.model.UserInfo"%>
<%@ page import="kr.ac.mju.prompt.model.UserBean"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>

<%
	obtainBean oBean = (obtainBean) request.getAttribute("obtainBean");
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="http://bootswatch.com/flatly/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>프로젝트 개인 평가</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
</head>
<body>
	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand"
				href="${pageContext.request.contextPath}/LoginController/main">GruopwareSystem</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="https://tahiti.mju.ac.kr/moodle/">메뉴</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<div class="project_user_evaluation_wrapper" style="margin: 10px 40px;">
		<h1>프로젝트 개인 평가</h1>

		<div class="project_user_evaluation_information">
			<table class="table table-striped table-hover" border="1"
				width="700px">
				<tr align="center">
					<td width="70px">번호</td>
					<td width="200px">이름</td>
					<td width="200px">직급</td>
					<td width="200px">역할</td>
					<td width="400px">평가</td>
					<td width="150px">평가점수(5점만점)</td>
				</tr>
				<tr align="center">
					<td>2</td>
					<td>박동현</td>
					<td>회장</td>
					<td>PM</td>
					<td><input type="text" style="width:300px;"></td>
					<td><select name="Evaluation" class="form-control">
							<option value="10">1</option>
							<option value="20">2</option>
							<option value="30">3</option>
							<option value="40">4</option>
							<option value="50">5</option>
					</select></td>
				</tr>
				<tr align="center">
					<td>3</td>
					<td>박박박</td>
					<td>장장</td>
					<td>개발자</td>
					<td><input type="text" style="width:300px;"></td>
					<td><select name="Evaluation" class="form-control">
							<option value="10">1</option>
							<option value="20">2</option>
							<option value="30">3</option>
							<option value="40">4</option>
							<option value="50">5</option>
					</select></td>
				</tr>
			</table>
		</div>
		<div class="main_button">
			<button type="submit" class="btn btn-success" style="margin: 5px"
				onclick="move();">등록</button>
		</div>

		<div class="Project_Information_button" style="padding: 10px 0px;">
			<button type="button" class="btn btn-primary"
				onclick="history.back(-1)">프로젝트
				정보</button>

			<button type="button" class="btn btn-default"
				onclick="location.replace('${pageContext.request.contextPath}/LoginController/main')">메인화면</button>
		</div>
	</div>

</body>
</html>