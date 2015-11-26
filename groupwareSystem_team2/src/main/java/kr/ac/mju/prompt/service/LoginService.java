package kr.ac.mju.prompt.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.mju.prompt.controller.LoginController;
import kr.ac.mju.prompt.dao.LoginDAO;
import kr.ac.mju.prompt.model.UserInfo;
import kr.ac.mju.prompt.model.signupBean;

@Service
public class LoginService {

	@Autowired
	private LoginDAO loginDAO;
	private static final Logger logger = LoggerFactory.getLogger(LoginService.class);
	public UserInfo login(String id, String pw) {
		// TODO Auto-generated method stub

		logger.info("login Service.Login : [" + id + "] [" + pw + "] ");

		return loginDAO.login(Integer.parseInt(id), pw);
	}

	public UserInfo signup(signupBean sb) {
		logger.info("login Service.signup :");

		return loginDAO.signup(sb);
	}
	
	public String idcheck(String id) {
		logger.info("login Service.idcheck :"+id);

		return loginDAO.checkID(id);
	}
	public signupBean showMember(String id) {
		logger.info("login Service.showMember :"+id );

		return loginDAO.showMember(id);
	}
}
