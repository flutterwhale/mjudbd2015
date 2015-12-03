<%@page import="kr.ac.mju.prompt.model.signupBean"%>
<%@page import="kr.ac.mju.prompt.model.UserInfo"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="mapper.jsp"%>
<%@include file="session.jsp"%>
<%@ page import="kr.ac.mju.prompt.model.UserInfo"%>
<%@ page import="kr.ac.mju.prompt.model.userProjectBean"%>
<%@ page import="kr.ac.mju.prompt.model.signupBean"%>
<%@ page import="kr.ac.mju.prompt.model.UserBean"%>
<%@ page import="kr.ac.mju.prompt.model.projectBean"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>

<%
	ArrayList<userProjectBean> pastProject = (ArrayList<userProjectBean>) request.getAttribute("PastProject");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="http://bootswatch.com/flatly/bootstrap.min.css">
<title>정보 조회</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"
	type="text/javascript"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>

	<%
		String sID = session.getAttribute("session_name").toString();
		UserInfo sUinfo = (UserInfo) session.getAttribute("userinfo");
		signupBean showBean = (signupBean) request.getAttribute("showBean");
		session.setAttribute("showBean", showBean);

		System.out.println(showBean.getId());
		System.out.println("session ID " + sID + " cat " + sUinfo.getMyUser().getCat());
	%>

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
				<li><a href="https://tahiti.mju.ac.kr/moodle/"></a></li>
			</ul>
		</div>
	</div>
	</nav>


	<form class="form-horizontal" onSubmit="return check()" method="POST"
		name="myform">
		<fieldset>
			<legend>
				<label class="col-sm-3 control-label">직원정보<br>(조직도 정보)
				</label>
			</legend>
			<div class="form-group"></div>
			<div class="form-group"></div>
			<div class="form-group"></div>
			<div class="form-group">
				<label for="inputname" class="col-sm-4 control-label">이름</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" style="width: 200px;"
						id="name" name="signupName" placeholder="최대8글자" size="8"
						maxlength="8" disabled="disabled" value="<%=showBean.getName()%>">
				</div>
			</div>
			<div class="form-group">
				<label for="inputname" class="col-sm-4 control-label">아이디</label>
				<div class="col-sm-2">
					<input type="text" class="form-control" style="width: 200px;"
						id="id" name="signupID" placeholder="8자리 숫자 사용" size="8"
						maxlength="8" disabled="disabled" value="<%=showBean.getId()%>">

				</div>
				<div class="col-sm-1">
					<!-- button class="btn btn-success" type="button"  onclick="idCheck()">id 중복 체크</button -->
				</div>

			</div>
			<div class="form-group">
				<label for="inputname" class="col-sm-4 control-label">연락처</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" style="width: 200px;"
						id="phone" name="phone" size="15" placeholder="010-1234-1234"
						maxlength="13" disabled="disabled"
						value="<%=showBean.getPhone()%>">
				</div>
			</div>
			<div class="form-group">
				<label for="inputname" class="col-sm-4 control-label">사내연락처</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" style="width: 200px;"
						id="phone" name="phone" size="15" placeholder="010-1234-1234"
						maxlength="13" disabled="disabled"
						value="<%=showBean.getOffice_Number()%>">
				</div>
			</div>
			<div class="form-group">
				<label for="inputname" class="col-sm-4 control-label">부서</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" style="width: 200px;"
						id="phone" name="phone" size="15" placeholder="010-1234-1234"
						maxlength="13" disabled="disabled"
						value="<%=Depart_map.get(showBean.getDi())%>">
				</div>
			</div>
			<div class="form-group">
				<label for="inputname" class="col-sm-4 control-label">직급</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" style="width: 200px;"
						id="phone" name="phone" size="15" placeholder="010-1234-1234"
						maxlength="13" disabled="disabled"
						value="<%=Position_map.get(showBean.getPosition_Name())%>">
				</div>
			</div>
			<div class="form-group">
				<label for="inputname" class="col-sm-4 control-label">e-mail</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" style="width: 200px;"
						id="email" name="email" size="15"
						placeholder="prompt@prompt.co.kr" maxlength="30"
						disabled="disabled" value="<%=showBean.getEmail()%>">
				</div>
			</div>
			<div class="form-group">
				<label for="inputname" class="col-sm-4 control-label">입사일자</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" style="width: 200px;"
						id="email" name="입사일자" size="15" placeholder="prompt@prompt.co.kr"
						maxlength="30" disabled="disabled"
						value="<%=showBean.getJoining_Date()%>">
				</div>
			</div>

			<%
				if (showBean.getRetired_Date() != null) {
			%>

			<div class="form-group">
				<label for="inputname" class="col-sm-4 control-label">퇴사일자</label>
				<div classe="col-sm-6">
					<input type="text" class="form-control" style="width: 200px;"
						id="email" name="입사일자" size="15" placeholder="prompt@prompt.co.kr"
						maxlength="30" disabled="disabled"
						value="<%=showBean.getRetired_Date()%>">
				</div>
			</div>
			<%
				}
			%>
		</fieldset>
		<fieldset>
			<!--  개발자인경우에만 아래의 항목이 보여지게 된다.-->
			<%
				if (showBean.getDi() == 17 || showBean.getDi() == 99) {
			%>
			<legend>
				<label class="col-sm-3 control-label">기타정보</label>
			</legend>
			<div class="form-group"></div>
			<div class="form-group"></div>
			<div class="form-group"></div>

			<div class="form-group">
				<label for="inputname" class="col-sm-4 control-label">고용관계</label>
				<div class="col-sm-2">
					<label class="radio-inline"><input type="radio"
						value="FreeLancer" name="isFreelancer" disabled="disabled"
						<%if (showBean.getDi() == 99) {%> checked <%}%>> 프리랜서</label>
				</div>
				<div class="col-sm-2">
					<label class="radio-inline"><input type="radio"
						value="common" name="isFreelancer" disabled="disabled"
						<%if (showBean.getDi() == 17) {%> checked <%}%>> 정직원</label>
				</div>
			</div>

			<div class="form-group">
				<label for="inputname" class="col-sm-4 control-label">KOSA
					기술등급</label>
				<div class="col-sm-2">
					<label class="radio-inline"><input class="radio-inline"
						type="radio" value="10" name="tech_level" disabled="disabled"
						<%if (showBean.getTech_level() == 10) {%> checked <%}%>>
						고급</label>
				</div>
				<div class="col-sm-2">
					<label class="radio-inline"><input class="radio-inline"
						type="radio" value="20" name="tech_level" disabled="disabled"
						<%if (showBean.getTech_level() == 20) {%> checked <%}%>>중급</label>
				</div>
				<div class="col-sm-2">
					<label class="radio-inline"><input class="radio-inline"
						type="radio" value="30" name="tech_level" disabled="disabled"
						<%if (showBean.getTech_level() == 30) {%> checked <%}%>>초급</label>
				</div>
			</div>
			<div class="form-group">
				<label for="inputname" class="col-sm-4 control-label">프로그래밍
					언어</label>
				<div class="col-sm-5">

					<table id="developer_join" class="table table-striped table-hover "
						style="width: 600px;">
						<tbody>

							<%
								ArrayList language_list = showBean.getLanguage_list();
									ArrayList language_level_list = showBean.getLanguage_level_list();
									System.out.print(language_list.size());
									int i;
									for (i = 0; i < language_list.size(); i++) {
							%>
							<tr id="item<%=i + 1%>" class="item<%=i + 1%>">
								<%
									if (i == 0) {
								%><td rowspan=<%=i + 2%> align="center" valign="middle"
									id="getRowSpan"><label for="inputname" class="">언어별
										능력</label></td>
								<%
									}
								%>
								<script type="text/javascript">
									document
											.getElementById("getRowSpan")
											.setAttribute("rowspan",
								<%=i + 2%>
									);
								</script>
								<td><select id="select<%=i + 1%>" name="select<%=i + 1%>"
									class="form-control" disabled="disabled"
									onclick="langugeEtc(this.value,this.name)">
										<option value="etc" selected>etc(<%=language_list.get(i)%>)
										</option>
										<option value="C" <%if (language_list.get(i).equals("C")) {%>
											selected <%}%>>C</option>
										<option value="C++"
											<%if (language_list.get(i).equals("C++")) {%> selected
											<%}%>>C++</option>
										<option value="JSP"
											<%if (language_list.get(i).equals("JSP")) {%> selected
											<%}%>>JSP</option>
										<option value="PHP"
											<%if (language_list.get(i).equals("PHP")) {%> selected
											<%}%>>PHP</option>
										<option value="HTML"
											<%if (language_list.get(i).equals("HTML")) {%> selected
											<%}%>>HTML</option>
										<option value="JAVA"
											<%if (language_list.get(i).equals("JAVA")) {%> selected
											<%}%>>JAVA</option>
										<option value="Object-C"
											<%if (language_list.get(i).equals("Object-C")) {%> selected
											<%}%>>Object-C</option>
										<option value="Swift"
											<%if (language_list.get(i).equals("Swift")) {%> selected
											<%}%>>Swift</option>
										<option value="Android"
											<%if (language_list.get(i).equals("Android")) {%> selected
											<%}%>>Android</option>
										<option value="Spring"
											<%if (language_list.get(i).equals("Spring")) {%> selected
											<%}%>>Spring FrameWork</option>
								</select> <label class="col-sm-3"><input class="radio-inline"
										type="radio" value="10" name="language_level<%=i + 1%>"
										disabled="disabled"
										<%if ((Integer) language_level_list.get(i) == 30) {%> checked
										<%}%>> 상 </label> <label class="col-sm-3"><input
										class="radio-inline" type="radio" value="20"
										name="language_level<%=i + 1%>" disabled="disabled"
										<%if ((Integer) language_level_list.get(i) == 20) {%> checked
										<%}%>> 중 </label> <label class="col-sm-3"><input
										class="radio-inline" type="radio" value="30"
										name="language_level<%=i + 1%>" disabled="disabled"
										<%if ((Integer) language_level_list.get(i) == 10) {%> checked
										<%}%>> 하 </label></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
					<legend>
						<label class="col-sm-3 control-label">평가정보</label>
					</legend>

					<!-- 김용민이 수정하는 부분 2015년 12월 02 일 23시 시작.  -->
					<table id="developer_join" class="table table-striped table-hover "
						style="width: 800px;">
						<tbody>
							<tr>
								<th>프로젝트번호</th>
								<th>프로젝트내 업무</th>
								<th>업무능력(평균)</th>
								<th>소통능력(평균)</th>
								<th>기술능력(평균)</th>
								<th>PM의 한마디</th>
							</tr>
							<%
								ArrayList<Hashtable> eval_list = showBean.getEvaluationList();
									for (int j = 0; j < eval_list.size(); j++) {
							%>
							<tr>
								<td><a
									href="${pageContext.request.contextPath}/ProjectController/showProjectInformation?pid=<%=eval_list.get(j).get("Project_Identifier")%>"><%=eval_list.get(j).get("Project_Identifier")%></td>
								<td><%=Permission_map.get(eval_list.get(j).get("Project_Role"))%></td>
								<td><%=eval_list.get(j).get("wg")%></td>
								<td><%=eval_list.get(j).get("cc")%></td>
								<td><%=eval_list.get(j).get("tg")%></td>
								<td>
									<%
										if (eval_list.get(j).get("Project_Role").equals("11")) {
									%><%=eval_list.get(j).get("Evaluation_Contents")%>
									<%
										}
									%>
								</td>
							</tr>

							<%
								}
							%>
						</tbody>
					</table>
					<div class="form-group">
						
							<div class="project_post" style="display: none;">
			<h1>과거 프로젝트</h1>
			<table class="table table-striped table-hover" border="1"
				width="1400px">
				<tr align="center">
					<td width="70px">번호</td>
					<td width="200px">프로젝트 이름</td>
					<td width="180px">내 역할</td>
					<td width="250px">프로젝트 시작 날짜</td>
					<td width="250px">종료 날짜</td>
					<td width="250px">역할 시작 날짜</td>
					<td width="250px">종료 날짜</td>
					<td width="300px">설명</td>
					<td width="200px">파견 지역</td>
					<td width="200px">PM</td>
					<td width="200px">고객 평가</td>
					<td width="180px">현재 상태</td>
				</tr>
				<%
					if (pastProject.isEmpty()) {
				%>
<tr>
				<h2>종료된 프로젝트가 없습니다.</h2>
				</tr>

				<%
					System.out.println("종료된 프로젝트가 없습니다.");
					} else {
						for (userProjectBean c : pastProject) {
				
				%>
				<form>
					
					<tr align="center">
						<td width="70px"><%=c.getProject_Identifier()%></td>
						<td width="200px"><a
							href="${pageContext.request.contextPath}/ProjectController/showProjectInformation?pid=<%=c.getProject_Identifier()%>"><%=c.getProject_name()%></a></td>
						<td><%=Project_Part.get(c.getProject_Role())%></td>
						<td width="250px"><%=c.getStart_Date()%></td>
						<td width="250px"><%=c.getEnd_Date()%></td>
						<td width="250px"><%=c.getrStart_Date()%></td>
						<td width="250px"><%=c.getrEnd_Date()%></td>
						<td width="300px"><%=c.getPproject_Description()%></td>
						<td width="200px"><%=c.getPdispatch_Location()%></td>
						
						<td width="200px"><a
							href='${pageContext.request.contextPath}/LoginController/retrieveUser?id=<%=c.getProjectmanager_Identifier()%>'><%=c.getProjectmanager_Identifier()%></a></td>
						<td width="180px"><%=c.getProject_Evaluation()%></td>
						<td width="180px"><%=Project_status_map.get(c.getPstatus())%></td>
					</tr>

				</form>
				<%
					}
					}
				%>

			</table>
		</div>
			
					</div>



				</div>

			</div>
			<%
				}
			%>
		</fieldset>
	</form>
	<div class="form-group">
		<label for="inputname" class="col-sm-5 control-label"></label>
		<div class="col-sm-2">

			<form
				action="${pageContext.request.contextPath}/LoginController/editMemberPage"
				method="POST">
				<input type="hidden" name="id" value="<%=showBean.getId()%>">
				<%
					if (showBean.getDi() == 17) {
				%>
				<input type="hidden" name="cat" value="common">
				<%
					}
				%>
				<%
					if (showBean.getDi() == 99) {
				%>
				<input type="hidden" name="cat" value="FreeLancer">
				<%
					} else {
				%>

				<%
					}
				%>
				<button type="submit" class="btn btn-primary">정보 수정하기</button>
			</form>
		</div>
		<div class="col-sm-1">
			<button type="button" class="btn btn-default"
				onclick="location.replace('${pageContext.request.contextPath}/LoginController/main')">뒤로가기</button>
		</div>
	</div>

</body>
</html>