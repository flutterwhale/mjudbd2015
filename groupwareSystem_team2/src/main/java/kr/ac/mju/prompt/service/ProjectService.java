package kr.ac.mju.prompt.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.mju.prompt.dao.ProjectDAO;
import kr.ac.mju.prompt.model.PscheduleBean;
import kr.ac.mju.prompt.model.UscheduleBean;
import kr.ac.mju.prompt.model.UserBean;
import kr.ac.mju.prompt.model.obtainBean;
import kr.ac.mju.prompt.model.projectBean;
import kr.ac.mju.prompt.model.signupBean;
import kr.ac.mju.prompt.model.userProjectBean;

@Service
public class ProjectService {

	@Autowired
	private ProjectDAO projectDAO;
	private static final Logger logger = LoggerFactory.getLogger(ProjectService.class);

	/*
	 * 프로젝트 관련 서비스
	 */
	public int deleteProject(String pid) {
		logger.info("============= 프로젝트 삭제하기 Service=============");
		logger.info("삭제할 project id" + pid);

		return projectDAO.deleteProject(pid);
	}

	public ArrayList<projectBean> getAllProjects() {
		// TODO Auto-generated method stub
		logger.info("=============모든 현재 프로젝트 가져오기 Service=============");
		logger.info("모든 현재 프로젝트 목록");

		return projectDAO.getAllProject();
	}

	public ArrayList<projectBean> getPastProjects() {
		// TODO Auto-generated method stub
		logger.info("=============모든 과거 프로젝트 가져오기 Service=============");
		logger.info("모든 과거 프로젝트 목록");

		return projectDAO.getPastProject();
	}

	public int insertProject(String pid, obtainBean obtainBean) {
		logger.info("=============insertProject Service=============");
		logger.info("insertProject  pm id : " + pid + " oId : " + obtainBean);
		return projectDAO.intsertProject(pid, obtainBean);
	}

	public projectBean getProjectInfo(String projectid) {
		logger.info("=============getProjectInfo Service=============");
		logger.info("Show Project info  projectid : " + projectid);
		return projectDAO.getProject(projectid);
	}

	public ArrayList<PscheduleBean> getProjectScheduleList(String pid) {
		// TODO Auto-generated method stub
		logger.info("=============ProjectScheduleList Service=============");
		logger.info("프로젝트 일정 목록");

		return projectDAO.getProjectSchedule(pid);
	}

	// 프로젝트 일정.
	public PscheduleBean getProjectSchedule(String sid) {
		// TODO Auto-generated method stub
		logger.info("select ProjectSchedule  sid : " + sid);

		return projectDAO.showProjectSchedule(sid);
	}

	public int deleteProjectSchedule(String sid) {
		// TODO Auto-generated method stub
		logger.info("deleteProjectSchedule  sid : " + sid);
		return projectDAO.deleteProjectSchedule(sid);
	}

	public int insertProjectSchedule(PscheduleBean psb) {
		// TODO Auto-generated method stub

		return projectDAO.insertProjectSchedule(psb);
	}

	public int updateProjectSchedule(PscheduleBean psb) {
		// TODO Auto-generated method stub

		return projectDAO.updateProjectSchedule(psb);
	}

	public ArrayList<UscheduleBean> getUserScheduleList(String pid) {
		// TODO Auto-generated method stub
		logger.info("=============UserScheduleList Service=============");
		logger.info("프로젝트 개인 일정 목록");

		return projectDAO.getUserScheduleList(pid);
	}

	/*
	 * 유저 정보 가져 오기 서비스(김용민)
	 */

	public ArrayList<signupBean> getMember_developer(String pmid, String pid) {
		// TODO Auto-generated method stub
		logger.info("=============개발자 리스트가져오기 Service=============");
		logger.info("list에서 PM 제거 ");
		return projectDAO.getRoleDepartUser(pmid, pid);
	}

	// 김용민
	public void setProjectRole(String uid, String start, String end, String role, String pid) {
		// TODO Auto-generated method stub
		logger.info("=============개발자 프로젝트에 등록하기 Service=============");

		projectDAO.setProjectRole(uid, start, end, role, pid);
	}

	// 김용민
	public void delProjectRole(String uid, String pid) {
		// TODO Auto-generated method stub
		logger.info("=============개발자 프로젝트에 등록하기 Service=============");

		projectDAO.delProjectRole(uid, pid);
	}

	// 김용민 평가할 대상 리스트 불러오기
	public ArrayList setProjectEvalList(String Appraiser, String pid) {
		// TODO Auto-generated method stub
		logger.info("=============평가 리스트 불러오기 Service=============");

		return projectDAO.setProjectEvalList(Appraiser, pid);

	}

