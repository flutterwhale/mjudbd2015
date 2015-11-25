<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.ac.mju.prompt.model.UserInfo"%>
<%@ page import="kr.ac.mju.prompt.model.UserBean"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<script language="javascript">
	history.go(1);
</script>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>obtain add</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
</head>
<body>
	<div class="obtain_add_wrapper">
		<div class="obtain_add">
			<table class="obtain_add_table">
				<tr>
					<th>PM 추가</th>
				</tr>
				<tr>
					<td><input type="radio" name="pm">딸기</td>
				</tr>
				<tr>
					<td><input type="radio" name="pm">메론</td>
				</tr>
				<tr>
					<td><input type="radio" name="pm">자두</td>
				</tr>
				<tr>
					<td><input type="radio" name="pm">키위</td>
				</tr>
				<tr>
					<td><input type="radio" name="pm">사과</td>
				</tr>
				<tr>
					<td><input type="radio" name="pm">땅콩</td>
				</tr>
				<tr>
					<td><button type="submit">완료</button>
				</tr>
			</table>
		</div>
	</div>
	<div class="obtain_Table_button">
		<button type="button"
			onclick="location.href='${pageContext.request.contextPath}/HomeController/showObtainTable'">수주 목록</button>
	</div>
</body>
</html>