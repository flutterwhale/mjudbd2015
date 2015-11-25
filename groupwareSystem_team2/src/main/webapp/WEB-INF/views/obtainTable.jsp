<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.ac.mju.prompt.model.UserInfo"%>
<%@ page import="kr.ac.mju.prompt.model.UserBean"%>
<%@page import="java.util.*"%>
<%@ page import="kr.ac.mju.prompt.model.obtainBean"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<% ArrayList<obtainBean> allObatain  = (ArrayList<obtainBean>)request.getAttribute("allObatain"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>obtainTable</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
</head>
<body>
	<div class="obtain_table_wrapper">
		<div class="obtain">
			<h1>수주 현황</h1>
			<table class="obtain_table" border="1" width="1600px" height="300px">
				<tr>
					<td width="70px">번호</td>
					<td width="200px">이름</td>
					<td width="250px">시작일</td>
					<td width="250px">마감일</td>
					<td width="300px">설명</td>
					<td width="200px">주문 회사</td>
					<td width="200px">작성자</td>
					<td width="180px">현재 상태</td>
					<td width="200px">PM 배정</td>
				</tr>
				<%
					if (allObatain.isEmpty()) {
				%>
				<h2>등록된 수주현황이 없습니다.</h2>

				<%
					System.out.println("등록된 수주현황이 없습니다.");
					} else {

						for (obtainBean c : allObatain) {
				%>
				
				<tr>
					<td><%=c.getObtain_Order_Identifier() %></td>
					<td><%=c.getObtain_Name() %></td>
					<td><%=c.getStart_Date() %></td>
					<td><%=c.getEnd_Date() %></td>
					<td><%=c.getComment() %></td>
					<td><%=c.getOrder_Company()%></td>
					<td><%=c.getWriter_User()%>/<%=c.getWriter_name() %></td>
					<td><%=c.getPresent_Status() %></td>
					<td>
						<button type="button"
							onclick="location.href='${pageContext.request.contextPath}/ProjectController/showObtainAdd'">추가
						</button>
					</td>
				</tr>
					<%
					}
					}
				%>
			</table>
		</div>
	</div>
	<div class="main_button">

		<button type="button"
			onclick="location.href='${pageContext.request.contextPath}/ProjectController/showObtainInformation'">수주
		</button>
		 <button type="button"
            onclick="location.replace('${pageContext.request.contextPath}/LoginController/main')">메인화면</button>

	</div>
</body>
</html>