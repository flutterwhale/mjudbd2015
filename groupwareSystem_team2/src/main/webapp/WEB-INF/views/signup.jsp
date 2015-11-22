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
		b = document.myform.signupID.value
		c = document.myform.signupPW.value
		if (b == "") {
			alert("이름를 입력해 주세요")
			document.myform.signupName.focus()
			return false;
		} else if (a == "") {
			alert("ID를 입력해 주세요")
			document.myform.signupID.focus()
			return false;
		} else if (c == "") {
			alert("암호를 입력해 주세요")
			document.myform.signupPW.focus()
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
				<td><input id="id" type="text" name="signupID" size="15"
					maxlength="10" disabled="disabled"></td>
				<td>가입 완료 시 자동부여</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input id="pw" type="password" name="signupPW" size="15"
					maxlength="15"></td>
				<td>최대 15글자</td>
			</tr>
			<tr>
				<td>비밀번호확인</td>
				<td><input id="pw" type="password" name="signupPW" size="15"
					maxlength="15"></td>
				<td>최대 15글자</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input id="id" type="text" name="signupID" size="15"
					maxlength="13"></td>
				<td></td>
			</tr>

			<tr>
				<td>주소</td>
				<td><textarea id="address" cols="30" rows="3"></textarea></td>
			</tr>
		<tr>
			<td>성별</td>
			<td><label><input type="radio" value="1" name="gender">남자</label><label><input
					type="radio" value="0" name="gender">여자</label></td>
		</tr>
		<tr>
			<td>회원종류</td>
			<td><select id="cat" name="signupCat"><option>정직원</option>
					<option>프리랜서</option></select></td>
		</tr>

		<br>
		<tr>
			<td><h2>기타 정보</h2></td>
		</tr>
		<tr>
			<td>최종학력 :</td>
			<td><input id="university" type="text" name="university"
				size="10" maxlength="10">학교 <input id="major" type="text"
				name="university" size="10" maxlength="10">학과 <input
				id="major" type="text" name="university" size="10" maxlength="10">입학/
			
			<td><input id="major" type="text" name="university" size="10"
				maxlength="10">졸업</td>

		</tr>
		<tr>
			<td>경력</td>
			<td><textarea id="career" cols="30" rows="5"></textarea></td>
		</tr>
		<tr>

			<td>포트폴리오 업로드</td>
			<td><input type="file"></td>

		</tr>
		<tr>
			<td>기술 등급</td>
			<td><label><input type="radio" value="10"
					name="tech_level"> 고급</label> <label><input type="radio"
					value="20" name="tech_level"> 중급</label> <label><input
					type="radio" value="30" name="tech_level"> 하급</label></td>
			<td>자신의 기술 등급 기재</td>
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