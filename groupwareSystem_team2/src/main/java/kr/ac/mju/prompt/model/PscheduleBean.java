package kr.ac.mju.prompt.model;

import java.sql.Date;

public class PscheduleBean {

	private int Project_Schedule_Identifier;
	private int Project_Identifier;
	private String Schedule_Name;
	private String Contents;
	private int Progress_Percentage;
	private int Status_Process;
	private Date Start_Date;
	private Date End_Date;

	public int getProject_Schedule_Identifier() {
		return Project_Schedule_Identifier;
	}

	public void setProject_Schedule_Identifier(int project_Schedule_Identifier) {
		Project_Schedule_Identifier = project_Schedule_Identifier;
	}

	public int getProject_Identifier() {
		return Project_Identifier;
	}

	public void setProject_Identifier(int project_Identifier) {
		Project_Identifier = project_Identifier;
	}

	public int getProgress_Percentage() {
		return Progress_Percentage;
	}

	public void setProgress_Percentage(int progress_Percentage) {
		Progress_Percentage = progress_Percentage;
	}

	public int getStatus_Process() {
		return Status_Process;
	}

	public void setStatus_Process(int status_Process) {
		Status_Process = status_Process;
	}

	public String getSchedule_Name() {
		return Schedule_Name;
	}

	public void setSchedule_Name(String schedule_Name) {
		Schedule_Name = schedule_Name;
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

	public String getContents() {
		return Contents;
	}

	public void setContents(String contents) {
		Contents = contents;
	}

}
