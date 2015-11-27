<%@page import="kr.ac.mju.prompt.model.signupBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>
<%@ page import="kr.ac.mju.prompt.model.UserInfo"%>
<%@ page import="kr.ac.mju.prompt.model.signupBean"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<jsp:useBean id="loginbean" class="kr.ac.mju.prompt.model.UserBean"
	scope="session" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%

	ArrayList<signupBean> list = (ArrayList<signupBean>) request.getAttribute("memberlist");
%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회사 인명부</title>


<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
<body>
	<%
		System.out.println("directory.jsp  code : " + session.getAttribute("code"));
		System.out.println("session_name : " + session.getAttribute("session_name"));
	%>


	<div style="float: left;">

		<table>
			<%
				if (list.isEmpty()) {
			%>
			<h2>해당 부서의 직원이 존재 하지 않습니다.</h2>

			<%
				} else {
					for (signupBean c : list) {
			%>
			<tr>
				<td><%=c.getId() %></td>
				<td><%=c.getName() %></td>
				<td><%=c.getPosition_Name() %></td>
			</tr>

			<%
		/* 	if(!c.getLanguage_list().isEmpty()){
				for(String s : c.getLanguage_list()){
					System.out.println(s.g);
					
				}
				
				
			} */
				}
				}
			%>

		</table>



	</div>


</body>
</html>