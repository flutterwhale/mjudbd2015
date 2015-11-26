<%@page import="kr.ac.mju.prompt.model.signupBean"%>
<%@page import="kr.ac.mju.prompt.model.UserInfo"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://bootswatch.com/flatly/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일반직원 그룹웨어 가입</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('address').value = data.zonecode.concat(" ").concat(fullRoadAddr);
            }
        }).open();
    }
</script>

<script type="text/javascript">

	function idCheck(){
		
		var id = document.getElementById("id").value;
		var reg_uid = /^[1-9][0-9]{7}$/;//아이디 유효성확인.
		if( reg_uid.test(id) != true ) {
	           alert("1이상으로 시작하는 수와 8자리 숫자만 넣으셔야 합니다.");
	           document.myform.signupID.value="";
	           document.myform.signupID.focus();
	           return false;
	    }
		window.open("${pageContext.request.contextPath}/LoginController/idcheck.do?id="+id+"","id중복 체크","width=100,height=100");
	}
	

	function check() {

		var reg_uid = /^[1-9][0-9]{7}$/;//아이디 유효성확인.
		var reg_email = /^[_a-z0-9-](.[_a-z0-9-]+)*@[a-z0-9-](.[a-z0-9-]+)*$/;
		var reg_ssn = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/;
		var reg_phone = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
		
		id = document.myform.signupID.value;
		name = document.myform.signupName.value;
		pass1 = document.myform.signupPW.value;
		pass2 = document.myform.signupPW2.value;
		ssn = document.myform.ssn.value;
		phone = document.myform.phone.value;
		email = document.myform.email.value;
		address = document.myform.address.value;
		gender = document.myform.gender.value;
		university = document.myform.university.value;
		depart = document.myform.depart.value;
		major = document.myform.major.value;
		graduation = document.myform.graduation.value;
		career = document.myform.career.value;

		if (name == "") {
			alert("이름를 입력해 주세요");
			document.myform.signupName.focus();
			return false;
		} else if( reg_uid.test(id) != true ) {
	           alert("8자리 숫자만 넣으셔야 합니다.");
	           document.myform.signupID.value="";
	           document.myform.signupID.focus();
	           return false;
	    }else if (pass1 == "") {
			alert("암호를 입력해 주세요");
			document.myform.signupPW.focus();
			return false;
		} else if (pass2 == "") {
			alert("암호 확인을 입력해 주세요");
			document.myform.signupPW2.focus();
			return false;
		} else if(pass1!=pass2){
			alert("암호 확인값이 다릅니다.");
			document.myform.signupPW2.focus();
			document.myform.signupPW2.value="";
			return false;
		}else if( reg_ssn.test(ssn) != true ) {
	           alert("주민번호를 재대로 입력해주세요.");
	           document.myform.ssn.value="";
	           document.myform.ssn.focus();
	           return false;
	    }else if( reg_phone.test(phone) != true ) {
	           alert("연락처를 재대로 입력해주세요.");
	           document.myform.phone.value="";
	           document.myform.phone.focus();
	           return false;
	    }else if( reg_email.test(email) != true ) {
	           alert("이메일을 재대로 입력해주세요.");
	           document.myform.email.value="";
	           document.myform.email.focus();
	           return false;
	    }else if (address == "") {
			alert("주소를 입력해 주세요");
			document.myform.address.focus();
			return false;
		}else if (gender == "") {
			alert("성별을 입력해 주세요");
			document.myform.gender.focus();
			return false;
		}else if (university == "") {
			alert("대학을 입력해 주세요");
			document.myform.university.focus();
			return false;
		}else if (depart == "") {
			alert("학과(부)을 입력해 주세요");
			document.myform.depart.focus();
			return false;
		}else if (major == "") {
			alert("전공을 입력해 주세요");
			document.myform.major.focus();
			return false;
		}else if (graduation == "") {
			alert("학위를 선택해 주세요");
			document.myform.graduation.focus();
			return false;
		}else if (career == "") {
			alert("경력을 입력해주세요");
			document.myform.career.focus();
			return false;
		}
		else {
			alert("제출합니다.");
		}
	}
