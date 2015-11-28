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
<link rel="stylesheet" href="http://bootswatch.com/flatly/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>업무 일지</title>
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
      			<a class="navbar-brand" href="${pageContext.request.contextPath}/LoginController/main">GruopwareSystem</a>
    		</div>

    		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      			<ul class="nav navbar-nav navbar-right">
        			<li><a href="https://tahiti.mju.ac.kr/moodle/">메뉴</a></li>
      			</ul>
    		</div>
  		</div>
	</nav>
	
	<div class="business_Information_Wrapper" style="margin:10px 40px;">
		<div class="business_information">
			<table class="table table-striped table-hover" border="1" width="600px">
				<tr align="center">
					<td width="400px">오늘의 업무일지</td>
					<td width="100px">작성자</td>
					<td width="100px">작성일자</td>
				</tr>
				<tr align="center">
					<td colspan="3">
					<p> 1. 가나다라<br>
					2. 마바사아<br>
					3. 아야어여<br>
					4. 으으ㅏ으ㅏㅇ</p></td>
				</tr>
				<tr align="center">
					<th width="150px">문서 등록</td>
					<td colspan="2"><input type="file" id="portfolio" name="portfolio"></td>
				</tr>
			</table>
		</div>

		<div class="main_button" style="padding:10px 0px;">
			<button type="button" class="btn btn-primary"
				onclick="location.href='${pageContext.request.contextPath}/ProjectController/showBusinessLog'">업무 일지 목록
			</button>
			<button type="button" class="btn btn-primary"
				onclick="location.href='${pageContext.request.contextPath}/ProjectController/showBusinessChange'">수정
			</button>
			<button type="submit" class="btn btn-primary">삭제??
			</button>
		</div>
	</div>
</body>
</html>