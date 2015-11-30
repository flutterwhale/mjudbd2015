<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@include file="session.jsp"%>
<%@include file="mapper.jsp"%>
<%@ page import="kr.ac.mju.prompt.model.signupBean"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>

<%
	ArrayList<signupBean> unapproved_list = (ArrayList<signupBean>) request.getAttribute("unapproved_list");
	ArrayList<signupBean> allList = (ArrayList<signupBean>) request.getAttribute("allList");
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
<title>인사 관리</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
<script>
	$(document).ready(function() {
		$("#btn_move_department").click(function() {
			$(".unapproved").hide();
			$(".move_department").show();
		});
		$("#btn_unapproved").click(function() {
			$(".move_department").hide();
			$(".unapproved").show();
		});
	});
</script>
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

	<div class="member_management_Wrapper" style="margin: 10px 40px;">
		<div class="_button">
			<button id="btn_move_department" class="btn btn-default"
				type="button">부서 이동</button>
			<button id="btn_unapproved" class="btn btn-default" type="button">가입
				대기</button>
		</div>
		<div class="move_department">
			<h1>부서 이동</h1>
			<table class="table table-striped table-hover" border="1"
				width="1070px">
				<tr align="center">
					<td width="70px">번호</td>
					<td width="200px">이름</td>
					<td width="200px">직급</td>
					<td width="200px">부서</td>
					<td width="200px">권한</td>
					<td width="100px">개발자 여부</td>
					<td width="200px">완료</td>
				</tr>

				<%
					for (signupBean c : allList) {
				%>
				<form
					action="${pageContext.request.contextPath}/ProjectController/moveDepart "
					method="post">
				<tr align="center">

					<td width="70px"><a
						href='${pageContext.request.contextPath}/LoginController/retrieveUser?id=<%=c.getId()%>'><%=c.getId()%></a><input type="hidden" name="uid"
						value="<%=c.getId()%>"></td>
					<td width="200px"><%=c.getName()%></td>
					<td width="200px"><%=c.getPosition_Name()%><select name="po"
						class="form-control">
							<option value="10">사장</option>
							<option value="11">부사장</option>
							<option value="12">상무</option>
							<option value="13">이사</option>
							<option value="14">부장</option>
							<option value="15">차장</option>
							<option value="16">과장</option>
							<option value="17">대리</option>
							<option value="18">주임</option>
							<option value="19">사원</option>
					</select></td>
					<td width="200px"><%=c.getDi()%><select name="di"
						class="form-control">
							<option value="10">영업부</option>
							<option value="11">마케팅팀</option>
							<option value="12">경영지원부</option>
							<option value="13">총무팀</option>
							<option value="14">회계팀</option>
							<option value="15">인사관리팀</option>
							<option value="16">연구 개발팀</option>
							<option value="17">개발팀</option>
					</select></td>
					<td width="200px"><%=c.getPermission()%><select name="pe"
						class="form-control">
							<option value="10">경영진</option>
							<option value="11">PM</option>
							<option value="12">PL</option>
							<option value="13">프로젝트 투입 직원</option>
					</select></td>
					<td> <%=c.getIsFreeLancer()==null?"일반":"개발자" %></td>
					<td width="200px"><button class="btn btn-default"
							type="submit">수정완료</button></td>
				</tr>

				</form>
				<%
					}
				%>
			</table>
		</div>
		<div class="unapproved" style="display: none;">
			<h1>가입 대기</h1>
			<table class="table table-striped table-hover" border="1"
				width="1070px">
				<tr align="center">
					<td width="70px">번호</td>
					<td width="200px">이름</td>
					<td width="200px">직급</td>
					<td width="200px">부서</td>
					<td width="200px">권한</td>
					<td width="100px">개발자 여부</td>
					<td width="200px">완료</td>
				</tr>
				<%
					if (unapproved_list.isEmpty()) {
				%>

				<h2>등록된 프로젝트가 없습니다.</h2>

				<%
					System.out.println("등록된 과거 프로젝트가 없습니다.");
					} else {

						for (signupBean c : unapproved_list) {
				%>

				<form
					action="${pageContext.request.contextPath}/ProjectController/moveDepart "
					method="post">
				<tr align="center">

					<td width="70px"><a
						href='${pageContext.request.contextPath}/LoginController/retrieveUser?id=<%=c.getId()%>'><%=c.getId()%></a><input type="hidden" name="uid"
						value="<%=c.getId()%>"></td>
					<td width="200px"><%=c.getName()%></td>
					<td width="200px"><%=c.getPosition_Name()%><select name="po"
						class="form-control">
							<option value="10">사장</option>
							<option value="11">부사장</option>
							<option value="12">상무</option>
							<option value="13">이사</option>
							<option value="14">부장</option>
							<option value="15">차장</option>
							<option value="16">과장</option>
							<option value="17">대리</option>
							<option value="18">주임</option>
							<option value="19">사원</option>
							<option value="99">프리랜서</option>
					</select></td>
					<td width="200px"><%=c.getDi()%><select name="di"
						class="form-control">
							<option value="10">영업부</option>
							<option value="11">마케팅팀</option>
							<option value="12">경영지원부</option>
							<option value="13">총무팀</option>
							<option value="14">회계팀</option>
							<option value="15">인사관리팀</option>
							<option value="16">연구 개발팀</option>
							<option value="17">개발팀</option>
					</select></td>
					<td width="200px"><%=c.getPermission()%><select name="pe"
						class="form-control">
							<option value="10">경영진</option>
							<option value="11">PM</option>
							<option value="12">PL</option>
							<option value="13">프로젝트 투입 직원</option>
					</select></td>
					<td> <%if(c.getIsFreeLancer().equals("common")){ %>개발자<% }else if(c.getIsFreeLancer().equals("FreeLancer")){%>프리랜서<%}else{ %>일반<%} %></td>
					<td width="200px"><button class="btn btn-default"
							type="submit"
							onclick="location.replace('${pageContext.request.contextPath}/ProjectController/showMemberManagement')">수정완료</button>
					</td>
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