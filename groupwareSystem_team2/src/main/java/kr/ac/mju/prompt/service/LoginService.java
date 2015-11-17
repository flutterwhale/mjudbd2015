package kr.ac.mju.prompt.service;

import kr.ac.mju.park.LMS.dao.LoginDAO;
import kr.ac.mju.park.LMS.model.LoginInfo;
import kr.ac.mju.park.LMS.model.User;
import kr.ac.mju.park.LMS.model.UserInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

	@Autowired
	private LoginDAO loginDAO;

	public UserInfo login(LoginInfo li) {
		// TODO Auto-generated method stub

		
		
		//System.out.println("login Service ["+ li.getID() +"] [" + li.getPW()+"] ");
		
		
		
		return loginDAO.login(li.getID(),li.getPW());
	}
	
	public UserInfo signup(UserInfo ui){
		
		User user = ui.getMyUser();
		
		return loginDAO.signup(user.getName(), user.getId(), user.getCategory(), user.getPassword());
	}

}
