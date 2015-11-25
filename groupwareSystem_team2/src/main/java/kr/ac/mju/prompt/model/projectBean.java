package kr.ac.mju.prompt.model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Map;

public class projectBean {
	private String msg = "";
	private int code;
	// 기본 정보

	private int Project_Identifier;
	private String project_Name;
	private int Projectmanager_Identifier;
	private String PM_name;
	private Date start_Date;
	private Date end_Date;
	private String project_Description;
	private int status;
	private String project_Price;
	private String comment;
	private String project_Document;
	private String product;
	private int project_Evaluation;
	private String dispatch_Location;

	public projectBean() {
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

	public String getProject_Name() {
		return project_Name;
	}

	public void setProject_Name(String project_Name) {
		this.project_Name = project_Name;
	}

	public int getProjectmanager_Identifier() {
		return Projectmanager_Identifier;
	}

	public void setProjectmanager_Identifier(int projectmanager_Identifier) {
		Projectmanager_Identifier = projectmanager_Identifier;
	}

	public Date getStart_Date() {
		return start_Date;
	}

	public void setStart_Date(Date start_Date) {
		this.start_Date = start_Date;
	}

	public Date getEnd_Date() {
		return end_Date;
	}

	public void setEnd_Date(Date end_Date) {
		this.end_Date = end_Date;
	}

	public String getProject_Description() {
		return project_Description;
	}

	public void setProject_Description(String project_Description) {
		this.project_Description = project_Description;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getProject_Price() {
		return project_Price;
	}

	public void setProject_Price(String project_Price) {
		this.project_Price = project_Price;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getProject_Document() {
		return project_Document;
	}

	public void setProject_Document(String project_Document) {
		this.project_Document = project_Document;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public int getProject_Evaluation() {
		return project_Evaluation;
	}

	public void setProject_Evaluation(int project_Evaluation) {
		this.project_Evaluation = project_Evaluation;
	}

	public String getDispatch_Location() {
		return dispatch_Location;
	}

	public void setDispatch_Location(String dispatch_Location) {
		this.dispatch_Location = dispatch_Location;
	}

	public int getProject_Identifier() {
		return Project_Identifier;
	}

	public void setProject_Identifier(int project_Identifier) {
		Project_Identifier = project_Identifier;
	}

	public String getPM_name() {
		return PM_name;
	}

	public void setPM_name(String pM_name) {
		PM_name = pM_name;
	}

}
