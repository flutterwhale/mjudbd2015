<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@include file="mapper.jsp"%>
	<%@include file="session.jsp"%>
<%@ page import="kr.ac.mju.prompt.model.UserInfo"%>
<%@ page import="kr.ac.mju.prompt.model.UserBean"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@ page import="java.util.Date" %>
<jsp:useBean id="loginbean" class="kr.ac.mju.prompt.model.UserBean"
		scope="session" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://bootswatch.com/flatly/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main</title>
</head>
<body>
<%
		response.setHeader("pragma", "no-cache");
		response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
		response.setHeader("Expires", "0");

		if (session.getAttribute("session_name") == null) {
			System.out.println("session is null : ");
	%>
	<script language="javascript">
		location.replace('main');
	</script>

	<%
		} else {
	%>
	

	<%
		System.out.println("=============== main.jsp ===============");
		System.out.println("code : " + session.getAttribute("code"));
			System.out.println("session_cat : " + session.getAttribute("cat"));
			if (session.getAttribute("code").equals("0")) {
				//로그인 성공 
				//System.out.println("session_name : " + session.getAttribute("session_name"));
				UserInfo ui = (UserInfo) session.getAttribute("userinfo");

				UserBean myuser = ui.getMyUser();
				BeanUtils.copyProperties(loginbean, myuser);
	%>
	<nav class="navbar navbar-default">
  		<div class="container-fluid">
    		<div class="navbar-header">
      			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        			<span class="sr-only">Toggle navigation</span>
        			<span class="icon-bar"></span>
        			<span class="icon-bar"></span>
        			<span class="icon-bar"></span>
      			</button>
      			<a class="navbar-brand" href="${pageContext.request.contextPath}/LoginController/main">GroupwareSystem</a>
    		</div>

    		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      			<ul class="nav navbar-nav navbar-right">
        			<li><a href="https://tahiti.mju.ac.kr/moodle/">메뉴</a></li>
      			</ul>
    		</div>
  		</div>
	</nav>

	<div class="container">
		<div style="float: left; margin: 10px 40px;">
			<table class="table table-striped table-hover" style="width: 300px;">
				<tr>
					<td>ID</td>
					<td><jsp:getProperty property="id" name="loginbean" /></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><jsp:getProperty property="name" name="loginbean" /></td>
				</tr>
				<tr>
					<td>직급</td>
					<td><%=Position_map.get(loginbean.getPosition_Name())%></td>

				</tr>


				<%
					if (myuser.getDi() == 17 || myuser.getDi() == 99) {
				%>
				<tr>
					<td>권한</td>
					<td><%=Permission_map.get(loginbean.getPermission())%></td>
				</tr>
				<%
					}
				%>

				<tr>
					<td>부서</td>
					<td><%=Depart_map.get(loginbean.getDi())%></td>
				</tr>
				<tr>
					<td colspan=2 align=center><button type="button"
							class="btn btn-danger" style="margin: 5px"
							onclick="location.href='${pageContext.request.contextPath}/LoginController/logout.do'">로그아웃</button></td>
				</tr>
				<tr>
					<td colspan=2 align=center><%=now%>.</td>
				</tr>
			</table>
		</div>
		<div style="float: letf">
			<button class="btn btn-primary" style="width: 200px; margin: 10px;"
				type="button"
				onclick="location.href='${pageContext.request.contextPath}/LoginController/showMemberPage'">개인
				정보</button>



			<button class="btn btn-primary" style="width: 200px; margin: 10px;"
				type="button"
				onclick="location.href='${pageContext.request.contextPath}/ProjectController/showDirectory'">인명부
			</button>
			<%-- <button class="btn btn-primary" style="width:200px; margin:10px;" type="button"
		onclick="location.href='${pageContext.request.contextPath}/ProjectController/memberManagement'">인사관리</button>
	<button class="btn btn-primary" style="width:200px; margin:10px;" type="button"
		onclick="location.href='${pageContext.request.contextPath}/ProjectController/showProjectTable'">프로젝트
	</button>
	<button class="btn btn-primary" style="width:200px; margin:10px;" type="button"
		onclick="location.href='${pageContext.request.contextPath}/ProjectController/showObtainTable'">수주
		현황</button>
		
		
		
		<button class="btn btn-primary" style="width:200px; margin:10px;" type="button"
		onclick="location.href='${pageContext.request.contextPath}/ProjectController/showMyProjectTable'">프로젝트
		관리</button><!-- 임시 권한 부여임. --> --%>
			<%
				if (loginbean.getPermission() == 11) { // PM 권한
							System.out.println(loginbean.getPermission() + ": PM 권한 로그인");
			%>


			<!--  button class="btn btn-primary" style="width:200px; margin:10px;" type="button"
		onclick="location.href='${pageContext.request.contextPath}/ProjectController/showMyProjectTable'">프로젝트
		관리</button-->

			<%
				} else if (loginbean.getPermission() == 12) {//PL 권한
							System.out.println(loginbean.getPermission() + ": PL 권한 로그인");
			%>


			<!-- button class="btn btn-primary" style="width:200px; margin:10px;" type="button"
		onclick="location.href='${pageContext.request.contextPath}/ProjectController/showMyProjectTable'">프로젝트
		관리</button-->



			<%
				} else if (loginbean.getPermission() == 13) { //개발자
							System.out.println(loginbean.getPermission() + ": 개발자 상태 로그인(프로젝트 투입 직원 권한 )");
			%>
			<!--  button class="btn btn-primary" style="width:200px; margin:10px;" type="button"
		onclick="location.href='${pageContext.request.contextPath}/ProjectController/showMyProjectTable'">프로젝트
		관리</button-->
			<%
				}
						if (loginbean.getDi() == 10) { // 경영진 메뉴
							System.out.println(loginbean.getPermission() + ": 경영진 메뉴");
							//수주현황
							//모든 프로젝트
			%>
			<button class="btn btn-primary" style="width: 200px; margin: 10px;"
				type="button"
				onclick="location.href='${pageContext.request.contextPath}/ProjectController/showObtainTable'">수주
				현황</button>

			<button class="btn btn-primary" style="width: 200px; margin: 10px;"
				type="button"
				onclick="location.href='${pageContext.request.contextPath}/ProjectController/showProjectTable'">프로젝트
			</button>


			<%
				} else if (loginbean.getDi() == 12) { //영업부 메뉴
			%>
			<button class="btn btn-primary" style="width: 200px; margin: 10px;"
				type="button"
				onclick="location.href='${pageContext.request.contextPath}/ProjectController/showObtainTable'">수주
				현황</button>
			<%
				
			%>

			<%
				} else if (loginbean.getDi() == 15) { // 인사관리팀 메뉴
			%>
			<button class="btn btn-primary" style="width: 200px; margin: 10px;"
				type="button"
				onclick="location.href='${pageContext.request.contextPath}/ProjectController/memberManagement'">인사관리</button>
			<%
				//인사 관리
						} else if (loginbean.getDi() == 13) {//총무팀 메뉴
							//프로젝트 관리?
			%>


	
			<%
				} else if (loginbean.getDi() == 17) { //개발팀
							//프로젝트
			%>
			<button class="btn btn-primary" style="width: 200px; margin: 10px;"
				type="button"
				onclick="location.href='${pageContext.request.contextPath}/ProjectController/showMyProjectTable'">프로젝트
				관리</button>

			<%
				}
						if (loginbean.getPosition_Name() == 0 || loginbean.getDi() == 0) { //가입 대기 상태 

				System.out.println(loginbean.getPermission() + ": 가입 대기 상태 로그인");
	%>
	<p>가입 대기 상태 입니다. 인사관리부의 승인을 기다립니다.</p>

	<%
		} else { //가입 대기가 아니라면?
				System.out.println(loginbean.getPermission() + ": 일반 직원 로그인, 공통 메뉴 보임");

				if (loginbean.getPosition_Name() == 99) { // 외부인력팀

								System.out.println(loginbean.getPermission() + ": 프리랜서(외부인력팀) 로그인");
			%>
<!-- 			<button class="btn btn-primary" style="width: 200px; margin: 10px;">메신저</button> -->
			<%
				} else {
			%>

			<!-- 공통 메뉴 -->

			<!-- 	<button class="btn btn-primary" style="width:200px; margin:10px;">전자결재</button>
	<button class="btn btn-primary" style="width:200px; margin:10px;">메신저</button>
	<button class="btn btn-primary" style="width:200px; margin:10px;">게시판</button> -->
			<%
				} // 외부 인력 아닌 기본 공통 메뉴

						} //가입 대기 아닌 경우 끝
					}
				} // session 유효한가?
			%>
		</div>
	</div>
</div>
	<div class = "well well-sm">
		<p>The time on the server is  <%= now %>.</p> 
	</div>
</body>
