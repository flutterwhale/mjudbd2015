<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ID check</title>
</head>
<script type="text/javascript">
	function parentTrue() {

		window.opener.document.getElementById('id').value = "";
		window.close();

	}
	function parentFalse() {

		//window.opener.document.getElementById('id').disabled="true";
		window.close();

	}
</script>

<body>

	${result}
	<%
		if (request.getAttribute("check").equals("true")) {// 중복
	%>
	<button onclick="parentFalse()">닫기</button>
	<%
		} else {
	%>
<button onclick="parentTrue()">닫기</button>
	<%
		}
	%>
</body>
</html>