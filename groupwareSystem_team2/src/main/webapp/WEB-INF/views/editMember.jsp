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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>
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
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
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
function check() {
	var reg_uid = /^[1-9][0-9]{7}$/;//아이디 유효성확인.
	var reg_email = /^[_a-z0-9-](.[_a-z0-9-]+)*@[a-z0-9-](.[a-z0-9-]+)*$/;
	var reg_ssn = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/;
	var reg_phone = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
	var address_button = 
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
	tech_level = document.myform.tech_level.value;
	
	if (name == "") {
		alert("이름를 입력해 주세요");
		document.myform.signupName.focus();
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
      			<a class="navbar-brand" href="${pageContext.request.contextPath}/LoginController/logout.do">GruopwareSystem</a>
    		</div>

    		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      			<ul class="nav navbar-nav navbar-right">
        			<li><a href="https://tahiti.mju.ac.kr/moodle/">메뉴</a></li>
      			</ul>
    		</div>
  		</div>
	</nav>
	
	<div style="margin:10px 40px;">
		<h2>개인 정보 수정 페이지</h2>
		<div>
			<form onSubmit="return check()"
				action="${pageContext.request.contextPath}/LoginController/updateMember.do"
				method="POST" name="myform">
				<table class="table table-striped table-hover" id="developer_join">
					<tr>
						<td colspan="3"><strong>개인 정보</strong></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input id="name" type="text" name="signupName" size="8" maxlength="8" disabled="disabled" value="<%=showBean.getName()%>"></td>
						<td>최대8글자</td>
					</tr>
					<tr>
						<td>아이디</td>
						<td><input id="id" type="text" name="signupID" size="9" maxlength="8" disabled="disabled" value="<%=sID%>" ></td>
						<td></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input id="pw" type="password" name="signupPW" size="15" maxlength="15"></td>
						<td>최대 15글자</td>
					</tr>
					<tr>
						<td>비밀번호확인</td>
						<td><input id="pw2" type="password" name="signupPW2" size="15" maxlength="15"></td>
						<td>최대 15글자</td>
					</tr>
					<tr>
						<td>주민 번호</td>
						<td><input id="ssn" type="text" name="ssn" size="14" maxlength="14" disabled="disabled"  value="<%=showBean.getSsn()%>"></td>
					</tr>
					<tr>
						<td>연락처</td>
						<td><input id="phone" type="text" name="phone" size="15" maxlength="13"></td>
						<td>010-0000-0000형태 작성.</td>
					</tr>
					<tr>
						<td>email</td>
						<td><input id="email" type="text" name="email" size="15" maxlength="30"></td>
						<td></td>
					</tr>
					<tr>
						<td>주소</td>
						<td colspan="2">
							<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
							<input type="text"id="address" name="address" size="50" onclick="sample4_execDaumPostcode()"/>
						</td>
					</tr>
					<tr>
						<td>성별</td>
						<td colspan="2">
							<label><input type="radio" value="1" name="gender">남자</label>
							<label><input type="radio" value="0" name="gender" checked>여자</label></td>
					</tr>
					<tr>
						<td colspan="3"><strong>기타 정보</strong></td>
					</tr>
					<tr>
						<td>학력 :</td>
						<td colspan="2">
							<input id="university" type="text" name="university" size="10" maxlength="10">학교 
							<input id="depart" type="text" name="depart" size="10" maxlength="10">학과(부) 
							<input id="major" type="text" name="major" size="10" maxlength="10">전공
							<select id="graduation" name="graduation" >
			                  	<option value="박사" >박사</option>
			                    <option value="박사수료" >박사수료</option>
	        		            <option value="박사재학" >박사재학</option>
	           			        <option value="석사" >석사</option>
	                		    <option value="석사수료" >석사수료</option>
	             			    <option value="석사재학" >석사재학</option>
	              			    <option value="학사" >학사</option>
	             			    <option value="학사수료" >학사수료</option>
	             			    <option value="학사재학">학사재학</option>
	                  			<option value="고등학교졸">고등학교졸</option>
	              			 </select>
						</td>
					</tr>
					<tr>
						<td>경력</td>
						<td colspan="2"><textarea id="career" name="career" cols="65" rows="5"></textarea></td>
					</tr>
					<tr>
						<td>포트폴리오 업로드</td>
						<td colspan="2"><input type="file" id="portfolio" name="portfolio"></td>
					</tr>
				</table>

				<button class="btn btn-primary" type="submit" class="btn_signup">제출</button>
			</form>
		</div>
		<div>
			<button class="btn btn-primary" type="button"
    	        onclick="location.replace('${pageContext.request.contextPath}/LoginController/showMemberPage')">뒤로가기</button>
            <button class="btn btn-primary" type="button"
    	        onclick="location.replace('${pageContext.request.contextPath}/LoginController/main')">메인화면</button>
		</div>
	</div>
</body>
</html>