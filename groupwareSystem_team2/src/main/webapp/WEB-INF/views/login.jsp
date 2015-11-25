<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="session.jsp"%>
<%@ page import="kr.ac.mju.prompt.model.UserInfo"%>
<%@ page import="kr.ac.mju.prompt.model.UserBean"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<!-- 
<script language="javascript">
	history.go(1);
</script>
 -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main</title>
</head>
<body>

	<%
	/* 	response.setHeader("pragma", "no-cache");
		response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
		response.setHeader("Expires", "0");
 */
		/* if (session.getAttribute("code") == null) {
			response.sendRedirect("logout.do");

		}

		System.out.println(
				" code : " + session.getAttribute("code") + " / " + session.getAttribute("code").getClass());
		System.out.println("session_name : " + session.getAttribute("session_name")); */
		//if (session.getAttribute("code").equals("0")) {
		//로그인 성공 
		System.out.println("session_name : " + session.getAttribute("session_name"));
		UserInfo ui = (UserInfo) session.getAttribute("userinfo");
		UserBean myuser = ui.getMyUser();
		session.setAttribute("myUser", myuser);
		session.setAttribute("session_name", myuser.getId());

		//}
		//response.sendRedirect("/LoginController/main");
	%>
	<%-- 	<jsp:forward page ="/LoginController/main"  /> --%>
	<script language="javascript">
		location.replace('main');
	</script>

</body>
</html>