<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>

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

	

	$(document).ready(function(){

	    

	    // 옵션추가 버튼 클릭시

		$("#addItemBtn").click(function(){

			// item 의 최대번호 구하기

			var lastItemNo = $("#developer_join tr:last").attr("class").replace("item", "");

			

			if(lastItemNo >=20){

	        	alert("최대 개수는 20개입니다.");

	        }else{

	        	$("#developer_join tr:eq(17)").find("td:eq(0)").attr("rowspan", (parseInt(lastItemNo)+1));

	        	$("#developer_join tr:eq(16)").find("td:eq(0)").find("input:eq(0)").attr("value", (parseInt(lastItemNo)+1));

		        

	        	var newitem = $("#developer_join tr:last").clone();

				newitem.removeClass();

				if(lastItemNo==1){

					newitem.find("td:eq(0)").remove();

					newitem.find("td:eq(1)").find("button:eq(0)").attr("class", "delBtn");

					newitem.find("td:eq(1)").find("button:eq(0)").attr("onclick", " ");

				}

				newitem.find("td:eq(0)").find("select:eq(0)").attr("id","select"+(parseInt(lastItemNo)+1));

				newitem.find("td:eq(0)").find("select:eq(0)").attr("name","select"+(parseInt(lastItemNo)+1));

				newitem.find("td:eq(0)").find("input:eq(0)").attr("id","language"+(parseInt(lastItemNo)+1));

				newitem.find("td:eq(0)").find("input:eq(0)").attr("name","language"+(parseInt(lastItemNo)+1));

				

				

				newitem.find("td:eq(0)").find("label:eq(0)").find("input:eq(0)").attr("name","language_level"+(parseInt(lastItemNo)+1));

		        newitem.find("td:eq(0)").find("label:eq(1)").find("input:eq(0)").attr("name","language_level"+(parseInt(lastItemNo)+1));

		        newitem.find("td:eq(0)").find("label:eq(2)").find("input:eq(0)").attr("name","language_level"+(parseInt(lastItemNo)+1));      

		        newitem.addClass("item"+(parseInt(lastItemNo)+1));

				$("#developer_join").append(newitem);

				document.getElementById("language"+(parseInt(lastItemNo)+1)).setAttribute("type","hidden");

				

	        }

		});

	                  

		// 삭제버튼 클릭시

		$(".delBtn").live("click", function(){

			var clickedRow = $(this).parent().parent();

			var cls = clickedRow.attr("class");

			

			// 각 항목의 첫번째 row를 삭제한 경우 다음 row에 td 하나를 추가해 준다.

			if( clickedRow.find("td:eq(0)").attr("rowspan") ){

				if( clickedRow.next().hasClass(cls) ){

					clickedRow.next().prepend(clickedRow.find("td:eq(0)"));

				}

			}

			clickedRow.remove();

		});

	

	});

	function idCheck(){
		var id = document.getElementById("id").value;
		var reg_uid = /^[1-9][0-9]{7}$/;//아이디 유효성확인.

		if( reg_uid.test(id) != true ) {
		
	           alert("8자리 숫자만 넣으셔야 합니다.");

	           document.myform.signupID.value="";

	           document.myform.signupID.focus();

	           return false;

	    }
		
		window.open("${pageContext.request.contextPath}/LoginController/idcheck.do?id="+id+"","id중복 체크","width=100,height=100");
		
		
		
	}
	function langugeEtc(s,select_name){

		

		var num = select_name.substr(6,select_name.length-6);

		var name = "language".concat(num.toString());

		

		if(s.substr(0,3)=="etc"){

			document.getElementById(name).setAttribute("type","text");

			document.getElementById(name).value="";

		}else{

			document.getElementById(name).setAttribute("type","hidden");

			document.getElementById(name).value=s;

		}	

	}

	function languageEtcInput(object,input){

		document.getElementById(object).setAttribute("value",input);

	}

	

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
	<form onSubmit="return check()"
			action="${pageContext.request.contextPath}/LoginController/signup_developer"
			method="POST" name="myform">
	<table id="developer_join" border="1">
		<tr>
			<td colspan="3"><h2>개인 정보</h2></td>
			</tr>
		<tr>
			<td>이름</td>
			<td><input id="name" type="text" name="signupName" size="8" maxlength="8"></td>
			<td>최대8글자</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input id="id" type="text" name="signupID" size="8" maxlength="8"  ><button type="button"  onclick="idCheck()">id 중복 체크</button></td>
			<td>8자리 숫자사용</td>
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
			<td><input id="ssn" type="text" name="ssn" size="14" maxlength="14"></td>
			<td>-를 포함하여 작성</td>
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
			<label><input type="radio" value="1" name="gender" checked>남자</label>
			<label><input type="radio" value="0" name="gender">여자</label></td>
		</tr>
		<tr>
			<td colspan="3"><h2>기타 정보</h2></td>
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
			<td>고용관계</td>
			<td colspan="2"><label><input type="radio" value="FreeLancer"
					name="isFreelancer"> 프리랜서</label> <label><input type="radio"
					value="common" name="isFreelancer"> 정직원</label></td>
		</tr>
		<tr>
			<td>포트폴리오 업로드</td>
			<td colspan="2"><input type="file" id="portfolio" name="portfolio"></td>
		</tr>
		<tr>
			<td>기술 등급</td>
			<td><label><input type="radio" value="10"
					name="tech_level"> 고급</label> <label><input type="radio"
					value="20" name="tech_level"> 중급</label> <label><input
					type="radio" value="30" name="tech_level" checked> 하급</label></td>
			<td>자신의 기술 등급 기재</td>
		</tr>
		<tr>
			<td colspan="3"><input type="hidden" id="language_count" name="language_count" value="1"><button id="addItemBtn" onclick="return false;">개발 가능 언어 추가</button></td>
		</tr>
		
		<tr class="item1">
			<td rowspan=2>사용 가능 언어</td>
			<td>
				<select id="select1" name="select1" onclick="langugeEtc(this.value,this.name)" >
                    <option value="C" selected>C</option>
                    <option value="C++" >C++</option>
                    <option value="JSP" >JSP</option>
                    <option value="PHP" >PHP</option>
                    <option value="HTML" >HTML</option>
                    <option value="JAVA" >JAVA</option>
                    <option value="Object-C">Object-C</option>
                    <option value="Swift">Swift</option>
                    <option value="Android">Android</option>
                    <option value="Spring">Spring FrameWork</option>
                    <option value="etc">etc</option>
                </select>
                <input type="hidden" id="language1" name="language1" value="C"  onfocusout="languageEtcInput(this.name,this.value)" size="8"/>
				<label><input type="radio" value="10" name="language_level1">상</label> 
				<label><input type="radio" value="20" name="language_level1">중</label>
				<label><input type="radio" value="30" name="language_level1" checked>하</label>
			</td>
			<td><button class="" onclick="alert('첫 행은 삭제가 불가능합니다.'); return false">삭제</button></td>
		</tr>
	</table>

	<button type="submit" class="btn_signup">제출</button>
	</form>
	<form
		action="${pageContext.request.contextPath}/LoginController/logout.do"
		method="GET">
		<button type="submit" class="btn_back">뒤로가기</button>
	</form>
</body>
</html>