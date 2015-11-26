<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.ac.mju.prompt.model.UserInfo"%>
<%@ page import="kr.ac.mju.prompt.model.UserBean"%>
<%@page import="java.util.*"%>
<%@ page import="kr.ac.mju.prompt.model.obtainBean"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<% ArrayList<obtainBean> allObatain  = (ArrayList<obtainBean>)request.getAttribute("allObatain"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://bootswatch.com/flatly/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>obtainTable</title>
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
	<div class="obtain_table_wrapper" style="margin:10px 40px;">
		<div class="obtain">
			<h1>수주 현황</h1>
			<table class="table table-striped table-hover" border="1" width="1600px" height="300px">
				<tr align=center>
					<td width="70px">번호</td>
					<td width="200px">이름</td>
					<td width="250px">시작일</td>
					<td width="250px">마감일</td>
					<td width="300px">설명</td>
					<td width="200px">주문 회사</td>
					<td width="200px">작성자</td>
					<td width="180px">현재 상태</td>
					<td width="200px">PM 배정</td>
				</tr>
				<%
					if (allObatain.isEmpty()) {
				%>
				<h2>등록된 수주현황이 없습니다.</h2>

				<%
					System.out.println("등록된 수주현황이 없습니다.");
					} else {

						for (obtainBean c : allObatain) {
				%>
				
				<tr align=center>
					<td><%=c.getObtain_Order_Identifier() %></td>
					<td><%=c.getObtain_Name() %></td>
					<td><%=c.getStart_Date() %></td>
					<td><%=c.getEnd_Date() %></td>
					<td><%=c.getComment() %></td>
					<td><%=c.getOrder_Company()%></td>
					<td><%=c.getWriter_User()%>/<%=c.getWriter_name() %></td>
					<td><%=c.getPresent_Status() %></td>
					<td>
						<button class="btn btn-primary" style="height:50px;" type="button"
							onclick="location.href='${pageContext.request.contextPath}/ProjectController/showObtainAdd'">추가
						</button>
					</td>
				</tr>
					<%
					}
					}
				%>
			</table>
		</div>
		<div class="main_button" style="padding:10px 0px;">
	
			<button class="btn btn-primary" type="button"
				onclick="location.href='${pageContext.request.contextPath}/ProjectController/showObtainInformation'">수주
			</button>
			 <button class="btn btn-primary" type="button"
	            onclick="location.replace('${pageContext.request.contextPath}/LoginController/main')">메인화면</button>
	
		</div>
	</div>
</body>
</html>