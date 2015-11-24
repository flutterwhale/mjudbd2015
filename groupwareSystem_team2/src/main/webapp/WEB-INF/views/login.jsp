<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.ac.mju.prompt.model.UserInfo"%>
<%@ page import="kr.ac.mju.prompt.model.UserBean"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>

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
		UserBean myuser = ui.getMyUser();

		BeanUtils.copyProperties(loginbean, myuser);

		loginbean.setCode(ui.getErrorCode());

		if (check == 0) {
			System.out.println(" session check ? 실패 " + loginbean.getCode());
			System.out.println(loginbean.getCode() + ": " + loginbean.getMsg());
		}
		if (loginbean.getCode() == 0) { //로그인 성공!
			System.out.println(" loginbean test  " + loginbean.getId() + " myuser " + myuser.getId() + " : "
					+ loginbean.getCode());
	%>

	<!-- 	<script type="text/javascript">
		alert("환영합니다!");
	</script>  -->
	<h2>
		Id<jsp:getProperty property="id" name="loginbean" /></br> 직급코드<jsp:getProperty
			property="position_Name" name="loginbean" /></br> 이름<jsp:getProperty
			property="name" name="loginbean" /></br> 권한<jsp:getProperty
			property="permission" name="loginbean" /></br> 부서코드<jsp:getProperty
			property="di" name="loginbean" /></br>
		<p>
			(으)로 로그인하였습니다.
			<button type="button"
				onclick="location.href='${pageContext.request.contextPath}/LoginController/logout.do'">로그아웃</button>
	</h2>

	</p>
	<p>The time on the server is ${serverTime}.</p>


	<button>개인 정보</button>
	<%
		if (loginbean.getPermission() == 11) { // PM 권한
				System.out.println(loginbean.getPermission() + ": PM 권한 로그인");
	%>


	<button type="button"
		onclick="location.href='${pageContext.request.contextPath}/CourseController/insertCoursePage'">프로젝트
		관리</button>



	<%
		} else if (loginbean.getPermission() == 12) {//PL 권한
				System.out.println(loginbean.getPermission() + ": PL 권한 로그인");
	%>


	<form
		action="${pageContext.request.contextPath}/LectureController/insertLecturePage"
		method="POST">
		<%-- <input type="hidden" name="user_id" value=<%=uid%>> --%>
		<button>프로젝트 관리</button>

	</form>



	<%
		} else if (loginbean.getPermission() == 13) { //개발자
				System.out.println(loginbean.getPermission() + ": 개발자 상태 로그인(프로젝트 투입 직원 권한 )");
	%>

	<%
		}
			if (loginbean.getDi() == 10) { // 경영진 메뉴
				System.out.println(loginbean.getPermission() + ": 경영진 메뉴");
				//수주현황
				//모든 프로젝트
	%>
	<button>수주 현황</button>
	<button>프로젝트 현황</button>
	<%
		} else if (loginbean.getDi() == 12) { //영업부 메뉴

				//수주 현황
	%>
	<button>수주 현황</button>
	<%
		} else if (loginbean.getDi() == 15) { // 인사관리팀 메뉴
	%>
	<button>인사 관리</button>
	<%
		//인사 관리
			} else if (loginbean.getDi() == 13) {//총무팀 메뉴
				//프로젝트 관리?
	%>

	<%
		} else if (loginbean.getDi() == 17) { //개발팀
				//업무 일지
				//프로젝트
	%>
	<button>프로젝트</button>
	<button>업무 일지</button>
	<%
		}
	if (loginbean.getPosition_Name() == 0 || loginbean.getDi() == 0) { //가입 대기 상태 

				System.out.println(loginbean.getPermission() + ": 가입 대기 상태 로그인");
	%>
		<p>가입 대기 상태 입니다. 인사관리부의 승인을 기다립니다.</p>

	<%
		} else { //가입 대기가 아니라면?
				System.out.println(loginbean.getPermission() + ": 일반 직원 로그인, 공통 메뉴 보임");

				if (loginbean.getPosition_Name() == 99) { // 외부인력팀

					System.out.println(loginbean.getPermission() + ": 프리랜서(외부인력팀) 로그인");
				%>
				<button>메신저</button>
				<%
					} else {
				%>

				<!-- 공통 메뉴 -->
			
				<button>전자결재</button>
				<button>메신저</button>
				<button>게시판</button>
				<%
					
					} // 외부 인력 아닌 기본 공통 메뉴

			} //가입 대기 아닌 경우 끝

		}//로그인 성공 끝
	%>

</body>
</html>