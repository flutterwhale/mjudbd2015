<%@page import="java.util.HashMap"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

	<%
		if (session.getAttribute("session_name") == null) {

			System.out.println("===========세션정보 없음===============");
			System.out.println("=========== home 으로===============");

			//	response.sendRedirect("home");
	%>

	<jsp:forward page="/" />
	<%
		} else {

			System.out.println("===========세션정보 확인됨===============");
			String sID = session.getAttribute("session_name").toString();
			System.out.println("session ID " + sID);
		}
	%>

</body>
</html>