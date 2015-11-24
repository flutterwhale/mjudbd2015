<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="http://bootswatch.com/flatly/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
	<nav class="navbar navbar-default">
  		<div class="container-fluid">
    		<div class="navbar-header">
      			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        			<span class="sr-only">Toggle navigation</span>
        			<span class="icon-bar"></span>
        			<span class="icon-bar"></span>
        			<span class="icon-bar"></span>
      			</button>
      			<a class="navbar-brand" href="#">GruopwareSystem</a>
    		</div>

    		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      			<ul class="nav navbar-nav navbar-right">
        			<li><a href="#">DatabaseSystem Team Project</a></li>
      			</ul>
    		</div>
  		</div>
	</nav>
	
		<form class="form-horizontal" onSubmit="return check()" action="${pageContext.request.contextPath}/LoginController/signup"
			method="POST" name="myform">
			<h2>개인 정보</h2>
			<div class="form-group">
				<label for="inputname" class="col-sm-2 control-label">이름</label>
    			<div class="col-sm-10">
      				<input type="text" class="form-control" style="width:200px;" id="name" name="signupName" placeholder="최대8글자" size="8" maxlength="8">
    			</div>
    		</div>
    		<div class="form-group">
				<label for="inputname" class="col-sm-2 control-label">아이디</label>
    			<div class="col-sm-10">
      				<input type="text" class="form-control" style="width:200px;" id="id" name="signupID" placeholder="8자리 숫자 사용" size="8" maxlength="8">
    			</div>
    		</div>
			<div class="form-group">
				<label for="inputname" class="col-sm-2 control-label">비밀번호</label>
    			<div class="col-sm-10">
      				<input type="password" class="form-control" style="width:200px;" id="pw" name="signupPW" placeholder="최대15글자" size="15" maxlength="15">
    			</div>
    		</div>
			<div class="form-group">
				<label for="inputname" class="col-sm-2 control-label">비밀번호 확인</label>
    			<div class="col-sm-10">
      				<input type="password" class="form-control" style="width:200px;" id="pw2" name="signupPW2" placeholder="최대15글자" size="15" maxlength="15">
    			</div>
    		</div>	
			<div class="form-group">
				<label for="inputname" class="col-sm-2 control-label">주민 번호</label>
    			<div class="col-sm-10">
      				<input type="text" class="form-control" style="width:200px;" id="ssn" name="ssn" size="14" maxlength="14">
    			</div>
    		</div>	
			<div class="form-group">
				<label for="inputname" class="col-sm-2 control-label">연락처</label>
    			<div class="col-sm-10">
      				<input type="text" class="form-control" style="width:200px;" id="phone" name="phone" size="15" maxlength="13">
    			</div>
    		</div>
			<div class="form-group">
				<label for="inputname" class="col-sm-2 control-label">email</label>
    			<div class="col-sm-10">
      				<input type="text" class="form-control" style="width:200px;" id="email" name="email" size="15" maxlength="30">
    			</div>
    		</div>	
			<div class="form-group">
				<label for="inputname" class="col-sm-2 control-label">주소</label>
    			<div class="col-sm-10">
      				<textarea class="form-control" style="width:600px;" id="address" name="address" cols="30" rows="3"></textarea>
    			</div>
    		</div>
			<div class="radio">
				<label for="inputname" class="col-sm-2 control-label">성별</label>
    			<label>
      				<input type="radio" value="1" name="gender">남자
      			</label>
      			<label>
      				<input type="radio" value="0" name="gender">여자
      			</label>
    		</div>
    		
			<h2>기타 정보</h2>
			<div class="form-group">
				<label for="inputname" class="col-sm-2 control-label">최종학력</label>
    			<div class="col-sm-10">
      				<input id="university" class="form-control" style="width:200px;" type="text" name="university" size="10" maxlength="10">학교 
      				<input id="major" class="form-control" style="width:200px;" type="text" name="major" size="10" maxlength="10">학과 
      				<input id="entrance" class="form-control" style="width:200px;" type="text" name="entrance" size="10" maxlength="10">입학/
      				<input id="graduation" class="form-control" style="width:200px;" type="text" name="graduation" size="10" maxlength="10">졸업
    			</div>
    		</div>	
			<div class="form-group">
				<label for="inputname" class="col-sm-2 control-label">경력</label>
    			<div class="col-sm-10">
      				<textarea id="career" class="form-control" style="width:600px;" name="career" cols="30" rows="5"></textarea>
      			</div>
    		</div>
			<div class="form-group">
				<label for="inputname" class="col-sm-2 control-label">포트폴리오 업로드</label>
    			<div class="col-sm-10">
      				<input type="file" id="portfolio" name="portfolio">
      			</div>
    		</div>

			<button type="submit" class="btn btn-primary">제출</button>
		</form>
		<form action="${pageContext.request.contextPath}/LoginController/logout.do" method="GET">
			<button type="submit" class="btn btn-primary">뒤로가기</button>
		</form>
</body>
</html>