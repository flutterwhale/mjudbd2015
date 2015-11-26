<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@include file="session.jsp"%>
<%@ page import="kr.ac.mju.prompt.model.UserInfo"%>
<%@ page import="kr.ac.mju.prompt.model.UserBean"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Project</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
</head>
<body>
	<div class="project_wrapper">
		<h1>1124 프로젝트</h1>
		<div class="project_information">
			<table class="project_information_table" border="1" width="920px">
				<tr>
					<th width="170px">설명</td>
					<td width="750px">프로젝트이다.</td>
				</tr>
				<tr>
					<th>부가 설명</td>
					<td>디비설 프로젝트이다.</td>
				</tr>
				<tr>
					<th>예산</td>
					<td>0</td>
				</tr>
				<tr>
					<th>PM</td>
					<td>SDAGVARGERHTRJYGHFDSERG</td>
				</tr>
			</table>
		</div>
		<div class="project_schedule">
			<h2>프로젝트 일정</h2>
		</div>
		<div class="project_user">
			<h2>투입 인력</h2>
			<table class="project_user_table" border="1" width="920px">
				<tr>
					<th width="70px">UID
					</td>
					<th width="130px">이름
					</td>
					<th width="150px">업무
					</td>
					<th width="170px">부서
					</td>
					<th width="150px">역할
					</td>
					<th width="250px">일정
					</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
		<div class="project_product">
			<h2>프로젝트 문서</h2>
			<table class="project_product_table" border="1" width="920px">
				<tr>
					<th width="150px">번호
					</td>
					<th width="320px">문서 이름
					</td>
					<th width="250px">업로드 날짜
					</td>
					<th width="200px">작성자
					</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th width="150px">문서 등록</td>
					<td colspan="3"><input type="file" id="portfolio" name="portfolio"></td>
				</tr>
			</table>
		</div>
		<div class="project_Evaluation">
			<h2>PM 전용 프로젝트 평가</h2>
			<table class="project_Evaluation_table" border="1" width="920px">
				<tr>
					<th width="100px">번호
					</td>
					<th width="140px">평가자
					</td>
					<th width="140px">피평가자
					</td>
					<th width="360px">내용
					</td>
					<th width="180px">평가일자
					</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
		<div class="project_code">
			<p> 프로젝트 코드 </p>
			<p> MJU60112348 </p>
		</div>
	</div>

	<div class="projectTable_button">
		<button type="button"
			onclick="location.href='${pageContext.request.contextPath}/ProjectController/showProjectTable'">프로젝트
			목록</button>
			<button type="button"> [PM 전용] PM 프로젝트 목록으로 가는 버튼</button>
			<button type="button"> [PM 전용] 수정버튼</button>
			 <button type="button"
            onclick="location.replace('${pageContext.request.contextPath}/LoginController/main')">메인화면</button>
	</div>
</body>
</html>