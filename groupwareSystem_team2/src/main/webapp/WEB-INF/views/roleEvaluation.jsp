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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="http://bootswatch.com/flatly/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>Role Evaluation</title>
<%
	String sID = session.getAttribute("session_name").toString();
	UserInfo sUinfo = (UserInfo)session.getAttribute("userinfo");
	signupBean showBean = (signupBean)request.getAttribute("showBean");	
	session.setAttribute("showBean", showBean);	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String now = sdf.format(new Date());
	
	ArrayList<Hashtable> list = (ArrayList<Hashtable>)request.getAttribute("list");
	System.out.println("평가리스트 사이즈:"+list.size());
	
	%>
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
	<div class="container">
		<div class="project_evaluation_wrapper">
			<div class="project_evaluation">
				<h3>프로젝트 개인 평가</h3>
				<table class="table table-striped table-hover" border="1"
					width="700px">
					<!-- Appraiser,wg,cg,tg,contents,is_pm,uid,pid,role -->
					<!-- User_Identifier,t_user.NAME,t_role.Project_Role,t_role.Project_Identifier,t_project.Project_Name -->
					<tr align="center">
						<th width="200px">피평가자</th>
						<th width="90px">작업<br>능력</th>
						<th width="90px">소통<br>능력</th>
						<th width="90px">기술<br>능력</th>
						<th width="200px">부연설명</th>
						<th width="300px">진행 프로젝트명</th>
						<th width="200px">프로젝트<br>담당업무</th>
						<th width="200px">평가하기</th>
					</tr>
					<% 
					for(int i=0; i< list.size(); i++){
						if(list.get(i).get("Eval_Check").equals("Y")){
							continue;
						}
					%> 
					<tr>
					<form action="${pageContext.request.contextPath}/ProjectController/projectUserEval" method="post">
					
						<td width="200px"><input id="Appraiser" Name="Appraiser" type="hidden" value="<%=sID%>"  ></input><input id="uid" Name="uid" type="hidden" value="<%=list.get(i).get("User_Identifier") %>"  ></input><%=list.get(i).get("User_Identifier")%>|<%=list.get(i).get("NAME") %></td>
						<td>
						<select name="wg" id="wg" class="form-control">
								<option value="1">1점</option>
								<option value="2">2점</option>
								<option value="3">3점</option>
								<option value="4">4점</option>
								<option value="5"selected>5점</option>
						</select>
						</td>
						<td>
						<select name="cg" id="cg" class="form-control">
								<option value="1">1점</option>
								<option value="2">2점</option>
								<option value="3">3점</option>
								<option value="4">4점</option>
								<option value="5"selected>5점</option>
						</select>
						</td>
						<td>
						<select name="tg" id="tg" class="form-control">
								<option value="1">1점</option>
								<option value="2">2점</option>
								<option value="3">3점</option>
								<option value="4">4점</option>
								<option value="5"selected>5점</option>
						</select>
						</td>
						<td width="200px"><input id="contents" Name="contents" type="text" placeholder="PM평가란" <%if(!list.get(i).get("Projectmanager_Identifier").equals(sID)){ %>disabled="disabled"<%}%>/></td>
						<td width="200px"><input id="pid" Name="pid" type="hidden" value="<%=list.get(i).get("Project_Identifier") %>"  /><%=list.get(i).get("Project_Identifier") %>/<%=list.get(i).get("Project_Name") %></td>
						<td width="200px"><input id="is_pm" Name="is_pm" type="hidden" value="<%if(list.get(i).get("Projectmanager_Identifier").equals(sID)){ %>1<%} else {%>0<%} %>" /><input id="role" Name="role" type="hidden" value="<%=list.get(i).get("Project_Role") %>" /><%=Project_Part.get(list.get(i).get("Project_Role")) %></td>
						<td width="200px"><input type="submit" value="평가하기"/></td>
					</form>
					</tr>
					
					<%
					}
					
					%>

				</table>
			</div>
		</div>

		<div class="main_button">
			<button type="button" class="btn btn-default"
				onclick="location.replace('${pageContext.request.contextPath}/LoginController/main')">메인화면</button>
		</div>
	</div>
</body>
</html>