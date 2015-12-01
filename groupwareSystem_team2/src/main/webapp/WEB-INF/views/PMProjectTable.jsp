<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.ac.mju.prompt.model.UserInfo"%>
<%@ page import="kr.ac.mju.prompt.model.UserBean"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
	<%@include file="session.jsp"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://bootswatch.com/flatly/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>My PMProject</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
</head>
<body>
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
	<div class="PMProject_Table_Wrapper" style="margin:10px 40px;">
		<div class="PMProject">
			<h1>PM 프로젝트 목록</h1>
			<table class="table table-striped table-hover" border="1" width="1200px"
				height="300px">
				<tr align="center">
					<td width="70px">번호</td>
					<td width="200px">이름</td>
					<td width="250px">일정</td>
					<td width="300px">설명</td>
					<td width="200px">파견 지역</td>
					<td width="180px">현재 상태</td>
				</tr>
				<tr align="center">
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
				</tr>
				<tr align="center">
					<td>b</td>
					<td>b</td>
					<td>b</td>
					<td>b</td>
					<td>b</td>
					<td>b</td>
				</tr>
				<tr align="center">
					<td>c</td>
					<td>c</td>
					<td>c</td>
					<td>c</td>
					<td>c</td>
					<td>c</td>
				</tr>
				<tr align="center">
					<td>d</td>
					<td>d</td>
					<td>d</td>
					<td>d</td>
					<td>d</td>
					<td>d</td>
				</tr>
				<tr align="center">
					<td>e</td>
					<td>e</td>
					<td>e</td>
					<td>e</td>
					<td>e</td>
					<td>e</td>
				</tr>
				<tr align="center">
					<td>f</td>
					<td>f</td>
					<td>f</td>
					<td>f</td>
					<td>f</td>
					<td>f</td>
				</tr>
				<tr align="center">
					<td>g</td>
					<td>g</td>
					<td>g</td>
					<td>g</td>
					<td>g</td>
					<td>g</td>
				</tr>
				<tr align="center">
					<td>h</td>
					<td>h</td>
					<td>h</td>
					<td>h</td>
					<td>h</td>
					<td>h</td>
				</tr>
				<tr align="center">
					<td>i</td>
					<td>i</td>
					<td>i</td>
					<td>i</td>
					<td>i</td>
					<td>i</td>
				</tr>
			</table>
		</div>

		<div class="main_button" style="padding:10px 0px;">
	
			<button type="button" class="btn btn-primary"
				onclick="location.href='${pageContext.request.contextPath}/ProjectController/showProjectInformation'">프로젝트
			</button>
	
			 <button type="button" class="btn btn-default"
	            onclick="location.replace('${pageContext.request.contextPath}/LoginController/main')">메인화면</button>
	
		</div>
	</div>
</body>
</html>