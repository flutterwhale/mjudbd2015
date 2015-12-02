package kr.ac.mju.prompt.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.mju.prompt.model.PscheduleBean;
import kr.ac.mju.prompt.model.UscheduleBean;
import kr.ac.mju.prompt.model.UserBean;
import kr.ac.mju.prompt.model.obtainBean;
import kr.ac.mju.prompt.model.projectBean;
import kr.ac.mju.prompt.model.signupBean;
import kr.ac.mju.prompt.model.userProjectBean;
import kr.ac.mju.prompt.service.ProjectService;

@Controller
public class ProjectController {

	@Autowired
	private ProjectService projectService;

	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

	// 조직도 보기
	@RequestMapping(value = "/ProjectController/showDirectory", method = RequestMethod.GET)
	public ModelAndView showDirectory(HttpSession session, Locale locale, HttpServletRequest request) {
		logger.info("Welcome home! The client locale is {}.", locale);
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}
		
		HashMap d_list = projectService.getDepartInfo();
		
		System.out.println("부서 정보 "+d_list.get(1));
		
		
		ModelAndView model = new ModelAndView();
		model.addObject("depart_list", d_list);
		model.setViewName("directory"); // jsp 이름 (view이름)
		return model;
		
	}
	
	// permission == pm 검색
	@RequestMapping(value = "/ProjectController/showObtainAdd", method = RequestMethod.GET)
	public ModelAndView showObtainAdd(HttpSession session, HttpServletRequest request) {
		logger.info("showObtainAdd: PM 추가 페이지 이동 , 제안서 id " + request.getParameter("oid"));

		ModelAndView model = new ModelAndView();
		ArrayList<UserBean> permissionlist = projectService.getMember_permission(11);
		model.addObject("PermissionList", permissionlist);
		model.setViewName("obtainAdd"); // jsp 이름 (view이름)

		return model;// jsp 파일 이름.
	}

	// 부서/직급 정보 변경하기.
	@RequestMapping(value = "/ProjectController/moveDepart", method = RequestMethod.POST)
	public String UpdatePosistion(HttpSession session, HttpServletRequest request) {
		logger.info("moveDepart:인사이동 pid: " + request.getParameter("uid") + " po " + request.getParameter("po") + " di "
				+ request.getParameter("di") + " po " + request.getParameter("po") + " perm "
				+ request.getParameter("pe"));

		projectService.moveDepartment(request.getParameter("uid"), request.getParameter("di"),
				request.getParameter("po"), request.getParameter("pe"));

		return "redirect:memberManagement";
	}
	
	
	// 부서 멤버 리스트 조회하고 부서 트리 화면으로 이동
	@RequestMapping(value = "/ProjectController/getDepartMemberlist", method = RequestMethod.GET)
	public ModelAndView getDepartmentMemberList(HttpServletRequest request) {

		logger.info("부서 멤버 리스트 " + request.getParameter("did"));

		ArrayList<signupBean> d_list = projectService.DepartmentMemberList(request.getParameter("did"));

		// System.out.println("부서 내 직원 정보 "+d_list.get(0).getId());

		ModelAndView model = new ModelAndView();
		model.addObject("memberlist", d_list);
		model.setViewName("directoryRightside"); // jsp 이름 (view이름)
		return model;

	}

	// memberManagement
	@RequestMapping(value = "/ProjectController/memberManagement", method = RequestMethod.GET)
	public ModelAndView memberManagement(HttpSession session, HttpServletRequest request) {

		logger.info("멤버 인사 관리 화면 ");

		ArrayList<signupBean> unapproved_list = projectService.DepartmentMemberList("0");
		ArrayList<signupBean> allList = projectService.allMemberList();
		ModelAndView model = new ModelAndView();
		model.addObject("allList", allList);
		model.addObject("unapproved_list", unapproved_list);
		model.setViewName("memberManagement");
		return model;

	}

	/*
	 * 제안서 관련 controller
	 */

	// 제안서 삭제 후 프로젝트 추가하기 -> 제안서 리스트 화면으로 이동
	@RequestMapping(value = "/ProjectController/newProject", method = RequestMethod.POST)
	public String InsertProject(HttpSession session, HttpServletRequest request) {
		logger.info("InsertProject:프로젝트 추가하기 pid: " + request.getParameter("pid") + " oid : "
				+ request.getParameter("oid"));
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}

		if (request.getParameter("pid") != null) {

			projectService.insertProject(request.getParameter("pid"),
					projectService.getObtains(request.getParameter("oid")));

		}
		return "redirect:showObtainTable";
	}

	// 제안서 세부 정보 확인
	@RequestMapping(value = "/ProjectController/showObtainInformation", method = RequestMethod.GET)
	public ModelAndView showObtain(HttpSession session, HttpServletRequest request) {
		logger.info("showObtain:제안서 정보 oid: " + request.getParameter("oid"));
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}

		ModelAndView model = new ModelAndView();
		obtainBean obtainBean = projectService.getObtains(request.getParameter("oid"));
		model.addObject("obtainBean", obtainBean);
		model.setViewName("obtainInformation"); // jsp 이름 (view이름)

		return model;
	}

	// 제안서 추가 페이지 이동
	@RequestMapping(value = "/ProjectController/newObtainPage", method = RequestMethod.GET)
	public ModelAndView InsertObtainPage(HttpSession session, HttpServletRequest request) {

		logger.info("InsertObtain:제안서 추가하기 ");
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}

		ModelAndView model = new ModelAndView();
		model.setViewName("insertObtainPage"); // jsp 이름 (view이름)

		return model;
	}

	// 제안서 삭제 (작성자의 제안서만 삭제)
	@RequestMapping(value = "/ProjectController/deleteObtainPage", method = RequestMethod.POST)
	public ModelAndView DeleteObtainPage(HttpSession session, HttpServletRequest request) {

		logger.info("DeleteObtain:제안서 제거하기  제거하려는 사람?:" + request.getParameter("id") + " 수주 아이디"
				+ request.getParameter("oid"));
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}

		if (session.getAttribute("session_name").toString().equals(request.getParameter("id").toString())) {

			logger.info("삭제 가능!" + request.getParameter("oid"));

			projectService.deleteObtain(request.getParameter("oid"));
		}

		ModelAndView model = new ModelAndView();

		model.setViewName("redirect:showObtainTable"); // jsp 이름 (view이름)

		return model;
	}

	// 제안서 업데이트 후 -> 제안서 리스트 화면으로 이동
	@RequestMapping(value = "/ProjectController/updateObtain", method = RequestMethod.POST)
	public String updateObtain(HttpSession session, HttpServletRequest request) {
		logger.info("InsertObtain:제안서 수정하기 wid: " + session.getAttribute("session_name") + " oid "
				+ request.getParameter("oid"));
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}

		String sdate = request.getParameter("start_date");
		String edate = request.getParameter("end_date");

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date sdateparsed = null;
		Date edateparsed = null;
		try {
			sdateparsed = format.parse(sdate);
			edateparsed = format.parse(edate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		java.sql.Date sqlStartDate = new java.sql.Date(sdateparsed.getTime());
		java.sql.Date sqlEndDate = new java.sql.Date(edateparsed.getTime());

		obtainBean oBean = new obtainBean();
		System.out.println(">>sqlStartDate " + sqlStartDate + " / sqlEndDate" + sqlEndDate + " setWriter_User "
				+ session.getAttribute("session_name") + " setObtain_Name " + request.getParameter("subject")
				+ " contents " + request.getParameter("contents") + " status " + request.getParameter("status"));
		oBean.setWriter_User((Integer) session.getAttribute("session_name"));
		oBean.setObtain_Name(request.getParameter("subject"));
		;
		oBean.setOrder_Company(request.getParameter("order_company"));
		oBean.setPresent_Status(Integer.parseInt(request.getParameter("status")));
		oBean.setStart_Date((java.sql.Date) sqlStartDate);
		oBean.setEnd_Date((java.sql.Date) sqlEndDate);
		oBean.setComment(request.getParameter("contents"));
		oBean.setLocation(request.getParameter("location"));
		oBean.setObtain_Order_Identifier(Integer.parseInt(request.getParameter("oid")));
		System.out.println("obean writer " + oBean.getWriter_User() + " stdat" + oBean.getStart_Date() + " ed"
				+ oBean.getEnd_Date());
		System.out.println(" update service 실행 !!!!! 결과 :" + projectService.updateObtain(oBean));

		return "redirect:showObtainTable";/// ProjectController/showObtainTable
	}

	// 제안 추가 후 제안서 리스트로 이동
	@RequestMapping(value = "/ProjectController/insertObtain", method = RequestMethod.POST)
	public String InsertObtain(HttpSession session, HttpServletRequest request) {
		logger.info("InsertObtain:제안서 추가하기 pid: " + session.getAttribute("session_name"));
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}

		String sdate = request.getParameter("start_date");
		String edate = request.getParameter("end_date");

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date sdateparsed = null;
		Date edateparsed = null;
		try {
			sdateparsed = format.parse(sdate);
			edateparsed = format.parse(edate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		java.sql.Date sqlStartDate = new java.sql.Date(sdateparsed.getTime());
		java.sql.Date sqlEndDate = new java.sql.Date(edateparsed.getTime());

		obtainBean oBean = new obtainBean();
		System.out.println(">> " + sqlStartDate + " / " + sqlEndDate + " " + session.getAttribute("session_name") + " "
				+ request.getParameter("subject") + " " + request.getParameter("contents"));
		oBean.setWriter_User((Integer) session.getAttribute("session_name"));
		oBean.setObtain_Name(request.getParameter("subject"));
		;
		oBean.setOrder_Company(request.getParameter("order_company"));
		oBean.setPresent_Status(10);// 기본 값
		oBean.setStart_Date((java.sql.Date) sqlStartDate);
		oBean.setEnd_Date((java.sql.Date) sqlEndDate);
		oBean.setComment(request.getParameter("contents"));
		oBean.setLocation(request.getParameter("location"));
		System.out.println(" insert !!!!! 결과 :" + projectService.insertObtain(oBean));

		// redirect:insertCoursePage
		return "redirect:showObtainTable";/// ProjectController/showObtainTable
	}

	// 제안 테이블 목록
	@RequestMapping(value = "/ProjectController/showObtainTable", method = RequestMethod.GET)
	public ModelAndView showObtainTable(HttpSession session) {
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}
		ModelAndView model = new ModelAndView();
		ArrayList<obtainBean> allObatain = projectService.getAllObtains();
		model.addObject("allObatain", allObatain);
		model.setViewName("obtainTable"); // jsp 이름 (view이름)

		return model;
	}
	/*
	 * 프로젝트 관련 controller
	 */

	// 현재 프로젝트 전체 목록
	@RequestMapping(value = "/ProjectController/showProjectTable", method = RequestMethod.GET)
	public ModelAndView showProjectTable(HttpSession session) {
		logger.info("showProjectTable:현재 프로젝트 전체 목록 보기");
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}

		ModelAndView model = new ModelAndView();
		ArrayList<projectBean> allProjects = projectService.getAllProjects();
		ArrayList<projectBean> PastProjects = projectService.getPastProjects();
		model.addObject("AllProject", allProjects);
		model.setViewName("projectTable"); // jsp 이름 (view이름)

		model.addObject("PastProject", PastProjects);
		return model;
	}

	// 프로젝트 세부 정보 페이지로 이동
	@RequestMapping(value = "/ProjectController/showProjectInformation", method = RequestMethod.GET)
	public String showProject(HttpSession session, Locale locale, Model model, HttpServletRequest request) {
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String pid = request.getParameter("pid");
		String formattedDate = dateFormat.format(date);
		logger.info("project ID " + pid);
		
		projectBean pb = projectService.getProjectInfo(pid);
		ArrayList<PscheduleBean> pschedule = projectService.getProjectScheduleList(pid);
		ArrayList<UscheduleBean> uschedule = projectService.getUserScheduleList(pid);

		model.addAttribute("serverTime", formattedDate);

		model.addAttribute("projectInfo", pb);
		model.addAttribute("projectScheduleList", pschedule);
		model.addAttribute("userScheduleList", uschedule);

		return "projectInformation";// jsp 파일 이름.
	}

	// 프로젝트 업데이트 후 -> 프로젝트 정보
	@RequestMapping(value = "/ProjectController/updateProjectInfo", method = RequestMethod.POST)
	public String updateProjectInfo(HttpSession session, HttpServletRequest request) {

		String pid = request.getParameter("pid");
		logger.info("updateProjectInfo:프로젝트 정보 수정하기 pid: " + pid);
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}

		// String sdate = request.getParameter("start_date");
		String edate = request.getParameter("end_date");
		System.out.println(" edate" + edate);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		// Date sdateparsed = null;
		Date edateparsed = null;
		try {
			// sdateparsed = format.parse(sdate);
			edateparsed = format.parse(edate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// java.sql.Date sqlStartDate = new
		// java.sql.Date(sdateparsed.getTime());
		java.sql.Date sqlEndDate = new java.sql.Date(edateparsed.getTime());

		projectBean pBean = new projectBean();

		pBean.setProject_Identifier(Integer.parseInt(pid));
		pBean.setProject_Description(request.getParameter("description"));
		pBean.setStatus(Integer.parseInt(request.getParameter("status")));
		pBean.setProject_Price(Integer.parseInt(request.getParameter("price")));
		pBean.setEnd_Date((java.sql.Date) sqlEndDate);
		pBean.setComment(request.getParameter("comment"));
		pBean.setDispatch_Location(request.getParameter("location"));
		System.out.println("projectInformation update service 실행 !!!!! 결과 :" + projectService.updateProjectInfo(pBean));

		request.setAttribute("pid", pid);
		return "redirect:showProjectInformation?pid=" + pid;// showProjectInformation
	}

	/*
	 * 프로젝트 일정
	 */

	// 프로젝트 일정 관리
	@RequestMapping(value = "/ProjectController/ShowProjectSchedulePage", method = RequestMethod.GET)
	public ModelAndView manageProjectSchedule(HttpSession session, HttpServletRequest request) {

		logger.info("newProjectSchedulePage:프로젝트 관리 page" + request.getParameter("pid"));
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}

		System.out.println(" sid? " + request.getParameter("sid"));

		ModelAndView model = new ModelAndView();

		model.setViewName("projectSchedule"); // jsp 이름 (view이름)
		model.addObject("sid", request.getParameter("sid"));
		model.addObject("projectSchedule", projectService.getProjectSchedule(request.getParameter("sid")));
		return model;
	}

	// 프로젝트 일정 업데이트 후 -> 프로젝트 정보 화면으로 이동
	@RequestMapping(value = "/ProjectController/UpdateProjectSchedule", method = RequestMethod.POST)
	public String updateProjectSchedule(HttpSession session, HttpServletRequest request) {
		logger.info("updateProjectSchedule: 일정 수정 : " + request.getParameter("pid") + " sid "
				+ request.getParameter("sid"));

		String sdate = request.getParameter("Start_date");
		String edate = request.getParameter("End_date");

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date sdateparsed = null;
		Date edateparsed = null;
		try {
			sdateparsed = format.parse(sdate);
			edateparsed = format.parse(edate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		java.sql.Date sqlStartDate = new java.sql.Date(sdateparsed.getTime());
		java.sql.Date sqlEndDate = new java.sql.Date(edateparsed.getTime());

		PscheduleBean psB = new PscheduleBean();
		System.out.println(">> " + sqlStartDate + " / " + sqlEndDate + " " + session.getAttribute("session_name") + " "
				+ request.getParameter("subject") + " " + request.getParameter("contents"));
		psB.setProject_Identifier(Integer.parseInt(request.getParameter("pid")));
		psB.setSchedule_Name(request.getParameter("Schedule_Name"));
		psB.setProgress_Percentage(Integer.parseInt(request.getParameter("Progress_Percentage")));
		psB.setStatus_Process(Integer.parseInt(request.getParameter("Status_Process")));// 기본
																						// 값
		psB.setStart_Date((java.sql.Date) sqlStartDate);
		psB.setEnd_Date((java.sql.Date) sqlEndDate);
		psB.setContents(request.getParameter("contents"));
		psB.setProject_Schedule_Identifier(Integer.parseInt(request.getParameter("Project_Schedule_Identifier")));
		System.out.println(" update service 실행 !!!!! 결과 :" + projectService.updateProjectSchedule(psB));

		return "redirect:showProjectInformation?pid=" + request.getParameter("pid");
	}

	// 프로젝트 일정 삭제 (PM만 삭제)-> 프로젝트 정보 페이지 이동
	@RequestMapping(value = "/ProjectController/deleteProjectschedule", method = RequestMethod.GET)
	public ModelAndView DeleteProjectschedule(HttpSession session, HttpServletRequest request) {

		logger.info("deleteProjectschedule:프로젝트 일정 제거하기  : 프로젝트 아이디" + request.getParameter("pid") + " 스케쥴 아이디"
				+ request.getParameter("sid"));
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}

		projectService.deleteProjectSchedule(request.getParameter("sid"));
		ModelAndView model = new ModelAndView();

		model.setViewName("redirect:showProjectInformation?pid=" + request.getParameter("pid"));

		return model;
	}

	// 프로젝트 일정 추가 완료.
	@RequestMapping(value = "/ProjectController/InsertProjectSchedule", method = RequestMethod.POST)
	public ModelAndView InsertProjectSchedule(HttpSession session, HttpServletRequest request) {

		logger.info("프로젝트 스케쥴 추가 ");

		String sdate = request.getParameter("Start_date");
		String edate = request.getParameter("End_date");

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date sdateparsed = null;
		Date edateparsed = null;
		try {
			sdateparsed = format.parse(sdate);
			edateparsed = format.parse(edate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		java.sql.Date sqlStartDate = new java.sql.Date(sdateparsed.getTime());
		java.sql.Date sqlEndDate = new java.sql.Date(edateparsed.getTime());

		PscheduleBean psB = new PscheduleBean();
		System.out.println(">> " + sqlStartDate + " / " + sqlEndDate + " " + session.getAttribute("session_name") + " "
				+ request.getParameter("subject") + " " + request.getParameter("contents"));
		psB.setProject_Identifier(Integer.parseInt(request.getParameter("pid")));
		psB.setSchedule_Name(request.getParameter("Schedule_Name"));
		psB.setProgress_Percentage(Integer.parseInt(request.getParameter("Progress_Percentage")));
		psB.setStatus_Process(Integer.parseInt(request.getParameter("Status_Process")));// 기본
																						// 값
		psB.setStart_Date((java.sql.Date) sqlStartDate);
		psB.setEnd_Date((java.sql.Date) sqlEndDate);
		psB.setContents(request.getParameter("contents"));

		System.out.println(" insert !!!!! 결과 :" + projectService.insertProjectSchedule(psB));
		ModelAndView model = new ModelAndView();
		model.setViewName("projectSchedule"); // jsp 이름 (view이름)
		// model.addObject("projectScheduleList",
		// projectService.getProjectScheduleList(request.getParameter("pid")));
		return model;

	}

	// 내 프로젝트 목록?
	@RequestMapping(value = "/ProjectController/showMyProjectTable", method = RequestMethod.GET)
	public ModelAndView showMyProjectTable(HttpSession session) {
		logger.info("showProjectTable:내 프로젝트 리스트");
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}

		ModelAndView model = new ModelAndView();
		ArrayList<userProjectBean> allProjects = projectService
				.getAllMyProjects(session.getAttribute("session_name").toString());
		ArrayList<userProjectBean> PastProjects = projectService
				.getPastMyProjects(session.getAttribute("session_name").toString());
		model.addObject("AllProject", allProjects);
		model.addObject("PastProject", PastProjects);
		model.setViewName("MyProjectTable"); // jsp 이름 (view이름)
		return model;

	}

	// 부서 트리 화면으로 이동

	/*
	 * 프로젝트 인원 추가 수정들어감. 1202_0040(김용민)
	 */

	@RequestMapping(value = "/ProjectController/showProjectMember", method = RequestMethod.GET)
	public ModelAndView showProjectUserAdd(HttpSession session, HttpServletRequest request) {

		logger.info("프로젝트 인원 추가 페이지 ");
		logger.info("showProjectMember: 개발자들 추가 페이지  , 프로젝트 id " + request.getParameter("pm_id"));

		ModelAndView model = new ModelAndView();
		ArrayList<signupBean> developerlist = projectService.getMember_developer(request.getParameter("pm_id"),request.getParameter("pid"));
		model.addObject("developerlist", developerlist);
		model.setViewName("projectUserAdd"); // jsp 이름 (view이름)

		return model;

	}
	//김용민
	@RequestMapping(value = "/ProjectController/projectUserAdd", method = RequestMethod.GET)
	public String projectUserAdd(HttpSession session, HttpServletRequest request) {

		logger.info("프로젝트 인원 추가 시도");
		//서비스 등록하는 장소
		projectService.setProjectRole(request.getParameter("uid"),request.getParameter("start"),request.getParameter("end"),request.getParameter("role"),request.getParameter("pid"));
		return "redirect:showProjectInformation?pid="+request.getParameter("pid");

	}
	//김용민(프로젝트 인원삭제)
		@RequestMapping(value = "/ProjectController/projectUserDel", method = RequestMethod.GET)
		public String projectUserDel(HttpSession session, HttpServletRequest request) {

			logger.info("프로젝트 인원 삭제 시도");
			//서비스 등록하는 장소
			projectService.delProjectRole(request.getParameter("uid"),request.getParameter("pid"));
			return "redirect:showProjectInformation?pid="+request.getParameter("pid");

		}
	//김용민(프로젝트 개인평가 리스트 만들기)
		@RequestMapping(value = "/ProjectController/projectUserEvalList", method = RequestMethod.GET)
		public ModelAndView projectUserEvalList(HttpSession session, HttpServletRequest request) {
			logger.info("프로젝트 개인 리스트 호출 시도");
			//서비스 등록하는 장소 Appraiser,wg,cg,tg,contents,is_pm,uid,pid,role
			
			ModelAndView model = new ModelAndView();
			ArrayList<Hashtable> list = projectService.setProjectEvalList(request.getParameter("Appraiser"),request.getParameter("pid"));
			model.addObject("developerlist", list);
			model.setViewName("roleEvaluation"); // jsp 이름 (view이름)
			
			return model;
		}
		
		
	//김용민(프로젝트 개인평가 추가)
		@RequestMapping(value = "/ProjectController/projectUserEval", method = RequestMethod.GET)
		public String projectUserEval(HttpSession session, HttpServletRequest request) {
			logger.info("프로젝트 개인 평가 추가 시도");
			//서비스 등록하는 장소 Appraiser,wg,cg,tg,contents,is_pm,uid,pid,role
			projectService.setProjectEval(request.getParameter("Appraiser"),request.getParameter("wg"),request.getParameter("cg"),request.getParameter("tg"),request.getParameter("contents"),request.getParameter("is_pm"),request.getParameter("uid"),request.getParameter("pid"),request.getParameter("role"));
			return "redirect:showProjectInformation?pid="+request.getParameter("pid")+"&Appraiser="+request.getParameter("Appraiser");
		}

	/*
	 * 업무일지 관련
	 */

	// 업무일지 화면 이동
	@RequestMapping(value = "/ProjectController/showBusinessLog", method = RequestMethod.GET)
	public String showBusinessLog(HttpSession session, Locale locale, Model model) {
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "businessLog";// jsp 파일 이름.
	}

	// 업무일지 세부 정보 확인
	@RequestMapping(value = "/ProjectController/showBusinessInformation", method = RequestMethod.GET)
	public String showBusinessInformation(HttpSession session, Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "businessInformation";// jsp 파일 이름.
	}

	// 업무일지 추가 하기
	@RequestMapping(value = "/ProjectController/showBusinessAdd", method = RequestMethod.GET)
	public String showBusinessAdd(HttpSession session, Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "businessAdd";// jsp 파일 이름.
	}

	// 업무 일지 변경
	@RequestMapping(value = "/ProjectController/showBusinessChange", method = RequestMethod.GET)
	public String showBusinessChange(HttpSession session, Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "businessChange";// jsp 파일 이름.
	}

	// 멤버 인사 관리 화면
	@RequestMapping(value = "/ProjectController/showMemberManagement", method = RequestMethod.GET)
	public String showMemberManagement(HttpSession session, HttpServletRequest request) {

		logger.info("멤버 인사 관리 화면 ");

		// ArrayList<signupBean> d_list
		// =projectService.DepartmentMemberList(request.getParameter("did"));

		return "memberManagement";

	}

	@RequestMapping(value = "/ProjectController/showUserSchedule", method = RequestMethod.GET)
	public String showUserSchedule(HttpSession session, HttpServletRequest request) {

		logger.info("유저 스케쥴 관리 화면 ");

		// ArrayList<signupBean> d_list =
		// projectService.DepartmentMemberList(request.getParameter("did"));

		return "userSchedule";

	}

	@RequestMapping(value = "/ProjectController/showUserScheduleAdd", method = RequestMethod.GET)
	public String showUserScheduleAdd(HttpSession session, HttpServletRequest request) {

		logger.info("유저 스케쥴 추가 ");

		// ArrayList<signupBean> d_list =
		// projectService.DepartmentMemberList(request.getParameter("did"));

		return "userScheduleAdd";

	}

	@RequestMapping(value = "/ProjectController/showProjectUserEvaluation", method = RequestMethod.GET)
	public String showProjectUserEvaluation(HttpSession session, HttpServletRequest request) {

		logger.info("프로젝트 개인 평가 보기 ");

		// ArrayList<signupBean> d_list =
		// projectService.DepartmentMemberList(request.getParameter("did"));

		return "projectUserEvaluation";

	}

	@RequestMapping(value = "/ProjectController/showProjectEvaluation", method = RequestMethod.GET)
	public String showProjectEvaluation(HttpSession session, HttpServletRequest request) {

		logger.info("프로젝트 평가 페이지  ");

		// ArrayList<signupBean> d_list =
		// projectService.DepartmentMemberList(request.getParameter("did"));

		return "projectEvaluation";

	}

	// 데이터 베이스 테스트
	@RequestMapping(value = "/ProjectController/showDepart", method = RequestMethod.GET)
	public String showDepart(HttpSession session, Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "depart_query";// jsp 파일 이름.
	}

	@RequestMapping(value = "/ProjectController/deleteProject", method = RequestMethod.GET)
	public String deleteProject(HttpSession session, HttpServletRequest request) {
		logger.info("프로젝트 삭제 ", request.getParameter("pid"));

		projectService.deleteProject(request.getParameter("pid"));

		return "redirect:showProjectTable";

	}

}
