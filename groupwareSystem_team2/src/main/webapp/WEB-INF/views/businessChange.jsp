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
<title>업무 일지 수정</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
</head>
<body>
	<div class="business_Change_Wrapper">
		<div class="business_Change">
			<table class="business_Change_table" border="1" width="600px">
				<tr>
					<th width="150px"> 제목 </th>
					<td width="450px"><textarea style="width:450px;"></textarea></td>
				</tr>
				<tr>
					<th> 내용 </th>
					<td> <textarea style="width:450px; height:200px"></textarea></td>
				</tr>
				<tr>
					<th width=>문서 등록</td>
					<td><input type="file" id="portfolio" name="portfolio"></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="main_button">
		<button type="button"
			onclick="location.href='${pageContext.request.contextPath}/ProjectController/showBusinessLog'">업무 일지 목록
		</button>
	</div>
</body>
</html>