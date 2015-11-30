<%@page import="kr.ac.mju.prompt.model.UserBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="session.jsp"%>
<%@page import="java.util.*"%>
<%@ page import="kr.ac.mju.prompt.model.UserBean"%>
<%@ page import="kr.ac.mju.prompt.model.projectBean"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet"
	href="http://bootswatch.com/flatly/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>Project user add</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript">
	
	
	</script>
	<script type="text/javascript">
	function move() {
		if (confirm('대상을 프로젝트에 추가합니다.')) {
			document.frm.submit();
		}
	}
</script>
	<%
	ArrayList<UserBean> developerlist = (ArrayList<UserBean>)request.getAttribute("developerlist");
	
	
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
	<div class="container">
		<div class="project_user_add_wrapper">
			<div class="project_user_add">
				<table class="table table-bordered" border="1" width="600px">
					<tr>
						<th width="150px">프로젝트에 추가</th>
						<th width="150px">ID/이름</th>
						<th width="150px">직급</th>
						<th width="100px">부서</th>
						<th width="150px">역할</th>
					</tr>
				
					<tr>
						<td><button type="submit" class="btn btn-primary"
								onclick="">확인</button></td>
						<td>박동현</td>
						<td>부서</td>
						<td>직급</td>
						<td>직급</td>
						<td><select name="Project_role" class="form-control">
								<option value="10">PM</option>
								<option value="11">PL</option>
								<option value="12">분석자</option>
								<option value="13">설계자</option>
								<option value="14">개발자</option>
								<option value="15">디자이너</option>
								<option value="16">테스터</option>
						</select></td>
					</tr>
					
				</table>
			</div>
		</div>

		<div class="main_button">
			<button class="btn btn-default" type="button"
				onclick="location.replace('${pageContext.request.contextPath}/ProjectController/showProjectInformation?pid=<%=request.getParameter("pid")%>')">프로젝트 정보</button>
			<button type="button" class="btn btn-default"
				onclick="location.replace('${pageContext.request.contextPath}/LoginController/main')">메인화면</button>
		</div>
	</div>
</body>
</html>