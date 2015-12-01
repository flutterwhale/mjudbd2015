<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@include file="session.jsp"%>
<%@include file="mapper.jsp"%>
<%@ page import="kr.ac.mju.prompt.model.UserInfo"%>
<%@ page import="kr.ac.mju.prompt.model.projectBean"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>

<%-- <%
	ArrayList<projectBean> allProject = (ArrayList<projectBean>) request.getAttribute("AllProject");
	ArrayList<projectBean> pastProject = (ArrayList<projectBean>) request.getAttribute("PastProject");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%
	response.setHeader("pragma", "no-cache");
	response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
	response.setHeader("Expires", "0");
%> --%>
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
<title>프로젝트 개인일정</title>
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
				href="${pageContext.request.contextPath}/LoginController/main">GroupwareSystem</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="https://tahiti.mju.ac.kr/moodle/">메뉴</a></li>
			</ul>
		</div>
	</div>
	</nav>

	<div class="user_Schedule_Wrapper" style="margin: 10px 40px;">
		<div class="user_Schedule">
			<h1>개인 일정</h1>
			<table class="table table-striped table-hover" border="1"
				width="1470px">
				<tr align="center">
					<td width="70px">번호</td>
					<td width="200px">이름</td>
					<td width="200px">직급</td>
					<td width="200px">역할</td>
					<td width="200px">업무 내용</td>
					<td width="200px">시작일</td>
					<td width="200px">종료일</td>
					<td width="200px">편집</td>
				</tr>
				<tr align="center">
					<td>2</td>
					<td>박동현</td>
					<td>회장</td>
					<td>PM</td>
					<td>먹고놀기</td>
					<td><input type="date" id="start_date" name="start_date"
						min="${now}" max="2200-12-31" value=""></td>
					<td><input type="date" id="end_date" name="end_date"
						min="${now}" max="2200-12-31" value=""></td>
					<td><button type="submit" class="btn btn-success"
							style="margin: 5px" onclick="move();">수정</button>
						<button type="submit" class="btn btn-danger" style="margin: 5px"
							class="col-sm-6" onclick="del();">삭제</button></td>
				</tr>
				<tr align="center">
					<td colspan="8"><button type="button" class="btn btn-success" onclick="location.href='${pageContext.request.contextPath}/ProjectController/showUserScheduleAdd'">추가
					</button></td>
				</tr>
			</table>
		</div>
		<div class="main_button" style="padding: 10px 0px;">
		<button class="btn btn-default" type="button"
				onclick="history.back(-1)">프로젝트
				정보</button>
			<button class="btn btn-default" type="button"
				onclick="location.replace('${pageContext.request.contextPath}/LoginController/main')">메인화면</button>
			
		</div>
	</div>
	<div class="well well-sm">
		<p>The time on the server is ${serverTime}.</p>
	</div>
</body>
</html>