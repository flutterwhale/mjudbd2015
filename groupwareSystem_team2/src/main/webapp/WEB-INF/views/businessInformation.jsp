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
<title>업무 일지</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
</head>
<body>
	<div class="business_Information_Wrapper">
		<div class="business_information">
			<table class="business_information_table" border="1" width="600px">
				<tr>
					<td width="400px">오늘의 업무일지</td>
					<td width="100px">작성자</td>
					<td width="100px">작성일자</td>
				</tr>
				<tr>
					<td colspan="3">
					<p> 1. 가나다라<br>
					2. 마바사아<br>
					3. 아야어여<br>
					4. 으으ㅏ으ㅏㅇ</p></td>
				</tr>
				<tr>
					<th width="150px">문서 등록</td>
					<td colspan="2"><input type="file" id="portfolio" name="portfolio"></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="main_button">
		<button type="button"
			onclick="location.href='${pageContext.request.contextPath}/ProjectController/showBusinessLog'">업무 일지 목록
		</button>
		<button type="button"
			onclick="location.href='${pageContext.request.contextPath}/ProjectController/showBusinessChange'">수정
		</button>
		<button type="submit">삭제??
		</button>
	</div>
</body>
</html>