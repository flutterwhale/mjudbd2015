<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.ac.mju.prompt.model.UserInfo"%>
<%@ page import="kr.ac.mju.prompt.model.UserBean"%>
<%@page import="org.apache.commons.beanutils.BeanUtils" %>

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
		
				BeanUtils.copyProperties(loginbean,myuser);
				
		if (check == 0) {
			System.out.println(" session check ? 실패 " + loginbean.getCode());
			if (loginbean.getCode() == 122) {
	%>

	<%-- 	
	<bean id="loginbean" class="kr.ac.mju.prompt.model.UserBean" scope = "session">
	      <constructor-arg>
	                <ref bean="<%=myuser%>"/>
	      <constructor-arg>
	</bean>
	 --%>

	<script type="text/javascript">
		alert("code 122 : 존재하지 않는 ID 입니다.");
		location
				.replace("${pageContext.request.contextPath}/LoginController/logout.do");
	</script>

	<%
			
			} else if (loginbean.getCode() == 121) {
				
	%>
	<script type="text/javascript">
		alert("code 121 : 비밀번호가 일치 하지 않습니다.");
		location
				.replace("${pageContext.request.contextPath}/LoginController/logout.do");
	</script>

	<%
		System.out.println("121:  비밀번호 틀림 ");
	System.out.println(loginbean.getCode()+": "+loginbean.getMsg());
			}

		} else {

	//		System.out.println(" Userinfo : id " + uId + " 이름 " + uName + "  code " + code);

			if (loginbean.getCode() == 0) { //로그인 성공!
				
			System.out.println(" loginbean test  "+loginbean.getId()+" myuser "+ myuser.getId()+ " : "+loginbean.getCode());
	%>

	<script type="text/javascript">
		alert("환영합니다.");
	</script>
	<h2>
		Id
		<jsp:getProperty property="id" name="loginbean" /></br> 직급코드
		<jsp:getProperty property="position_Name" name="loginbean" /></br> 이름
		<jsp:getProperty property="name" name="loginbean" /></br> 권한
		<jsp:getProperty property="permission" name="loginbean" /></br> 부서코드
		<jsp:getProperty property="di" name="loginbean" /></br>

		<p>(으)로 로그인하였습니다. <button type="button"
		onclick="location.href='${pageContext.request.contextPath}/LoginController/logout.do'">로그아웃</button>
	</h2>
	
	</p><p>
The time on the server is ${serverTime}.</p>
	
	
	<button>개인 정보</button>
	<%
		if (loginbean.getPermission()== 14 ) { // 영업부
			
			System.out.println(loginbean.getPermission()+": 영업부 권한  로그인");
	%>


	<button type="button"
		onclick="location.href='${pageContext.request.contextPath}/CourseController/insertCoursePage'">수주 현황</button>
	<br />
	

	

	<%
		} else if (loginbean.getPermission()==11) {//pm
			System.out.println(loginbean.getPermission()+": PM 권한 로그인");
	%>

	
	<br />
	<form
		action="${pageContext.request.contextPath}/LectureController/insertLecturePage"
		method="POST">
		<%-- <input type="hidden" name="user_id" value=<%=uid%>> --%>
		<button>프로젝트 관리</button>
		<br />
	</form>
<button>평가 관리</button>


	<%
		} else if (loginbean.getPermission()==99) { //가입 대기
			System.out.println(loginbean.getPermission()+": 가입대기 상태 로그인");
			
			
		
	%>

	


	<%

		}
		else if(loginbean.getPermission()==15){ //개발팀
			
			System.out.println(loginbean.getPermission()+": 프로젝트 투입 직원 권한 로그인");
		
		
	%>
	<button>프로젝트</button>
	
	
	<%
	
			}
		if (loginbean.getDi()==17 ) { // 개발팀 업무 : 프로젝트...
			
			System.out.println(loginbean.getPermission()+": 개발팀 업무 프로젝트  로그인");
	
			
		
	%>
	
		<%
		
		}
		
		if (loginbean.getPosition_Name()== 99 ) { // 프리랜서
			
			System.out.println(loginbean.getPermission()+": 프리랜서 직급  로그인");
			
		
		
		%> 
		<button>메신저</button>
		<%
		}else { //프리랜서가아니라면?
			System.out.println(" loginbean test 2  "+loginbean.getId()+" myuser "+ myuser.getId()+ " : "+loginbean.getCode());
		
	%>
	
	<!-- 공통 메뉴 -->
	
		<button>전자결재 </button>
	<button>메신저</button>
	<button>게시판</button>
	<%
	
		}
			}
			
		}
			%>
	



</body>
</html>