</script>
</head>
<body>

	<%
		String sID = session.getAttribute("session_name").toString();
		UserInfo sUinfo = (UserInfo)session.getAttribute("userinfo");
		signupBean showBean = (signupBean)session.getAttribute("showBean");	
		//request.setAttribute("editMember: showBean", showBean)	;	
		System.out.println("editMember: session ID " + sID);
		String academy[] = showBean.getA_career().split("\\.");
		
	%>
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
	                <li><a></a></li>
	               </ul>
	          </div>
	        </div>
	   </nav>
	<form class="form-horizontal" onSubmit="return check()"
			action="${pageContext.request.contextPath}/LoginController/updateMember.do"
			method="POST" name="myform">
			<fieldset>
		         <legend><label class="col-sm-3 control-label">개인정보(수정)</label></legend>
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
		                  <input type="text" class="form-control" style="width:200px;" id="id" name="signupIDDisable" placeholder="8자리 숫자 사용" size="8" maxlength="8" disabled="disabled" value="<%=showBean.getId()%>">
		             	  <input type="hidden" class="form-control" style="width:200px;" id="id" name="signupID" placeholder="8자리 숫자 사용" size="8" maxlength="8" value="<%=showBean.getId()%>">
		             </div>
		          </div>
		         <div class="form-group">
		            <label for="inputname" class="col-sm-4 control-label">비밀번호</label>
		             <div class="col-sm-6">
		                  <input type="password" class="form-control" style="width:200px;" id="pw" name="signupPW" placeholder="최대15글자" size="15" maxlength="15" value="<%=showBean.getPassword()%>">
		             </div>
		          </div>
		         <div class="form-group">
		            <label for="inputname" class="col-sm-4 control-label">비밀번호 확인</label>
		             <div class="col-sm-6">
		                  <input type="password" class="form-control" style="width:200px;" id="pw2" name="signupPW2" placeholder="수정을 위하여 비밀번호 입력" size="15" maxlength="15" >
		             </div>
		          </div>   
		         <div class="form-group">
		            <label for="inputname" class="col-sm-4 control-label">주민번호</label>
		             <div class="col-sm-6">
		                  <input type="text" class="form-control" style="width:200px;" id="ssn" name="ssn" size="14" placeholder="910111-1234567"maxlength="14" disabled="disabled" value="<%=showBean.getSsn()%>">
		             </div>
		          </div>   
		         <div class="form-group">
		            <label for="inputname" class="col-sm-4 control-label">연락처</label>
		             <div class="col-sm-6">
		                  <input type="text" class="form-control" style="width:200px;" id="phone" name="phone" size="15" placeholder="010-1234-1234" maxlength="13"value="<%=showBean.getPhone()%>">
		             </div>
		          </div>
		         <div class="form-group">
		            <label for="inputname" class="col-sm-4 control-label">e-mail</label>
		             <div class="col-sm-6">
		                  <input type="text" class="form-control" style="width:200px;" id="email" name="email" size="15" placeholder="prompt@prompt.co.kr" maxlength="30" value="<%=showBean.getEmail()%>">
		             </div>
		          </div>   
		         
		         <div class="form-group">
		            <label for="inputname" class="col-sm-4 control-label">주소</label>
		            <div class="col-sm-6">
						<input type="button" class="col-lg-2 btn btn-info" onclick="sample4_execDaumPostcode()" value="우편번호"/> 
						<input type="text"id="address" class="col-lg-4 form-control" style="width:400px;" name="address" size="50" placeholder="클릭해서 주소를 입력해주세요." onclick="sample4_execDaumPostcode()" value="<%=showBean.getAddr()%>"/> 
			        </div>
		         </div>
		         <div class="form-group">
		            <label for="inputname" class="col-sm-4 control-label">성별</label>
		            <div class="col-sm-2">
			            <label class="radio-inline"><input type="radio"  value="1" name="gender" <%if(showBean.getGender()==1){%> checked <%} %>>남자</label>
		            </div>
		            <div class="col-sm-2">
			            <label class="radio-inline"><input type="radio" value="0" name="gender" <%if(showBean.getGender()==0){%> checked <%} %>>여자</label>
		            </div>
		          </div>
	        </fieldset>
			<fieldset>
	         	<legend><label class="col-sm-3 control-label">기타정보</label></legend>
	       	<div class="form-group">
	       	</div>
	       	<div class="form-group">
	       	</div>
	       	<div class="form-group">
	       	</div>
	        <div class="form-group">
	            <label for="inputname" class="col-sm-4 control-label">최종학력</label>
	            <div class="col-sm-8">
		            <div class="col-sm-3">              
		                <input id="university" type="text" class="form-control" name="university" style="width:200px;" size="10" maxlength="10" placeholder="명지대" value="<%=academy[0]%>" >
					</div>
					<div class="col-sm-1">              
		                <label class="control-label">학교</label>
					</div>
					<div class="col-sm-3">
						<input id="depart" type="text" class="form-control" name="depart" style="width:200px;" size="10" maxlength="10" placeholder="컴퓨공"  value="<%=academy[1]%>">
					</div>
					<div class="col-sm-2">              
		                <label class="control-label">학과(부)</label>
					</div>
				</div>
			</div>
			<div class="form-group">
	      		<label for="inputname" class="col-sm-4 control-label"></label>
				<div class="col-sm-8">
					<div class="col-sm-3">
						<input id="major" type="text" class="form-control" name="major" style="width:200px;" size="10" maxlength="10" placeholder="컴퓨공학"  value="<%=academy[2]%>">
					</div>
					<div class="col-sm-1">              
		                <label class="control-label">전공</label>
					</div>
					<div class="col-sm-3">	
						<select id="graduation" name="graduation" class="form-control"style="width:200px;">
		                    <option value="박사" <%if(academy[3].equals("박사")){ %>selected<%}%>>박사</option>
		                    <option value="박사수료"<%if(academy[3].equals("박사수료")){ %>selected<%}%>>박사수료</option>
		                    <option value="박사재학"<%if(academy[3].equals("박사재학")){ %>selected<%}%>>박사재학</option>
		                    <option value="석사"<%if(academy[3].equals("석사")){ %>selected<%}%>>석사</option>
		                    <option value="석사수료"<%if(academy[3].equals("석사수료")){ %>selected<%}%>>석사수료</option>
		                    <option value="석사재학"<%if(academy[3].equals("석사재학")){ %>selected<%}%>>석사재학</option>
		                    <option value="학사" <%if(academy[3].equals("학사")){ %>selected<%}%>>학사</option>
		                    <option value="학사수료"<%if(academy[3].equals("학사수료")){ %>selected<%}%>>학사수료</option>
		                    <option value="학사재학"<%if(academy[3].equals("학사재학")){ %>selected<%}%>>학사재학</option>
		                    <option value="고등학교졸"<%if(academy[3].equals("고등학교졸")){ %>selected<%}%>>고등학교졸</option>
		                </select> 
		             </div>
		             <div class="col-sm-2">              
		               <label class="control-label">학위</label>
					</div>
	             </div>
	          </div>
	          <div class="form-group">
	            <label for="inputname" class="col-sm-4 control-label">경력</label>
	            <div class="col-sm-6">
	                  <textarea id="career" class="form-control" style="width:600px;" name="career" cols="30" rows="5" placeholder="기존 회사의 경력을 기술해주세요." ><%=showBean.getCareer()%></textarea>
	               </div>
	          </div>
	        
	         <div class="form-group">
	            <label for="inputname" class="col-sm-4 control-label">포트폴리오 업로드</label>
	            <div class="col-sm-6">
	                  <label class="control-label"><input class="btn btn-primary btn-xs" type="file" id="portfolio" style="width:300px;" name="portfolio" placeholder="<%=showBean.getPortfolio()%>"></label>
	             </div>
	         </div>
	        </fieldset>
			<div class="form-group">
		      	<label for="inputname" class="col-sm-5 control-label"></label>
				<div class="col-sm-1">
					<button type="submit" class="btn btn-primary">제출</button>
				</div> 
				<div class="col-sm-1">
					<button type="button" class="btn btn-default" onclick="location.replace('${pageContext.request.contextPath}/LoginController/showMemberPage')">뒤로가기</button>
				</div>
		    </div>
	</form>
	
</body>
</html>