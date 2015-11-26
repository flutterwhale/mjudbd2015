<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ page import="kr.ac.mju.prompt.model.UserInfo"%>
<%@ page import="kr.ac.mju.prompt.model.projectBean"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>

<%
	ArrayList<projectBean> allProject = (ArrayList<projectBean>) request.getAttribute("AllProject");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
		response.setHeader("pragma", "no-cache");
		response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
		response.setHeader("Expires", "0");
		 %>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ProjectTable</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
<script>
	$(document).ready(function() {
		$(".btn_present_project").click(function() {
			$(".project_post").hide();
			$(".project_present").show();
		});
		$(".btn_post_project").click(function() {
			$(".project_present").hide();
			$(".project_post").show();
		});
	});
</script>
</head>
<body>
	<div class="project_table_Wrapper">
		<div class="project_button">
			<button type="button" class="btn_present_project">현재 프로젝트</button>
			<button type="button" class="btn_post_project">과거 프로젝트</button>
		</div>
		<div class="project_present">
			<h1>현재 프로젝트</h1>
			<table class="project_present_table" border="1" width="1400px"
				height="300px">
				<tr align="center">
					<td width="70px">번호</td>
					<td width="200px">이름</td>
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
					System.out.println("등록된 프로젝트가 없습니다.");
					} else {

						for (projectBean c : allProject) {
				%>
				<form
					action="${pageContext.request.contextPath}/LectureController/deleteLecture"
					method="post">
					<%-- 	<input type="hidden" name="lecture_id" value=<%=c.getProject_Identifier()%>>
		<input type="hidden" name="user_id" value=<%=sID%>>
		<input type="hidden" name="lecture_name" value=<%=c.getLectureName()%>>
		<input type="hidden" name="hackjeom" value=<%=c.getHackjeom()%>> --%>

					<tr align="center">
						<td width="70px"><%=c.getProject_Identifier()%></td>
						<td width="200px"><%=c.getProject_Name()%></td>
						<td width="250px"><%=c.getStart_Date()%></td>
						<td width="250px"><%=c.getEnd_Date()%></td>
						<td width="300px"><%=c.getProject_Description()%></td>
						<td width="200px"><%=c.getDispatch_Location()%></td>
						<td width="200px"><%=c.getProjectmanager_Identifier()%>/<%=c.getPM_name()%></td>
						<td width="180px"><%=c.getStatus()%></td>
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
			<table class="project_post_table" border="1" width="1400px"
				height="300px">
				<tr>
					<td width="70px">번호</td>
					<td width="200px">이름</td>
					<td width="250px">일정</td>
					<td width="300px">설명</td>
					<td width="200px">파견 지역</td>
					<td width="200px">PM</td>
					<td width="180px">현재 상태</td>
				</tr>
				<tr>
					<td>aa</td>
					<td>aa</td>
					<td>aa</td>
					<td>aa</td>
					<td>aa</td>
					<td>aa</td>
					<td>aa</td>
				</tr>
				<tr>
					<td>b</td>
					<td>b</td>
					<td>b</td>
					<td>b</td>
					<td>b</td>
					<td>b</td>
					<td>b</td>
				</tr>
				<tr>
					<td>c</td>
					<td>c</td>
					<td>c</td>
					<td>c</td>
					<td>c</td>
					<td>c</td>
					<td>c</td>
				</tr>
				<tr>
					<td>d</td>
					<td>d</td>
					<td>d</td>
					<td>d</td>
					<td>d</td>
					<td>d</td>
					<td>d</td>
				</tr>
				<tr>
					<td>e</td>
					<td>e</td>
					<td>e</td>
					<td>e</td>
					<td>e</td>
					<td>e</td>
					<td>e</td>
				</tr>
				<tr>
					<td>f</td>
					<td>f</td>
					<td>f</td>
					<td>f</td>
					<td>f</td>
					<td>f</td>
					<td>f</td>
					</trf>
				<tr>
					<td>g</td>
					<td>g</td>
					<td>g</td>
					<td>g</td>
					<td>g</td>
					<td>g</td>
					<td>g</td>
				</tr>
				<tr>
					<td>h</td>
					<td>h</td>
					<td>h</td>
					<td>h</td>
					<td>h</td>
					<td>h</td>
					<td>h</td>
				</tr>
				<tr>
					<td>i</td>
					<td>i</td>
					<td>i</td>
					<td>i</td>
					<td>i</td>
					<td>i</td>
					<td>i</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="main_button">

		<button type="button"
			onclick="location.href='${pageContext.request.contextPath}/ProjectController/showProjectInformation'">프로젝트
		</button>

		<button type="button"
			onclick="location.replace('${pageContext.request.contextPath}/LoginController/main')">메인화면</button>

	</div>

</body>
</html>