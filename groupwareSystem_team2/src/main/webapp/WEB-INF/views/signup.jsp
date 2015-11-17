<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>
<script type="text/javascript">
 function check()
   {a=document.myform.signupName.value
   b=document.myform.signupID.value
   c=document.myform.signupPW.value
  if(b=="")
   {alert("ID를 입력해 주세요")
   document.myform.signupName.focus()
   return false;
   } else if(a=="")
   {alert("이름을 입력해 주세요")
	   document.myform.signupID.focus()
	   return false;
	   }  
  else if(c=="")
   {alert("암호를 입력해 주세요")
   document.myform.signupPW.focus()
   return false;
   }  
  else
   {alert("제출합니다.")
   }
  }
</script>
</head>
<body>

<table>
	<form onSubmit="return check()" action="${pageContext.request.contextPath}/LoginController/signup" method="POST" name="myform">
		
		<h2>개인 정보</h2>
		
		<tr><td>아이디</td><td><input id="id" type="text" name="signupID" size="15" maxlength="10"></td><td>최대 10글자</td></tr>
		<tr><td>비밀번호</td><td><input  id ="pw" type="password" name="signupPW" size="15" maxlength="15"></td><td>최대 15글자</td></tr>
			<tr><td>이름 </td><td><input id="name" type="text" name="signupName" size="8" maxlength="8"></td><td>최대8글자</td></tr>
		<tr><td>회원종류</td><td> <select id="cat" name = "signupCat"><option>학생</option><option>교수</option><option>관리자</option></select></td></tr>
	
	
		<h2>기타 정보</h2>
		<tr> 
		<td>최종학력 : </td><input id="university" type="text" name="university" size="15" maxlength="10"></td><td>학교</td>
		<input id="major" type="text" name="university" size="15" maxlength="10"></td><td>학과</td>
		
		</tr>
		<tr>
		<td>경력</td> 
		</tr>
		<tr>
		
		<td> 포트폴리오 업로드 </td> <input type="file">
				
		</tr>
	<tr>
	<td>기술 등급</td> <td>상/중/하</td> 
	</tr>

	</table>

 <button type="submit" class="btn_signup" >제출</button></form> 
 <form action="${pageContext.request.contextPath}/LoginController/logout.do" method="GET">
 <button type="submit" class="btn_back" >뒤로가기</button>
 </form>
</body>
</html>