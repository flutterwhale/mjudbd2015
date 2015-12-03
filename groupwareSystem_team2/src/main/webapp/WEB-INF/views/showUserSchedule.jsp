<%@page import="kr.ac.mju.prompt.model.PscheduleBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@include file="session.jsp"%>
<%@include file="mapper.jsp"%>
<%@ page import="kr.ac.mju.prompt.model.UserInfo"%>
<%@ page import="kr.ac.mju.prompt.model.UscheduleBean"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%
	UscheduleBean c = (UscheduleBean) request.getAttribute("UserSchedule");

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
<title>프로젝트 일정 관리</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript">
	function move() {
		if (confirm('수정 합니다.')) {
			document.frm.submit();
		}
	}

	function del() {
		if (confirm('선택한 PM으로 프로젝트를 추가합니다.')) {
			document.frm.submit();
		}
	}
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



	<div class="project_Schedule_Wrapper" style="margin: 10px 40px;">
		<div class="project_Schedule">

			<%
				System.out.println("sid " + request.getParameter("sid") + now);
			%>

			<h1>
				개인 일정 관리 /
				<%=request.getParameter("sid")%>/<%=request.getParameter("pid")%>
			</h1>
			<form name="frm" id="frm"
				action='${pageContext.request.contextPath}/ProjectController/UpdateUserSchedule'
				method="POST">
				<table class="table table-striped table-hover" border="1"
					width="1270px">
					<tr align="center">
						<td width="200px">일정 이름</td>
						<td width="100px">이름</td>
						<td width="200px">시작일</td>
						<td width="200px">종료일</td>
						<td width="200px">진행률</td>
					</tr>
					<tr align="center">


						<input type="hidden" name="pid"
							value="<%=request.getParameter("pid")%>">


						<input type="hidden" name="sid"
							value="<%=c.getUser_Schedule_Identifier()%>">
						<input type="hidden" name="role" value="<%=c.getProject_Role()%>">

						<td><input type="text" name="workname"
							value="<%=c.getWork_Name()%>"></td>
						<td><input type="text" value="<%=c.getUser_Identifier()%>"
							readonly="readonly" name="uid"></td>
						<td><input type="date" id="start_date" name="Start_date"
							min="1990-12-31" max="2200-12-31" value="<%=c.getStart_Date()%>"></td>
						<td><input type="date" id="end_date" name="End_date"
							max="2200-12-31" value="<%=c.getEnd_Date()%>"></td>

						<td><input type="text" name="Progress_Percentage"
							value="<%=c.getProgress_Percentage()%>">%</td>

					</tr>
					<tr>

						<td colspan="5"><textarea form="frm" name="contents"
								style="width: 100%; height: 200px"> <%=c.getWork_descriptions()%></textarea></td>
					</tr>

				</table>



				<button type="submit" class="btn btn-success" onclick="move();">일정
					수정</button>
				<button type="button" class="btn btn-danger"
					onclick="location.href='${pageContext.request.contextPath}/ProjectController/deleteUserSchedule?sid=<%=request.getParameter("sid") %>&pid=<%=request.getParameter("pid")%>'">일정
					삭제</button>
					
			</form>


		</div>
		<div class="main_button" style="padding: 10px 0px;">
			<button class="btn btn-default" type="button"
				onclick="javascript:history.back();">프로젝트 정보</button>

			<button class="btn btn-default" type="button"
				onclick="location.replace('${pageContext.request.contextPath}/LoginController/main')">메인화면</button>

		</div>
	</div>
	<div class="well well-sm">
		<p>The time on the server is ${serverTime}.</p>
	</div>
</body>
</html>