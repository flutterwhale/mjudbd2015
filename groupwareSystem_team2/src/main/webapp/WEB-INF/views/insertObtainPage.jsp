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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>obtain</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
</head>
<body>
	<div class="obtain_wrapper">
		<h1>제안서 정보</h1>
		<form
			action="${pageContext.request.contextPath}/ProjectController/insertObtain"
			method="post">
			<div class="obtain_information">
				<table class="obtain_information_table" border="1" width="600px">
					<tr>
						<td width="100px">제목</td>
						<td width="100px">시작 날짜</td>
						<td width="100px">종료 날짜</td>
						<td width="100px">고객사</td>
						<td width="200px">내용</td>
					</tr>
					<tr>
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


			<button type="submit">등록</button>
		</form>
	</div>



	<div class="obtain_Table_button">
		<button type="button"
			onclick="location.href='${pageContext.request.contextPath}/ProjectController/showObtainTable'">수주
			목록</button>
	</div>
	<button type="button"
		onclick="location.replace('${pageContext.request.contextPath}/LoginController/main')">메인화면</button>
</body>
</html>