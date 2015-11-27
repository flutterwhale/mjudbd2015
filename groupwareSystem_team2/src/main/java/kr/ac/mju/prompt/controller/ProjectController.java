package kr.ac.mju.prompt.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

import kr.ac.mju.prompt.model.UserBean;
import kr.ac.mju.prompt.model.obtainBean;
import kr.ac.mju.prompt.model.projectBean;
import kr.ac.mju.prompt.service.ProjectService;

@Controller
public class ProjectController {

	@Autowired
	// private LoginService loginService;
	private ProjectService projectService;

	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

	@RequestMapping(value = "/ProjectController/newProject", method = RequestMethod.GET)
	public String InsertProject(HttpSession session, HttpServletRequest request) {
		logger.info("InsertProject:프로젝트 추가하기 pid: " + request.getParameter("pid") + " oid : "
				+ request.getParameter("oid"));
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}

		if(request.getParameter("pid")!=null){
		
		 projectService.insertProject(request.getParameter("pid"), projectService.getObtains(request.getParameter("oid")));
		
		
		}
		return "redirect:showObtainTable";
	}

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

	@RequestMapping(value = "/ProjectController/newObtainPage", method = RequestMethod.GET)
	public ModelAndView InsertObtainPage(HttpSession session,HttpServletRequest request) {
	
		logger.info("InsertObtain:제안서 추가하기 " );
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}

		
		
		ModelAndView model = new ModelAndView();
		//UserInfo ui = loginService.signup(sb);
		//return "insertObtainPage";
	//	model.addObject("obtainBean", oBean);
		model.setViewName("insertObtainPage"); // jsp 이름 (view이름)

		return model;
	}
	@RequestMapping(value = "/ProjectController/deleteObtainPage", method = RequestMethod.POST)
	public ModelAndView DeleteObtainPage(HttpSession session,HttpServletRequest request) {
	
		logger.info("DeleteObtain:제안서 제거하기  제거하려는 사람?:" +request.getParameter("id") + " 수주 아이디" +request.getParameter("oid") );
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}

		if(session.getAttribute("session_name").toString().equals(request.getParameter("id").toString())){
			
			logger.info("삭제 가능!" +request.getParameter("oid"));
			
			projectService.deleteObtain(request.getParameter("oid"));
		}
		
		
		ModelAndView model = new ModelAndView();
		
		model.setViewName("redirect:showObtainTable"); // jsp 이름 (view이름)

		return model;
	}
	@RequestMapping(value = "/ProjectController/updateObtain", method = RequestMethod.POST)
	public String updateObtain(HttpSession session, HttpServletRequest request) {
		logger.info("InsertObtain:제안서 수정하기 wid: " + session.getAttribute("session_name")+ " oid "+ request.getParameter("oid"));
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}

		
		String sdate = request.getParameter("start_date");
		String edate = request.getParameter("end_date");
		
		 SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		  Date sdateparsed = null;
		  Date edateparsed = null ;
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
		System.out.println(">>sqlStartDate " +sqlStartDate + " / sqlEndDate" + sqlEndDate+ " setWriter_User " + session.getAttribute("session_name")+" setObtain_Name "+ request.getParameter("subject") +" contents "+request.getParameter("contents") +" status "+request.getParameter("status"));
		oBean.setWriter_User((Integer) session.getAttribute("session_name"));
		oBean.setObtain_Name(request.getParameter("subject"));;
		oBean.setOrder_Company(request.getParameter("order_company"));
		oBean.setPresent_Status(Integer.parseInt(request.getParameter("status")));
		oBean.setStart_Date((java.sql.Date) sqlStartDate);
		oBean.setEnd_Date((java.sql.Date) sqlEndDate);
		oBean.setComment(request.getParameter("contents"));
		oBean.setObtain_Order_Identifier(Integer.parseInt(request.getParameter("oid")));
		System.out.println("obean writer "+oBean.getWriter_User() + " stdat" + oBean.getStart_Date() +" ed"+ oBean.getEnd_Date());
		System.out.println(" update !!!!! 결과 :"+projectService.updateObtain(oBean));
		
		return "redirect:showObtainTable";///ProjectController/showObtainTable
	}

	
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
		  Date edateparsed = null ;
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
		System.out.println(">> " +sqlStartDate + " / " + sqlEndDate+ " " + session.getAttribute("session_name")+" "+ request.getParameter("subject") +" "+request.getParameter("contents"));
		//request.getParameter("start_date"),request.getParameter("end_date"),
		//request.getParameter("order_company"),request.getParameter("contents"),request.getParameter("wid")
		oBean.setWriter_User((Integer) session.getAttribute("session_name"));
		oBean.setObtain_Name(request.getParameter("subject"));;
		oBean.setOrder_Company(request.getParameter("order_company"));
		oBean.setPresent_Status(10);//기본 값
		oBean.setStart_Date((java.sql.Date) sqlStartDate);
		oBean.setEnd_Date((java.sql.Date) sqlEndDate);
		oBean.setComment(request.getParameter("contents"));

		System.out.println(" insert !!!!! 결과 :"+projectService.insertObtain(oBean));
		
