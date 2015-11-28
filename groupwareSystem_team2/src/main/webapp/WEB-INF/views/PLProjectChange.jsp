<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.ac.mju.prompt.model.UserInfo"%>
<%@ page import="kr.ac.mju.prompt.model.UserBean"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://bootswatch.com/flatly/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>[PL]Project 개인일정 수정</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
</head>
<body>
	<nav class="navbar navbar-default">
  		<div class="container-fluid">
    		<div class="navbar-header">
      			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        			<span class="sr-only">Toggle navigation</span>
        			<span class="icon-bar"></span>
        			<span class="icon-bar"></span>
        			<span class="icon-bar"></span>
      			</button>
      			<a class="navbar-brand" href="${pageContext.request.contextPath}/LoginController/main">GruopwareSystem</a>
    		</div>

    		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      			<ul class="nav navbar-nav navbar-right">
        			<li><a href="https://tahiti.mju.ac.kr/moodle/">메뉴</a></li>
      			</ul>
    		</div>
  		</div>
	</nav>
	
	<div class="project_wrapper" style="margin:10px 40px;">
		<h1>1124 프로젝트</h1>
		<div class="project_information">
			<table class="table table-striped table-hover" width="920px">
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
				<tr>
					<th>상태</td>
					<td>11</td>
				</tr>
			</table>
		</div>
		<div class="project_schedule">
			<h3>프로젝트 일정</h3>
			<table class="table table-striped table-hover" border="1"
				width="750px">
				<tr>
					<th width="200px">일정이름
					</td>
					<th width="200px">시작일
					</td>
					<th width="200px">종료일
					</td>
					<th width="150px">상태
					</td>
				</tr>
				<tr>
					<td>설계</td>
					<td>11111111</td>
					<td>22222222</td>
					<td>딜레이</td>
				</tr>
			</table>
		</div>
		<div class="project_user">
			<h3>투입 인력</h3>
			<table class="table table-striped table-hover" border="1" width="920px">
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
			<h3>프로젝트 문서</h3>
			<table class="table table-striped table-hover" border="1" width="920px">
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
			<h3>PM 전용 프로젝트 평가</h3>
			<table class="table table-striped table-hover" border="1" width="920px">
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
		<div class="project_individual_schedule">
			<h3> 개인 일정 </h3>
			<table class="table table-striped table-hover" border="1" width="920px">
				<tr>
					<th width="100px">이름
					</td>
					<th width="100px">역할
					</td>
					<th width="360px">업무
					</td>
					<th width="180px">시작일
					</td>
					<th width="180px">종료일
					</td>
				</tr>
				<tr>
					<td><button class="btn btn-primary" type="button"
				onclick="location.href='${pageContext.request.contextPath}/ProjectController/showRoleAdd'">인원 추가</button></td>
					<td></td>
					<td></td>
					<td><input type="date" id="start_date" name="start_date"
						min="${now}" max="2200-12-31"></td>
					<td><input type="date" id="end_date" name="end_date"
						min="${now}" max="2200-12-31"></td>
				</tr>
			</table>
		</div>
		<div class="project_code">
			<h3> 프로젝트 코드 </h3>
			<p> MJU60112348 </p>
		</div>
	

	<div class="projectTable_button">
			<button class="btn btn-primary" type="button"
				onclick="location.href='${pageContext.request.contextPath}/ProjectController/showProjectTable'">프로젝트
				목록</button>

			<button class="btn btn-primary" type="submit"
				onclick="location.replace('${pageContext.request.contextPath}/ProjectController/showProjectInformation')">완료</button>
		</div>
</div>	
<div class = "well well-sm">
		<p>The time on the server is ${serverTime}.</p> 
	</div>
</body>
