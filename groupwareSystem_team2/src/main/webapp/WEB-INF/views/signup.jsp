<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>
<script type="text/javascript">
	function check() {
		a = document.myform.signupName.value
		b = document.myform.signupPW.value
		c = document.myform.signupPW2.value
		if (a == "") {
			alert("이름를 입력해 주세요")
			document.myform.signupName.focus();
			return false;
		} else if (b == "") {
			alert("암호를 입력해 주세요")
			document.myform.signupPW.focus();
			return false;
		} else if (c == "") {
			alert("암호 확인을 입력해 주세요")
			document.myform.signupPW2.focus();
			return false;
		} else {
			alert("제출합니다.")
		}
	}
</script>
</head>
<body>

	<table>
		<form onSubmit="return check()"
			action="${pageContext.request.contextPath}/LoginController/signup"
			method="POST" name="myform">
			<tr>
				<td><h2>개인 정보</h2></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input id="name" type="text" name="signupName" size="8"
					maxlength="8"></td>
				<td>최대8글자</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input id="id" type="text" name="signupID" size="8"
					maxlength="8"></td>
				<td>8자리 숫자사용</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input id="pw" type="password" name="signupPW" size="15"
					maxlength="15"></td>
				<td>최대 15글자</td>
			</tr>
			<tr>
				<td>비밀번호확인</td>
				<td><input id="pw2" type="password" name="signupPW2" size="15"
					maxlength="15"></td>
				<td>최대 15글자</td>
			</tr>
			<tr>
				<td>주민 번호</td>
				<td><input id="ssn" type="text" name="ssn" size="14"
					maxlength="14"></td>
				<td></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input id="phone" type="text" name="phone" size="15"
					maxlength="13"></td>
				<td></td>
			</tr>
			<tr>
				<td>email</td>
				<td><input id="email" type="text" name="email" size="15"
					maxlength="30"></td>
				<td></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><textarea id="address" name="address" cols="30" rows="3"></textarea></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><label><input type="radio" value="1" name="gender">남자</label><label><input
						type="radio" value="0" name="gender">여자</label></td>
			</tr>


			<br>
			<tr>
				<td><h2>기타 정보</h2></td>
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
				<td><textarea id="career" name="career" cols="30" rows="5"></textarea></td>
			</tr>

			<tr>

				<td>포트폴리오 업로드</td>
				<td><input type="file" id="portfolio" name="portfolio"></td>

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