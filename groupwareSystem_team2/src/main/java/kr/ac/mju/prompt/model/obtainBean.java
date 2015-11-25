package kr.ac.mju.prompt.model;

import java.sql.Date;

public class obtainBean {

	private int Obtain_Order_Identifier;
	private String Obtain_Name;
	private String Comment;
	private int Present_Status;
	private String Order_Company;
	private Date Start_Date;
	private Date End_Date;
	private int Writer_User; 
	private String Writer_name;
	
	
	public obtainBean(){
	}
	public int getObtain_Order_Identifier() {
		return Obtain_Order_Identifier;
	}
	public void setObtain_Order_Identifier(int obtain_Order_Identifier) {
		Obtain_Order_Identifier = obtain_Order_Identifier;
	}
	public String getObtain_Name() {
		return Obtain_Name;
	}
	public void setObtain_Name(String obtain_Name) {
		Obtain_Name = obtain_Name;
	}
	public String getComment() {
		return Comment;
	}
	public void setComment(String comment) {
		Comment = comment;
	}
	public int getPresent_Status() {
		return Present_Status;
	}
	public void setPresent_Status(int present_Status) {
		Present_Status = present_Status;
	}
	public String getOrder_Company() {
		return Order_Company;
	}
	public void setOrder_Company(String order_Company) {
		Order_Company = order_Company;
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
	public int getWriter_User() {
		return Writer_User;
	}
	public void setWriter_User(int writer_User) {
		Writer_User = writer_User;
	}
	public String getWriter_name() {
		return Writer_name;
	}
	public void setWriter_name(String writer_name) {
		Writer_name = writer_name;
	}
	
	
	
}
