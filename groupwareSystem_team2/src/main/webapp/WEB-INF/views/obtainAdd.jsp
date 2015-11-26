<%@page import="kr.ac.mju.prompt.model.UserBean"%>
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
	ArrayList<UserBean> list = (ArrayList<UserBean>) request.getAttribute("PermissionList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="http://bootswatch.com/flatly/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>obtain add</title>
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
      			<a class="navbar-brand" href="${pageContext.request.contextPath}/LoginController/logout.do">GruopwareSystem</a>
    		</div>

    		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      			<ul class="nav navbar-nav navbar-right">
        			<li><a href="https://tahiti.mju.ac.kr/moodle/">메뉴</a></li>
      			</ul>
    		</div>
  		</div>
	</nav>
	<div class="container">
	<div class="obtain_add_wrapper">
		<div class="obtain_add">
			<table class="table table-bordered" border="1" width="300px" height="300px" >
				<tr>
					<th>PM 선택</th> <th>ID</th>
				</tr>
				<%
					if (list.isEmpty()) {
				%>

				<h2>PM이 존재 하지 않습니다.</h2>

				<%
					System.out.println("PM이 존재 하지 않습니다.");
					} else {

						for (UserBean c : list) {
				%>
				<tr>
					<td><input type="radio" name="pm" value="<%=c.getId()%>"></td><td><%=c.getName() %>/<%=c.getId()%></td>
				</tr>
				<%
					}
					}
				%>
				<tr>
					<td><button type="submit" class="btn btn-primary">완료</button>
				</tr>
				
			</table>
		</div>
	</div>
	<div class="main_button">
		<button type="button" class="btn btn-default"
			onclick="location.href='${pageContext.request.contextPath}/ProjectController/showObtainTable'">수주 목록</button>
	 	<button type="button" class="btn btn-default"
            onclick="location.replace('${pageContext.request.contextPath}/LoginController/main')">메인화면</button>
            </div>
     </div>
</body>
</html>