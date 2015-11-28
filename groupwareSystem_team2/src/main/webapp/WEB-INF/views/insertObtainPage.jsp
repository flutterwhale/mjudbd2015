<%@page import="kr.ac.mju.prompt.model.obtainBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@include file="session.jsp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="kr.ac.mju.prompt.model.UserInfo"%>
<%@ page import="kr.ac.mju.prompt.model.UserBean"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>

<%
	obtainBean oBean = (obtainBean) request.getAttribute("obtainBean");

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String now = sdf.format(new Date());
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://bootswatch.com/flatly/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>obtain</title>
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
      			<a class="navbar-brand" href="${pageContext.request.contextPath}/LoginController/main">GruopwareSystem</a>
    		</div>

    		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      			<ul class="nav navbar-nav navbar-right">
        			<li><a href="https://tahiti.mju.ac.kr/moodle/">메뉴</a></li>
      			</ul>
    		</div>
  		</div>
	</nav>
	<div class="obtain_wrapper" style="margin:10px 40px;">
		<h1>제안서 정보</h1>
		<form
			action="${pageContext.request.contextPath}/ProjectController/insertObtain"
			method="post">
			<div class="obtain_information">
				<table class="table table-striped table-hover" border="1" width="600px">
					<tr align="center">
						<td width="100px">제목</td>
						<td width="100px">시작 날짜</td>
						<td width="100px">종료 날짜</td>
						<td width="100px">고객사</td>
						<td width="200px">내용</td>
					</tr>
					<tr align="center">
						</td>
						<td><input type="text" name="subject"></td>
						<td><input type="date" id="start_date" name="start_date"
							min="${now}" max="2200-12-31" value="<%=now%>"></td>
						<td><input type="date" id="end_date" name="end_date"
							min="${now}" max="2200-12-31" value="<%=now%>"></td>
						<td><input type="text" name="order_company"></td>
						<td><input type="text" name="contents"></td>
					</tr>
				</table>
			</div>


			<button class="btn btn-primary" type="submit">등록</button>
		</form>

		<div class="obtain_Table_button" style="padding:10px 0px;">
			<button type="button" class="btn btn-primary"
				onclick="location.href='${pageContext.request.contextPath}/ProjectController/showObtainTable'">수주
				목록</button>
			<button type="button" class="btn btn-default"
				onclick="location.replace('${pageContext.request.contextPath}/LoginController/main')">메인화면</button>
		</div>
	</div>
</body>
</html>