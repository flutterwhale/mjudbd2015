<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>
<%
	ArrayList myLectures = (ArrayList) request.getAttribute("MyLectures");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>정보 조회</title>
</head>
<body>

	<%
		String sID = session.getAttribute("sessionUser").toString();
		System.out.println("session ID " + sID);
	%>

	<h2>내 정보 조회</h2>

<table id="developer_join" border="1">
		<tr>
			<td colspan="3"><h2>개인 정보</h2></td>
			</tr>
		<tr>
			<td>이름</td>
			<td><input id="name" type="text" name="signupName" size="8" maxlength="8" disabled="disabled"></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input id="id" type="text" name="signupID" size="8" maxlength="8" disabled="disabled"></td>
		</tr>
		<tr>
			<td>주민 번호</td>
			<td><input id="ssn" type="text" name="ssn" size="14" maxlength="14" disabled="disabled"></td>
		</tr>
		<tr>
			<td>연락처</td>
			<td><input id="phone" type="text" name="phone" size="15" maxlength="13" disabled="disabled"></td>
		</tr>
		<tr>
			<td>email</td>
			<td><input id="email" type="text" name="email" size="15" maxlength="30" disabled="disabled"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td colspan="2">
				<input type="text"id="address" name="address" size="50" disabled="disabled" />
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
				<input id="university" type="text" name="university" size="10" maxlength="10" disabled="disabled">학교 
				<input id="depart" type="text" name="depart" size="10" maxlength="10" disabled="disabled">학과(부) 
				<input id="major" type="text" name="major" size="10" maxlength="10" disabled="disabled">전공
				<input  type="text" id="graduation" name="graduation" value="" disabled="disabled"> 
                 
			</td>
		</tr>
		<tr>
			<td>경력</td>
			<td colspan="2"><textarea id="career" name="career" cols="65" rows="5" disabled="disabled"></textarea></td>
		</tr>
		<tr>
			<td>고용관계</td>
			<td colspan="2"><label><input type="radio" value="FreeLancer" name="isFreelancer"> 프리랜서</label> 
		</tr>
		<tr>
			<td>나의 포트폴리오</td>
			<td colspan="2"><input type="file" id="portfolio" name="portfolio"></td>
		</tr>
		<tr>
			<td>기술 등급</td>
			<td><label><input type="radio" value="10"
					name="tech_level" disabled="disabled"> 고급</label> <label><input type="radio"
					value="20" name="tech_level" disabled="disabled"> 중급</label> <label><input
					type="radio" value="30" name="tech_level" checked disabled="disabled"> 하급</label></td>
		</tr>
		<tr>
			<td colspan="3"><input type="hidden" id="language_count" name="language_count" value="1"><button id="addItemBtn" onclick="return false;">개발 가능 언어 추가</button></td>
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
		action="${pageContext.request.contextPath}/LoginController/main.do"
		method="get">
		<input type="hidden" name="user_id" value=<%=sID%>>
		<button>정보 수정하기</button>
	</form>
	
	<form
		action="${pageContext.request.contextPath}/LoginController/main.do"
		method="get">
		<input type="hidden" name="user_id" value=<%=sID%>>
		<button>메인화면으로</button>
	</form>
	
	
	
<%-- 
	<%
		if (myLectures.isEmpty()) {
	%>

	<h2>등록된 강좌가 없습니다.</h2>
	<form
		action="${pageContext.request.contextPath}/LectureController/insertLecturePage"
		method="POST">
		<input type="hidden" name="user_id" value=<%=sID%>>
		<button>강좌 개설하기</button>
		<br />
	</form>
	<%
		System.out.println("등록된 강좌가 없습니다.");
		} else {
	%>
	<table>
		<tr align="center">
			<td width="150">강좌ID</td>
			<td width="150">강좌명</td>
			<td width="150">학기</td>
			<td width="150">학점</td>
			<td width="150">현재 인원</td>
			<td width="120">최대 인원</td>
			<td width="150">성적 입력</td>
			<td width="150">강좌 삭제</td>
		</tr>
		--%>
	<%-- 	<%
		 	for (Lecture c : myLectures) {
		%>



		<tr align="center">
			<td width="150"><%=c.getLectureID()%></td>

			<td width="150"><%=c.getLectureName()%></td>
			<td width="150"><%=c.getSemester()%></td>
			<td width="120"><%=c.getHackjeom()%></td>
			<td width="120"><%=c.getCurNum()%></td>
			<td width="120"><%=c.getLimitNum()%></td>
			<td width="150">

				<form
					action="${pageContext.request.contextPath}/LectureController/showStudentPage"
					method="GET">
					<input type="hidden" name="lecture_id" value=<%=c.getLectureID()%>>
					<input type="hidden" name="user_id" value=<%=sID%>>


					<button class="btn_insertgrade" type="submit">학생 목록</button>
			</td>
			</form>
			</td>
			<td width="150">

				<form
					action="${pageContext.request.contextPath}/LectureController/deleteLecture"
					method="post">
					<input type="hidden" name="lecture_id" value=<%=c.getLectureID()%>>
					<input type="hidden" name="user_id" value=<%=sID%>>

					<button class="btn_registForLecture" type="submit">강좌 삭제</button>
			</td>
			</form>
		</tr>



		<%
			}
			}
		%> 
		</table>
		--%>
	
</body>
</html>