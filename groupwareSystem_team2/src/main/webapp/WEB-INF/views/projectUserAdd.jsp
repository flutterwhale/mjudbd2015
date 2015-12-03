<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="session.jsp"%>
<%@page import="java.util.*"%>
<%@ page import="kr.ac.mju.prompt.model.UserBean"%>
<%@ page import="kr.ac.mju.prompt.model.signupBean"%>
<%@ page import="kr.ac.mju.prompt.model.projectBean"%>
<%@page import="kr.ac.mju.prompt.model.UserInfo"%>
<%@include file="mapper.jsp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.ac.mju.prompt.model.signupBean"%>

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
<%
	String sID = session.getAttribute("session_name").toString();
	UserInfo sUinfo = (UserInfo)session.getAttribute("userinfo");
	signupBean showBean = (signupBean)request.getAttribute("showBean");	
	session.setAttribute("showBean", showBean);	
	ArrayList<signupBean> developerlist = (ArrayList<signupBean>)request.getAttribute("developerlist");
	//ArrayList<UserBean> developerlist = (ArrayList<UserBean>)request.getAttribute("developerlist");
//	System.out.println("개발자 리스트는: "+developerlist.get(0).getDi());
	%>
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
	
	function addRole(uid,pid,i){
		var role = document.getElementById("Project_role"+i).value;
		var start = document.getElementById("start_date"+i).value;
		var end = document.getElementById("end_date"+i).value;
		
		location.replace('${pageContext.request.contextPath}/ProjectController/projectUserAdd?uid='+uid+'&role='+role+'&start='+start+'&end='+end+'&pid='+pid);
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
<div class="container">
		<div class="project_user_add_wrapper">
			<div class="project_user_add">
				<table class="table table-bordered" border="1" width="600px">
					<tr>
						<th width="150px">프로젝트에 추가</th>
						<th width="150px">ID/이름</th>
						<th width="150px">직급</th>
						<th width="100px">부서</th>
						<th width="150px">주역할</th>
						<th width="150px">투입역할</th>
						<th width="150px">투입일자</th>
						<th width="150px">투입종료일자</th>
					</tr>
					<% 
					for(int i=0; i<developerlist.size();i++){
					%> 
					
					<tr>
						<td><button type="button" class="btn btn-primary"
								onclick="addRole(<%=developerlist.get(i).getId()%>,<%=developerlist.get(i).getComment()%>,<%=i%>)">확인</button></td>
						<td><a href="${pageContext.request.contextPath}/LoginController/retrieveUser?id=<%=developerlist.get(i).getId()%>"><%=developerlist.get(i).getId()%></a>/<%=developerlist.get(i).getName()%></td>
						<td><%=Position_map.get(developerlist.get(i).getPosition_Name())%></td>
						<td><%=Depart_map.get(developerlist.get(i).getDi())%></td>
						<td><%=Permission_map.get(developerlist.get(i).getPermission())%></td>
						<td><select name="Project_role<%=i%>" id="Project_role<%=i%>" class="form-control">
								<option value="11">PL</option>
								<option value="12">분석자</option>
								<option value="13">설계자</option>
								<option value="14" selected>개발자</option>
								<option value="15">디자이너</option>
								<option value="16">테스터</option>
						</select></td>
						<td><input type="date" id="start_date<%=i%>" name="start_date<%=i%>"  max="2200-12-31" value="<%=now%>"></td>
						<td><input type="date" id="end_date<%=i%>" name="end_date<%=i%>" max="2200-12-31" value="<%=now%>"></td>
					</tr>
					<%
					}
					
					%>
					
					
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