<%@ page import="org.apache.commons.mail.HtmlEmail" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String mail = (String)request.getAttribute("mail");
	String charSet = "UTF-8";
	//String hostSMTP = "localhost";
	String hostSMTP = "smtp.naver.com";
	//String hostSMTPid = "";
	String hostSMTPid = "cs_kym3149"; //gmail  계정 ID
	String hostSMTPpasswd = "rladyd12"; //  gmail  계정  password
	String fromEmail = "cs_kym3149@naver.com";
	String fromName = "김용민";
	String subject = "프로젝트 평가 안내 메일입니다.";
	
	String pid = (String)request.getAttribute("pid");
try {
	HtmlEmail email = new HtmlEmail();  //html형식의 메일이 아닌 기본 메일일 경우에는 SimpleEmail email = new SimpleEmail()
	email.setDebug(true);  
	email.setCharset(charSet);
	email.setSSL(true);
	email.setHostName(hostSMTP);
	email.setAuthentication(hostSMTPid, hostSMTPpasswd);
	email.setTLS(true); 
	email.addTo(mail, "(주)프람프트 솔루션 고객님");
	email.setFrom(fromEmail, fromName, charSet);
	email.setSubject(subject);
	email.setHtmlMsg("<p align = 'center'>프람트 그룹웨어 고객평가 이메일입니다.<br><br><form action='http://groupwareprompt.iptime.org/prompt/ProjectController/setProjectOrderEval' method='post'><input type='hidden' id='pid' name='pid' value='"+pid+"'>프로젝트에 대한 의견을 남겨주시기바랍니다.<br> <textarea rows='4' cols='50' id='comment' name='comment'></textarea><br><br>프로젝트 만족도를 표시해주시기바랍니다.<br><br><br><select name='score' id='score'><option value='1'>1점</option><option value='2'>2점</option><option value='3'>3점</option><option value='4'>4점</option><option value='5'selected>5점</option></select><input type='submit' name='제출'></form></p>");
	email.send();
	
	out.println("<script>history.go(-1); alert('메일을 성공적으로 보냈습니다!'); </script>");
} catch (Exception e) {
	
}

%>