	// 김용민
	public void setProjectEval(String Appraiser, String wg, String cg, String tg, String contents, String is_pm,
			String uid, String pid, String role) {
		// TODO Auto-generated method stub
		logger.info("=============평가 테이블 등록하기Service=============");

		projectDAO.setProjectEval(Appraiser, wg, cg, tg, contents, is_pm, uid, pid, role);
	}

	public ArrayList<UserBean> getMember_permission(int p) {
		// TODO Auto-generated method stub
		logger.info("=============PM List 가져오기 Service=============");
		logger.info("PM list");

		return projectDAO.showMember_permssion(p);
	}

	public signupBean getMemberInfo(String string) {
		logger.info("=============해당 유저 정보 가져오기 Service=============");
		logger.info("해당 유저 정보 " + string);

		return projectDAO.getUserInfo(string);
	}

	public ArrayList<signupBean> DepartmentMemberList(String di) {
		logger.info("=============DepartmentMemberList Service=============");
		logger.info("login Service.DepartmentMemberList :" + di);

		return projectDAO.getDepartUser(di);
	}

	/*
	 * 수주 관련 service
	 */
	public ArrayList<obtainBean> getAllObtains() {
		// TODO Auto-generated method stub
		logger.info("=============모든 수주  List 가져오기 Service=============");
		logger.info("모든 수주 목록");

		return projectDAO.getAllObtain();
	}

	public int insertObtain(obtainBean ob) {
		// TODO Auto-generated method stub
		logger.info("insertObtain :");

		return projectDAO.insertObtain(ob);
	}

	public obtainBean getObtains(String oid) {
		// TODO Auto-generated method stub
		logger.info("selectObtain  oid : " + oid);

		return projectDAO.showObtain(oid);
	}

	public int deleteObtain(String oid) {
		// TODO Auto-generated method stub
		logger.info("deleteObtain  oid : " + oid);
		return projectDAO.deleteObtain(oid);
	}

	public int updateObtain(obtainBean ob) {
		// TODO Auto-generated method stub

		return projectDAO.updateObtain(ob);
	}

	public int updateProjectInfo(projectBean pBean) {
		// TODO Auto-generated method stub
		logger.info("=============updateProjectInfo Service=============");
		logger.info("update Project info  projectid : " + pBean.getProject_Identifier());
		return projectDAO.updateProjectInfo(pBean);
	}

	// 모든 멤버 출력
	public ArrayList<signupBean> allMemberList() {
		// TODO Auto-generated method stub
		logger.info("=============allMemberList Service=============");

		return projectDAO.getAllMembers();
	}

	public int moveDepartment(String id, String di, String po, String pe) {
		// TODO Auto-generated method stub
		logger.info("=============allMemberList Service=============");

		return projectDAO.moveDepart(id, di, po, pe);
	}

	public HashMap getDepartInfo() {
		// TODO Auto-generated method stub
		return projectDAO.getDepartInfo();
	}

	public ArrayList<userProjectBean> getAllMyProjects(String id) {
		// TODO Auto-generated method stub
		logger.info("=============나의 현재 프로젝트 가져오기 Service=============");
		logger.info("getAllMyProjects :" + id);
		return projectDAO.getAllMyProject(id);
	}

	public ArrayList<userProjectBean> getPastMyProjects(String id) {
		// TODO Auto-generated method stub
		logger.info("=============나의  과거 프로젝트 가져오기 Service=============");
		logger.info("getPastMyProjects :" + id);
		return projectDAO.getPastMyProject(id);
	}

	// 김용민 (프로젝트 평가)
	public void setProjectOrderEval(String pid, String Project_Comment, String Score) {
		projectDAO.setProjectOrderEval(pid, Project_Comment, Score);
	}

	// 유저 스케쥴 등록
	public int insertUserSchedule(UscheduleBean usB) {
		// TODO Auto-generated method stub
		return projectDAO.insertUserSchedule(usB);
	}

	public UscheduleBean getUserSchedule(String uid, String pid) {
		// TODO Auto-generated method stub
		logger.info("select ProjectSchedule  uid : " + uid + " pid " + pid);

		return projectDAO.showUserSchedule(uid, pid);
	}

	public int deleteUserSchedule(String sid) {
		// TODO Auto-generated method stub
		logger.info("deleteProjectSchedule  sid : " + sid);
		return projectDAO.deleteUserSchedule(sid);
	}

	public int updateProjectSchedule(UscheduleBean usb) {
		// TODO Auto-generated method stub

		return projectDAO.updateProjectSchedule(usb);
	}
}