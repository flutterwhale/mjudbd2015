<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
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
	
	<div class="container">
		<form onSubmit="return check()"
			action="${pageContext.request.contextPath}/LoginController/signup"
			method="POST" name="myform">
			<fieldset>
			<legend class="legend">개인정보</legend>
			<div class="form-group">
			<label>이름</label>
			<input id="name" type="text" name="signupName" size="8"
					maxlength="8" placeholder="최대8글자">
			</div>
			<div class="form-group">
			<label>아이디</label>
			<input id="id" type="text" name="signupID" size="15"
					maxlength="10" disabled="disabled" placeholder="가입 완료 시 자동부여">
			</div>
			<div class="form-group">
			<label>비밀번호</label>
			<input id="pw" type="password" name="signupPW" size="15"
					maxlength="15" placeholder="최대 15글자">
			<label>비밀번호 확인</label>
			<input id="pw2" type="password" name="signupPW2" size="15"
					maxlength="15" placeholder="최대 15글자">
			</div>
			<div class="form-group">
			<label>주민번호</label>
			<input id="ssn" type="text" name="ssn" size="14"
					maxlength="14">
			</div>
			<div class="form-group">
			<label>연락처</label>
			<input id="phone" type="text" name="phone" size="15"
					maxlength="13">
			</div>
			<div class="form-group">
			<label>이메일</label>
			<input id="email" type="text" name="email" size="15"
					maxlength="30">
			</div>
			<div class="form-group">
			<label>주소</label>
			<textarea id="address" name="address" cols="30" rows="3"></textarea>
			</div>
			<div class="form-group">
			<label>성별</label>
			<label><input type="radio" value="1" name="gender">남자</label><label><input
						type="radio" value="0" name="gender">여자</label>
			</div>
			<div class="form-group">
			<label>회원종류</label>
			<select id="cat" name="signupCat"><option>정직원</option>
						<option>프리랜서</option></select>
			</div>
					
			</fieldset>
			<fieldset>
			<legend class="legend">기타 정보</legend>
			<div class="form-group">
			<label>최종학력</label>
			<input id="university" type="text" name="university"
					size="10" maxlength="10">학교 <input id="major" type="text"
					name="major" size="10" maxlength="10">학과 <input
					id="entrance" type="text" name="entrance" size="10" maxlength="10">입학
					<input id="graduation" type="text" name="graduation"
					size="10" maxlength="10">졸업
			</div>
			<div class="form-group">
			<label>경력</label>
			<textarea id="career" name="career" cols="30" rows="5"></textarea>
			</div>
			<div class="form-group">
			<label>포트폴리오 업로드</label>
			<input type="file" id="portfolio" name="portfolio">
			</div>
			<div class="form-group">
			<label>기술등급</label>
			<label><input type="radio" value="10"
						name="tech_level"> 고급</label> <label><input type="radio"
						value="20" name="tech_level"> 중급</label> <label><input
						type="radio" value="30" name="tech_level"> 하급</label>
			</div>
					
			</fieldset>

			<!-- <tr>
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
					name="major" size="10" maxlength="10">학과 <input
					id="entrance" type="text" name="entrance" size="10" maxlength="10">입학/



				
				<td><input id="graduation" type="text" name="graduation"
					size="10" maxlength="10">졸업</td>

			</tr>
			<tr>
				<td>경력</td>
				<td><textarea id="career" name="career" cols="30" rows="5"></textarea></td>
			</tr>
			<tr>

				<td>포트폴리오 업로드</td>
				<td><input type="file" id="portfolio" name="portfolio"></td>

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
				<td>사용 가능 언어</td>
				<td><input type="text" id="language" name="language"> <label><input
						type="radio" value="10" name="language_level">상</label> <label><input
						type="radio" value="20" name="language_level">중</label><label><input
						type="radio" value="30" name="language_level">하</label></td>
				<td>아래로 동적으로 증가한다..</td>
			</tr>
	</table>
 -->
	<button type="submit" class="btn btn-primary">제출</button>
	</form>
	<form
		action="${pageContext.request.contextPath}/LoginController/logout.do"
		method="GET">
		<button type="submit" class="btn">뒤로가기</button>
	</form>
</body>
</html>