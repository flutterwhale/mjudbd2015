package kr.ac.mju.prompt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.mju.prompt.dao.LoginDAO;
import kr.ac.mju.prompt.model.UserInfo;
import kr.ac.mju.prompt.model.signupBean;

@Service
public class LoginService {

	@Autowired
	private LoginDAO loginDAO;

	public UserInfo login(String id, String pw) {
		// TODO Auto-generated method stub

		System.out.println("login Service.Login : [" + id + "] [" + pw + "] ");

		return loginDAO.login(Integer.parseInt(id), pw);
	}

	public UserInfo signup(signupBean sb) {
		System.out.println("login Service.signup :");

		return loginDAO.signup(sb);
	}
	
	public String idcheck(String id) {
		System.out.println("login Service.idcheck :"+id);

		return loginDAO.checkID(id);
	}
	public signupBean showMember(String id) {
		System.out.println("login Service.idcheck :"+id);

		return loginDAO.showMember(id);
	}
}
