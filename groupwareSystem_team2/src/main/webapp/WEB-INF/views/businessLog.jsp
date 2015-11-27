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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>업무 일지 목록</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
</head>
<body>
	<div class="Business_Log_Wrapper">
		<div class="Business_Log">
			<h1>업무 일지</h1>
			<table class="Business_Log_table" border="1" width="770px"
				height="300px">
				<tr>
					<td width="70px">번호</td>
					<td width="200px">작성자</td>
					<td width="300px">설명</td>
					<td width="200px">작성 일자</td>
				</tr>
				<tr>
					<td>a</td>
					<td>a</td>
					<td>a</td>
					<td>a</td>
				</tr>
				<tr>
					<td>b</td>
					<td>b</td>
					<td>b</td>
					<td>b</td>
				</tr>
				<tr>
					<td>c</td>
					<td>c</td>
					<td>c</td>
					<td>c</td>
				</tr>
				<tr>
					<td>d</td>
					<td>d</td>
					<td>d</td>
					<td>d</td>
				</tr>
				<tr>
					<td>e</td>
					<td>e</td>
					<td>e</td>
					<td>e</td>
				</tr>
				<tr>
					<td>f</td>
					<td>f</td>
					<td>f</td>
					<td>f</td>
				</tr>
				<tr>
					<td>g</td>
					<td>g</td>
					<td>g</td>
					<td>g</td>
				</tr>
				<tr>
					<td>h</td>
					<td>h</td>
					<td>h</td>
					<td>h</td>
				</tr>
				<tr>
					<td>i</td>
					<td>i</td>
					<td>i</td>
					<td>i</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="main_button">

		<button type="button"
			onclick="location.href='${pageContext.request.contextPath}/ProjectController/showBusinessInformation'">업무일지
		</button>
		<button type="button"
			onclick="location.replace('${pageContext.request.contextPath}/ProjectController/showBusinessAdd')">업무일지 추가
		</button>
		<button type="button"
			onclick="location.replace('${pageContext.request.contextPath}/LoginController/main')">메인화면
		</button>
	</div>
</body>
</html>