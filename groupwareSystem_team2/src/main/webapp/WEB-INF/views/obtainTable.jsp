<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="mapper.jsp"%>
<%@include file="session.jsp"%>
<%@ page import="kr.ac.mju.prompt.model.UserInfo"%>
<%@ page import="kr.ac.mju.prompt.model.UserBean"%>
<%@page import="java.util.*"%>
<%@ page import="kr.ac.mju.prompt.model.obtainBean"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<% ArrayList<obtainBean> allObatain  = (ArrayList<obtainBean>)request.getAttribute("allObatain"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="http://bootswatch.com/flatly/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>obtainTable</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript">
<%
	UserInfo sUinfo = (UserInfo) session.getAttribute("userinfo");
%>
	</script>
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
	<div class="obtain_table_wrapper" style="margin:10px 40px;">
		<div class="obtain">
			<h1>수주 현황</h1>
			<table class="table table-striped table-hover" border="1">
				<tr align="center">
					<td width="50px">번호</td>
					<td width="180px">이름</td>
					<td width="120px">시작일</td>
					<td width="120px">마감일</td>
					<td width="180px">설명</td>
					<td width="120px">주문 회사</td>
					<td width="120px">위치</td>
					<td width="60px">작성자</td>
					<td width="80px">현재 상태</td>
					<%if(sUinfo.getMyUser().getDi() == 10){%>
					<td width="100px">PM 배정</td>
					<%}%>
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
				
				<tr align="center">
					<td><a href='${pageContext.request.contextPath}/ProjectController/showObtainInformation?oid=<%=c.getObtain_Order_Identifier() %>'><%=c.getObtain_Order_Identifier() %></a></td>
					<td><a href='${pageContext.request.contextPath}/ProjectController/showObtainInformation?oid=<%=c.getObtain_Order_Identifier() %>'><%=c.getObtain_Name() %></td>
					<td><%=c.getStart_Date() %></td>
					<td><%=c.getEnd_Date() %></td>
					<td><input type="text" maxlength="70px" value="<%=c.getComment()%>" readonly="readonly"></td>
					<td><%=c.getOrder_Company()%></td>
					<td><%=c.getLocation()%></td>
					<td><a href='${pageContext.request.contextPath}/LoginController/retrieveUser?id=<%=c.getWriter_User()%>'><%=c.getWriter_User()%></a><br/><%=c.getWriter_name() %></td>
					<td><%=Obtain_status_map.get(c.getPresent_Status())%></td>
					<%if(sUinfo.getMyUser().getDi() == 10){%>
					<td>
						<%
					
					if(c.getPM()==null){
					%>
						<button type="button" class="btn btn-success"
							onclick="location.href='${pageContext.request.contextPath}/ProjectController/showObtainAdd?oid=<%=c.getObtain_Order_Identifier()%>'">추가
						</button>
						 <%} else {
							%>
							<a href='${pageContext.request.contextPath}/LoginController/retrieveUser?id=<%= c.getPM() %>'><%= c.getPM() %></a>
						<% } %>
					</td>
					<%}%>
				</tr>
					<%
						}
					}
				%>
			</table>
		</div>

		<div class="main_button">
	
			<button type="button" class="btn btn-primary"
				onclick="location.href='${pageContext.request.contextPath}/ProjectController/newObtainPage'">제안 올리기
			</button>
			 <button type="button" class="btn btn-default"
	            onclick="location.replace('${pageContext.request.contextPath}/LoginController/main')">메인화면</button>
	
		</div>
		<div class = "well well-sm">
			<p>The time on the server is ${serverTime}.</p> 
		</div>
	</div>
</body>
</html>