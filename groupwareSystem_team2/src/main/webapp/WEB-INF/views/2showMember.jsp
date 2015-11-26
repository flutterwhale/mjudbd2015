<%@page import="kr.ac.mju.prompt.model.signupBean"%>
<%@page import="kr.ac.mju.prompt.model.UserInfo"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="session.jsp"%>
<%@include file="mapper.jsp"%>
<%@page import="java.util.*"%>
<%
	//ArrayList myLectures = (ArrayList) request.getAttribute("MyLectures");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
		response.setHeader("pragma", "no-cache");
		response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
		response.setHeader("Expires", "0");
		 %>
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

	<h2>내 정보 조회</h2>

<table id="developer_join" border="1">
		<tr>
			<td colspan="3"><h2>개인 정보</h2></td>
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
			<td colspan="3"><h2>기타 정보</h2></td>
		</tr>
		<tr>
			<td>학력 :</td>
			<td colspan="2">
				<input id="university" type="text" name="university" size="10" maxlength="10" disabled="disabled" value="<%=showBean.getA_career() %>">학력 
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


	<form
		action="${pageContext.request.contextPath}/LoginController/editMemberPage"
		method="POST">
		<input type="hidden" name="id"  value="<%=sID%>"> 
		<input type="hidden" name="cat"  value="<%=sUinfo.getMyUser().getCat()%>"> 
		<button>정보 수정하기</button>
	</form>

	<button type="button"
            onclick="location.replace('${pageContext.request.contextPath}/LoginController/main')">뒤로 가기</button>
	
	
	
</body>
</html>