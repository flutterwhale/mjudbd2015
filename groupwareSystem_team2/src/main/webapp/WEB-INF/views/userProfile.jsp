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
<%@ page import="kr.ac.mju.prompt.model.UserBean"%>
<%@page import="java.util.*"%>
<%
	//ArrayList myLectures = (ArrayList) request.getAttribute("MyLectures");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://bootswatch.com/flatly/bootstrap.min.css">
<title>정보 조회</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>

	<%
		
		String sID = session.getAttribute("session_name").toString();
		UserInfo sUinfo = (UserInfo)session.getAttribute("userinfo");
		signupBean showBean = (signupBean)request.getAttribute("showBean");	
		session.setAttribute("showBean", showBean);	
		
		
		
		System.out.println(showBean.getId());
		System.out.println("session ID " + sID + " cat "+ sUinfo.getMyUser().getCat());
	%>
		<form class="form-horizontal" onSubmit="return check()" method="POST" name="myform">
			<fieldset>
		         <legend><label class="col-sm-3 control-label"><%=showBean.getId() %>/ <%=showBean.getName() %> <br>직원 정보 조회</label></legend>
		       	 <div class="form-group">
		       	 </div>
		       	 <div class="form-group">
		       	 </div>
		       	 <div class="form-group">
		       	 </div>
		       	 <div class="form-group">
		            <label for="inputname" class="col-sm-4 control-label">이름</label>
		             <div class="col-sm-6">
		                  <input type="text" class="form-control" style="width:200px;" id="name" name="signupName" placeholder="최대8글자" size="8" maxlength="8"  disabled="disabled" value="<%=showBean.getName()%>">
		             </div>
		         </div>
		         <div class="form-group">
		            <label for="inputname" class="col-sm-4 control-label">아이디</label>
		             <div class="col-sm-2">
		                  <input type="text" class="form-control" style="width:200px;" id="id" name="signupID" placeholder="8자리 숫자 사용" size="8" maxlength="8" disabled="disabled" value="<%=showBean.getId()%>">
		                  
		             </div>
		             <div class="col-sm-1">
		                   <!-- button class="btn btn-success" type="button"  onclick="idCheck()">id 중복 체크</button -->
		             </div>
		            
		          </div>  
		          <div class="form-group">
		            <label for="inputname" class="col-sm-4 control-label">연락처</label>
		             <div class="col-sm-6">
		                  <input type="text" class="form-control" style="width:200px;" id="phone" name="phone" size="15" placeholder="010-1234-1234" maxlength="13" disabled="disabled" value="<%=showBean.getPhone()%>">
		             </div>
		          </div>
		          <div class="form-group">
		            <label for="inputname" class="col-sm-4 control-label">사내연락처</label>
		             <div class="col-sm-6">
		                  <input type="text" class="form-control" style="width:200px;" id="phone" name="phone" size="15" placeholder="010-1234-1234" maxlength="13" disabled="disabled" value="<%=showBean.getOffice_Number()%>">
		             </div>
		          </div>
		          <div class="form-group">
		            <label for="inputname" class="col-sm-4 control-label">부서</label>
		             <div class="col-sm-6">
		                  <input type="text" class="form-control" style="width:200px;" id="phone" name="phone" size="15" placeholder="010-1234-1234" maxlength="13" disabled="disabled" value="<%=Depart_map.get(showBean.getDi())%>">
		             </div>
		          </div>
		          <div class="form-group">
		            <label for="inputname" class="col-sm-4 control-label">직급</label>
		             <div class="col-sm-6">
		                  <input type="text" class="form-control" style="width:200px;" id="phone" name="phone" size="15" placeholder="010-1234-1234" maxlength="13" disabled="disabled" value="<%=Position_map.get(showBean.getPosition_Name())%>">
		             </div>
		          </div>
		         <div class="form-group">
		            <label for="inputname" class="col-sm-4 control-label">e-mail</label>
		             <div class="col-sm-6">
		                  <input type="text" class="form-control" style="width:200px;" id="email" name="email" size="15" placeholder="prompt@prompt.co.kr" maxlength="30" disabled="disabled" value="<%=showBean.getEmail()%>">
		             </div>
		          </div>   
		         <div class="form-group">
		            <label for="inputname" class="col-sm-4 control-label">입사일자</label>
		             <div class="col-sm-6">
		                  <input type="text" class="form-control" style="width:200px;" id="email" name="입사일자" size="15" placeholder="prompt@prompt.co.kr" maxlength="30" disabled="disabled" value="<%=showBean.getJoining_Date()%>">
		             </div>
		          </div> 
		          
		         <%  if(showBean.getRetired_Date()!=null){  %>
		      
		         <div class="form-group">
		            <label for="inputname" class="col-sm-4 control-label">퇴사일자</label>
		             <div classe="col-sm-6">
		                  <input type="text" class="form-control" style="width:200px;" id="email" name="입사일자" size="15" placeholder="prompt@prompt.co.kr" maxlength="30" disabled="disabled" value="<%=showBean.getRetired_Date()%>">
		             </div>
		          </div> 
		         <% }%>
	        </fieldset>
			<fieldset>
	         <!--  개발자인경우에만 아래의 항목이 보여지게 된다.-->
	        <% if(showBean.getDi()==17||showBean.getDi()==99){  %>
	        <legend><label class="col-sm-3 control-label">기타정보</label></legend>
	       	<div class="form-group">
	       	</div>
	       	<div class="form-group">
	       	</div>
	       	<div class="form-group">
	       	</div>
	        
	         <div class="form-group">
	            <label for="inputname" class="col-sm-4 control-label">고용관계</label>
	            <div class="col-sm-2">
			        <label class="radio-inline"><input type="radio" value="FreeLancer" name="isFreelancer" disabled="disabled"<% if(showBean.getDi()==99){  %>checked <%} %>> 프리랜서</label>
		        </div>
		        <div class="col-sm-2">
			        <label class="radio-inline"><input type="radio" value="common" name="isFreelancer"  disabled="disabled" <% if(showBean.getDi()==17){  %>checked <%} %>> 정직원</label> 
		        </div>
	         </div>
	          
	          <div class="form-group">
	           	<label for="inputname" class="col-sm-4 control-label">KOSA 기술등급</label>
	            <div class="col-sm-2">
			    	<label class="radio-inline"><input class="radio-inline" type="radio" value="10"name="tech_level" disabled="disabled" <% if(showBean.getTech_level()==10){  %>checked <%} %>> 고급</label> 
		        </div>
		        <div class="col-sm-2">
			        <label class="radio-inline"><input class="radio-inline" type="radio" value="20" name="tech_level" disabled="disabled" <% if(showBean.getTech_level()==20){  %>checked <%} %>>중급</label> 
		        </div>
		        <div class="col-sm-2">
			        <label class="radio-inline"><input class="radio-inline" type="radio" value="30" name="tech_level" disabled="disabled" <% if(showBean.getTech_level()==30){  %>checked <%} %>>초급</label>
		        </div>
	         </div>
	         <div class="form-group"> 
		     	<label for="inputname" class="col-sm-4 control-label">프로그래밍 언어</label>
		     	<div class="col-sm-5"> 
		         
		         <table id="developer_join" class="table table-striped table-hover " style="width:600px;">
			         <tbody>
			        
			         <%
				       	ArrayList language_list = showBean.getLanguage_list(); 
						ArrayList language_level_list = showBean.getLanguage_level_list(); 
						System.out.print(language_list.size());
						int i;
				       	for(i =0; i<language_list.size();i++){ 
				     %>
				         <tr id ="item<%=i+1 %>" class="item<%=i+1 %>">
							<%if(i==0){ %><td rowspan=<%=i+2 %> align="center" valign="middle" id="getRowSpan"><label for="inputname" class="">언어별 능력</label></td><%} %>
							<script type="text/javascript">document.getElementById("getRowSpan").setAttribute("rowspan",<%=i+2%>);</script>
							<td>
								<select id="select<%=i+1 %>" name="select<%=i+1 %>" class="form-control" disabled="disabled" onclick="langugeEtc(this.value,this.name)" >
				                    <option value="etc" selected >etc(<%=language_list.get(i)%>)</option>
				                    <option value="C"   <% if(language_list.get(i).equals("C")){  %>selected <%} %>>C</option>
				                    <option value="C++" <% if(language_list.get(i).equals("C++")){  %>selected <%} %>>C++</option>
				                    <option value="JSP" <% if(language_list.get(i).equals("JSP")){  %>selected <%} %>>JSP</option>
				                    <option value="PHP" <% if(language_list.get(i).equals("PHP")){  %>selected <%} %>>PHP</option>
				                    <option value="HTML"<% if(language_list.get(i).equals("HTML")){  %>selected <%} %> >HTML</option>
				                    <option value="JAVA"<% if(language_list.get(i).equals("JAVA")){  %>selected <%} %> >JAVA</option>
				                    <option value="Object-C"<% if(language_list.get(i).equals("Object-C")){  %>selected <%} %>>Object-C</option>
				                    <option value="Swift"<% if(language_list.get(i).equals("Swift")){  %>selected <%} %>>Swift</option>
				                    <option value="Android"<% if(language_list.get(i).equals("Android")){  %>selected <%} %>>Android</option>
				                    <option value="Spring"<% if(language_list.get(i).equals("Spring")){  %>selected <%} %>>Spring FrameWork</option>
				                </select>
				                <label class="col-sm-3"><input class="radio-inline" type="radio" value="10" name="language_level<%=i+1 %>" disabled="disabled" <% if((Integer)language_level_list.get(i)==30){  %>checked <%} %>>  상  </label> 
								<label class="col-sm-3"><input class="radio-inline" type="radio" value="20" name="language_level<%=i+1 %>"disabled="disabled"<% if((Integer)language_level_list.get(i)==20){  %>checked <%} %> >  중  </label>
								<label class="col-sm-3"><input class="radio-inline" type="radio" value="30" name="language_level<%=i+1 %>" disabled="disabled"<% if((Integer)language_level_list.get(i)==10){  %>checked <%} %> >  하  </label>
							</td>
						</tr>
					<%} %>
					</tbody>
				</table>
	          
	          </div>
	         </div>
	      	<% }%>
	         </fieldset>
			</form>
			<div class="form-group">
		      	<label for="inputname" class="col-sm-5 control-label"></label>
				<div class="col-sm-2">
				
				<form
					action="${pageContext.request.contextPath}/LoginController/editMemberPage"
					method="POST">
					<input type="hidden" name="id"  value="<%=showBean.getId()%>"> 
					<%if(showBean.getDi()==17){ %>
						<input type="hidden" name="cat"  value="common"> 
					<% } %>
					<%if(showBean.getDi()==99){ %>
						<input type="hidden" name="cat"  value="FreeLancer"> 
					<% }else{ %>
						
					<% } %>
					<%if(showBean.getId()==Integer.parseInt(sID)||((UserBean)session.getAttribute("myUser")).getDi()==15){ %>
						<button type="submit" class="btn btn-primary">정보 수정하기</button>
					<%} %>
				</form>
				</div>
				<div class="col-sm-1">
					<button type="button" class="btn btn-default" onclick="history.go(-1)">뒤로가기</button>
				</div>
		    </div>
	
</body>
</html>