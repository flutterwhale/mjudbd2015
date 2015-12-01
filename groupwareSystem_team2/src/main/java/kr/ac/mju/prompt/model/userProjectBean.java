package kr.ac.mju.prompt.model;

import java.sql.Date;

public class userProjectBean {
	private int User_Schedule_Identifier;
	private int User_Identifier;
	private int Project_Identifier;
	
	private int Projectmanager_Identifier;
	private int Project_Role;
	private String Work_Name;
	private String Product;
	private Date rStart_Date;
	private Date rEnd_Date;

	private Date Start_Date;
	private Date End_Date;

	private String project_name;
	private String Pproject_Description;
	private int Pstatus;
	private String Pcomment;
	private String Pdispatch_Location;

	public int getUser_Schedule_Identifier() {
		return User_Schedule_Identifier;
	}

	public void setUser_Schedule_Identifier(int user_Schedule_Identifier) {
		User_Schedule_Identifier = user_Schedule_Identifier;
	}

	public int getUser_Identifier() {
		return User_Identifier;
	}

	public void setUser_Identifier(int user_Identifier) {
		User_Identifier = user_Identifier;
	}

	public int getProject_Identifier() {
		return Project_Identifier;
	}

	public void setProject_Identifier(int project_Identifier) {
		Project_Identifier = project_Identifier;
	}

	public int getProject_Role() {
		return Project_Role;
	}

	public void setProject_Role(int project_Role) {
		Project_Role = project_Role;
	}

	public String getWork_Name() {
		return Work_Name;
	}

	public void setWork_Name(String work_Name) {
		Work_Name = work_Name;
	}

	public String getProduct() {
		return Product;
	}

	public void setProduct(String product) {
		Product = product;
	}

	public Date getrStart_Date() {
		return rStart_Date;
	}

	public void setrStart_Date(Date rStart_Date) {
		this.rStart_Date = rStart_Date;
	}

	public Date getrEnd_Date() {
		return rEnd_Date;
	}

	public void setrEnd_Date(Date rEnd_Date) {
		this.rEnd_Date = rEnd_Date;
	}

	public Date getStart_Date() {
		return Start_Date;
	}

	public void setStart_Date(Date start_Date) {
		Start_Date = start_Date;
	}

	public Date getEnd_Date() {
		return End_Date;
	}

	public void setEnd_Date(Date end_Date) {
		End_Date = end_Date;
	}

	public String getPproject_Description() {
		return Pproject_Description;
	}

	public void setPproject_Description(String pproject_Description) {
		Pproject_Description = pproject_Description;
	}

	public int getPstatus() {
		return Pstatus;
	}

	public void setPstatus(int pstatus) {
		Pstatus = pstatus;
	}

	public String getPcomment() {
		return Pcomment;
	}

	public void setPcomment(String pcomment) {
		Pcomment = pcomment;
	}

	public String getPdispatch_Location() {
		return Pdispatch_Location;
	}

	public void setPdispatch_Location(String pdispatch_Location) {
		Pdispatch_Location = pdispatch_Location;
	}

	public int getProjectmanager_Identifier() {
		return Projectmanager_Identifier;
	}

	public void setProjectmanager_Identifier(int projectmanager_Identifier) {
		Projectmanager_Identifier = projectmanager_Identifier;
	}

	public String getProject_name() {
		return project_name;
	}

	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}

}
