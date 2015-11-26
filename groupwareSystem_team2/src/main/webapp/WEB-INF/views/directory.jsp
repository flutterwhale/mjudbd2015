<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="session.jsp"%>
<%@ page import="kr.ac.mju.prompt.model.UserInfo"%>
<%@ page import="kr.ac.mju.prompt.model.UserBean"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<jsp:useBean id="loginbean" class="kr.ac.mju.prompt.model.UserBean"
	scope="session" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
		response.setHeader("pragma", "no-cache");
		response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
		response.setHeader("Expires", "0");
		 %>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회사 인명부</title>

<script type="text/javascript">
	$(
			function() {
				$("#browser").treeview();
				$("#add")
						.click(
								function() {
									var branches = $(
											"<li><span class='folder'>New Sublist</span><ul>"
													+ "<li><span class='file'>Item1</span></li>"
													+ "<li><span class='file'>Item2</span></li></ul></li>")
											.appendTo("#browser");
									$("#browser").treeview({
										add : branches
									});
									branches = $(
											"<li class='closed'><span class='folder'>New Sublist</span><ul><li><span class='file'>Item1</span></li><li><span class='file'>Item2</span></li></ul></li>")
											.prependTo("#folder21");
									$("#browser").treeview({
										add : branches
									});
								});
				/*$("#browser").bind("contextmenu", function(event) {
				   if ($(event.target).is("li") || $(event.target).parents("li").length) {
				      $("#browser").treeview({
				         remove: $(event.target).parents("li").filter(":first")
				      });
				      return false;
				   }
				});*/
			})
</script>




<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
<body>
<%

System.out.println(
		"directory.jsp  code : " + session.getAttribute("code") + " / " + session.getAttribute("code").getClass());
System.out.println("session_name : " + session.getAttribute("session_name"));

%>

	<div class="directory_wrapper">
		<h1>회사 인명부</h1>
		<ul id="browser" class="filetree">
			<li class="closed"><span class="folder">회사</span>
				<ul>
					<li><span class="file">사장</span></li>
					<li><span class="file">부사장</span></li>
					<li><span class="file">상무</span></li>
					<li><span class="file">이사</span></li>
					<li class="closed"><span class="folder">영업부</span>
						<ul id="folder21">
							<li><span class="file">직원1</span></li>
							<li><span class="file">직원2</span></li>
						</ul></li>
					<li class="closed"><span class="folder">총무부</span>
						<ul id="folder21">
							<li><span class="file">직원1</span></li>
							<li><span class="file">직원2</span></li>
							<li class="closed"><span class="folder">회계팀</span>
								<ul id="folder21">
									<li><span class="file">직원1</span></li>
									<li><span class="file">직원2</span></li>
								</ul></li>
						</ul></li>
					<li class="closed"><span class="folder">인사관리부</span>
						<ul id="folder21">
							<li><span class="file">직원1</span></li>
							<li><span class="file">직원2</span></li>
							<li class="closed"><span class="folder">가입대기</span>
								<ul id="folder21">
									<li><span class="file">직원1</span></li>
									<li><span class="file">직원2</span></li>
								</ul></li>

						</ul></li>
					<li class="closed"><span class="folder">마케팅부</span>
						<ul id="folder21">
							<li><span class="file">직원1</span></li>
							<li><span class="file">직원2</span></li>
						</ul></li>
					<li class="closed"><span class="folder">개발부</span>
						<ul id="folder21">
							<li><span class="file">직원1</span></li>
							<li><span class="file">직원2</span></li>
							<li class="closed"><span class="folder">외부인력팀</span>
								<ul id="folder21">
									<li><span class="file">직원1</span></li>
									<li><span class="file">직원2</span></li>
								</ul></li>
						</ul></li>
				</ul></li>
			<li><span class="file">File 4</span></li>
		</ul>
	</div>
	<div class="main_button">


		 <button type="button"
            onclick="location.replace('${pageContext.request.contextPath}/LoginController/main')">메인화면</button>


	</div>

</body>
</html>