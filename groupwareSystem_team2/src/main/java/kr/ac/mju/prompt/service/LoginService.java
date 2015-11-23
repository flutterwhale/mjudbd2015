package kr.ac.mju.prompt.service;

import kr.ac.mju.prompt.model.UserBean;
import kr.ac.mju.prompt.model.UserInfo;
import kr.ac.mju.prompt.model.signupBean;
import kr.ac.mju.prompt.dao.LoginDAO;

import java.lang.reflect.InvocationTargetException;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {

	@Autowired
	private LoginDAO loginDAO;

	public UserInfo login(String id, String pw) {
		// TODO Auto-generated method stub

		
		
		System.out.println("login Service : ["+ id +"] [" + pw+"] ");		
		
		
		return loginDAO.login(Integer.parseInt(id),pw);
	}


	
public UserInfo signup(UserInfo ui){
		
		 UserBean user = ui.getMyUser();
		signupBean sb = new signupBean();
		try {
			BeanUtils.copyProperties(user,sb);
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		return loginDAO.signup(sb);
	}


}
