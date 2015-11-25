package kr.ac.mju.prompt.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.mju.prompt.service.LoginService;
import kr.ac.mju.prompt.service.ProjectService;

@Controller
public class ProjectController {

	@Autowired
	//private LoginService loginService;
	private ProjectService projectService;
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	@RequestMapping(value = "/ProjectController/showProjectTable", method = RequestMethod.GET)
	public String showProjectTable(HttpSession session, Locale locale, Model model) {
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}	
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "projectTable";//jsp 파일 이름. 
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
		
		model.addAttribute("serverTime", formattedDate );
		
		return "projectInformation";//jsp 파일 이름. 
	}
	
	@RequestMapping(value = "/ProjectController/showObtainTable", method = RequestMethod.GET)
	public String showObtainTable(HttpSession session, Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}	
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "obtainTable";//jsp 파일 이름. 
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
		
		model.addAttribute("serverTime", formattedDate );
		
		return "obtainInformation";//jsp 파일 이름. 
	}
	
	@RequestMapping(value = "/ProjectController/showObtainAdd", method = RequestMethod.GET)
	public String showObtainAdd(HttpSession session, Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}	
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "obtainAdd";//jsp 파일 이름. 
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
		
		model.addAttribute("serverTime", formattedDate );
		
		return "PMProjectTable";//jsp 파일 이름. 
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
		
		model.addAttribute("serverTime", formattedDate );
		
		return "directory";//jsp 파일 이름. 
	}
}
