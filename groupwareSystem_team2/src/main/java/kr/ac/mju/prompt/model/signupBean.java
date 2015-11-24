package kr.ac.mju.prompt.model;

import java.util.ArrayList;
import java.util.Map;

public class signupBean {
	private String msg = "";
	private int code;
	// 기본 정보
	private int id;
	private String name;
	private String password;
	private String ssn;
	private String phone;

	private String addr;
	private String email;
	private int gender;

	// 기타정보
	private String a_career;
	private String career;
	private String portfolio;
	// 개발자 정보
	private String isFreeLancer;
	private String language;
	private int language_level;
	private int tech_level;
	private ArrayList language_list;
	private ArrayList language_level_list;
	// 부서 정보
	private int di;
	private int permission;
	private int position_Name;

	public signupBean(String isFreeLancer, String name, String id, String password, String ssn, String phone,
			String addr, String email, String gender, String a_career, String career, String portfolio,  ArrayList language_list,ArrayList language_level_list, String tech_level) {
		
		this.setIsFreeLancer(isFreeLancer);
		this.setName(name);
		this.setId(Integer.parseInt(id));
		this.setPassword(password);
		this.setSsn(ssn);
		this.setPhone(phone);
		this.setAddr(addr);
		this.setGender(Integer.parseInt(gender));
		this.setA_career(a_career);
		this.setEmail(email);
		this.setCareer(career);
		this.setPortfolio(portfolio);
		this.setLanguage_list(language_list);
		this.setLanguage_level_list(language_level_list);
		this.setTech_level(Integer.parseInt(tech_level));
		System.out.println("signupBean(개발자) 생성완료");

	}

	public signupBean(String name,String id, String password, String ssn, String phone, String addr, String email, String gender,
			String a_career, String career, String portfolio) {
		
		this.setName(name);
		this.setId(Integer.parseInt(id));
		this.setPassword(password);
		this.setSsn(ssn);
		this.setPhone(phone);
		this.setAddr(addr);
		this.setGender(Integer.parseInt(gender));
		this.setA_career(a_career);
		this.setEmail(email);
		this.setCareer(career);
		this.setPortfolio(portfolio);
		System.out.println("signupBean(비 개발자) 생성완료");

	}
	

	public signupBean() {
		// TODO Auto-generated constructor stub
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getDi() {
		return di;
	}

	public void setDi(int di) {
		this.di = di;
	}

	public int getPermission() {
		return permission;
	}

	public void setPermission(int permission) {
		this.permission = permission;
	}

	public int getPosition_Name() {
		return position_Name;
	}

	public void setPosition_Name(int position_Name) {
		this.position_Name = position_Name;
	}

	public String getSsn() {
		return ssn;
	}

	public void setSsn(String ssn) {
		this.ssn = ssn;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getA_career() {
		return a_career;
	}

	public void setA_career(String a_career) {
		this.a_career = a_career;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public int getLanguage_level() {
		return language_level;
	}

	public void setLanguage_level(int language_level) {
		this.language_level = language_level;
	}

	public int getTech_level() {
		return tech_level;
	}

	public void setTech_level(int tech_level) {
		this.tech_level = tech_level;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getPortfolio() {
		return portfolio;
	}

	public void setPortfolio(String portfolio) {
		this.portfolio = portfolio;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getIsFreeLancer() {
		return isFreeLancer;
	}

	public void setIsFreeLancer(String isFreeLancer) {
		this.isFreeLancer = isFreeLancer;
	}

	public ArrayList getLanguage_list() {
		return language_list;
	}

	public void setLanguage_list(ArrayList language_list) {
		this.language_list = language_list;
	}

	public ArrayList getLanguage_level_list() {
		return language_level_list;
	}

	public void setLanguage_level_list(ArrayList language_level_list) {
		this.language_level_list = language_level_list;
	}



}
