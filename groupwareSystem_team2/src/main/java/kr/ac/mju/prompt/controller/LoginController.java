package kr.ac.mju.prompt.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.ac.mju.prompt.model.User;
import kr.ac.mju.prompt.model.UserInfo;
import kr.ac.mju.prompt.service.LoginService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
 
	@Autowired
	private LoginService loginService;
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@RequestMapping(value = "/LoginController/login.do", method = RequestMethod.POST)
	public String login(HttpSession session, HttpServletRequest request)
			throws UnsupportedEncodingException{
 
		request.setCharacterEncoding("utf-8");
		String userID = request.getParameter("user_id");  //home.jsp 에서 input 에서 넘어온 parameter
		String userPW = request.getParameter("user_password");
		
		if(0==userID.length()) {
			logger.info("97 : id 입력하지 않음");
			logger.info("로그인 시도 ID:11111111" + userID + ", PW:" + userPW);	
			return "home"; 
		}
		//LoginInfo logininfo = new LoginInfo(userID,userPW); 
		logger.info("로그인 시도 ID:" + userID + ", PW:" + userPW);		
		UserInfo ui = loginService.login(userID,userPW);   // loginservice 요청 !!!!!!!!!!!!!
		
		session.setAttribute("LoginINFO", ui.getMyUser().getId());
		 
		if(ui.getErrorCode()==0){ //로그인 성공 정보 0
			//userID.equals(ui.getMyUser().getId()+"")&& userPW.equals(ui.getMyUser().getPassword())
			logger.info("0 : 로그인 일치");			
			session.setAttribute("sessionCheck", 1);
			session.setAttribute("userinfo", ui);
			return "login";	
		}else{
			session.setAttribute("sessionCheck", 0);
			logger.info("99 : 로그인 실패");
			session.setAttribute("userinfo", ui);
			return "login"; 
		}   
	} 
	   
	   
	
	
	@RequestMapping(value = "/LoginController/main.do", method = RequestMethod.GET)
	public String main(HttpSession session) {
		logger.info("메인화면");
		if (session.getAttribute("sessionUser") != null) {
			
			logger.info(session.getAttribute("sessionUser").toString()+" / " + session.getAttribute("sessionName").toString()+ " 해당 사용자가 로그인중입니다. ");
		}
		return "login";
	}
	  
	 
	@RequestMapping(value = "/LoginController/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("로그아웃");
		if (session.getAttribute("sessionUser") != null) {
			
			logger.info(session.getAttribute("sessionUser").toString()+" / " + session.getAttribute("sessionName").toString()+ " 해당 사용자가 로그아웃 하였습니다. ");
			session.removeAttribute("sessionUser");
		}
		return "home";
	}
	
	@RequestMapping(value = "/LoginController/signupPage", method = RequestMethod.POST)
	public String signupPage(HttpSession session) {
		logger.info("회원 가입");
		if (session.getAttribute("sessionUser") != null) {
			
			logger.info(session.getAttribute("sessionUser").toString()+" / " + session.getAttribute("sessionName").toString()+ " 해당 사용자가 로그아웃 하였습니다. ");
			session.removeAttribute("sessionUser");
			
			
			
		}
		return "signup";
	}
	@RequestMapping(value = "/LoginController/signup", method = RequestMethod.POST)
	public String signup(HttpSession session, HttpServletRequest request)
			throws UnsupportedEncodingException{
 
		request.setCharacterEncoding("utf-8");
		String userID = request.getParameter("signupID");
		String userPW = request.getParameter("signupPW");
		String userName = request.getParameter("signupName");
		String userCat = request.getParameter("signupCat");

		if(userCat.equals("학생")){
			userCat="S";
			
		}else if (userCat.equals("교수")){
			userCat="T";
		}else{
			userCat="A";
		}
		
		
		
		User myUser = new User(Integer.parseInt(userID), userName, userPW, userCat);
		UserInfo userInfo = new UserInfo();
		userInfo.setMyUser(myUser);
		
		logger.info("회원가입 시도 ID :" + userID + ", PW:" + userPW + " , NAME : "+ userName + " " + userCat);
		
		

		
		UserInfo ui = loginService.signup(userInfo); 
		
		request.setAttribute("code", ui.getErrorCode());
	
		return "failureLogin";
	}
}
