<%@page import="kr.ac.mju.prompt.model.signupBean"%>
<%@page import="kr.ac.mju.prompt.model.UserInfo"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>
<%
	//ArrayList myLectures = (ArrayList) request.getAttribute("MyLectures");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://bootswatch.com/flatly/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보 조회</title>
</head>
<body>

	<%
		String sID = session.getAttribute("session_name").toString();
		UserInfo sUinfo = (UserInfo)session.getAttribute("userinfo");
		signupBean showBean = (signupBean)request.getAttribute("showBean");
		session.setAttribute("showBean", showBean);	
		System.out.println("session ID " + sID + " cat "+ sUinfo.getMyUser().getCat());
	%>
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
	<div style="margin:10px 40px;">
		<h2>내 정보 조회</h2>
		<div>
			<table class="table table-striped table-hover " id="developer_join">
			<tr>
				<td colspan="3"><strong>개인 정보</strong></td>
				</tr>
			<tr>
				<td>이름</td>
				<td><input id="name" type="text" name="signupName" size="8" maxlength="8" disabled="disabled" value="<%=showBean.getName()%>"></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input id="id" type="text" name="signupID" size="8" maxlength="8" disabled="disabled" value= " <%=showBean.getId()%>"></td>
			</tr>
	
			<tr>
				<td>연락처</td>
				<td><input id="phone" type="text" name="phone" size="15" maxlength="13" disabled="disabled" value="<%=showBean.getPhone()%>"></td>
			</tr>
			<tr>
				<td>email</td>
				<td><input id="email" type="text" name="email" size="15" maxlength="30" disabled="disabled" value="<%=showBean.getEmail()%>"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td colspan="2">
					<input type="text"id="address" name="address" size="50" disabled="disabled"  value="<%=showBean.getAddr()%>"/>
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td colspan="2">
				<label><input type="radio" value="1" name="gender" checked>남자</label> 
			</tr>
			<tr>
				<td colspan="3"><strong>기타 정보</strong></td>
			</tr>
			<tr>
				<td>학력 :</td>
				<td colspan="2">
					<input id="university" type="text" name="university" size="20" maxlength="20" disabled="disabled" value="<%=showBean.getA_career() %>"> 
					<!-- <input id="depart" type="text" name="depart" size="10" maxlength="10" disabled="disabled">학과(부) 
					<input id="major" type="text" name="major" size="10" maxlength="10" disabled="disabled">전공
					<input  type="text" id="graduation" name="graduation" value="" disabled="disabled">  -->
    	             
				</td>
			</tr>
			<tr>
				<td>경력</td>
				<td colspan="2"><textarea id="career" name="career" cols="65" rows="5" disabled="disabled" value="<%=showBean.getCareer() %>"></textarea></td>
			</tr>
			<tr>
				<td>고용관계</td>
				<td colspan="2"><label><input type="radio" value="FreeLancer" name="isFreelancer" value="<%=showBean.getIsFreeLancer()%>"> 프리랜서</label> 
			</tr>
			<tr>
				<td>나의 포트폴리오</td>
				<td colspan="2"><input type="file" id="portfolio" name="portfolio" <%=showBean.getPortfolio() %>></td>
			</tr>
			<tr>
				<td>기술 등급</td>
				<td><label><input type="radio" value="10"
						name="tech_level" disabled="disabled"> 고급</label> <label><input type="radio"
						value="20" name="tech_level" disabled="disabled"> 중급</label> <label><input
						type="radio" value="30" name="tech_level" checked disabled="disabled"> 하급</label></td>
			</tr>
			<tr class="item1">
				<td rowspan=2>사용 가능 언어</td>
				<td>
				
                	<input type="text" id="language1" name="language1"  value=""   disabled="disabled"/>
					<label><input type="radio" value="10" name="language_level1" disabled="disabled">상</label> 
					<label><input type="radio" value="20" name="language_level1" disabled="disabled">중</label>
					<label><input type="radio" value="30" name="language_level1" checked disabled="disabled">하</label>
				</td>
			</tr>
			</table>
		</div>
		<div>
			<div>
				<form
					action="${pageContext.request.contextPath}/LoginController/editMemberPage"
					method="POST">
					<input type="hidden" name="id"  value="<%=sID%>"> 
					<input type="hidden" name="cat"  value="<%=sUinfo.getMyUser().getCat()%>"> 
					<button class="btn btn-primary">정보 수정하기</button>
				</form>
			</div>
			<div>
				<button class="btn btn-primary" type="button"
    	        onclick="location.replace('${pageContext.request.contextPath}/LoginController/main')">뒤로 가기</button>
			</div>
		</div>
	
	</div>
</body>
</html>