<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	$(document).ready(function(){
	    // 옵션추가 버튼 클릭시
		$("#addItemBtn").click(function(){
			// item 의 최대번호 구하기
			var lastItemNo = $("#developer_join tr:last").attr("class").replace("item", "");
			if(lastItemNo >=20){
	        	alert("최대 개수는 20개입니다.");
	        }else{
	        	$("#developer_join tr:eq(1)").find("td:eq(0)").attr("rowspan", (parseInt(lastItemNo)+1));
	        	$("#developer_join tr:eq(0)").find("td:eq(0)").find("input:eq(0)").attr("value", (parseInt(lastItemNo)+1));
	        	var newitem = $("#developer_join tr:last").clone();
				newitem.removeClass();
				if(lastItemNo==1){
					newitem.find("td:eq(0)").remove();
					newitem.find("td:eq(1)").find("button:eq(0)").attr("class", "delBtn btn btn-info");
					newitem.find("td:eq(1)").find("button:eq(0)").attr("onclick", " ");
				}
				newitem.find("td:eq(0)").find("select:eq(0)").attr("id","select"+(parseInt(lastItemNo)+1));
				newitem.find("td:eq(0)").find("select:eq(0)").attr("name","select"+(parseInt(lastItemNo)+1));
				newitem.find("td:eq(0)").find("input:eq(0)").attr("id","language"+(parseInt(lastItemNo)+1));
				newitem.find("td:eq(0)").find("input:eq(0)").attr("name","language"+(parseInt(lastItemNo)+1));
				newitem.find("td:eq(1)").find("button:eq(0)").attr("value",(parseInt(lastItemNo)+1).toString());
			 	
				newitem.find("td:eq(0)").find("label:eq(0)").find("input:eq(0)").attr("name","language_level"+(parseInt(lastItemNo)+1));
		        newitem.find("td:eq(0)").find("label:eq(1)").find("input:eq(0)").attr("name","language_level"+(parseInt(lastItemNo)+1));
		        newitem.find("td:eq(0)").find("label:eq(2)").find("input:eq(0)").attr("name","language_level"+(parseInt(lastItemNo)+1));   
		        newitem.find("td:eq(1)").find("button:eq(0)").attr("name", "language_del"+(parseInt(lastItemNo)+1));
				
		        newitem.attr("id","item"+(parseInt(lastItemNo)+1));
		        newitem.addClass("item"+(parseInt(lastItemNo)+1));
				$("#developer_join").append(newitem);
				document.getElementById("language"+(parseInt(lastItemNo)+1)).setAttribute("type","hidden");
	        }

		});
		// 삭제버튼 클릭시

		$(".delBtn").live("click", function(){
			var i;
			if(document.getElementById("language_count").value > this.value){
				for( i=0; i<document.getElementById("language_count").value -this.value;i++){
					document.getElementById("item".concat((parseInt(this.value)+1+i).toString())).className = "item".concat((parseInt(this.value)+i).toString());
					document.getElementById("item".concat((parseInt(this.value)+1+i).toString())).setAttribute("id","item".concat((parseInt(this.value)+i).toString()));
					document.getElementById("select".concat((parseInt(this.value)+1+i).toString())).setAttribute("id","select".concat((parseInt(this.value)+i).toString()));
					document.getElementsByName("select".concat((parseInt(this.value)+1+i).toString()))[0].setAttribute("name","select".concat((parseInt(this.value)+i).toString()));
					document.getElementById("language".concat((parseInt(this.value)+1+i).toString())).setAttribute("id","language".concat((parseInt(this.value)+i).toString()));
					document.getElementsByName("language".concat((parseInt(this.value)+1+i).toString()))[0].setAttribute("name","language".concat((parseInt(this.value)+i).toString()));
					document.getElementsByName("language_level".concat((parseInt(this.value)+1+i).toString()))[0].setAttribute("name","language_level".concat((parseInt(this.value)+i).toString()));
					document.getElementsByName("language_level".concat((parseInt(this.value)+1+i).toString()))[0].setAttribute("name","language_level".concat((parseInt(this.value)+i).toString()));
					document.getElementsByName("language_level".concat((parseInt(this.value)+1+i).toString()))[0].setAttribute("name","language_level".concat((parseInt(this.value)+i).toString()));
					document.getElementsByName("language_del".concat((parseInt(this.value)+1+i).toString()))[0].setAttribute("value",(parseInt(this.value)+i).toString());
					document.getElementsByName("language_del".concat((parseInt(this.value)+1+i).toString()))[0].setAttribute("name","language_del".concat((parseInt(this.value)+i).toString()));
				}
			}
			
			document.getElementById("language_count").value = document.getElementById("language_count").value - 1;
			var clickedRow = $(this).parent().parent();
			clickedRow.remove();//객체의 삭제
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
	
	function dupdel(){
		var i;
		var k=1;
		var j=2;
		var language_count_value = document.getElementById("language_count").value;
		if(language_count_value==1){
			return true;
		}
		for(k = 1; k<= language_count_value-1;++k){
			for(j=k+1; j<= language_count_value;++j){
				if((document.getElementById("language".concat(k.toString())).value.toLowerCase())==(document.getElementById("language".concat(j.toString())).value.toLowerCase())){	
					k = 0; 
					document.getElementById("item".concat(j.toString())).remove();
					for( i=j+1; i<=language_count_value;i++){
						document.getElementById("item".concat(i.toString())).className = "item".concat((i-1).toString());
						document.getElementById("item".concat(i.toString())).setAttribute("id","item".concat((i-1).toString()));
						document.getElementById("select".concat(i.toString())).setAttribute("id","select".concat((i-1).toString()));
						document.getElementsByName("select".concat(i.toString()))[0].setAttribute("name","select".concat((i-1).toString()));
						document.getElementById("language".concat(i.toString())).setAttribute("id","language".concat((i-1).toString()));
						document.getElementsByName("language".concat(i.toString()))[0].setAttribute("name","language".concat((i-1).toString()));
						document.getElementsByName("language_level".concat(i.toString()))[0].setAttribute("name","language_level".concat((i-1).toString()));
						document.getElementsByName("language_level".concat(i.toString()))[0].setAttribute("name","language_level".concat((i-1).toString()));
						document.getElementsByName("language_level".concat(i.toString()))[0].setAttribute("name","language_level".concat((i-1).toString()));
					}
					document.getElementById("language_count").value = language_count_value - 1;
					language_count_value = document.getElementById("language_count").value;
					
					j =1;
					break;
				}
			}
		}
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
		tech_level = document.myform.tech_level.value;
		dupdel();

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
	                 <li><a href="https://tahiti.mju.ac.kr/moodle/"></a></li>
	               </ul>
	          </div>
	        </div>
	   </nav>
		<form class="form-horizontal" onSubmit="return check()" action="${pageContext.request.contextPath}/LoginController/signup_developer" method="POST" name="myform">
			<fieldset>
		         <legend><label class="col-sm-3 control-label">개인정보</label></legend>
		       	 <div class="form-group">
		       	 </div>
		       	 <div class="form-group">
		       	 </div>
		       	 <div class="form-group">
		       	 </div>
		       	 <div class="form-group">
		            <label for="inputname" class="col-sm-4 control-label">이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</label>
		             <div class="col-sm-6">
		                  <input type="text" class="form-control" style="width:200px;" id="name" name="signupName" placeholder="최대8글자" size="8" maxlength="8">
		             </div>
		         </div>
		         <div class="form-group">
		            <label for="inputname" class="col-sm-4 control-label">아&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;디</label>
		             <div class="col-sm-2">
		                  <input type="text" class="form-control" style="width:200px;" id="id" name="signupID" placeholder="8자리 숫자 사용" size="8" maxlength="8">
		                  
		             </div>
		             <div class="col-sm-1">
		                   <button class="btn btn-success" type="button"  onclick="idCheck()">id 중복 체크</button>
		             </div>
		            
		          </div>
		         <div class="form-group">
		            <label for="inputname" class="col-sm-4 control-label">비&nbsp;&nbsp;&nbsp;밀&nbsp;&nbsp;&nbsp;번&nbsp;&nbsp;&nbsp;호&nbsp;</label>
		             <div class="col-sm-6">
		                  <input type="password" class="form-control" style="width:200px;" id="pw" name="signupPW" placeholder="최대15글자" size="15" maxlength="15">
		             </div>
		          </div>
		         <div class="form-group">
		            <label for="inputname" class="col-sm-4 control-label">비밀번호 확인</label>
		             <div class="col-sm-6">
		                  <input type="password" class="form-control" style="width:200px;" id="pw2" name="signupPW2" placeholder="최대15글자" size="15" maxlength="15">
		             </div>
		          </div>   
		         <div class="form-group">
		            <label for="inputname" class="col-sm-4 control-label">주&nbsp;&nbsp;&nbsp;민&nbsp;&nbsp;&nbsp;번&nbsp;&nbsp;&nbsp;호&nbsp;</label>
		             <div class="col-sm-6">
		                  <input type="text" class="form-control" style="width:200px;" id="ssn" name="ssn" size="14" placeholder="910111-1234567"maxlength="14">
		             </div>
		          </div>   
		         <div class="form-group">
		            <label for="inputname" class="col-sm-4 control-label">연&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;락&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;처</label>
		             <div class="col-sm-6">
		                  <input type="text" class="form-control" style="width:200px;" id="phone" name="phone" size="15" placeholder="010-1234-1234" maxlength="13">
		             </div>
		          </div>
		         <div class="form-group">
		            <label for="inputname" class="col-sm-4 control-label">e&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;m&nbsp;&nbsp;&nbsp;a&nbsp;&nbsp;&nbsp;i&nbsp;&nbsp;&nbsp;l</label>
		             <div class="col-sm-6">
		                  <input type="text" class="form-control" style="width:200px;" id="email" name="email" size="15" placeholder="prompt@prompt.co.kr" maxlength="30">
		             </div>
		          </div>   
		         
		         <div class="form-group">
		            <label for="inputname" class="col-sm-4 control-label">주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</label>
		            <div class="col-sm-6">
						<input type="button" class="col-lg-2 btn btn-info" onclick="sample4_execDaumPostcode()" value="우편번호"/> 
						<input type="text"id="address" class="col-lg-4 form-control" style="width:400px;" name="address" size="50" placeholder="클릭해서 주소를 입력해주세요." onclick="sample4_execDaumPostcode()"/> 
			        </div>
		         </div>
		         <div class="form-group">
		            <label for="inputname" class="col-sm-4 control-label">성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별</label>
		            <div class="col-sm-2">
			            <label class="radio-inline"><input type="radio"  value="1" name="gender" checked>남자</label>
		            </div>
		            <div class="col-sm-2">
			            <label class="radio-inline"><input type="radio" value="0" name="gender">여자</label>
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
	            <label for="inputname" class="col-sm-4 control-label">최&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;력</label>
	            <div class="col-sm-8">
		            <div class="col-sm-3">              
		                <input id="university" type="text" class="form-control" name="university" style="width:200px;" size="10" maxlength="10" placeholder="명지대" >
					</div>
					<div class="col-sm-1">              
		                <label class="control-label">학교</label>
					</div>
					<div class="col-sm-3">
						<input id="depart" type="text" class="form-control" name="depart" style="width:200px;" size="10" maxlength="10" placeholder="컴퓨공">
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
						<input id="major" type="text" class="form-control" name="major" style="width:200px;" size="10" maxlength="10" placeholder="컴퓨공학">
					</div>
					<div class="col-sm-1">              
		                <label class="control-label">전공</label>
					</div>
					<div class="col-sm-3">	
						<select id="graduation" name="graduation" class="form-control"style="width:200px;">
		                    <option value="박사" >박사</option>
		                    <option value="박사수료" >박사수료</option>
		                    <option value="박사재학" >박사재학</option>
		                    <option value="석사" >석사</option>
		                    <option value="석사수료" >석사수료</option>
		                    <option value="석사재학" >석사재학</option>
		                    <option value="학사" selected>학사</option>
		                    <option value="학사수료" >학사수료</option>
		                    <option value="학사재학">학사재학</option>
		                    <option value="고등학교졸">고등학교졸</option>
		                </select> 
		             </div>
		             <div class="col-sm-2">              
		               <label class="control-label">학위</label>
					</div>
	             </div>
	          </div>
	          <div class="form-group">
	            <label for="inputname" class="col-sm-4 control-label">경&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;력</label>
	            <div class="col-sm-6">
	                  <textarea id="career" class="form-control" style="width:600px;" name="career" cols="30" rows="5" placeholder="기존 회사의 경력을 기술해주세요."></textarea>
	               </div>
	          </div>
	         <div class="form-group">
	            <label for="inputname" class="col-sm-4 control-label">고&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;관&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;계</label>
	            <div class="col-sm-2">
			        <label class="radio-inline"><input type="radio" value="FreeLancer" name="isFreelancer"> 프리랜서</label>
		        </div>
		        <div class="col-sm-2">
			        <label class="radio-inline"><input type="radio" value="common" name="isFreelancer" checked> 정직원</label> 
		        </div>
	         </div>
	         <div class="form-group">
	            <label for="inputname" class="col-sm-4 control-label">포트폴리오 업로드</label>
	            <div class="col-sm-6">
	                  <label class="control-label"><input class="btn btn-primary btn-xs" type="file" id="portfolio" style="width:300px;" name="portfolio"></label>
	             </div>
	         </div>
	          <div class="form-group">
	           	<label for="inputname" class="col-sm-4 control-label">KOSA&nbsp;&nbsp;기술&nbsp;&nbsp;등급</label>
	            <div class="col-sm-2">
			    	<label class="radio-inline"><input class="radio-inline" type="radio" value="10"name="tech_level"> 고급</label> 
		        </div>
		        <div class="col-sm-2">
			        <label class="radio-inline"><input class="radio-inline" type="radio" value="20" name="tech_level">중급</label> 
		        </div>
		        <div class="col-sm-2">
			        <label class="radio-inline"><input class="radio-inline" type="radio" value="30" name="tech_level" checked>초급</label>
		        </div>
	         </div>
	         <div class="form-group"> 
		     	<label for="inputname" class="col-sm-4 control-label">프로그래밍&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;언어</label>
		     	<div class="col-sm-5"> 
		         
		         <table id="developer_join" class="table table-striped table-hover " style="width:600px;">
			         <tbody>
				         <tr>
				         	<td colspan="3"><input type="hidden" id="language_count" name="language_count" value="1"><button type="button" class="btn btn-info" id="addItemBtn" onclick="return false;">개발 가능 언어 추가</button></td>
						 </tr>
						 <tr id ="item1" class="item1">
							<td rowspan=2 align="center" valign="middle"><label for="inputname" class="">언어별 능력</label></td>
							<td>
								<select id="select1" name="select1" class="form-control" onclick="langugeEtc(this.value,this.name)" >
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
				                <input class="form-control" type="hidden" id="language1" name="language1" value="C"  onfocusout="languageEtcInput(this.name,this.value)" size="8"/>
								<label class="col-sm-3"><input class="radio-inline" type="radio" value="10" name="language_level1">  상  </label> 
								<label class="col-sm-3"><input class="radio-inline" type="radio" value="20" name="language_level1">  중  </label>
								<label class="col-sm-3"><input class="radio-inline" type="radio" value="30" name="language_level1" checked>  하  </label>
							</td>
							<td><button class="btn btn-info" name="language_del1" value="1" onclick="alert('첫 행은 삭제가 불가능합니다.'); return false">삭제</button></td>
						</tr>
					</tbody>
				</table>
	          
	          </div>
	         </div>
	      
	         </fieldset>
			
			<div class="form-group">
		      	<label for="inputname" class="col-sm-5 control-label"></label>
				<div class="col-sm-1">
					<button type="submit" class="btn btn-primary">제출</button>
				</div> 
				<div class="col-sm-1">
					<button type="button" class="btn btn-default" onclick="location.replace('${pageContext.request.contextPath}/LoginController/logout.do')">뒤로가기</button>
				</div>
		    </div>
		</form>
		
		
	</body>
</html>