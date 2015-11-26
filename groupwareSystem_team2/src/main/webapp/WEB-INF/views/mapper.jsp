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

		System.out.println("mapper loaded");


		HashMap<Integer ,String> Depart_map = new HashMap<Integer ,String>();
		Depart_map.put(10, "경영부");
		Depart_map.put(11, "마케팅팀");
		Depart_map.put(12, "영업부");
		Depart_map.put(13, "총무팀");
		Depart_map.put(14, "회계팀");
		Depart_map.put(15, "인사 관리팀");
		Depart_map.put(16, "연구 개발팀");
		Depart_map.put(17, "개발팀");
		Depart_map.put(99, "외부 인력팀");
		Depart_map.put(0, "가입 대기");
		HashMap<Integer ,String> Position_map = new HashMap<Integer ,String>();
		Position_map.put(10, "사장");
		Position_map.put(11, "부사장");
		Position_map.put(12, "상무");
		Position_map.put(13, "이사");
		Position_map.put(14, "부장");
		Position_map.put(15, "차장");
		Position_map.put(16, "과장");
		Position_map.put(17, "대리");
		Position_map.put(18, "주임");
		Position_map.put(19, "사원");
		Position_map.put(99, "프리랜서");
		Position_map.put(0, "가입 대기");
		
	%>

</body>
</html>