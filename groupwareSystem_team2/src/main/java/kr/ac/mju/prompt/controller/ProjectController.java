package kr.ac.mju.prompt.controller;

import java.text.DateFormat;
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
import kr.ac.mju.prompt.model.signupBean;
import kr.ac.mju.prompt.service.LoginService;
import kr.ac.mju.prompt.service.ProjectService;

@Controller
public class ProjectController {

	@Autowired
	private LoginService loginService;
	private ProjectService projectService;
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);

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

	@RequestMapping(value = "/ProjectController/showObtainInformation", method = RequestMethod.GET)
	public String showObtainInformation(HttpSession session, Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "obtainInformation";// jsp 파일 이름.
	}

	@RequestMapping(value = "/ProjectController/showObtain1Add", method = RequestMethod.GET)
	public ModelAndView showObtainAdd(HttpSession session) {
		logger.info("showObtainAdd:권한으로 검색하기");

		ModelAndView model = new ModelAndView();
		ArrayList<UserBean> permissionlist = projectService.getMember_permission(11);
		model.addObject("PermissionList", permissionlist);
		model.setViewName("obtainAdd"); // jsp 이름 (view이름)

		return model;// jsp 파일 이름.
	}
	@RequestMapping(value = "/ProjectController/retrieveUser", method = RequestMethod.GET)
	public String retrieveMember(HttpServletRequest request,HttpSession session){
		logger.info("retrieveMember:ID로 User정보 검색하기" + request.getParameter("id"));
		ModelAndView model = new ModelAndView();
		//signupBean userInfo = projectService.getMemberInfo(request.getParameter("id"));
	//	request.setAttribute("showBean", show);
			
	//	signupBean userInfo = (signupBean) session.getAttribute("signupBean"));
		signupBean show = loginService.showMember(request.getParameter("id"));
		request.setAttribute("showBean", show);
		return "userProfile";
	}

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
}
