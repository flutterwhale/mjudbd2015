package kr.ac.mju.prompt.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.ac.mju.prompt.model.User;
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
	private static final Logger logger = LoggerFactory
			.getLogger(Controller.class);

	@RequestMapping(value = "/LoginController/login.do", method = RequestMethod.POST)
	public String login(HttpSession session, HttpServletRequest request)
			throws UnsupportedEncodingException{
 
		request.setCharacterEncoding("utf-8");
		String userID = request.getParameter("user_id");
		String userPW = request.getParameter("user_password");
		
		User login = new User(userID,userPW); 
		logger.info("로그인 시도 ID:" + login.getID() + ", PW:" + login.getPW());
		
		
		
		User ui = loginService.login(login); 
		
		//System.out.println("   ?? "+ui.getMyUser().getId());
		
		session.setAttribute("sessionUser", ui.getId());
		session.setAttribute("sessionName", ui.getName());
		session.setAttribute("sessionCategory", ui.getCategory());
		
		
		
		if(userID.equals(ui.getId() )& userPW.equals(ui.getPassword())){
			
			
			logger.info("111 : 로그인 일치");
			
			session.setAttribute("sessionCheck", 1);
			session.setAttribute("user", ui);
			
			return "login";	
		}else{
			session.setAttribute("sessionCheck", 0);
		
			
			session.setAttribute("user", ui);
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
		
		
		
		User myUser = new User(userID, userName, userPW, userCat);
		UserInfo userInfo = new UserInfo();
		userInfo.setMyUser(myUser);
		
		
		logger.info("회원가입 시도 ID:" + userID + ", PW:" + userPW + " , NAME : "+ userName + " " + userCat);
		
		
		
		UserInfo ui = loginService.signup(userInfo); 
		
		
		
	
		request.setAttribute("code", ui.getErrorCode());
		return "failureLogin";
	}
}
