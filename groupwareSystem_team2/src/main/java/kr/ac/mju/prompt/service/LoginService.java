package kr.ac.mju.prompt.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.mju.prompt.dao.LoginDAO;
import kr.ac.mju.prompt.dao.ProjectDAO;
import kr.ac.mju.prompt.model.UserInfo;
import kr.ac.mju.prompt.model.signupBean;
import kr.ac.mju.prompt.model.userProjectBean;

@Service
public class LoginService {

	@Autowired
	private LoginDAO loginDAO;
	private ProjectDAO projectDAO;
	private static final Logger logger = LoggerFactory.getLogger(LoginService.class);

	public UserInfo login(String id, String pw) {
		logger.info("=============login Service=============");
		logger.info("login Service.Login : [" + id + "] [" + pw + "] ");

		return loginDAO.login(Integer.parseInt(id), pw);
	}

	public UserInfo signup(signupBean sb) {
		logger.info("=============signup Service=============");
		logger.info("login Service.signup :");

		return loginDAO.signup(sb);
	}

	public String idcheck(String id) {
		logger.info("=============idcheck Service=============");
		logger.info("login Service.idcheck :" + id);

		return loginDAO.checkID(id);
	}

	public signupBean showMember(String id) {
		logger.info("=============showMember Service=============");
		logger.info("login Service.showMember :" + id);

		return loginDAO.showMember(id);
	}
	
	

	public signupBean updateMember(signupBean userInfo) {
		logger.info("=============updateMember Service=============");
		return loginDAO.editMember(userInfo);
	}

	public void deleteMemberLanguage(String id) {
		logger.info("=============deleteMemberLanguage Service=============");
		loginDAO.deleteLanguage(id);
	}

	public int searchMemberDepart(String id) {
		logger.info("=============searchMemberDepart Service=============");
		return loginDAO.searchDepart(id);
	}
	
	public ArrayList<userProjectBean> getPastMyProjects(String id) {
		// TODO Auto-generated method stub
		logger.info("=============나의  과거 프로젝트 가져오기 Service=============");
		logger.info("getPastMyProjects :" + id);
		return loginDAO.getPastMyProject(id);
	}
}
