<%@page import="kr.ac.mju.prompt.model.obtainBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.ac.mju.prompt.model.UserInfo"%>
<%@ page import="kr.ac.mju.prompt.model.UserBean"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>

<%
obtainBean oBean = (obtainBean)request.getAttribute("obtainBean");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>obtain</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
</head>
<body>
	<div class="obtain_wrapper">
		<h1>제안서 정보</h1>
		<div class="obtain_information">
			<table class="obtain_information_table" border="1" width="600px">
				<tr>
					<td width="100px">번호</td><td width="100px">제목</td><td width="100px">시작</td><td width="100px">끝</td><td width="100px">고객</td><td width="200px">내용</td><td width="100px">작성자</td><td width="100px">상태</td>
				</tr>
				<tr>
					<td><%=oBean.getObtain_Order_Identifier() %></td><td><%=oBean.getObtain_Name() %></td><td><%=oBean.getStart_Date()%></td><td><%=oBean.getEnd_Date() %></td>
					<td><%=oBean.getOrder_Company() %></td><td><%=oBean.getComment() %></td><td><a href='${pageContext.request.contextPath}/LoginController/retrieveUser?id=<%=oBean.getWriter_User() %>'><%=oBean.getWriter_User() %></a>/<%=oBean.getWriter_name() %></td><td><%=oBean.getPresent_Status() %></td>
				</tr>
			</table>
		</div>
	</div>

<button type="button"
		>수정하기 ? 삭제하기 ?</button>

	<div class="obtain_Table_button">
		<button type="button"
			onclick="location.href='${pageContext.request.contextPath}/ProjectController/showObtainTable'">수주
			목록</button>
	</div>
	<button type="button"
		onclick="location.replace('${pageContext.request.contextPath}/LoginController/main')">메인화면</button>
</body>
</html>