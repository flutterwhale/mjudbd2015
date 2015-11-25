package kr.ac.mju.prompt.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.mju.prompt.dao.ProjectDAO;
import kr.ac.mju.prompt.model.UserBean;
import kr.ac.mju.prompt.model.obtainBean;
import kr.ac.mju.prompt.model.projectBean;

@Service
public class ProjectService {

	@Autowired
	private ProjectDAO projectDAO;
	private static final Logger logger = LoggerFactory.getLogger(ProjectService.class);
	
	public ArrayList<projectBean> getAllProjects() {
		// TODO Auto-generated method stub
		logger.info("모든 프로젝트 목록");

		return projectDAO.getAllProject();
	}
	
	public ArrayList<obtainBean> getAllObtains() {
		// TODO Auto-generated method stub
		logger.info("모든 프로젝트 목록");

		return projectDAO.getAllObtain();
	}

	public ArrayList<UserBean> getMember_permission(int p) {
		// TODO Auto-generated method stub
		logger.info("모든 프로젝트 목록");

		return projectDAO.showMember_permssion(p);
	}

}
