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

		System.out.println("mapper loaded.");


		HashMap<Integer ,String> Depart_map = new HashMap<Integer ,String>();
		Depart_map.put(10, "경영부");
		Depart_map.put(11, "마케팅팀");
		Depart_map.put(12, "영업부");
		Depart_map.put(13, "총무팀");
		Depart_map.put(14, "회계팀");
		Depart_map.put(15, "인사 관리팀");
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
		HashMap<Integer ,String> Permission_map = new HashMap<Integer ,String>();
		Permission_map.put(11, "PM");
		Permission_map.put(12, "PL");
		Permission_map.put(13, "프로젝트 투입 가능 직원");
		Permission_map.put(14, "PM/PL");
		HashMap<Integer ,String> Project_status_map = new HashMap<Integer ,String>();
		Project_status_map.put(10, "착수");
		Project_status_map.put(11, "기획");
		Project_status_map.put(12, "이행");
		Project_status_map.put(13, "통제");
		Project_status_map.put(14, "종료");
		Project_status_map.put(15, "평가");
		HashMap<Integer ,String> Schedule_status_map = new HashMap<Integer ,String>();
		Schedule_status_map.put(10, "시작 전");
		Schedule_status_map.put(11, "진행");
		Schedule_status_map.put(12, "완료");
		Schedule_status_map.put(13, "보류");
		Schedule_status_map.put(14, "딜레이");
		HashMap<Integer ,String> Obtain_status_map = new HashMap<Integer ,String>();
		Obtain_status_map.put(10, "제안");
		Obtain_status_map.put(11, "취소");
		Obtain_status_map.put(12, "수주");
		HashMap<Integer ,String> Project_Part = new HashMap<Integer ,String>();
		Project_Part.put(11, "PL");
		Project_Part.put(12, "분석자");
		Project_Part.put(13, "설계자");
		Project_Part.put(14, "개발자");
		Project_Part.put(15, "디자이너");
		Project_Part.put(16, "테스터");
		HashMap<Integer ,String> Gender = new HashMap<Integer ,String>();
		Gender.put(1, "남성");
		Gender.put(0, "여성");
		
	%>

</body>
</html>