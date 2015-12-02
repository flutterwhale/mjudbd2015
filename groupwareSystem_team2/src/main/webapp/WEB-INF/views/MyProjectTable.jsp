<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="mapper.jsp"%>
<%@include file="session.jsp"%>
<%@ page import="kr.ac.mju.prompt.model.UserInfo"%>
<%@ page import="kr.ac.mju.prompt.model.userProjectBean"%>
<%@ page import="kr.ac.mju.prompt.model.signupBean"%>
<%@ page import="kr.ac.mju.prompt.model.UserBean"%>
<%@ page import="kr.ac.mju.prompt.model.projectBean"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>

<%
	ArrayList<userProjectBean> allProject = (ArrayList<userProjectBean>) request.getAttribute("AllProject");
	ArrayList<userProjectBean> pastProject = (ArrayList<userProjectBean>) request.getAttribute("PastProject");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%
	response.setHeader("pragma", "no-cache");
	response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
	response.setHeader("Expires", "0");
%>
<link rel="stylesheet"
	href="http://bootswatch.com/flatly/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>나의 프로젝트 목록</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
<script>
	$(document).ready(function() {
		$("#btn_present_project").click(function() {
			$(".project_post").hide();
			$(".project_present").show();
		});
		$("#btn_post_project").click(function() {
			$(".project_present").hide();
			$(".project_post").show();
		});
	});
</script>
<%
	signupBean showBean = (signupBean) request.getAttribute("showBean");
	session.setAttribute("showBean", showBean);
	projectBean pBean = (projectBean) request.getAttribute("projectInfo");
%>
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

	<div class="project_table_Wrapper" style="margin: 10px 40px;">
		<div class="project_button">
			<button id="btn_present_project" class="btn btn-default"
				type="button">내 현재 프로젝트</button>
			<button id="btn_post_project" class="btn btn-default" type="button">내
				과거 프로젝트</button>
		</div>
		<div class="project_present">
			<h1>현재 프로젝트</h1>
			<table class="table table-striped table-hover" border="1"
				width="1400px">
				<tr align="center">
					<td width="70px">번호</td>
					<td width="200px">이름</td>
					<td width="180px">내 역할</td>
					<td width="250px">시작 날짜</td>
					<td width="250px">종료 날짜</td>
					<td width="250px">시작 날짜</td>
					<td width="250px">종료 날짜</td>
					<td width="300px">설명</td>
					<td width="200px">파견 지역</td>
					<td width="200px">PM</td>
					<td width="180px">현재 상태</td>
				</tr>
				<%
					if (allProject.isEmpty()) {
				%>

				<h2>등록된 프로젝트가 없습니다.</h2>

				<%
					System.out.println("등록된 현재 프로젝트가 없습니다.");
					} else {

						for (userProjectBean c : allProject) {
				%>
				<form action="${pageContext.request.contextPath}/ " method="post">


					<tr align="center">
						<td width="70px"><%=c.getProject_Identifier()%></td>
						<td width="200px"><a
							href="${pageContext.request.contextPath}/ProjectController/showProjectInformation?pid=<%=c.getProject_Identifier()%>"><%=c.getProject_name()%></a></td>
						<td width="180px"><%=Project_Part.get(c.getProject_Role())%></td>
						<td width="250px"><%=c.getStart_Date()%></td>
						<td width="250px"><%=c.getEnd_Date()%></td>
						<td width="250px"><%=c.getrStart_Date()%></td>
						<td width="250px"><%=c.getrEnd_Date()%></td>
						<td width="300px"><%=c.getPproject_Description()%></td>
						<td width="200px"><%=c.getPdispatch_Location()%></td>
						<td width="200px"><a
							href='${pageContext.request.contextPath}/LoginController/retrieveUser?id=<%=c.getProjectmanager_Identifier()%>'><%=c.getProjectmanager_Identifier()%></a></td>
						<td width="180px"><%=Project_status_map.get(c.getPstatus())%></td>
					</tr>

				</form>
				<%
					}
					}
				%>
			</table>
		</div>
		<div class="project_post" style="display: none;">
			<h1>과거 프로젝트</h1>
			<table class="table table-striped table-hover" border="1"
				width="1400px">
				<tr align="center">
					<td width="70px">번호</td>
					<td width="200px">이름</td>
					<td width="180px">내 역할</td>
					<td width="250px">시작 날짜</td>
					<td width="250px">종료 날짜</td>
					<td width="300px">설명</td>
					<td width="200px">파견 지역</td>
					<td width="200px">PM</td>
					<td width="200px">고객 평가</td>
					<td width="180px">현재 상태</td>
				</tr>
				<%
					if (pastProject.isEmpty()) {
				%>

				<h2>등록된 프로젝트가 없습니다.</h2>

				<%
					System.out.println("등록된 과거 프로젝트가 없습니다.");
					} else {

						for (userProjectBean c : pastProject) {
				%>
				<form
					action="${pageContext.request.contextPath}/LectureController/deleteLecture"
					method="post">

					<tr align="center">
						<td width="70px"><%=c.getProject_Identifier()%></td>
						<td width="200px"><a
							href="${pageContext.request.contextPath}/ProjectController/showProjectInformation?pid=<%=c.getProject_Identifier()%>"><%=c.getProject_name()%></a></td>
						<td><%=c.getProject_Role()%></td>
						<td width="250px"><%=c.getStart_Date()%></td>
						<td width="250px"><%=c.getEnd_Date()%></td>
						<td width="250px"><%=c.getrStart_Date()%></td>
						<td width="250px"><%=c.getrEnd_Date()%></td>
						<td width="300px"><%=c.getPproject_Description()%></td>
						<td width="200px"><%=c.getPdispatch_Location()%></td>
						<td width="200px"><a
							href='${pageContext.request.contextPath}/LoginController/retrieveUser?id=<%=c.getProjectmanager_Identifier()%>'><%=c.getProjectmanager_Identifier()%></a></td>
						<td width="180px"><%=Project_status_map.get(c.getPstatus())%></td>
					</tr>

				</form>
				<%
					}
					}
				%>

			</table>
		</div>
		<div class="main_button" style="padding: 10px 0px;">

			<button class="btn btn-default" type="button"
				onclick="location.replace('${pageContext.request.contextPath}/LoginController/main')">메인화면</button>

		</div>
	</div>
	<div class="well well-sm">
		<p>The time on the server is ${serverTime}.</p>
	</div>
</body>
</html>