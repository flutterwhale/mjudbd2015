<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.ac.mju.prompt.model.UserInfo"%>
<%@ page import="kr.ac.mju.prompt.model.UserBean"%>
<%@ page import="kr.ac.mju.prompt.model.User"%>
<jsp:useBean id="loginbean" class="kr.ac.mju.prompt.model.UserBean"
	scope="session" />


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main</title>
</head>
<body>

	<%
		int check = (Integer) session.getAttribute("sessionCheck");
		System.out.println(" session check ? " + check);

		UserInfo ui = (UserInfo) session.getAttribute("userinfo");
		int code = ui.getErrorCode();
		User myuser = ui.getMyUser();
		
		loginbean.setMyUser(myuser);
//loginbean.setId(myuser.getId());		
				
				
		if (check == 0) {
			System.out.println(" session check ? 실패 " + code);
			if (code == 122) {
				
				
				
				
	%>

	
	
	<script type="text/javascript">
		alert("code 122 : 존재하지 않는 ID 입니다.");
		location.replace("${pageContext.request.contextPath}/LoginController/logout.do");
	</script>

	<%
		System.out.println("122:  아이디 없음 ");

			} else if (code == 121) {
	%>
	<script type="text/javascript">
		alert("code 121 : 비밀번호가 일치 하지 않습니다.");
		location
				.replace("${pageContext.request.contextPath}/LoginController/logout.do");
	</script>

	<%
		System.out.println("121:  비밀번호 틀림 ");
			}

		} else {

	//		System.out.println(" Userinfo : id " + uId + " 이름 " + uName + "  code " + code);

			if (code == 0) { //로그인 성공!
	%>

	<script type="text/javascript">
		alert("환영합니다.");
	</script>
	<h2>
		Id <jsp:getProperty property="id" name="loginbean"/></br>
	직급코드 <jsp:getProperty property="position_Name" name="loginbean"/></br>
		이름  <jsp:getProperty property="name" name="loginbean"/></br>
	권한 <jsp:getProperty property="permission" name="loginbean"/></br>
	 부서코드 <jsp:getProperty property="di" name="loginbean"/></br>
	
		<p>(으)로 로그인하였습니다.
	</h2>
	</p>
	<button type="button"
		onclick="location.href='${pageContext.request.contextPath}/LoginController/logout.do'">로그아웃</button>
	<br />
	<%-- 	
	<%
		if (cat.equals("학생")) {
	%>

	
	<button type="button"
		onclick="location.href='${pageContext.request.contextPath}/CourseController/insertCoursePage'">수강신청하기</button>
	<br />
	<form
		action="${pageContext.request.contextPath}/CourseController/checkCoursePage"
		method="get">
		<input type="hidden" name="user_id" value=<%=uid%>>
		<button>수강 신청 목록</button>
		<br />
	</form>
	<form
		action="${pageContext.request.contextPath}/CourseController/showMyHackjeom"
		method="get">
		<input type="hidden" name="user_id" value=<%=uid%>>
		<button>내 성적 확인</button>
		<br />
	</form>


	<%
		} else if (cat.equals("교수")) {
	%>

	<button type="button"
		onclick="location.href='${pageContext.request.contextPath}/LoginController/logout.do'">로그아웃</button>
	<br />
	<form
		action="${pageContext.request.contextPath}/LectureController/insertLecturePage"
		method="POST">
		<input type="hidden" name="user_id" value=<%=uid%>>
		<button>강좌 개설하기</button>
		<br />
	</form>
	<form
		action="${pageContext.request.contextPath}/LectureController/myLecturePage"
		method="get">
		<input type="hidden" name="user_id" value=<%=uid%>>
		<button>내 강좌 목록</button>
		<br />
	</form>





	<%
		} else if (cat.equals("관리자")) {
	%>

	<button type="button"
		onclick="location.href='${pageContext.request.contextPath}/LoginController/logout.do'">로그아웃</button>
	<br />


	<button type="button"
		onclick="location.href='${pageContext.request.contextPath}/LectureController/AllLecturePage'">강좌
		개설 현황 보기</button>
	<br />
	<button type="button"
		onclick="location.href='${pageContext.request.contextPath}/CourseController/registForCoursePage'">사용자
		전체 목록</button>
	<br /> 

	<%
		}--%>

	<%
		}
		}
	%>




</body>
</html>