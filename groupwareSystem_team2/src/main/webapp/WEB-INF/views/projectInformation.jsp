<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.ac.mju.prompt.model.UserInfo"%>
<%@ page import="kr.ac.mju.prompt.model.UserBean"%>
<%@ page import="kr.ac.mju.prompt.model.projectBean"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
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
<title>Project</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>

<%
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
	<%
		if (session.getAttribute("session_name").equals(pBean.getProjectmanager_Identifier())) {
	%>
	<!-- PM 화면 -->
	<div class="project_wrapper" style="margin: 10px 40px;">
		<h1><%=pBean.getProject_Identifier()%>
			/
			<%=pBean.getProject_Name()%></h1>
		<div class="project_information">
			<table class="table table-striped table-hover" width="920px">
				<tr>
					<th width="170px">프로젝트 개요</th>
					<td width="750px"><textarea name="Project_Description"><%=pBean.getProject_Description()%></textarea>
					</td>
				</tr>
				<tr>
					<th>프로젝트 일정</th>
					<td>시작 날짜<input type="text" name="startDate"
						value="<%=pBean.getStart_Date()%>" ></td>
					<td>종료 날짜<input type="text" name="endDate"
						value="<%=pBean.getEnd_Date()%>" ></td>
				</tr>
				<tr>
					<th>부가 설명</th>
					<td><textarea name="comment"><%=pBean.getComment()%></textarea></td>
				</tr>
				<tr>
					<th>예산</th>
					<td><input type="text" name="price"
						value="<%=pBean.getProject_Price()%>" ></td>
				</tr>
				<tr>
					<th>진행 상태</th>
					<td><input type="text" name="status"
						value="<%=pBean.getStatus()%>" ></td>
				</tr>
				<tr>
					<th>파견 지역</th>
					<td><input type="text" name="location"
						value="<%=pBean.getDispatch_Location()%>"></td>
				</tr>
				<tr>
					<th>PM</th>
					<td><input type="text" name="pm_id"
						value="<%=pBean.getProjectmanager_Identifier()%>"
						readonly="readonly">/<input type="text" name="pm_name"
						value="<%=pBean.getPM_name()%>" readonly="readonly"></td>
				</tr>
			</table>
		</div>
		<button class="btn btn-primary" type="button">[PM 전용] 프로젝트 정보
			수정버튼</button>
		<div class="project_schedule">
			<h3>프로젝트 일정</h3>
			<button class="btn btn-primary" type="button">[PM 전용]일정 추가</button>
			<table class="table table-striped table-hover" border="1"
				width="920px">
				<tr>
					<th width="70px">schedule_ID</th>
					<td width="130px">일정 이름</td>
					<tD width="150px">업무 내용</td>
					<td width="170px">시작 날짜</td>
					<td width="150px">종료 날짜</td>
					<td width="250px">현재 상태</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
			<h3>개인 일정</h3>
			<table class="table table-striped table-hover" border="1"
				width="920px">
				<tr>
					<th width="70px">schedule_ID</th>
					<td width="130px">일정 이름</td>
					<tD width="150px">업무 내용</td>
					<td width="170px">시작 날짜</td>
					<td width="150px">종료 날짜</td>
					<td width="250px">현재 상태</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
		<div class="project_user">
			<h3>투입 인력</h3>
			<button class="btn btn-primary" type="button">[PM 전용] 인원 추가
				버튼</button>
			<table class="table table-striped table-hover" border="1"
				width="920px">
				<tr>
					<th width="70px">UID</th>
					<th width="130px">이름</th>
					<th width="150px">업무</th>
					<th width="170px">부서</th>
					<th width="150px">역할</th>
					<th width="250px">일정</th>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
		<div class="project_product">
			<h3>프로젝트 문서</h3>
			<table class="table table-striped table-hover" border="1"
				width="920px">
				<tr>
					<th width="150px">번호</th>
					<th width="320px">문서 이름</th>
					<th width="250px">업로드 날짜</th>
					<th width="200px">작성자</th>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th width="150px">문서 등록</th>
					<td colspan="3"><input type="file" id="portfolio"
						name="portfolio"></td>
				</tr>
			</table>
		</div>
		<div class="project_Evaluation">
			<h3>프로젝트 인원 평가(완료 상태 일때)</h3>
			<table class="table table-striped table-hover" border="1"
				width="920px">
				<tr>
					<th width="100px">번호</th>
					<th width="140px">평가자</th>
					<th width="140px">피평가자</th>
					<th width="360px">내용</th>
					<th width="180px">평가일자</th>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
		<div class="project_code">
			<h3>프로젝트 산출물</h3>
			<table class="table table-striped table-hover" border="1"
				width="920px">
				<tr>
					<th width="150px">번호</th>
					<th width="320px">산출물 이름</th>
					<th width="250px">업로드 날짜</th>
					<th width="200px">작성자</th>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th width="150px">파일 등록</th>
					<td colspan="3"><input type="file" id="product" name="product"></td>
				</tr>
			</table>
		</div>


		<div class="projectTable_button">
			<button class="btn btn-primary" type="button"
				onclick="location.href='${pageContext.request.contextPath}/ProjectController/showProjectTable'">프로젝트
				목록</button>
			<button class="btn btn-primary" type="button">[PM 전용] 내 프로젝트
				목록</button>

			<button class="btn btn-primary" type="button"
				onclick="location.replace('${pageContext.request.contextPath}/LoginController/main')">메인화면</button>
		</div>
	</div>
	<%
		} else if (true) {
	%>
	<!--  PL 일 때  -->
	<div class="project_wrapper" style="margin: 10px 40px;">
		<h1><%=pBean.getProject_Identifier()%>
			/
			<%=pBean.getProject_Name()%></h1>
		<div class="project_information">
			<table class="table table-striped table-hover" width="920px">
				<tr>
					<th width="170px">프로젝트 개요</th>
					<td width="750px"><textarea name="Project_Description"><%=pBean.getProject_Description()%></textarea>
					</td>
				</tr>
				<tr>
					<th>프로젝트 일정</th>
					<td>시작 날짜 <%=pBean.getStart_Date()%> ~ 종료 날짜<%=pBean.getEnd_Date()%></td>
				</tr>
				<tr>
					<th>부가 설명</th>
					<td><textarea name="Project_Comment"><%=pBean.getComment()%></textarea></td>
				</tr>
				<tr>
					<th>예산</th>
					<td><%=pBean.getProject_Price()%></td>
				</tr>
				<tr>
					<th>파견 지역</th>
					<td><%=pBean.getDispatch_Location()%></td>
				</tr>
				<tr>
					<th>PM</th>
					<td><%=pBean.getProjectmanager_Identifier()%> / <%=pBean.getPM_name()%></td>
				</tr>
				<tr>
					<th>진행 상태</th>
					<td><%=pBean.getStatus()%></td>
				</tr>
			</table>
		</div>
		<div class="project_schedule">
			<h3>프로젝트 일정</h3>
			<table class="table table-striped table-hover" border="1"
				width="920px">
				<tr>
					<th width="70px">schedule_ID</th>
					<td width="130px">일정 이름</td>
					<tD width="150px">업무 내용</td>
					<td width="170px">시작 날짜</td>
					<td width="150px">종료 날짜</td>
					<td width="250px">현재 상태</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
			<h3>개인 일정</h3>
			<table class="table table-striped table-hover" border="1"
				width="920px">
				<tr>
					<th width="70px">schedule_ID</th>
					<td width="130px">일정 이름</td>
					<tD width="150px">업무 내용</td>
					<td width="170px">시작 날짜</td>
					<td width="150px">종료 날짜</td>
					<td width="250px">현재 상태</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
			<button class="btn btn-primary" type="button">[PL 전용]개인 일정
				추가</button>
		</div>
		<div class="project_user">
			<h3>투입 인력</h3>

			<table class="table table-striped table-hover" border="1"
				width="920px">
				<tr>
					<th width="70px">UID</th>
					<th width="130px">이름</th>
					<th width="150px">업무</th>
					<th width="170px">부서</th>
					<th width="150px">역할</th>
					<th width="250px">일정</th>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
		<div class="project_product">
			<h3>프로젝트 문서</h3>
			<table class="table table-striped table-hover" border="1"
				width="920px">
				<tr>
					<th width="150px">번호</th>
					<th width="320px">문서 이름</th>
					<th width="250px">업로드 날짜</th>
					<th width="200px">작성자</th>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th width="150px">문서 등록</th>
					<td colspan="3"><input type="file" id="document"
						name="document"></td>
				</tr>
			</table>
		</div>

		<div class="project_code">
			<h3>프로젝트 산출물</h3>
			<table class="table table-striped table-hover" border="1"
				width="920px">
				<tr>
					<th width="150px">번호</th>
					<th width="320px">산출물 이름</th>
					<th width="250px">업로드 날짜</th>
					<th width="200px">작성자</th>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th width="150px">파일 등록</th>
					<td colspan="3"><input type="file" id="product" name="product"></td>
				</tr>
			</table>
		</div>


		<div class="projectTable_button">
			<button class="btn btn-primary" type="button"
				onclick="location.href='${pageContext.request.contextPath}/ProjectController/showProjectTable'">프로젝트
				목록</button>
			<button class="btn btn-primary" type="button">[PL 전용] 내 프로젝트
				목록</button>

			<button class="btn btn-primary" type="button"
				onclick="location.replace('${pageContext.request.contextPath}/LoginController/main')">메인화면</button>
		</div>
	</div>
	<!--  일반 권한  -->
	<%
		} else {
	%>
	<div class="project_wrapper" style="margin: 10px 40px;">
		<h1><%=pBean.getProject_Identifier()%>
			/
			<%=pBean.getProject_Name()%></h1>
		<div class="project_information">
			<table class="table table-striped table-hover" width="920px">
				<tr>
					<th width="170px">프로젝트 개요</th>
					<td width="750px"><textarea name="Project_Description"><%=pBean.getProject_Description()%></textarea>
					</td>
				</tr>
				<tr>
					<th>프로젝트 일정</th>
					<td>시작 날짜 <%=pBean.getStart_Date()%> ~ 종료 날짜<%=pBean.getEnd_Date()%></td>
				</tr>
				<tr>
					<th>부가 설명</th>
					<td><textarea name="Project_Comment"><%=pBean.getComment()%></textarea></td>
				</tr>
				<tr>
					<th>예산</th>
					<td><%=pBean.getProject_Price()%></td>
				</tr>
					<tr>
					<th>파견 지역</th>
					<td><%=pBean.getDispatch_Location()%></td>
				</tr>
				<tr>
					<th>PM</th>
					<td><%=pBean.getProjectmanager_Identifier()%> / <%=pBean.getPM_name()%></td>
				</tr>
				<tr>
					<th>진행 상태</th>
					<td><%=pBean.getStatus()%></td>
				</tr>
			</table>
		</div>
		<div class="project_schedule">
			<h3>프로젝트 일정</h3>
			<table class="table table-striped table-hover" border="1"
				width="920px">
				<tr>
					<th width="70px">schedule_ID</th>
					<td width="130px">일정 이름</td>
					<td width="150px">업무 내용</td>
					<td width="170px">시작 날짜</td>
					<td width="150px">종료 날짜</td>
					<td width="250px">현재 상태</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
			<h3>프로젝트 세부 일정</h3>
			<table class="table table-striped table-hover" border="1"
				width="920px">
				<tr>
					<th width="70px">schedule_ID</th>
					<td width="130px">일정 이름</td>
					<td width="150px">업무 내용</td>
					<td width="170px">시작 날짜</td>
					<td width="150px">종료 날짜</td>
					<td width="250px">현재 상태</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
		<div class="project_user">
			<h3>투입 인력</h3>
			<table class="table table-striped table-hover" border="1"
				width="920px">
				<tr>
					<th width="70px">UID</th>
					<th width="130px">이름</th>
					<th width="150px">업무</th>
					<th width="170px">부서</th>
					<th width="150px">역할</th>
					<th width="250px">일정</th>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
		<div class="project_product">
			<h3>프로젝트 문서</h3>
			<table class="table table-striped table-hover" border="1"
				width="920px">
				<tr>
					<th width="150px">번호</th>
					<th width="320px">문서 이름</th>
					<th width="250px">업로드 날짜</th>
					<th width="200px">작성자</th>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th width="150px">문서 등록</th>
					<td colspan="3"><input type="file" id="portfolio"
						name="portfolio"></td>
				</tr>
			</table>
		</div>

		<div class="project_code">
			<h3>프로젝트 산출물</h3>
			<table class="table table-striped table-hover" border="1"
				width="920px">
				<tr>
					<th width="150px">번호</th>
					<th width="320px">산출물 이름</th>
					<th width="250px">업로드 날짜</th>
					<th width="200px">작성자</th>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th width="150px">파일 등록</th>
					<td colspan="3"><input type="file" id="product" name="product"></td>
				</tr>
			</table>
		</div>


		<div class="projectTable_button">
			<button class="btn btn-primary" type="button"
				onclick="location.href='${pageContext.request.contextPath}/ProjectController/showProjectTable'">프로젝트
				목록</button>

			<button class="btn btn-primary" type="button"
				onclick="location.replace('${pageContext.request.contextPath}/LoginController/main')">메인화면</button>
		</div>
	</div>

	<%
		}
	%>
	<div class="well well-sm">
		<p>The time on the server is ${serverTime}.</p>
	</div>
</body>