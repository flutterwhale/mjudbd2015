<%@page import="kr.ac.mju.prompt.model.signupBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="session.jsp"%>
<%@include file="mapper.jsp"%>

<%@page import="java.util.*"%>
<%@ page import="kr.ac.mju.prompt.model.UserInfo"%>
<%@ page import="kr.ac.mju.prompt.model.signupBean"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<jsp:useBean id="loginbean" class="kr.ac.mju.prompt.model.UserBean"
	scope="session" />
<!-- http://localhost:8080/mju/LoginController/retrieveUser?id=60102339 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/jquery.treeview.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/screen.css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/jquery.cookie.js"></script>
<script src="${pageContext.request.contextPath}/resources/jquery.treeview.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/jquery.treeview.edit.js" type="text/javascript"></script>

<link rel="stylesheet" href="http://bootswatch.com/flatly/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<%
	response.setHeader("pragma", "no-cache");
	response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
	response.setHeader("Expires", "0");
%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회사 인명부</title>
<script>
var request;
function sendInfo()
{
var v=document.vinform.t1.value;
var url="${pageContext.request.contextPath}/ProjectController/showDepart?val="+v;

if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}

try
{
request.onreadystatechange=getInfo;
request.open("GET",url,true);
request.send();
}
catch(e)
{
alert("Unable to connect to server");
}
}

function getInfo(){
if(request.readyState==4){
var val=request.responseText;


}
}
function getUser(v){
	$(document).ready(function(){
	    $("#div1").load("${pageContext.request.contextPath}/LoginController/retrieveUser?id="+v);
	});
}
</script>
<script>



</script>
<script type="text/javascript">
	$(
			function() {
				$("#browser").treeview();
				$("#add")
						.click(
								function() {
									var branches = $(
											"<li><span class='folder'>New Sublist</span><ul>"
													+ "<li><span class='file'>Item1</span></li>"
													+ "<li><span class='file'>Item2</span></li></ul></li>")
											.appendTo("#browser");
									$("#browser").treeview({
										add : branches
									});
									branches = $(
											"<li class='closed'><span class='folder'>New Sublist</span><ul><li><span class='file'>Item1</span></li><li><span class='file'>Item2</span></li></ul></li>")
											.prependTo("#folder21");
									$("#browser").treeview({
										add : branches
									});
								});
				/*$("#browser").bind("contextmenu", function(event) {
				   if ($(event.target).is("li") || $(event.target).parents("li").length) {
				      $("#browser").treeview({
				         remove: $(event.target).parents("li").filter(":first")
				      });
				      return false;
				   }
				});*/
			})
