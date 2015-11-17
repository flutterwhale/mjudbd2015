package kr.ac.mju.prompt.service;

import kr.ac.mju.prompt.dao.LoginDAO;
import kr.ac.mju.prompt.model.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

	@Autowired
	private LoginDAO loginDAO;

	public User login(User user) {
		// TODO Auto-generated method stub

		
		
		//System.out.println("login Service ["+ li.getID() +"] [" + li.getPW()+"] ");
		
		
		
		return loginDAO.login(user.getId(),user.getPassword());
	}
	
	public User signup(User user){
		
		
		return loginDAO.signup(user.getName(), user.getId(), user.getCategory(), user.getPassword());
	}

}
