<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
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
					$("#developer_join tr:last").find("td:eq(1)").find("button:eq(0)").attr("class", "delBtn");
					$("#developer_join tr:last").find("td:eq(1)").find("button:eq(0)").attr("onclick", " ");
					
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
	function langugeEtc(s,object){
		var name = object.name;
		name = name.substr(6,name.length-6);
		name = "language".concat(name.toString());
		
		if(s=="etc"){
			object.remove();
			document.getElementById(name).style.visibility="visible";
			document.getElementById(name).size="22";
		}else{
			document.getElementById(name).value = s;
		}
	}
	
	function check() {
		id = document.myform.signupID.value
		a = document.myform.signupName.value
		b = document.myform.signupPW.value
		c = document.myform.signupPW2.value
		
		if (a == "") {
			alert("이름를 입력해 주세요");
			document.myform.signupName.focus();
			return false;
		}else if (b == "") {
			alert("암호를 입력해 주세요");
			document.myform.signupPW.focus();
			return false;
		} else if (c == "") {
			alert("암호 확인을 입력해 주세요");
			document.myform.signupPW2.focus();
			return false;
		} else {
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
			<td><input id="id" type="text" name="signupID" size="8" maxlength="8" ></td>
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
			<td></td>
		</tr>
		<tr>
			<td>email</td>
			<td><input id="email" type="text" name="email" size="15" maxlength="30"></td>
			<td></td>
		</tr>
		<tr>
			<td>주소</td>
			<td colspan="2"><textarea id="address" name="address" cols="30" rows="3"></textarea></td>
		</tr>
		<tr>
			<td>성별</td>
			<td colspan="2">
			<label><input type="radio" value="1" name="gender">남자</label>
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
			<td>프리랜서 여부</td>
			<td colspan="2"><label><input type="radio" value="FreeLancer"
					name="isFreelancer"> 프리랜서</label> <label><input type="radio"
					value="common" name="isFreelancer"> 개발자</label></td>
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
					type="radio" value="30" name="tech_level"> 하급</label></td>
			<td>자신의 기술 등급 기재</td>
		</tr>
		<tr>
			<td colspan="3"><input type="hidden" id="language_count" name="language_count" value="1"><button id="addItemBtn" onclick="return false;">개발 가능 언어 추가</button></td>
		</tr>
		<tr class="item1">
			<td rowspan=2>사용 가능 언어</td>
			<td>
				<select id="select1" name="select1" onchange="langugeEtc(this.value,this)" >
                    <option value="C" >C</option>
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
                <input type="text" id="language1" name="language1" value="C" style="visibility:hidden;" size="1" />
				<label><input type="radio" value="10" name="language_level1">상</label> 
				<label><input type="radio" value="20" name="language_level1">중</label>
				<label><input type="radio" value="30" name="language_level1">하</label>
			</td>
			<td><button class="" onclick="alert('반드시 하나는 있어야합니다.'); return false">삭제</button></td>
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