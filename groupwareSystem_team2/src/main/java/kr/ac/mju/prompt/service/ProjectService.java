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
import kr.ac.mju.prompt.model.signupBean;

@Service
public class ProjectService {

	@Autowired
	private ProjectDAO projectDAO;
	private static final Logger logger = LoggerFactory.getLogger(ProjectService.class);
	
	public ArrayList<projectBean> getAllProjects() {
		// TODO Auto-generated method stub
		logger.info("모든 현재 프로젝트 목록");

		return projectDAO.getAllProject();
	}
	
	public ArrayList<projectBean> getPastProjects() {
		// TODO Auto-generated method stub
		logger.info("모든 과거 프로젝트 목록");

		return projectDAO.getPastProject();
	}
	
	public ArrayList<obtainBean> getAllObtains() {
		// TODO Auto-generated method stub
		logger.info("모든 수주 목록");

		return projectDAO.getAllObtain();
	}

	public ArrayList<UserBean> getMember_permission(int p) {
		// TODO Auto-generated method stub
		logger.info("PM list");

		return projectDAO.showMember_permssion(p);
	}
	public signupBean getMemberInfo(String string) {
		logger.info("해당 유저 정보 "+string);
		
		return projectDAO.getUserInfo(string);
	}
	
	public int insertProject (String pid,obtainBean obtainBean){
		logger.info("insertProject  pm id : "+pid+ " oId : "+obtainBean);
	
		
		
		return projectDAO.intsertProject(pid, obtainBean);
	}
	public ArrayList<signupBean> DepartmentMemberList(String di) {
		logger.info("=============DepartmentMemberList Service=============");
		logger.info("login Service.DepartmentMemberList :" + di);
		
		return projectDAO.getDepartUser(di);
	}

	public int insertObtain(obtainBean ob) {
		// TODO Auto-generated method stub
		logger.info("insertObtain :");
		
		return projectDAO.insertObtain(ob);
	}
	public obtainBean getObtains(String oid) {
		// TODO Auto-generated method stub
		logger.info("selectObtain  oid : "+oid);
		
		return projectDAO.showObtain(oid);
	}

	public int deleteObtain(String oid) {
		// TODO Auto-generated method stub
		logger.info("deleteObtain  oid : "+oid);
		return projectDAO.deleteObtain(oid);
	}

	public int updateObtain(obtainBean ob) {
		// TODO Auto-generated method stub
		
		
		return projectDAO.updateObtain(ob);
	}
	
}
