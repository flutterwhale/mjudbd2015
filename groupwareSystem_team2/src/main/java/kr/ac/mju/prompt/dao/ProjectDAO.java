package kr.ac.mju.prompt.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.mju.prompt.model.PscheduleBean;
import kr.ac.mju.prompt.model.UscheduleBean;
import kr.ac.mju.prompt.model.UserBean;
import kr.ac.mju.prompt.model.obtainBean;
import kr.ac.mju.prompt.model.projectBean;
import kr.ac.mju.prompt.model.signupBean;
import kr.ac.mju.prompt.model.userProjectBean;

@Repository
public class ProjectDAO {

	@Autowired
	private static final Logger logger = LoggerFactory.getLogger(ProjectDAO.class);

	// 해당 유저 정보 조회 처리
	public signupBean getUserInfo(String id) {
		logger.info("=============해당 유저 정보 조회 처리 =============");
		logger.info("해당 유저 정보 확인하기" + id);
		// PreparedStatement pstmt = null;
		Statement stmt = null;
		Connection conn = null;
		ResultSet rs = null, rs2 = null;

		signupBean member = new signupBean();
		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();

			String query1 = "SELECT * FROM dbd2015.t_user join dbd2015.t_position on t_user.User_Identifier = t_position.User_Identifier  join  dbd2015.t_department on t_department.Department_Identifier = t_position.Department_Identifier  WHERE t_user.User_Identifier = '"
					+ id + "' ;";

			System.out.println("ProjectDAO.getUserInfo : 쿼리1 > " + query1);
			rs = stmt.executeQuery(query1);

			if (rs.first()) {
				member.setIsFreeLancer(rs.getString("cat"));

				member.setId(Integer.parseInt(id));
				member.setName(rs.getString("Name"));
				member.setSsn(rs.getString("SocialSecurtyNum"));
				member.setGender(Integer.parseInt(rs.getString("Gender")));
				member.setPhone(rs.getString("Phone_Number"));
				member.setEmail(rs.getString("Email"));
				member.setPassword(rs.getString("Password"));
				member.setAddr(rs.getString("Address"));
				member.setA_career(rs.getString("Academic_Career"));

				member.setCareer(rs.getString("Career"));
				member.setJoining_Date(rs.getDate("Joining_Date"));
				member.setRetired_Date(rs.getDate("Retired_Date"));
				member.setComment(rs.getString("comment"));
				member.setOffice_Number(rs.getString("office_Number"));
				member.setPortfolio(rs.getString("Career_File"));
				member.setPermission(rs.getInt("Permission"));
				member.setPosition_Name(rs.getInt("Position_Name"));
				member.setDi(rs.getInt("Department_Identifier"));

				member.setTech_level(Integer.parseInt(rs.getString("Technic_Level")));

			}
			String query2 = "SELECT * FROM dbd2015.t_programming_technical_level WHERE User_Identifier = '" + id
					+ "' ;";

			System.out.println("ProjectDAO.getUserInfo : 쿼리2 > " + query2);
			rs2 = stmt.executeQuery(query2);
			ArrayList<String> language_list = new ArrayList<String>();
			ArrayList<Integer> language_level_list = new ArrayList<Integer>();

			while (true) {
				if (rs2.next()) {
					language_list.add(rs2.getString("Language"));
					language_level_list.add(rs2.getInt("Language_Level"));
				} else {
					break;
				}
			}

			member.setLanguage_list(language_list);
			member.setLanguage_level_list(language_level_list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

				if (rs2 != null) {
					rs2.close();
				}

				if (stmt != null) {
					stmt.close();
				}

				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return member;
	}

	// 전체 프로젝트 리스트 조회 처리
	public ArrayList<projectBean> getAllProject() {
		// TODO Auto-generated method stub
		logger.info("=============전체 활성화된 프로젝트 리스트 조회 처리 =============");
		ArrayList<projectBean> allProject = new ArrayList<projectBean>();
		PreparedStatement pstmt = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");

			String query = "SELECT Project_Identifier, Project_Name, Projectmanager_Identifier,Start_Date,End_Date,Project_Description ,Status,Project_Price,t_project.Comment AS pComment,Project_Document, Product ,Project_Evaluation ,Dispatch_Location, t_user.Name AS PMname FROM dbd2015.t_project join dbd2015.t_user on t_user.User_Identifier = t_project.Projectmanager_Identifier where dbd2015.t_project.Status <14;";

			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			logger.info("전체 프로젝트 나열 (현재 날 이후)");

			while (rs.next()) {

				logger.info(rs.getString("project_Name") + " " + rs.getInt("projectmanager_Identifier"));

				projectBean pbean = new projectBean();

				pbean.setProject_Identifier(rs.getInt("project_Identifier"));
				pbean.setProject_Name(rs.getString("project_Name"));
				pbean.setProjectmanager_Identifier(rs.getInt("projectmanager_Identifier"));
				pbean.setPM_name(rs.getString("PMname"));
				pbean.setStart_Date(rs.getDate("start_Date"));
				pbean.setEnd_Date(rs.getDate("end_Date"));
				pbean.setProject_Description(rs.getString("project_Description"));
				pbean.setStatus(rs.getInt("status"));
				pbean.setProject_Price(rs.getInt("project_Price"));
				pbean.setComment(rs.getString("pComment"));
				pbean.setProject_Document(rs.getString("project_Document"));
				pbean.setProject_Evaluation(rs.getString("project_Evaluation"));
				pbean.setDispatch_Location(rs.getString("dispatch_Location"));

				allProject.add(pbean);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

				if (pstmt != null) {
					pstmt.close();
				}

				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return allProject;

	}

	// 과거 프로젝트 리스트 조회 처리
	public ArrayList<projectBean> getPastProject() {
		// TODO Auto-generated method stub
		logger.info("=============과거 프로젝트 리스트 조회 처리 =============");
		ArrayList<projectBean> Past_Project = new ArrayList<projectBean>();
		PreparedStatement pstmt = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");

			String query = "SELECT Project_Identifier, Project_Name, Projectmanager_Identifier,Start_Date,End_Date,Project_Description ,Status,Project_Price,t_project.Comment AS pComment,Project_Document, Product ,Project_Evaluation ,Dispatch_Location, t_user.Name AS PMname FROM dbd2015.t_project join dbd2015.t_user on t_user.User_Identifier = t_project.Projectmanager_Identifier where dbd2015.t_project.Status >=14 ;";

			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			logger.info("과거 프로젝트 나열 (현재 날 이전)");

			while (rs.next()) {

				logger.info(rs.getString("project_Name") + " " + rs.getInt("projectmanager_Identifier"));

				projectBean pbean = new projectBean();

				pbean.setProject_Identifier(rs.getInt("project_Identifier"));
				pbean.setProject_Name(rs.getString("project_Name"));
				pbean.setProjectmanager_Identifier(rs.getInt("projectmanager_Identifier"));
				pbean.setPM_name(rs.getString("PMname"));
				pbean.setStart_Date(rs.getDate("start_Date"));
				pbean.setEnd_Date(rs.getDate("end_Date"));
				pbean.setProject_Description(rs.getString("project_Description"));
				pbean.setStatus(rs.getInt("status"));
				pbean.setProject_Price(rs.getInt("project_Price"));
				pbean.setComment(rs.getString("pComment"));
				pbean.setProject_Document(rs.getString("project_Document"));
				pbean.setDispatch_Location(rs.getString("dispatch_Location"));
				pbean.setProject_Evaluation(rs.getString("project_Evaluation"));

				Past_Project.add(pbean);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

				if (pstmt != null) {
					pstmt.close();
				}

				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return Past_Project;

	}

	// 현재 프로젝트의 모든 일정 조회
	public ArrayList<PscheduleBean> getProjectSchedule(String pid) {
		// TODO Auto-generated method stub
		logger.info("=============현재 프로젝트의 일정 조회 =============");
		ArrayList<PscheduleBean> projectScheduleList = new ArrayList<PscheduleBean>();
		PreparedStatement pstmt = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");

			String query = "SELECT * FROM dbd2015.t_project_schedule where Project_Identifier='" + pid + "';";

			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {

				logger.info("getProjectSchedule ", rs.getInt("Project_Schedule_Identifier"));

				PscheduleBean pbean = new PscheduleBean();

				pbean.setProject_Schedule_Identifier(rs.getInt("Project_Schedule_Identifier"));
				pbean.setProject_Identifier(rs.getInt("project_Identifier"));
				pbean.setSchedule_Name(rs.getString("Schedule_Name"));
				pbean.setContents(rs.getString("Contents"));
				pbean.setProgress_Percentage(rs.getInt("Progress_Percentage"));
				pbean.setStatus_Process(rs.getInt("Status_Process"));
				pbean.setStart_Date(rs.getDate("Start_Date"));
				pbean.setEnd_Date(rs.getDate("End_Date"));
				projectScheduleList.add(pbean);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

				if (pstmt != null) {
					pstmt.close();
				}

				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return projectScheduleList;

	}

	// (김용민 수정)
	// 프로젝트 정보 가져오기
	public projectBean getProject(String projectid) {
		// TODO Auto-generated method stub

		logger.info("=============프로젝트 정보 조회 처리 =============");
		logger.info("getProject : " + projectid);
		// TODO Auto-generated method stub
		projectBean pbean = new projectBean();
		;

		Statement stmt = null;
		Connection conn = null;
		ResultSet rs = null;
		ResultSet rs2 = null;

		try {
			ArrayList role = new ArrayList();

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();

			String query = "SELECT t_role.User_Identifier,t_role.Start_Date,t_role.End_Date,t_user.Name,t_user.Gender,t_user.Phone_Number, t_role.Project_Role FROM dbd2015.t_role join dbd2015.t_user on t_role.User_Identifier = t_user.User_Identifier WHERE Project_Identifier = "
					+ projectid + ";";
			rs2 = stmt.executeQuery(query);

			while (rs2.next()) {
				Hashtable user = new Hashtable();
				user.put("User_Identifier", rs2.getString("User_Identifier"));
				user.put("Name", rs2.getString("Name"));
				user.put("Gender", rs2.getString("Gender"));
				user.put("Start_Date", rs2.getString("Start_Date"));
				user.put("End_Date", rs2.getString("End_Date"));
				user.put("Phone_Number", rs2.getString("Phone_Number"));
				user.put("Project_Role", rs2.getString("Project_Role"));
				role.add(user);
			}

			query = "SELECT Project_Identifier, Project_Name,Evaluation_Score, Projectmanager_Identifier,Start_Date,End_Date,Project_Description ,Status,Project_Price,t_project.Comment AS pComment,Project_Document, Product ,Project_Evaluation ,Dispatch_Location, t_user.Name AS PMname FROM dbd2015.t_project join dbd2015.t_user on t_user.User_Identifier = t_project.Projectmanager_Identifier where Project_Identifier = '"
					+ projectid + "' ;";

			rs = stmt.executeQuery(query);
			if (rs.first()) {

				logger.info(" result  id:  " + projectid + " " + rs.getInt("project_Identifier") + " "
						+ rs.getString("Project_Name"));

				pbean.setProject_Identifier(rs.getInt("project_Identifier"));
				pbean.setProject_Name(rs.getString("project_Name"));
				pbean.setProjectmanager_Identifier(rs.getInt("projectmanager_Identifier"));
				pbean.setPM_name(rs.getString("PMname"));
				pbean.setStart_Date(rs.getDate("start_Date"));
				pbean.setEnd_Date(rs.getDate("end_Date"));
				pbean.setProject_Description(rs.getString("project_Description"));
				pbean.setStatus(rs.getInt("status"));
				pbean.setProject_Price(rs.getInt("project_Price"));
				pbean.setComment(rs.getString("pComment"));
				pbean.setProject_Document(rs.getString("project_Document"));
				pbean.setProject_Evaluation(rs.getString("project_Evaluation"));
				pbean.setEvaluation_Score(rs.getInt("Evaluation_Score"));
				pbean.setDispatch_Location(rs.getString("dispatch_Location"));
				pbean.setRole(role);

			}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (rs2 != null) {
					rs2.close();
				}
				if (stmt != null) {
					stmt.close();
				}

				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return pbean;

	}

	// 프로젝트 일정 등록
	public int insertProjectSchedule(PscheduleBean psb) {
		logger.info("=============프로젝트 일정 등록 =============");
		logger.info("insertProjectSchedule name : " + psb.getSchedule_Name());
		// TODO Auto-generated method stub
		Statement stmt = null;
		Connection conn = null;
		int result = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();

			String query = "INSERT INTO `dbd2015`.`t_project_schedule` "
					+ "(`Project_Identifier`, `Status_Process`, `Schedule_Name`, `Start_Date`, `End_Date`, `Progress_Percentage`, `contents`) "
					+ "VALUES (" + "'" + psb.getProject_Identifier() + "', '" + psb.getStatus_Process() + "', '"
					+ psb.getSchedule_Name() + "', '" + psb.getStart_Date() + "', '" + psb.getEnd_Date() + "', '"
					+ psb.getProgress_Percentage() + "', '" + psb.getContents() + "');";

			System.out.println("insert query? : " + query);
			result = stmt.executeUpdate(query);
			System.out.println("insert result? " + result);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	// 특정 일정 정보 가져오기
	public PscheduleBean showProjectSchedule(String sid) {
		// TODO Auto-generated method stub
		logger.info("=============대상 프로젝트 일정 조회 =============");
		PreparedStatement pstmt = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		PscheduleBean pbean = null;
		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");

			String query = "SELECT * FROM dbd2015.t_project_schedule where Project_Schedule_Identifier='" + sid + "';";

			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);

			if (rs.first()) {
				pbean = new PscheduleBean();
				logger.info("getProjectSchedule " + rs.getInt("Project_Schedule_Identifier") + " sid " + sid);

				pbean.setProject_Schedule_Identifier(rs.getInt("Project_Schedule_Identifier"));
				pbean.setProject_Identifier(rs.getInt("project_Identifier"));
				pbean.setSchedule_Name(rs.getString("Schedule_Name"));
				pbean.setContents(rs.getString("Contents"));
				pbean.setProgress_Percentage(rs.getInt("Progress_Percentage"));
				pbean.setStatus_Process(rs.getInt("Status_Process"));
				pbean.setStart_Date(rs.getDate("Start_Date"));
				pbean.setEnd_Date(rs.getDate("End_Date"));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

				if (pstmt != null) {
					pstmt.close();
				}

				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return pbean;

	}

	// 프로젝트 일정 삭제
	public int deleteProjectSchedule(String sid) {
		// TODO Auto-generated method stub
		logger.info("=============일정 삭제 처리 =============");
		logger.info("deleteProjectSchedule : " + sid);
		Statement stmt = null;
		Connection conn = null;
		int result = 0;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();
			String query = "DELETE FROM `dbd2015`.`t_project_schedule` WHERE `Project_Schedule_Identifier`='" + sid
					+ "';";
			result = stmt.executeUpdate(query);
			System.out.println("query 1 " + query);

			System.out.println("insert result? " + result);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	// 프로젝트 일정 업데이트
	public int updateProjectSchedule(PscheduleBean psbean) {
		logger.info("=============프로젝트 일정 변경 처리 =============");
		logger.info("update query : " + psbean.getProject_Schedule_Identifier());
		// TODO Auto-generated method stub
		Statement stmt = null;
		Connection conn = null;
		int result = 0;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();
			/*
			 * System.out.println( "obean writer " + ob.getWriter_User() +
			 * " stdat" + ob.getStart_Date() + " ed" + ob.getEnd_Date());
			 */
			String query = "UPDATE `dbd2015`.`t_project_schedule` SET `Schedule_Name`='" + psbean.getSchedule_Name()
					+ "', `contents`='" + psbean.getContents() + "', `Status_Process`='" + psbean.getStatus_Process()
					+ "', `End_Date`='" + psbean.getEnd_Date() + "', `Start_Date`='" + psbean.getStart_Date()
					+ "', `Progress_Percentage`='" + psbean.getProgress_Percentage()
					+ "' WHERE `Project_Schedule_Identifier`='" + psbean.getProject_Schedule_Identifier() + "';";

			System.out.println("update query? : " + query);
			result = stmt.executeUpdate(query);
			System.out.println("update result? " + result);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	// 현재 프로젝트의 개인 일정 조회
	public ArrayList<UscheduleBean> getUserScheduleList(String pid) {
		// TODO Auto-generated method stub
		logger.info("=============현재 프로젝트의 개인 일정 조회 =============");
		ArrayList<UscheduleBean> UserScheduleList = new ArrayList<UscheduleBean>();
		PreparedStatement pstmt = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");

			String query = "SELECT * FROM dbd2015.t_user_schedule where Project_Identifier='" + pid + "';";

			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {

				logger.info("getUserSchedule ", rs.getInt("User_Schedule_Identifier"));

				UscheduleBean pbean = new UscheduleBean();

				pbean.setUser_Schedule_Identifier(rs.getInt("User_Schedule_Identifier"));
				pbean.setUser_Identifier(rs.getInt("User_Identifier"));
				pbean.setProject_Identifier(rs.getInt("project_Identifier"));
				pbean.setProject_Role(rs.getInt("Project_Role"));
				pbean.setProgress_Percentage(rs.getInt("progress_Percentage"));
				pbean.setWork_Name(rs.getString("Work_Name"));
				pbean.setWork_descriptions(rs.getString("Work_descriptions"));
				pbean.setProduct(rs.getString("Product"));
				pbean.setStart_Date(rs.getDate("Start_Date"));
				pbean.setEnd_Date(rs.getDate("End_Date"));
				UserScheduleList.add(pbean);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

				if (pstmt != null) {
					pstmt.close();
				}

				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return UserScheduleList;

	}

	// 부서 에 따른 멤버 리스트 확인

	// 해당 부서 직원 리스트 조회 처리 ArrayList<signupBean>
	public ArrayList<signupBean> getDepartUser(String d) {
		// TODO Auto-generated method stub
		logger.info("=============해당 부서 직원 리스트 조회 처리=============");

		logger.info("부서에 따른 멤버 리스트 " + d);
		Statement stmt = null;
		Connection conn = null;
		ResultSet rs = null, rs2 = null;
		ArrayList<signupBean> member_List = new ArrayList<signupBean>();
		String query1 = null;
		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();

			if (!d.equals("10")) {
				query1 = "SELECT * FROM dbd2015.t_user join dbd2015.t_position on t_user.User_Identifier = t_position.User_Identifier  join  dbd2015.t_department on t_department.Department_Identifier = t_position.Department_Identifier  where t_position.Department_Identifier ='"
						+ d + "' order by Position_Name ;";
			} else {
				query1 = "SELECT * FROM dbd2015.t_user join dbd2015.t_position on t_user.User_Identifier = t_position.User_Identifier  join  dbd2015.t_department on t_department.Department_Identifier = t_position.Department_Identifier  where t_position.Position_Name <='13' and  t_position.Position_Name >'0' order by Position_Name ;";
			}
			System.out.println("ProjectDAO.getUserInfo : 쿼리1 > " + query1);
			rs = stmt.executeQuery(query1);

			// System.out.println(" 몇명이냐 ? "+rs.getRow());
			while (rs.next()) {
				signupBean member = new signupBean();
				System.out.println(" id : " + rs.getInt("User_Identifier") + " " + rs.getString("Name"));
				member.setIsFreeLancer(rs.getString("cat"));

				member.setId(rs.getInt("User_Identifier"));
				member.setName(rs.getString("Name"));
				member.setSsn(rs.getString("SocialSecurtyNum"));
				member.setGender(Integer.parseInt(rs.getString("Gender")));
				member.setPhone(rs.getString("Phone_Number"));
				member.setEmail(rs.getString("Email"));
				member.setPassword(rs.getString("Password"));
				member.setAddr(rs.getString("Address"));
				member.setA_career(rs.getString("Academic_Career"));

				member.setCareer(rs.getString("Career"));
				member.setJoining_Date(rs.getDate("Joining_Date"));
				member.setRetired_Date(rs.getDate("Retired_Date"));
				member.setComment(rs.getString("comment"));
				member.setOffice_Number(rs.getString("office_Number"));
				member.setPortfolio(rs.getString("Career_File"));
				member.setPermission(rs.getInt("Permission"));
				member.setPosition_Name(rs.getInt("Position_Name"));
				member.setDi(rs.getInt("Department_Identifier"));

				member.setTech_level(Integer.parseInt(rs.getString("Technic_Level")));

				/*
				 * String query2 =
				 * "SELECT * FROM dbd2015.t_programming_technical_level WHERE User_Identifier = '"
				 * + rs.getInt("User_Identifier") + "' ;";
				 * 
				 * System.out.println("ProjectDAO.getUserInfo : 쿼리2 > " +
				 * query2); rs2 = stmt.executeQuery(query2); ArrayList<String>
				 * language_list = new ArrayList<String>(); ArrayList<Integer>
				 * language_level_list = new ArrayList<Integer>();
				 * 
				 * while (rs2.next()) {
				 * language_list.add(rs2.getString("Language"));
				 * language_level_list.add(rs2.getInt("Language_Level")); }
				 * member.setLanguage_list(language_list);
				 * member.setLanguage_level_list(language_level_list);
				 * 
				 * for(String s : language_list){ System.out.println(" list " +
				 * s); }
				 */

				member_List.add(member);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

				if (rs2 != null) {
					rs2.close();
				}

				if (stmt != null) {
					stmt.close();
				}

				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return member_List;
	}

	// 프로젝트 인력을 추가하기위한 DAO (김용민)
	public ArrayList<signupBean> getRoleDepartUser(String d, String pid) {
		// TODO Auto-generated method stub
		logger.info("=============개발 부서 직원 리스트 조회 처리=============");

		logger.info("프로젝트 인력을 추가하는 사람의 아이디 값 " + d);
		Statement stmt = null;
		Connection conn = null;
		ResultSet rs = null, rs2 = null;
		ArrayList<signupBean> member_List = new ArrayList<signupBean>();
		String query1 = null;
		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();

			query1 = "SELECT User_Identifier FROM dbd2015.t_role WHERE Project_Identifier = " + pid + ";";
			System.out.println("ProjectDAO.getUserInfo : 쿼리1 > " + query1);
			rs2 = stmt.executeQuery(query1);
			String q = "";
			while (rs2.next()) {
				q = q + " and t_user.User_Identifier !=" + rs2.getInt("User_Identifier");
			}

			query1 = "SELECT * FROM dbd2015.t_user join dbd2015.t_position on t_user.User_Identifier = t_position.User_Identifier where (t_position.Department_Identifier =17 or t_position.Department_Identifier =99) and t_user.User_Identifier !="
					+ d + " " + q + "  order by Position_Name ;";
			System.out.println("ProjectDAO.getUserInfo : 쿼리1 > " + query1);
			rs = stmt.executeQuery(query1);

			// System.out.println(" 몇명이냐 ? "+rs.getRow());
			while (rs.next()) {
				signupBean member = new signupBean();
				System.out.println(" id : " + rs.getInt("User_Identifier") + " " + rs.getString("Name"));
				member.setIsFreeLancer(rs.getString("cat"));

				member.setId(rs.getInt("User_Identifier"));
				member.setName(rs.getString("Name"));
				member.setSsn(rs.getString("SocialSecurtyNum"));
				member.setGender(Integer.parseInt(rs.getString("Gender")));
				member.setPhone(rs.getString("Phone_Number"));
				member.setEmail(rs.getString("Email"));
				member.setPassword(rs.getString("Password"));
				member.setAddr(rs.getString("Address"));
				member.setA_career(rs.getString("Academic_Career"));

				member.setCareer(rs.getString("Career"));
				member.setJoining_Date(rs.getDate("Joining_Date"));
				member.setRetired_Date(rs.getDate("Retired_Date"));
				member.setComment(pid);
				member.setOffice_Number(rs.getString("office_Number"));
				member.setPortfolio(rs.getString("Career_File"));
				member.setPermission(rs.getInt("Permission"));
				member.setPosition_Name(rs.getInt("Position_Name"));
				member.setDi(rs.getInt("Department_Identifier"));

				member.setTech_level(Integer.parseInt(rs.getString("Technic_Level")));

				/*
				 * String query2 =
				 * "SELECT * FROM dbd2015.t_programming_technical_level WHERE User_Identifier = '"
				 * + rs.getInt("User_Identifier") + "' ;";
				 * 
				 * System.out.println("ProjectDAO.getUserInfo : 쿼리2 > " +
				 * query2); rs2 = stmt.executeQuery(query2); ArrayList<String>
				 * language_list = new ArrayList<String>(); ArrayList<Integer>
				 * language_level_list = new ArrayList<Integer>();
				 * 
				 * while (rs2.next()) {
				 * language_list.add(rs2.getString("Language"));
				 * language_level_list.add(rs2.getInt("Language_Level")); }
				 * member.setLanguage_list(language_list);
				 * member.setLanguage_level_list(language_level_list);
				 * 
				 * for(String s : language_list){ System.out.println(" list " +
				 * s); }
				 */

				member_List.add(member);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

				if (rs2 != null) {
					rs2.close();
				}

				if (stmt != null) {
					stmt.close();
				}

				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return member_List;
	}

	// 김용민
	public void setProjectRole(String uid, String start, String end, String role, String pid) {
		// TODO Auto-generated method stub
		logger.info("=============프로젝트 롤에 추가 하는 곳=============");
		System.out.println("파라메터 전달" + uid + " " + role + " " + pid + " ");

		Statement stmt = null;
		Connection conn = null;
		ResultSet rs = null, rs2 = null;
		String query1 = null;
		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();

			query1 = "INSERT INTO `dbd2015`.`t_role` (`User_Identifier`, `Project_Role`, `Start_Date`, `End_Date`, `Project_Identifier`) "
					+ "VALUES ('" + uid + "', '" + role + "', '" + start + "', '" + end + "', '" + pid + "');";

			System.out.println("Insert to role : 쿼리1 > " + query1);

			if (stmt.executeUpdate(query1) == 0) {
				System.out.println("롤테이블에 등록 실패");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (rs2 != null) {
					rs2.close();
				}
				if (stmt != null) {
					stmt.close();
				}

				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

	// 김용민
	public void delProjectRole(String uid, String pid) {
		// TODO Auto-generated method stub
		logger.info("=============프로젝트 롤에 추가 하는 곳=============");
		System.out.println("파라메터 전달" + uid + " " + pid + " ");

		Statement stmt = null;
		Connection conn = null;
		ResultSet rs = null, rs2 = null;
		String query1 = null;
		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();

			query1 = "DELETE FROM `dbd2015`.`t_role` WHERE `User_Identifier`='" + uid + "' and`Project_Identifier`='"
					+ pid + "'";

			System.out.println(" 쿼리1 > " + query1);

			if (stmt.executeUpdate(query1) == 0) {
				System.out.println("롤테이블 삭제 실패");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (rs2 != null) {
					rs2.close();
				}
				if (stmt != null) {
					stmt.close();
				}

				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

	// 김용민(평가 해야할 리스트 뿌려주기)
	public ArrayList setProjectEvalList(String Appraiser, String pid) {
		// TODO Auto-generated method stub
		logger.info("=============프로젝트 평가 추가 하는 곳=============");
		System.out.println("파라메터 전달" + pid + " " + Appraiser + " ");
		ArrayList evalRoleData = new ArrayList();

		Statement stmt = null;
		Connection conn = null;
		ResultSet rs = null, rs2 = null;
		String query1 = null;
		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();

			query1 = "SELECT t_role.User_Identifier,t_user.NAME,t_role.Project_Role,t_role.Project_Identifier,t_role.Eval_Check,t_project.Project_Name,t_project.Projectmanager_Identifier FROM dbd2015.t_role Join dbd2015.t_user on t_role.User_Identifier=t_user.User_Identifier Join dbd2015.t_project on t_role.Project_Identifier=t_project.Project_Identifier WHERE t_role.Project_Identifier = "
					+ pid + " and t_role.User_Identifier != " + Appraiser + ";";

			System.out.println("평가테이블에 넣을 기본정보 수신 : 쿼리1 > " + query1);
			rs2 = stmt.executeQuery(query1);

			while (rs2.next()) {
				Hashtable evalUser = new Hashtable();
				evalUser.put("User_Identifier", rs2.getInt("User_Identifier"));
				evalUser.put("NAME", rs2.getString("NAME"));
				evalUser.put("Project_Role", rs2.getInt("Project_Role"));
				evalUser.put("Project_Identifier", rs2.getInt("Project_Identifier"));
				evalUser.put("Project_Name", rs2.getString("Project_Name"));
				evalUser.put("Projectmanager_Identifier", rs2.getString("Projectmanager_Identifier"));
				evalUser.put("Eval_Check", rs2.getString("Eval_Check"));
				evalRoleData.add(evalUser);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (rs2 != null) {
					rs2.close();
				}
				if (stmt != null) {
					stmt.close();
				}

				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return evalRoleData;

	}

	// 김용민(평가 등록하기)
	public void setProjectEval(String Appraiser, String wg, String cg, String tg, String contents, String is_pm,
			String uid, String pid, String role) {
		// TODO Auto-generated method stub
		logger.info("=============프로젝트 평가 추가 하는 곳=============");
		System.out.println("파라메터 전달" + Appraiser + " " + wg + " " + cg + " " + tg + " " + contents + " " + is_pm + " "
				+ uid + " " + pid + " " + role);

		Statement stmt = null;
		Connection conn = null;
		ResultSet rs = null, rs2 = null;
		String query1 = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();

			query1 = "INSERT INTO `dbd2015`.`t_evaluation` (`Appraiser`, `Work_Performance_Grade`, `Communication_Capacity`, `Technic_Grade`, `Evaluation_Contents`, `ISProjectmanager`, `User_Identifier`, `Project_Identifier`, `Project_Role`) "
					+ "VALUES ('" + Appraiser + "', '" + wg + "', '" + cg + "', '" + tg + "', '" + contents + "', '"
					+ is_pm + "','" + uid + "', '" + pid + "', '" + role + "');";
			System.out.println("Insert to role : 쿼리1 > " + query1);
			if (stmt.executeUpdate(query1) == 0) {
				System.out.println("평가테이블에 등록 실패");
			}

			query1 = "UPDATE `dbd2015`.`t_role` SET `Eval_Check`='Y' WHERE `User_Identifier`='" + uid
					+ "' and`Project_Identifier`='" + pid + "';";
			System.out.println("Insert to role : 쿼리1 > " + query1);
			if (stmt.executeUpdate(query1) == 0) {
				System.out.println("평가확인에 등록 실패");
			}

			query1 = "SELECT count(Eval_Check) count FROM dbd2015.t_role WHERE Eval_Check='N' and Project_Identifier='"
					+ pid + "';";
			System.out.println("쿼리1 > " + query1);
			rs = stmt.executeQuery(query1);

			query1 = "SELECT count(Evaluation_Score) count FROM dbd2015.t_project where Evaluation_Score >0 and Project_Identifier = '"
					+ pid + "';";
			System.out.println("쿼리1 > " + query1);
			rs2 = stmt.executeQuery(query1);
			int a =0;
			if(rs2.first()){
				a = rs2.getInt("count");
			}
			query1 = "UPDATE `dbd2015`.`t_project` SET `Status`='" + 15 + "' WHERE `Project_Identifier`='" + pid
					+ "';";
			stmt.executeUpdate(query1);
		/*	if (rs.first()) {
				
				if (rs.getInt("count") == 0 && a > 0) {
					
					System.out.println("평가가 모두 종료되어 프로젝트 역시 종료로 처리하였습니다.");
				}}*/

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (rs2 != null) {
					rs2.close();
				}
				if (stmt != null) {
					stmt.close();
				}

				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}
	// permission 으로 유저 리스트 조회 처리

	// 권한에 따른 멤버 리스트
	public ArrayList<UserBean> showMember_permssion(int p) {
		logger.info("=============권한에 따른 회원 리스트 조회 처리 =============");
		logger.info("권한에 따른 멤버 리스트 확인 " + p);
		Statement stmt = null;
		Connection conn = null;
		ResultSet rs = null, rs2 = null;
		ArrayList<UserBean> member_List = new ArrayList<UserBean>();

		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();

			String query1 = "SELECT * FROM dbd2015.t_user join dbd2015.t_position on t_user.User_Identifier = t_position.User_Identifier WHERE t_position.Permission = '"
					+ p + "' ;";

			System.out.println("loginDAO.showMember : 쿼리 >" + query1);
			rs = stmt.executeQuery(query1);

			while (rs.next()) {
				logger.info(rs.getString("Name") + "/ " + rs.getInt("User_Identifier") + " " + rs.getInt("Permission"));

				UserBean member = new UserBean();
				member.setId(rs.getInt("User_Identifier"));
				member.setName(rs.getString("Name"));
				member.setDi(rs.getInt("Department_Identifier"));
				member.setPermission(rs.getInt("Permission")); // 권한 구분 !!
				member.setPosition_Name(rs.getInt("Position_Name")); // 직급 !!!!

				member_List.add(member);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

				if (rs2 != null) {
					rs2.close();
				}

				if (stmt != null) {
					stmt.close();
				}

				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return member_List;
	}

	// 프로젝트 정보 수정 처리

	// 프로젝트 정보 업데이트
	public int updateProjectInfo(projectBean pBean) {
		logger.info("=============프로젝트 정보 수정 처리 =============");
		logger.info("update query : id " + pBean.getProject_Identifier());
		// TODO Auto-generated method stub
		Statement stmt = null;
		Connection conn = null;
		int result = 0;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();

			String query = "UPDATE `dbd2015`.`t_project` SET  `Comment`='" + pBean.getComment() + "', `Status`='"
					+ pBean.getStatus() + "', `Dispatch_Location`='" + pBean.getDispatch_Location() + "', `End_Date`='"
					+ pBean.getEnd_Date() + "', `Project_Description` ='" + pBean.getProject_Description()
					+ "', `Project_Price` ='" + pBean.getProject_Price() + "' " + " WHERE `Project_Identifier`='"
					+ pBean.getProject_Identifier()

					+ "';";

			System.out.println("update query? : " + query);
			result = stmt.executeUpdate(query);
			System.out.println("update result? " + result);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;

	}

	/*
	 * 수주(제안서) 테이블 관련
	 */

	// 제안서 내용으로 프로젝트 생성하고, 제안서 삭제 처리
	public int intsertProject(String pid, obtainBean oBean) {
		logger.info("=============프로젝트 추가/제안 삭제 처리/role 에 pm 추가 =============");
		logger.info("intsertProject : pid " + pid + " oid " + oBean.getObtain_Order_Identifier());
		int result = 0, result2 = 0, result3 = 0;
		int last = 0;
		Statement stmt = null;
		Connection conn = null;
		ResultSet rs = null;
		// insert query
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();

			String query = "INSERT INTO `dbd2015`.`t_project` (`Project_Name`,  `Start_Date`, `End_Date`, `Status`, `Project_Description` ,`Projectmanager_Identifier`,`Dispatch_Location`) VALUES ('"
					+ oBean.getObtain_Name() + "', '" + oBean.getStart_Date() + "', '" + oBean.getEnd_Date()
					+ "', '10', '" + oBean.getComment() + "' ,'" + pid + "','" + oBean.getLocation() + "');";

			result = stmt.executeUpdate(query);
			System.out.println("query 1 " + query);

			String lastinsert = "SELECT LAST_INSERT_ID();";
			rs = stmt.executeQuery(lastinsert);

			if (rs.first()) {
				last = rs.getInt("LAST_INSERT_ID()");

				System.out.println("last Insert value :" + last);
			}

			String query2 = "INSERT INTO `dbd2015`.`t_role` (`User_Identifier`, `Project_Role`, `Start_Date`, `End_Date`, `Project_Identifier`) VALUES"
					+ " ('" + pid + "', '10', '" + oBean.getStart_Date() + "','" + oBean.getEnd_Date() + "', '" + last
					+ "');";

			System.out.println("query2 " + query2);
			result2 = stmt.executeUpdate(query2);

			String query3 = "DELETE FROM `dbd2015`.`t_obtain_order` WHERE `Obtain_Order_Identifier`='"
					+ oBean.getObtain_Order_Identifier() + "';";
			System.out.println("query 3 " + query3);
			result3 = stmt.executeUpdate(query3);

			System.out.println("insert result? " + result + " / " + result2 + " / " + result3);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	// 제안서 등록

	// 모든 제안서 조회 처리하기
	public ArrayList<obtainBean> getAllObtain() {
		logger.info("=============전체 수주 현황 조회 처리 =============");
		// TODO Auto-generated method stub
		ArrayList<obtainBean> allObatain = new ArrayList<obtainBean>();
		// ArrayList<obtainBean> Past_Obatain = new ArrayList<obtainBean>();
		PreparedStatement pstmt = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park",
					"pjw49064215");

			String query = "SELECT Obtain_Order_Identifier,location, Obtain_Name,Start_Date,End_Date,Present_Status,Order_Company,t_obtain_order.Comment AS oComment,Writer_User, t_user.Name AS writer_name ,pm_id FROM dbd2015.t_obtain_order join dbd2015.t_user on t_user.User_Identifier = dbd2015.t_obtain_order.Writer_User ;";
			conn = connection;

			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {

				logger.info(rs.getString("obtain_Name") + " " + rs.getInt("obtain_Order_Identifier"));

				obtainBean oBean = new obtainBean();

				oBean.setObtain_Order_Identifier(rs.getInt("obtain_Order_Identifier"));
				oBean.setObtain_Name(rs.getString("obtain_Name"));
				oBean.setComment(rs.getString("oComment"));
				oBean.setPresent_Status(rs.getInt("present_Status"));
				oBean.setOrder_Company(rs.getString("order_Company"));
				oBean.setStart_Date(rs.getDate("start_Date"));
				oBean.setEnd_Date(rs.getDate("end_Date"));
				oBean.setWriter_User(rs.getInt("writer_User"));
				oBean.setWriter_name(rs.getString("writer_name"));
				oBean.setPM(rs.getString("pm_id"));
				oBean.setLocation(rs.getString("location"));
				allObatain.add(oBean);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

				if (pstmt != null) {
					pstmt.close();
				}

				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return allObatain;

	}

	// 제안서 세부 정보 조회

	// 제안서 세부 정보 조회 처리
	public obtainBean showObtain(String oid) {
		logger.info("=============제안서 세부 정보 조회 처리 =============");
		logger.info("showObtain : " + oid);
		// TODO Auto-generated method stub
		obtainBean ob = null;

		Statement stmt = null;
		Connection conn = null;
		ResultSet rs = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();
			String query = "SELECT Obtain_Order_Identifier,Obtain_Name,Start_Date,End_Date,Present_Status,Order_Company,t_obtain_order.Comment AS oComment,Writer_User, t_user.Name AS writer_name , pm_id, location FROM dbd2015.t_obtain_order join dbd2015.t_user on t_user.User_Identifier = dbd2015.t_obtain_order.Writer_User where Obtain_Order_Identifier='"
					+ oid + "' ;";

			rs = stmt.executeQuery(query);

			if (rs.first()) {

				int oID = rs.getInt("Obtain_Order_Identifier");
				logger.info(" result  id:  " + oid + " name : " + rs.getString("Obtain_Name") + " location "
						+ rs.getString("location"));

				ob = new obtainBean(oID, rs.getString("Obtain_Name"), rs.getString("oComment"),
						rs.getInt("Present_Status"), rs.getString("Order_Company"), rs.getDate("Start_Date"),
						rs.getDate("End_Date"), rs.getInt("Writer_User"), rs.getString("writer_name"),
						rs.getString("pm_id"), rs.getString("location"));

			}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

				if (stmt != null) {
					stmt.close();
				}

				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return ob;

	}

	// 제안서 추가하기 처리
	public int insertObtain(obtainBean ob) {
		logger.info("=============제안서 등록 처리 =============");
		logger.info("insert ob name : " + ob.getObtain_Name());
		// TODO Auto-generated method stub
		Statement stmt = null;
		Connection conn = null;
		int result = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();

			String query = "INSERT INTO `dbd2015`.`t_obtain_order` (`Obtain_Name`, `Comment`, `Present_Status`, `Order_Company`,`location`, `End_Date`, `Start_Date`, `Writer_User`)"
					+ "VALUES ('" + ob.getObtain_Name() + "', '" + ob.getComment() + "', '" + ob.getPresent_Status()
					+ "', '" + ob.getOrder_Company() + "', '" + ob.getLocation() + "', '" + ob.getEnd_Date() + "', '"
					+ ob.getStart_Date() + "', '" + ob.getWriter_User() + "');";

			System.out.println("insert query? : " + query);
			result = stmt.executeUpdate(query);
			System.out.println("insert result? " + result);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	// 제안서 삭제 처리
	public int deleteObtain(String oid) {
		// TODO Auto-generated method stub
		logger.info("=============제안서 삭제 처리 =============");
		logger.info("deleteObtain : " + oid);
		Statement stmt = null;
		Connection conn = null;
		int result = 0;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();
			String query = "DELETE FROM `dbd2015`.`t_obtain_order` WHERE `Obtain_Order_Identifier`='" + oid + "';";
			result = stmt.executeUpdate(query);
			System.out.println("query 1 " + query);

			System.out.println("insert result? " + result);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	// 제안서 정보 변경 처리
	public int updateObtain(obtainBean ob) {
		logger.info("=============제안서 정보 변경 처리 =============");
		logger.info("update query : " + ob.getObtain_Name() + " id " + ob.getObtain_Order_Identifier());
		// TODO Auto-generated method stub
		Statement stmt = null;
		Connection conn = null;
		int result = 0;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();

			System.out.println(
					"obean writer " + ob.getWriter_User() + " stdat" + ob.getStart_Date() + " ed" + ob.getEnd_Date());

			String query = "UPDATE `dbd2015`.`t_obtain_order` SET `Obtain_Name`='" + ob.getObtain_Name()
					+ "', `Comment`='" + ob.getComment() + "', `Present_Status`='" + ob.getPresent_Status()
					+ "', `location`='" + ob.getLocation() + "', `End_Date`='" + ob.getEnd_Date() + "', `Start_Date`='"
					+ ob.getStart_Date() + "' ,`Order_Company`= '" + ob.getOrder_Company()
					+ "' WHERE `Obtain_Order_Identifier`='" + ob.getObtain_Order_Identifier() + "';";

			System.out.println("update query? : " + query);
			result = stmt.executeUpdate(query);
			System.out.println("update result? " + result);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	public ArrayList<signupBean> getAllMembers() {
		// TODO Auto-generated method stub
		logger.info("=============모든 멤버 출력(가입 대기 제외) =============");
		Statement stmt = null;
		Connection conn = null;
		ResultSet rs = null, rs2 = null;
		ArrayList<signupBean> member_List = new ArrayList<signupBean>();
		String query1 = null;
		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();

			query1 = "SELECT * FROM dbd2015.t_user join dbd2015.t_position on t_user.User_Identifier = t_position.User_Identifier  join  dbd2015.t_department on t_department.Department_Identifier = t_position.Department_Identifier where t_position.Department_Identifier > '0'  ;";

			System.out.println("ProjectDAO.getAllMembers : 쿼리1 > " + query1);
			rs = stmt.executeQuery(query1);

			//
			while (rs.next()) {
				signupBean member = new signupBean();
				member.setIsFreeLancer(rs.getString("cat"));

				member.setId(rs.getInt("User_Identifier"));
				member.setName(rs.getString("Name"));
				member.setSsn(rs.getString("SocialSecurtyNum"));
				member.setGender(Integer.parseInt(rs.getString("Gender")));
				member.setPhone(rs.getString("Phone_Number"));
				member.setEmail(rs.getString("Email"));
				member.setPassword(rs.getString("Password"));
				member.setAddr(rs.getString("Address"));
				member.setA_career(rs.getString("Academic_Career"));

				member.setCareer(rs.getString("Career"));
				member.setJoining_Date(rs.getDate("Joining_Date"));
				member.setRetired_Date(rs.getDate("Retired_Date"));
				member.setComment(rs.getString("comment"));
				member.setOffice_Number(rs.getString("office_Number"));
				member.setPortfolio(rs.getString("Career_File"));
				member.setPermission(rs.getInt("Permission"));
				member.setPosition_Name(rs.getInt("Position_Name"));
				member.setDi(rs.getInt("Department_Identifier"));

				member_List.add(member);
			}
			System.out.println(" 몇명이냐 ? " + member_List.size());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

				if (rs2 != null) {
					rs2.close();
				}

				if (stmt != null) {
					stmt.close();
				}

				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return member_List;
	}

	public int moveDepart(String id, String di, String po, String pe) {
		// TODO Auto-generated method stub
		logger.info("=============부서 정보 변경 처리 =============");
		logger.info("update query : " + id + " 부서 " + di + " 직급 " + po + " 권한 " + pe);
		// TODO Auto-generated method stub
		Statement stmt = null;
		Connection conn = null;
		int result = 0;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();
			String query = null;
			if (pe == null) {

				System.out.println(" permission 없음 ");
				query = "UPDATE `dbd2015`.`t_position` SET `Department_Identifier`='" + di + "', `Position_Name`='" + po
						+ "' WHERE `User_Identifier`='" + id + "';";
			} else {
				query = "UPDATE `dbd2015`.`t_position` SET `Department_Identifier`='" + di + "', `Position_Name`='" + po
						+ "', `Permission`='" + pe + "' WHERE `User_Identifier`='" + id + "';";
			}

			result = stmt.executeUpdate(query);

			String query1 = "UPDATE `dbd2015`.`t_user` SET `Joining_Date`=now() WHERE `User_Identifier`='" + id + "';";
			result = stmt.executeUpdate(query1);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	// 부서 정보를 받아오는 과정
	public HashMap getDepartInfo() {
		logger.info("=============부서 정보 조회 처리 =============");
		// PreparedStatement pstmt = null;
		Statement stmt = null;
		Connection conn = null;
		ResultSet rs = null;
		HashMap hashmap = new HashMap();
		HashMap depart = new HashMap();
		HashMap user = new HashMap();

		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();

			String query1 = "SELECT Hierachical_Identifier,Department_Level,Parent_Department,Department_ID,Department_Name FROM dbd2015.t_department_hierachical "
					+ "h join dbd2015.t_department d on h.Department_ID = d.Department_Identifier";

			System.out.println("ProjectDAO.getUserInfo : 쿼리1 > " + query1);
			rs = stmt.executeQuery(query1);

			while (rs.next()) {
				ArrayList data = new ArrayList();
				data.add(rs.getInt("Parent_Department"));
				data.add(rs.getInt("Department_Level"));
				data.add(rs.getString("Department_Name"));
				data.add(rs.getInt("Department_ID"));
				depart.put(rs.getInt("Hierachical_Identifier"), data);
			}

			query1 = "SELECT t_user.User_Identifier, t_user.NAME ,Department_Identifier FROM dbd2015.t_user join dbd2015.t_position on t_user.User_Identifier = t_position.User_Identifier order by Position_Name;";

			System.out.println("ProjectDAO.getUserInfo : 쿼리1 > " + query1);
			rs = stmt.executeQuery(query1);

			for (int i = 0; rs.next(); i++) {
				ArrayList data = new ArrayList();
				data.add(rs.getInt("User_Identifier"));
				data.add(rs.getString("NAME"));
				data.add(rs.getInt("Department_Identifier"));
				user.put(i, data);
			}

			hashmap.put(0, depart);
			hashmap.put(1, user);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

				if (stmt != null) {
					stmt.close();
				}

				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return hashmap;
	}

	public ArrayList<userProjectBean> getAllMyProject(String id) {
		logger.info("=============getAllMyProject 처리 =============");
		ArrayList<userProjectBean> allProject = new ArrayList<userProjectBean>();
		PreparedStatement pstmt = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			String query = "SELECT Evaluation_Score,Project_Evaluation,t_project.Project_Identifier, t_role.User_Identifier, Project_Name,Project_Role ,Projectmanager_Identifier, t_project.Start_Date as pStart_date ,t_project.End_Date as pEnd_date,t_role.Start_Date as rStart_date ,t_role.End_Date as rEnd_date,Project_Description , Status,Project_Price,t_project.Comment AS pComment,Project_Document, Product ,Project_Evaluation ,Dispatch_Location FROM dbd2015.t_role join dbd2015.t_project on t_role.Project_Identifier = t_project.Project_Identifier where dbd2015.t_project.Status <'14'  and t_role.User_Identifier = '"
					+ id + "';";

			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			System.out.println("내 프로젝트 목록 " + query);
			while (rs.next()) {

				logger.info(rs.getString("Project_Name") + " " + rs.getInt("Projectmanager_Identifier"));

				userProjectBean usbean = new userProjectBean();

				usbean.setEvaluation_Score(rs.getInt("Evaluation_Score"));

				usbean.setProject_Evaluation(rs.getString("Project_Evaluation"));
				usbean.setUser_Identifier(rs.getInt("User_Identifier"));
				usbean.setrStart_Date(rs.getDate("rStart_date"));
				usbean.setrEnd_Date(rs.getDate("rEnd_Date"));

				usbean.setProject_Role(rs.getInt("Project_Role"));

				usbean.setProject_name(rs.getString("Project_Name"));

				usbean.setProject_Identifier(rs.getInt("project_Identifier"));
				usbean.setProjectmanager_Identifier(rs.getInt("Projectmanager_Identifier"));
				usbean.setStart_Date(rs.getDate("pStart_date"));
				usbean.setEnd_Date(rs.getDate("pEnd_date"));
				usbean.setPproject_Description(rs.getString("Project_Description"));
				usbean.setPstatus(rs.getInt("Status"));
				usbean.setPcomment(rs.getString("pComment"));
				usbean.setPdispatch_Location(rs.getString("Dispatch_Location"));

				allProject.add(usbean);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

				if (pstmt != null) {
					pstmt.close();
				}

				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return allProject;

	}

	public ArrayList<userProjectBean> getPastMyProject(String id) {
		logger.info("=============getPastMyProject 처리 =============");
		ArrayList<userProjectBean> Past_Project = new ArrayList<userProjectBean>();
		PreparedStatement pstmt = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");

			String query = "SELECT   Evaluation_Score, Project_Evaluation, t_role.User_Identifier,t_project.Project_Identifier, Project_Name,Project_Role, Projectmanager_Identifier, t_project.Start_Date as pStart_date ,t_project.End_Date as pEnd_date,t_role.Start_Date as rStart_date ,t_role.End_Date as rEnd_date,Project_Description , Status,Project_Price,t_project.Comment AS pComment,Project_Document, Product ,Project_Evaluation ,Dispatch_Location FROM dbd2015.t_role join dbd2015.t_project on t_role.Project_Identifier = t_project.Project_Identifier where dbd2015.t_project.Status >='14'  and t_role.User_Identifier = '"
					+ id + "';";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			logger.info("과거 프로젝트 나열 ");

			while (rs.next()) {

				logger.info(rs.getString("Project_Name") + " " + rs.getInt("Projectmanager_Identifier"));

				userProjectBean usbean = new userProjectBean();

				usbean.setEvaluation_Score(rs.getInt("Evaluation_Score"));

				usbean.setProject_Evaluation(rs.getString("Project_Evaluation"));
				usbean.setUser_Identifier(rs.getInt("User_Identifier"));
				usbean.setrStart_Date(rs.getDate("rStart_date"));
				usbean.setrEnd_Date(rs.getDate("rEnd_Date"));

				usbean.setProject_Role(rs.getInt("Project_Role"));

				usbean.setProject_name(rs.getString("Project_Name"));

				usbean.setProject_Identifier(rs.getInt("project_Identifier"));
				usbean.setProjectmanager_Identifier(rs.getInt("Projectmanager_Identifier"));
				usbean.setStart_Date(rs.getDate("pStart_date"));
				usbean.setEnd_Date(rs.getDate("pEnd_date"));
				usbean.setPproject_Description(rs.getString("Project_Description"));
				usbean.setPstatus(rs.getInt("Status"));
				usbean.setPcomment(rs.getString("pComment"));
				usbean.setPdispatch_Location(rs.getString("Dispatch_Location"));
				Past_Project.add(usbean);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

				if (pstmt != null) {
					pstmt.close();
				}

				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return Past_Project;

	}

	// 경영진 프로젝트 삭제 처리
	public int deleteProject(String pid) {
		// TODO Auto-generated method stub
		logger.info("=============프로젝트 삭제 처리 =============");
		logger.info("deleteObtain : " + pid);
		Statement stmt = null;
		Connection conn = null;
		int result = 0;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();
			String query = "DELETE FROM `dbd2015`.`t_project` WHERE `Project_Identifier`='" + pid + "';";
			result = stmt.executeUpdate(query);
			System.out.println("query 1 " + query);

			System.out.println("insert result? " + result);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	// 김용민 고객평가 추가
	public void setProjectOrderEval(String pid, String Project_Comment, String Score) {
		// TODO Auto-generated method stub
		logger.info("=============프로젝트 고객 평가 추가 하는 곳=============");
		System.out.println("파라메터 전달" + pid);

		Statement stmt = null;
		Connection conn = null;
		ResultSet rs = null, rs2 = null;
		String query1 = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();

			query1 = "UPDATE `dbd2015`.`t_project` SET `Project_Evaluation`='" + Project_Comment
					+ "', `Evaluation_Score`='" + Score + "' WHERE `Project_Identifier`='" + pid + "';";
			System.out.println("UPDATE to role : 쿼리1 > " + query1);
			if (stmt.executeUpdate(query1) == 0) {
				System.out.println("고객평가 실패");
			}

			query1 = "SELECT count(Eval_Check) count FROM dbd2015.t_role WHERE Eval_Check='N' and Project_Identifier='"
					+ pid + "';";
			System.out.println("쿼리1 > " + query1);
			rs = stmt.executeQuery(query1);

			if (rs.first()) {
				if (rs.getInt("count") == 0) {
					query1 = "UPDATE `dbd2015`.`t_project` SET `Status`='" + 15 + "' WHERE `Project_Identifier`='" + pid
							+ "';";
					System.out.println("평가가 모두 종료되어 프로젝트 역시 종료로 처리하였습니다.");
				}
				if (stmt.executeUpdate(query1) == 0) {
					System.out.println("프로젝트 종료 실패");
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (rs2 != null) {
					rs2.close();
				}
				if (stmt != null) {
					stmt.close();
				}

				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

	public int insertUserSchedule(UscheduleBean usB) {
		logger.info("=============개인 일정 등록 =============");
		logger.info("insertProjectSchedule name : " + usB.getWork_Name() + " " + usB.getUser_Identifier());
		// TODO Auto-generated method stub
		Statement stmt = null;
		Connection conn = null;
		int result = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();

			String query = "INSERT INTO `dbd2015`.`t_user_schedule` (`End_Date`, `Work_Name`, `Start_Date`, `User_Identifier`, `Project_Identifier`, `Project_Role`, `Work_descriptions`, `Progress_Percentage`) VALUES ('"
					+ usB.getEnd_Date() + "', '" + usB.getWork_Name() + "', '" + usB.getStart_Date() + "', '"
					+ usB.getUser_Identifier() + "', '" + usB.getProject_Identifier() + "', '" + usB.getProject_Role()
					+ "', '" + usB.getWork_descriptions() + " ', '" + usB.getProgress_Percentage() + "');";

			System.out.println("insert query? : " + query);
			result = stmt.executeUpdate(query);
			System.out.println("insert result? " + result);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	

	public int updateProjectSchedule(UscheduleBean usb) {
			logger.info("=============프로젝트 일정 변경 처리 =============");
			logger.info("update query : " + usb.getUser_Schedule_Identifier());
			// TODO Auto-generated method stub
			Statement stmt = null;
			Connection conn = null;
			int result = 0;

			try {
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
				stmt = conn.createStatement();
				/*
				 * System.out.println( "obean writer " + ob.getWriter_User() +
				 * " stdat" + ob.getStart_Date() + " ed" + ob.getEnd_Date());
				 */
				String query = "UPDATE `dbd2015`.`t_user_schedule` SET `End_Date`='"+usb.getEnd_Date()+"', "
						+ "`Work_Name`='"+usb.getWork_Name()+"', `Start_Date`='" + usb.getStart_Date()+"', `Work_descriptions`='" + usb.getWork_descriptions()+"', `Progress_Percentage`='"+usb.getProgress_Percentage()+"' WHERE `User_Schedule_Identifier`='"+usb.getUser_Schedule_Identifier()+"';"; 
		
				
				System.out.println("update query? : " + query);
				result = stmt.executeUpdate(query);
				System.out.println("update result? " + result);

			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return result;
		}


	public String searchPL(String pid) {
		// SELECT User_Identifier FROM dbd2015.t_project join dbd2015.t_role on
		// t_project.Project_Identifier = t_role.Project_Identifier where
		// t_role.Project_Role ='11' and t_role.Project_Identifier= '"+pid+"' ;

		Statement stmt = null;
		Connection conn = null;
		ResultSet rs = null, rs2 = null;
		String query1 = null;
		String plID = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();
			query1 = "SELECT User_Identifier FROM dbd2015.t_project join dbd2015.t_role on  t_project.Project_Identifier = t_role.Project_Identifier where  t_role.Project_Role ='11' and t_role.Project_Identifier= '"
					+ pid + "';";
			System.out.println("쿼리1 > " + query1);
			rs = stmt.executeQuery(query1);

			if (rs.first()) {
				plID = (rs.getInt("User_Identifier") + "");

			}

			System.out.println("pl id? " + plID);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (rs2 != null) {
					rs2.close();
				}
				if (stmt != null) {
					stmt.close();
				}

				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return plID;
	}

	public UscheduleBean getUserSchedule(String sid) {
		// TODO Auto-generated method stub
		Statement stmt = null;
		Connection conn = null;
		ResultSet rs = null;
		UscheduleBean usBean = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();
			String query = "SELECT * FROM dbd2015.t_user_schedule where User_Schedule_Identifier = '"+sid+"';";

			rs = stmt.executeQuery(query);

			if (rs.first()) {
				usBean = new UscheduleBean();

				usBean.setUser_Schedule_Identifier(Integer.parseInt(sid));
				usBean.setStart_Date(rs.getDate("Start_Date"));
				usBean.setEnd_Date(rs.getDate("End_Date"));
				usBean.setWork_Name(rs.getString("Work_Name"));
				usBean.setWork_descriptions(rs.getString("Work_descriptions"));
				usBean.setProgress_Percentage(rs.getInt("Progress_Percentage"));

				usBean.setProject_Role(rs.getInt("Project_Role"));
				usBean.setUser_Identifier(rs.getInt("user_Identifier"));
				usBean.setProject_Identifier(rs.getInt("Project_Identifier"));
				//usBean.setProduct(rs.getInt("Product"));
				
			}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

				if (stmt != null) {
					stmt.close();
				}

				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return usBean;
	}
	
	public int deleteUserSchedule(String sid) {
		logger.info("=============일정 삭제 처리 =============");
		logger.info("deleteProjectSchedule : " + sid);
		Statement stmt = null;
		Connection conn = null;
		int result = 0;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();
			String query = "DELETE FROM `dbd2015`.`t_user_schedule` WHERE `User_Schedule_Identifier`='" + sid
					+ "';";
			
			//

			result = stmt.executeUpdate(query);
			System.out.println("query 1 " + query);

			System.out.println("insert result? " + result);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
}
