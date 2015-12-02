package kr.ac.mju.prompt.model;

import java.sql.Date;

public class UscheduleBean {
	private int User_Schedule_Identifier;
	private int User_Identifier;
	private int Project_Identifier;
	private int Project_Role;
	private String Work_Name;
	private String Work_descriptions;
	private int Progress_Percentage;
	private Date Start_Date;
	private Date End_Date;

	private String Product;

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

	public String getProduct() {
		return Product;
	}

	public void setProduct(String product) {
		Product = product;
	}

	public String getWork_descriptions() {
		return Work_descriptions;
	}

	public void setWork_descriptions(String work_descriptions) {
		Work_descriptions = work_descriptions;
	}

	public int getProgress_Percentage() {
		return Progress_Percentage;
	}

	public void setProgress_Percentage(int progress_Percentage) {
		Progress_Percentage = progress_Percentage;
	}

}
