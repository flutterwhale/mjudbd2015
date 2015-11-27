package kr.ac.mju.prompt.controller;

import java.io.UnsupportedEncodingException;
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
import kr.ac.mju.prompt.model.UserInfo;
import kr.ac.mju.prompt.model.signupBean;
import kr.ac.mju.prompt.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	// 로그인 시도, 성공시 login.jsp로 / 실패시 loginRetrun.jsp
	@RequestMapping(value = "/LoginController/login.do", method = RequestMethod.POST)
	public ModelAndView login(HttpSession session, HttpServletRequest request, Locale locale, Model model)
			throws UnsupportedEncodingException {
		logger.info("=============로그인=============");

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		request.setCharacterEncoding("utf-8");
		String userID = request.getParameter("user_id"); // home.jsp 에서 input 에서
															// 넘어온 parameter
		String userPW = request.getParameter("user_password");
		ModelAndView modelview = new ModelAndView();
		if (0 == userID.length()) {
			logger.info("97 : id 입력하지 않음");
			logger.info("로그인 시도 ID:" + userID + ", PW:" + userPW);
			request.setAttribute("code", 97);

			modelview.setViewName("loginRetrun");

			// return "loginRetrun";
			return modelview;
		} else if (0 == userPW.length()) {
			logger.info("96 : pw 입력하지 않음");
			request.setAttribute("code", 96);
			logger.info("로그인 시도 ID:" + userID + ", PW:" + userPW);
			// return "loginRetrun";
			modelview.setViewName("loginRetrun");
			return modelview;
		}
		logger.info("로그인 시도 ID:" + userID + ", PW:" + userPW);
		UserInfo ui = loginService.login(userID, userPW); // loginservice 요청

		if (ui.getErrorCode() == 0) { // 로그인 성공 정보 0
			logger.info("0 : 로그인 일치");
			// session = request.getSession(true);
			// request.setAttribute("code", "0");
			/*
			 * session.setAttribute("userinfo", ui);
			 * session.setAttribute("session_name", ui.getMyUser().getId());
			 * session.setAttribute("cat", ui.getMyUser().getCat());
			 * session.setAttribute("code", "0");
			 */
			// return "login";

			modelview.addObject("userinfo", ui);
			modelview.setViewName("login"); // jsp 이름 (view이름)

			return modelview;
		} else {
			// session.setAttribute("sessionCheck", 0);
			request.setAttribute("code", ui.getErrorCode());
			logger.info("99 : 로그인 실패");
			// return "loginRetrun";
			modelview.setViewName("loginRetrun");
			return modelview;
		}
	}

	// 메인 메뉴 화면 이동
	@RequestMapping(value = "/LoginController/main", method = RequestMethod.GET)
	public String main(HttpSession session) {
		logger.info("=============메인화면=============");
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}
		return "main";
	}

	// id 중복 체크하기

	
	// id 중복 체크
	@RequestMapping(value = "LoginController/idcheck.do", method = RequestMethod.GET)
	public String idchk(HttpServletRequest request, Model model) {
		logger.info("id check 하기 ");
		String id = request.getParameter("id");

		String result = loginService.idcheck(id);
		String test = result.equals("true") ? "사용 가능한 아이디 입니다." : "이미 사용중인 아이디 입니다.";
		System.out.println("idchk : " + test);
		model.addAttribute("result", test);

		request.setAttribute("check", result);
		return "idcheck";
	}

	// 세션삭제후 로그아웃, 초기 페이지 home.jsp로 이동.
	@RequestMapping(value = "/LoginController/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session, Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		logger.info("=============로그아웃=============");
		session.invalidate();
		logger.info("=============세션 종료=============");
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	
	// 회원 가입 페이지 이동 , 일반인 / 개발자 분기
	@RequestMapping(value = "/LoginController/signupPage", method = RequestMethod.GET)
	public String signupPage(HttpSession session, HttpServletRequest request) {
		logger.info("=============회원가입=============");
		if (session.getAttribute("session_name") != null) {
			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}
		
		String joincat = request.getParameter("joincat");
		logger.info("회원 가입 종류 :" + joincat);
		
		if (joincat.equals("common")) {
			logger.info("signup_common");
			return "signup";

		} else {
			logger.info("signup_developer");
			return "signup_developer";
		}

	}

	 // 비개발자 등록
	@RequestMapping(value = "/LoginController/signup", method = RequestMethod.POST)
	public String signup(HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException {
		logger.info("회원 등록 시도: 일반직원");

		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("signupName");// 이름
		String id = request.getParameter("signupID");// 아이디?
		String password = request.getParameter("signupPW");// 비밀번호

		String phone = request.getParameter("phone");// 연락처
		String email = request.getParameter("email");// 연락처
		String addr = request.getParameter("address"); // 주소
		String gender = request.getParameter("gender"); // 성별
		String ssn = request.getParameter("ssn"); // 성별

		// 기타 정보
		String university = request.getParameter("university"); // 최종학력
		String major = request.getParameter("major");
		String entrance = request.getParameter("entrance");
		String graduation = request.getParameter("graduation");
		String academic_career = university + "." + major + "." + entrance + "." + graduation;

		String career = request.getParameter("career");

		String portfolio = request.getParameter("portfolio");

		// 사용 가능한 언어

		logger.info(
				"회원가입 시도  : ID " + id + "NAME :" + name + ", PW:" + password + " , NAME : " + phone + "ssn : " + ssn);
		logger.info(" userAddr :" + addr + "email : " + email + ", gender:" + gender + " , academic_carrer career: "
				+ academic_career + " careers : " + career + " portfolio: " + portfolio);

		signupBean sb = new signupBean(name, id, password, ssn, phone, addr, email, gender, academic_career, career,
				portfolio);

		// logger.info("회원가입 시도 ID :" + userID + ", PW:" + userPW + " , NAME : "
		// + userName + " " + userCat);

		UserInfo ui = loginService.signup(sb);

		request.setAttribute("code", ui.getErrorCode());

		return "loginRetrun";
	}

	// 개발자 등록 , 사용 가능한 언어리스트 추가
	@RequestMapping(value = "/LoginController/signup_developer", method = RequestMethod.POST) // 개발자
	public String signup_developer(HttpSession session, HttpServletRequest request)
			throws UnsupportedEncodingException {
		String joincat = request.getParameter("isFreelancer");// !=
																// false?"FreeLancer":"Common"
																// .length()!=0?"FreeLancer":"Common"
		logger.info("회원 등록 시도: 프리랜서 여부" + joincat);

		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("signupName");// 이름
		String id = request.getParameter("signupID");// 아이디?
		String password = request.getParameter("signupPW");// 비밀번호

		String phone = request.getParameter("phone");// 연락처
		String email = request.getParameter("email");// 연락처
		String addr = request.getParameter("address"); // 주소
		String gender = request.getParameter("gender"); // 성별
		String ssn = request.getParameter("ssn"); // 성별

		// 기타 정보
		String university = request.getParameter("university"); // 최종학력
		String major = request.getParameter("major");
		String depart = request.getParameter("depart");
		String graduation = request.getParameter("graduation");
		String academic_career = university + "." + depart + "." + major + "." + graduation;

		String career = request.getParameter("career");

		String portfolio = request.getParameter("portfolio");
		String tech_level = request.getParameter("tech_level");

		int language_count = Integer.parseInt(request.getParameter("language_count"));
		System.out.println("추가된 language 개수 " + language_count);

		ArrayList<String> language_list = new ArrayList<String>();
		ArrayList<Integer> language_level_list = new ArrayList<Integer>();

		for (int i = 1; i <= language_count; i++) {
			language_list.add(new String(request.getParameter("language" + i)));
			language_level_list.add(new Integer(request.getParameter("language_level" + i)));
		}

		for (int i = 0; i < language_count; i++) {
			System.out.println(i + "language>" + language_list.get(i).toString());
			System.out.println(i + "level==>" + language_level_list.get(i).toString());
		}
		// 사용 가능한 언어
		logger.info(
				"개발자 등록 시도  : ID " + id + "NAME :" + name + ", PW:" + password + " , NAME : " + phone + "ssn : " + ssn);
		logger.info(" userAddr :" + addr + "email : " + email + ", gender:" + gender + " , academic_carrer career: "
				+ academic_career + " careers : " + career + " portfolio: " + portfolio);
		logger.info(" joincat " + joincat + " tech_level: " + tech_level);

		signupBean sb = new signupBean(joincat, name, id, password, ssn, phone, addr, email, gender, academic_career,
				career, portfolio, language_list, language_level_list, tech_level);

		UserInfo ui = loginService.signup(sb);

		request.setAttribute("code", ui.getErrorCode());

		return "loginRetrun";
	}
	
	// 개인정보 확인 페이지 이동

	@RequestMapping(value = "/LoginController/showMemberPage", method = RequestMethod.GET)
	public String showMember(HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException {
		logger.info("=============개인정보 확인 페이지=============");
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}
		UserBean u = (UserBean) session.getAttribute("loginbean");
		logger.info("개인 정보 확인: " + u.getName() + " : " + u.getId() + " / " + u.getCat());
		signupBean show = loginService.showMember(u.getId() + "");
		request.setAttribute("showBean", show);
		return "showMember";

	}

	
	// 유저ID로 정보 검색하기
	@RequestMapping(value = "/LoginController/retrieveUser", method = RequestMethod.GET)
	public String retrieveMember(HttpServletRequest request, HttpSession session) {
		logger.info("=============ID로검색=============");
		logger.info("retrieveMember:ID로 User정보 검색하기 " + request.getParameter("id"));
		signupBean show = loginService.showMember(request.getParameter("id"));
		request.setAttribute("showBean", show);
		return "userProfile";
	}

	// 개인정보 수정 페이지 분기
	@RequestMapping(value = "/LoginController/editMemberPage", method = RequestMethod.POST)
	public String editPage(HttpSession session, HttpServletRequest request) {
		logger.info("=============개인정보 수정 분기=============");
		if (session.getAttribute("session_name") != null) {

			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}
		String cat = (String) request.getParameter("cat");
		String id = (String) request.getParameter("id");

		logger.info("정보 업데이트 : cat : " + cat + " id " + id);

		if (cat == null) { // null 값이면 일반 사용자
			logger.info("일반 사용자 정보 수정 페이지 이동");
			
			return "editMember"; // 일반 사용자

		} else { // 개발자 모드 //common은 일반 개발자 //FreeLancer는 외부자
			logger.info("개발자 정보 수정 페이지 이동");
			return "editMember_developer";
		}

	}

	// 유저 정보 업데이트 수행 - 프로그래밍 언어 수준 적용 안됨.
	@RequestMapping(value = "/LoginController/updateMember.do", method = RequestMethod.POST)
	public String updateMember(HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException {
		if (session.getAttribute("session_name") != null) {
			logger.info(session.getAttribute("session_name").toString() + " 해당 사용자가 로그인중입니다. ");
		}
		request.setCharacterEncoding("utf-8");
		String id = (String) request.getParameter("signupID");

//		String pw1 = (String) request.getParameter("signupPW");

		String password = request.getParameter("signupPW");// 비밀번호

		String phone = request.getParameter("phone");// 연락처
		String email = request.getParameter("email");// 연락처
		String addr = request.getParameter("address"); // 주소

		// 기타 정보
		String university = request.getParameter("university"); // 최종학력
		String major = request.getParameter("major");
		String depart = request.getParameter("depart");
		String graduation = request.getParameter("graduation");
		String academic_career = university + "." + depart + "." + major + "." + graduation;

		String career = request.getParameter("career");

		String portfolio = request.getParameter("portfolio");

		int part_id = loginService.searchMemberDepart(id);

		signupBean sb = new signupBean();// 기본정보 미리 빈에 담아둠.

		sb.setId(Integer.parseInt(id));
		sb.setPassword(password);
		sb.setPhone(phone);
		sb.setAddr(addr);
		sb.setEmail(email);
		sb.setA_career(academic_career);
		sb.setCareer(career);
		sb.setPortfolio(portfolio);

		System.out.println("부서 ID " + part_id);

		if (part_id == 17 || part_id == 99) {
			/*
			 * loginService.deleteMemberLanguage(id);//사용자 아이디를 프로그래밍 언어 내역의 삭제
			 * 
			 * int tech_level =
			 * Integer.parseInt(request.getParameter("tech_level").toString());
			 * sb.setTech_level(tech_level);
			 * 
			 * int language_count =
			 * Integer.parseInt(request.getParameter("language_count"));
			 * System.out.println("추가된 language 개수 " + language_count);
			 * 
			 * ArrayList<String> language_list = new ArrayList<String>();
			 * ArrayList<Integer> language_level_list = new
			 * ArrayList<Integer>();
			 * 
			 * for (int i = 1; i <= language_count; i++) { language_list.add(new
			 * String(request.getParameter("language" + i)));
			 * language_level_list.add(new
			 * Integer(request.getParameter("language_level" + i))); }
			 * 
			 * for (int i = 0; i < language_count; i++) { System.out.println(i +
			 * "language>" + language_list.get(i).toString());
			 * System.out.println(i + "level==>" +
			 * language_level_list.get(i).toString()); }
			 * sb.setLanguage_list(language_list);
			 * sb.setLanguage_level_list(language_level_list);
			 */
		}

		signupBean ui = loginService.updateMember(sb);
		request.setAttribute("code", ui.getCode());

		return "login";
	}

	
	
}