//redirect:insertCoursePage
		return "redirect:showObtainTable";///ProjectController/showObtainTable
	}

	@RequestMapping(value = "/ProjectController/showProjectTable", method = RequestMethod.GET)
	public ModelAndView showProjectTable(HttpSession session) {
		logger.info("showProjectTable:프로젝트 전체 목록 보기");
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}

		ModelAndView model = new ModelAndView();
		ArrayList<projectBean> allProjects = projectService.getAllProjects();
		model.addObject("AllProject", allProjects);
		model.setViewName("projectTable"); // jsp 이름 (view이름)

		return model;
	}

	@RequestMapping(value = "/ProjectController/showProjectInformation", method = RequestMethod.GET)
	public String showProject(HttpSession session, Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "projectInformation";// jsp 파일 이름.
	}

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

	@RequestMapping(value = "/ProjectController/retrieveUserList", method = RequestMethod.GET)
	public ModelAndView showRetrieveList(HttpSession session, String input) {
		logger.info("retrieveUserList:유저 리스트 검색하기");

		ModelAndView model = new ModelAndView();
		ArrayList<UserBean> permissionlist = projectService.getMember_permission(11);
		model.addObject("PermissionList", permissionlist);
		model.setViewName("obtainAdd"); // jsp 이름 (view이름)

		return model;// jsp 파일 이름.
	}

	/*
	 * @RequestMapping(value = "/ProjectController/retrieveUser", method =
	 * RequestMethod.GET) public String retrieveMember(HttpServletRequest
	 * request,HttpSession session){ logger.info(
	 * "retrieveMember:ID로 User정보 검색하기 " + request.getParameter("id"));
	 * //ModelAndView model = new ModelAndView(); //signupBean userInfo =
	 * projectService.getMemberInfo(request.getParameter("id")); //
	 * request.setAttribute("showBean", show);
	 * 
	 * // signupBean userInfo = (signupBean)
	 * session.getAttribute("signupBean")); signupBean show =
	 * loginService.showMember(request.getParameter("id"));
	 * request.setAttribute("showBean", show); return "userProfile"; }
	 */
	@RequestMapping(value = "/ProjectController/showPMProjectTable", method = RequestMethod.GET)
	public String showPMProjectTable(HttpSession session, Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "PMProjectTable";// jsp 파일 이름.
	}

	@RequestMapping(value = "/ProjectController/showDirectory", method = RequestMethod.GET)
	public String showDirectory(HttpSession session, Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "directory";// jsp 파일 이름.
	}
	
	@RequestMapping(value = "/ProjectController/showBusinessLog", method = RequestMethod.GET)
	public String showBusinessLog(HttpSession session, Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "businessLog";// jsp 파일 이름.
	}
	
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
}
