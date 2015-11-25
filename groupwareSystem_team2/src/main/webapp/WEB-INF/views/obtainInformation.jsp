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
<title>obtain</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
</head>
<body>
	<div class="obtain_wrapper">
		<h1>4441 수주</h1>
		<div class="obtain_information">
			<table class="obtain_information_table" border="1" width="600px">
				<tr>
					<td width="600px">커피좀 만들어주세요</td>
				</tr>
				<tr>
					<td>아메리카노 1잔
					카라멜마끼야또 2잔</td>
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