</script>



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
      			<a class="navbar-brand" href="${pageContext.request.contextPath}/LoginController/main">GroupwareSystem</a>
    		</div>

    		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      			<ul class="nav navbar-nav navbar-right">
        			<li><a href="https://tahiti.mju.ac.kr/moodle/">메뉴</a></li>
      			</ul>
    		</div>
  		</div>
	</nav>
	<%
		System.out.println("directory.jsp  code : " + session.getAttribute("code") + " / "
				+ session.getAttribute("code").getClass());
		System.out.println("session_name : " + session.getAttribute("session_name"));
		
	%>
	
	<div class="directory_wrapper" style="margin:10px 40px; width: 100%; float: left;">
	<div id="div1"  style="margin:10px 40px; width: 70%; height: 60%; float: right; align: right;"></div>
		
		<h1>조직도</h1>
		<ul id="browser" class="filetree">
			<%
			HashMap input = (HashMap) request.getAttribute("depart_list");
			HashMap hashmap = (HashMap) input.get(0);
			HashMap user = (HashMap) input.get(1);
			int m =0;
			int n =0;
			int o =0;
			//ArrayList temp = (ArrayList)hashmap.get(1);
			//int depart_num = (Integer)temp.get(4);
			//String depart_name = (String)temp.get(2);
			
			%>
			<%
						for(int i=1; i<= hashmap.size() ; i++){
							ArrayList temp = (ArrayList)hashmap.get(i);
							
							if((Integer)temp.get(0)==0){
								%> 
									<li class="closed"><span class="folder"><%=temp.get(2)%></span>
										<ul id="browser" class="filetree">
											<% 
												for(int j=1; j<= hashmap.size() ; j++){
													m=0;
													//System.out.println("parent value: "+(Integer)(((ArrayList)hashmap.get(j)).get(0)));
													//System.out.println("parnet check value: "+(Integer)(((ArrayList)hashmap.get(i)).get(3)));
													
													
													if((Integer)(((ArrayList)hashmap.get(j)).get(0))==(Integer)((ArrayList)hashmap.get(i)).get(3)){
														
											%> 
															<li class="closed"><span class="folder"><%=(((ArrayList)hashmap.get(j)).get(2))%></span>
																<ul id="browser" class="filetree">
																	<% 
																		for(int k=1; k<= hashmap.size() ; k++){
																			//System.out.println("parent value: "+(Integer)(((ArrayList)hashmap.get(k)).get(0)));
																			//System.out.println("parnet check value: "+(Integer)(((ArrayList)hashmap.get(j)).get(3)));
																			n=0;
																			if(m==0){
																				for(m =0; m < user.size(); m++){
																					//System.out.print("user depart: "+(Integer)(((ArrayList)(user.get(m))).get(2))+"/");
																					//System.out.println("now  depart: "+(Integer)(((ArrayList)hashmap.get(k)).get(3)));
																					
																				if((Integer)(((ArrayList)(user.get(m))).get(2))==(Integer)(((ArrayList)hashmap.get(j)).get(3))){
																				%> 
																					<li><span class="file"><a href="javascript:getUser(<%=(((ArrayList)user.get(m)).get(0))%>);"><%=(((ArrayList)user.get(m)).get(1))%></a></span></li>
																				<%	
																				}
																			}
																		}
																			if((Integer)(((ArrayList)hashmap.get(k)).get(0))==(Integer)((ArrayList)hashmap.get(j)).get(3)){
																				
																				
																	%> 
																					<li class="closed"><span class="folder"><%=(((ArrayList)hashmap.get(k)).get(2))%></span>
																						<ul id="browser" class="filetree">
																							<% 
																								
																								for(int l=1; l<= hashmap.size() ; l++){
																									//System.out.println("parent value: "+(Integer)(((ArrayList)hashmap.get(k)).get(0)));
																									//System.out.println("parnet check value: "+(Integer)(((ArrayList)hashmap.get(j)).get(3)));
																										o=0;
																										if(n==0){
																											for(n =0; n < user.size(); n++){
																												
																												if((Integer)(((ArrayList)(user.get(n))).get(2))==(Integer)(((ArrayList)hashmap.get(k)).get(3))){
																												%> 
																													<li><span class="file"><a href="javascript:getUser(<%=(((ArrayList)user.get(n)).get(0))%>);"><%=(((ArrayList)user.get(n)).get(1))%></a></span></li>
																												<%	
																												}
																											}
																										}
																										if((Integer)(((ArrayList)hashmap.get(l)).get(0))==(Integer)((ArrayList)hashmap.get(k)).get(3)){
																											
																							%> 			
																											<li class="closed"><span class="folder"><%=(((ArrayList)hashmap.get(l)).get(2))%></span>
																												<ul id="browser" class="filetree">
																													<%
																													if(o==0){
																														for(o =0; o < user.size(); o++){
																															
																															if((Integer)(((ArrayList)(user.get(o))).get(2))==(Integer)(((ArrayList)hashmap.get(l)).get(3))){
																															%> 
																																<li><span class="file"><a href="javascript:getUser(<%=(((ArrayList)user.get(o)).get(0))%>);"><%=(((ArrayList)user.get(o)).get(1))%></a></span></li>
																															<%	
																															}
																														}
																													}
																													
																													
																													%>
																												</ul>
																											</li>
																							<% 
																										
																									}
																								}
																							
																							%>
																						</ul>
																					</li>
																	<% 
																				
																			}
																		}
																	
																	%>
																</ul>
															</li>
											<% 
														
													}
												}
											
											%>
										</ul>
									</li>
								<% 
								
								
							}
						}
					
			%> 			
		</ul>
		
		<div class="main_button">


			<button type="button" class="btn btn-default"
				onclick="location.replace('${pageContext.request.contextPath}/LoginController/main')">메인화면</button>


		</div>

	</div>
	
		
	
</body>
</html>