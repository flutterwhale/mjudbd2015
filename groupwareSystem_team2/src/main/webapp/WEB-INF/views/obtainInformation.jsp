
<%@page import="kr.ac.mju.prompt.model.obtainBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="mapper.jsp"%>
<%@include file="session.jsp"%>
<%@ page import="kr.ac.mju.prompt.model.UserInfo"%>
<%@ page import="kr.ac.mju.prompt.model.UserBean"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%
	obtainBean oBean = (obtainBean) request.getAttribute("obtainBean");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String now = sdf.format(new Date());
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="http://bootswatch.com/flatly/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>obtain</title>
<script type="text/javascript">
	function move() {
		if (confirm('수정하시겠습니까?')) {
			document.frm.submit();
		}
	}
	function del() {
		if (confirm('삭제하시겠습니까?')) {
			document.frm2.submit();
		}
	}
</script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
</head>
<body>
	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand"
				href="${pageContext.request.contextPath}/LoginController/main">GroupwareSystem</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="https://tahiti.mju.ac.kr/moodle/">메뉴</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<%
		if (session.getAttribute("session_name").equals(oBean.getWriter_User())) {
	%>
	<div class="obtain_wrapper" style="margin: 10px 40px;">
		<h1>제안서 정보/ 수정</h1>

		<div class="obtain_information">
			<form name='frm'
				action='${pageContext.request.contextPath}/ProjectController/updateObtain'
				method="post">
				<table class="table table-striped table-hover" border="1"
					width="500px">
					<tr align="center">
						<td width="100px">번호</td>
						<td width="100px">제목</td>
						<td width="100px">시작</td>
						<td width="100px">끝</td>
						<td width="100px">고객</td>
						<td width="100px">위치</td>
						<td width="100px">상태</td>
					</tr>
					<tr align="center">
						<td><input type="text" name="oid"
							value="<%=oBean.getObtain_Order_Identifier()%>"
							readonly="readonly"></td>
						<td><input type="text" name="subject"
							value="<%=oBean.getObtain_Name()%>"></td>
						<td><input type="date" id="start_date" name="start_date"
							min="${now}" max="2200-12-31" value="<%=oBean.getStart_Date()%>"></td>
						<td><input type="date" id="end_date" name="end_date"
							min="${now}" max="2200-12-31" value="<%=oBean.getEnd_Date()%>"></td>
						<td><input type="text" name="order_company"
							value="<%=oBean.getOrder_Company()%>"></td>
						<td><input type="text" name="location"
							value="<%=oBean.getLocation()%>"></td>
						<td><select name="status" style="width: '200px'">
								<option value="10" <%if (oBean.getPresent_Status() == 10) {%>
									selected <%}%>>제안</option>
								<option value="11" <%if (oBean.getPresent_Status() == 11) {%>
									selected <%}%>>취소</option>
								<option value="12" <%if (oBean.getPresent_Status() == 12) {%>
									selected <%}%>>수주</option>
						</select></td>
					</tr>
					<tr>

						<td colspan="7"><textarea name="contents"
								style="width: 100%; height: 200px"><%=oBean.getComment()%></textarea></td>
					</tr>

				</table>
			</form>
		</div>
	</div>
	<div class="main_button" style="float: right">
		<button type="submit" class="btn btn-success" style="margin: 5px"
			onclick="move();">수정</button>
		<form name='frm2' class="col-sm-6"
			action='${pageContext.request.contextPath}/ProjectController/deleteObtainPage'
			method="post">
			<input type="hidden" name="id" value="<%=oBean.getWriter_User()%>">
			<input type="hidden" name="oid"
				value="<%=oBean.getObtain_Order_Identifier()%>">
			<button type="submit" class="btn btn-danger" style="margin: 5px"
				class="col-sm-6" onclick="del();">삭제</button>
		</form>
	</div>
	<%
		System.out.println("location " + oBean.getLocation());
			System.out.println("subject " + oBean.getObtain_Name());
		} else {
	%>

	<div class="obtain_wrapper">
		<h1>제안서 정보</h1>

		<div class="obtain_information">
			<table class="table table-striped table-hover" border="1"
				width="500px">
				<tr align="center">
					<td width="100px">번호</td>
					<td width="100px">제목</td>
					<td width="100px">시작</td>
					<td width="100px">끝</td>
					<td width="100px">고객</td>
					<td width="100px">위치</td>
					<td width="200px">작성자</td>
					<td width="100px">상태</td>
				</tr>

				<tr align="center">
					<td><%=oBean.getObtain_Order_Identifier()%></td>
					<td><%=oBean.getObtain_Name()%></td>
					<td><%=oBean.getStart_Date()%></td>
					<td><%=oBean.getEnd_Date()%></td>
					<td><%=oBean.getOrder_Company()%></td>
					<td><%=oBean.getLocation()%></td>
					<td><a
						href='${pageContext.request.contextPath}/LoginController/retrieveUser?id=<%=oBean.getWriter_User() %>'><%=oBean.getWriter_User()%></a>/<%=oBean.getWriter_name()%></td>
					<td><%=Obtain_status_map.get(oBean.getPresent_Status())%></td>
				</tr>
				<tr>
					<td colspan="8"><%=oBean.getComment()%></td>
				</tr>
			</table>
		</div>

		<%
			}
		%>

		<div class="obtain_Table_button" style="padding: 10px 0px;">
			<button type="button" class="btn btn-primary"
				onclick="location.href='${pageContext.request.contextPath}/ProjectController/showObtainTable'">수주
				목록</button>

			<button type="button" class="btn btn-default"
				onclick="location.replace('${pageContext.request.contextPath}/LoginController/main')">메인화면</button>
		</div>
	</div>
</body>
</html>