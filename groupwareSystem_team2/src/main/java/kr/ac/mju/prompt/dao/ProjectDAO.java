package kr.ac.mju.prompt.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.mju.prompt.model.UserBean;
import kr.ac.mju.prompt.model.UserInfo;
import kr.ac.mju.prompt.model.obtainBean;
import kr.ac.mju.prompt.model.projectBean;
import kr.ac.mju.prompt.model.signupBean;

@Repository
public class ProjectDAO {

	@Autowired
	private static final Logger logger = LoggerFactory.getLogger(ProjectDAO.class);

	public signupBean getUserInfo(String sid) {
		logger.info("DAO : 해당 유저 정보 확인하기"+sid);
		PreparedStatement pstmt = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		signupBean user = new signupBean();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			conn =  DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park",
					"pjw49064215");
			
			
			
			String query = "SELECT * FROM dbd2015.t_user join dbd2015.t_position on t_user.User_Identifier = t_position.User_Identifier WHERE t_user.User_Identifier="+sid+" ;";
			
			while (rs.first()) {

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
				pbean.setProject_Price(rs.getString("project_Price"));
				pbean.setComment(rs.getString("pComment"));
				pbean.setProject_Document(rs.getString("project_Document"));
				pbean.setProject_Evaluation(rs.getInt("project_Evaluation"));
				pbean.setDispatch_Location(rs.getString("dispatch_Location"));


			}
			
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	
		
		return user;
	}
	
	public ArrayList<projectBean> getAllProject() {
		// TODO Auto-generated method stub
		ArrayList<projectBean> allProject = new ArrayList<projectBean>();
		ArrayList<projectBean> Past_Project = new ArrayList<projectBean>();
		PreparedStatement pstmt = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn =  DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park",
					"pjw49064215");

			String query = "SELECT Project_Identifier, Project_Name, Projectmanager_Identifier,Start_Date,End_Date,Project_Description ,Status,Project_Price,t_project.Comment AS pComment,Project_Document, Product ,Project_Evaluation ,Dispatch_Location, t_user.Name AS PMname FROM dbd2015.t_project join dbd2015.t_user on t_user.User_Identifier = t_project.Projectmanager_Identifier ;";
			// pstmt = (PreparedStatement) conn.prepareStatement(query);
			// rs = pstmt.executeQuery();
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
				pbean.setProject_Price(rs.getString("project_Price"));
				pbean.setComment(rs.getString("pComment"));
				pbean.setProject_Document(rs.getString("project_Document"));
				pbean.setProject_Evaluation(rs.getInt("project_Evaluation"));
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

	public ArrayList<obtainBean> getAllObtain() {
		// TODO Auto-generated method stub
		ArrayList<obtainBean> allObatain = new ArrayList<obtainBean>();
		ArrayList<obtainBean> Past_Obatain = new ArrayList<obtainBean>();
		PreparedStatement pstmt = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park",
					"pjw49064215");

			String query = "SELECT Obtain_Order_Identifier, Obtain_Name,Start_Date,End_Date,Present_Status,Order_Company,t_obtain_order.Comment AS oComment,Writer_User, t_user.Name AS writer_name FROM dbd2015.t_obtain_order join dbd2015.t_user on t_user.User_Identifier = dbd2015.t_obtain_order.Writer_User ;";
			conn = connection;

			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			logger.info("전체 수주 현황");

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

	public UserInfo signup(signupBean sb) {

		System.out.println("회원 가입 ");
		UserInfo Uinfo = new UserInfo();
		Statement stmt = null;
		Connection conn = null;
		ResultSet rs = null;
		int result, result2 = 0, result3 = 0;

		System.out.println("가입. name " + sb.getName() + " IsFreeLancer : " + sb.getIsFreeLancer());

		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();

			System.out.println("프리랜서? " + sb.getIsFreeLancer());

			String query = "INSERT INTO `dbd2015`.`t_user` (`Name`,`User_Identifier`, `SocialSecurtyNum`, `Gender`, `Phone_Number`, `Address`, `Academic_Career`, `Technic_Level`, `Career`, `Email`, `Password`) "
					+ "VALUES ('" + sb.getName() + "', '" + sb.getId() + "', '" + sb.getSsn() + "', '" + sb.getGender()
					+ "', '" + sb.getPhone() + "', '" + sb.getAddr() + "', '" + sb.getA_career() + "', '"
					+ sb.getTech_level() + "', '" + sb.getCareer() + "', '" + sb.getEmail() + "', '" + sb.getPassword()
					+ "');";

			System.out.println("insert query? : " + query);
			result = stmt.executeUpdate(query);
			System.out.println("insert result? " + result);
			if (result == 1) {
				System.out.println("insert 2 :" + sb.getIsFreeLancer());
				if (sb.getIsFreeLancer().isEmpty()) {
					System.out.println("일반 직원 속성 추가");
					query = "INSERT INTO `dbd2015`.`t_position` (`Department_Identifier`, `User_Identifier`, `Position_Name`) VALUES ('0', '"
							+ sb.getId() + "', '0');";
					result2 = stmt.executeUpdate(query);
					System.out.println("insert result2? " + result2);
				}
				if (sb.getIsFreeLancer().equals("common") == true) {
					System.out.println("일반 개발자 속성 추가");

					query = "INSERT INTO `dbd2015`.`t_position` (`Department_Identifier`, `User_Identifier`, `Position_Name`) VALUES ('0', '"
							+ sb.getId() + "', '0');";
					result2 = stmt.executeUpdate(query);
					System.out.println("insert result2? " + result2);
					if (result2 == 1) {
						System.out.println("1차 쿼리 성공?");
						ArrayList ll = sb.getLanguage_list();
						ArrayList lll = sb.getLanguage_level_list();
						System.out.println(" ll  size :" + ll.size());
						System.out.println(" lll  size :" + ll.size());
						for (int i = 0; i < ll.size(); i++) {

							System.out.println(" ll  get :" + ll.get(i));
							System.out.println(" lll  get :" + lll.get(i));
							query = "INSERT INTO `dbd2015`.`t_programming_technical_level` (`Language`, `Language_Level`, `User_Identifier`) VALUES ('"
									+ ll.get(i) + "', '" + lll.get(i) + "', '" + sb.getId() + "');";

							System.out.println(" 프로그래밍 언어 추가 : " + query);
							stmt.executeUpdate(query);

						}

					}

				}
				if (sb.getIsFreeLancer().equals("FreeLancer") == true) {

					System.out.println("프리랜서 기본 속성 추가");
					query = "INSERT INTO `dbd2015`.`t_position` (`Department_Identifier`, `User_Identifier`, `Position_Name`) VALUES ('0', '"
							+ sb.getId() + "', '99');";
					result2 = stmt.executeUpdate(query);
					System.out.println("insert result2? " + result2);
					if (result2 == 1) {

						ArrayList ll = sb.getLanguage_list();
						ArrayList lll = sb.getLanguage_level_list();
						for (int i = 0; i < ll.size(); i++) {
							System.out.println(" ll  get" + ll.get(i));
							System.out.println(" lll  get" + lll.get(i));

							query = "INSERT INTO `dbd2015`.`t_programming_technical_level` (`Language`, `Language_Level`, `User_Identifier`) VALUES ('"
									+ ll.get(i) + "', '" + lll.get(i) + "', '" + sb.getId() + "');";

							System.out.println(" 프로그래밍 언어 추가 : " + query);
							stmt.executeUpdate(query);
						}
					}
				}

			}
			if (result == 1 && result2 == 1) {

				System.out.println("insert 쿼리 성공");

				Uinfo.setMySignupBean(sb);
				Uinfo.setErrorCode(222);

			} else {
				System.out.println("쿼리 실패");
				Uinfo.setErrorCode(200);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("잘못된 값이 들어 왔습니다.");
			Uinfo.setErrorCode(201);
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

		return Uinfo;

	}

	public String checkID(String id) {
		System.out.println("id 중복 확인" + id);
		String result = null;
		Statement stmt = null;
		Connection conn = null;
		ResultSet rs = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();
			String query = "SELECT * FROM dbd2015.t_user where User_Identifier ='" + id + "' ;";

			rs = stmt.executeQuery(query);

			if (rs.next()) {

				int rID = rs.getInt("User_Identifier");
				System.out.println("loginDAO.checkID: " + id + " -> " + rID + " 아이디가 존재 합니다.");
				result = "false";
			} else {

				System.out.println("loginDAO.checkID: " + id + " 해당 아이디는 사용 가능합니다.");
				result = "true";
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

		return result;

	}

	public ArrayList<UserBean> showMember_permssion(int p) {

		logger.info("권한에 따른 멤버 리스트 확인 "+p);
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
				logger.info(rs.getString("Name") + "/ "+rs.getInt("User_Identifier")+" " + rs.getInt("Permission"));
				
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

	public signupBean editMember(signupBean sb) {

		System.out.println("개인 정보 수정");
		UserInfo Uinfo = new UserInfo();
		Statement stmt = null;
		Connection conn = null;
		ResultSet rs = null;
		int result, result2 = 0, result3 = 0;

		System.out.println("가입. name " + sb.getName() + " IsFreeLancer : " + sb.getIsFreeLancer());

		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();

			System.out.println("프리랜서? " + sb.getIsFreeLancer());

			String query = "INSERT INTO `dbd2015`.`t_user` (`Name`,`User_Identifier`, `SocialSecurtyNum`, `Gender`, `Phone_Number`, `Address`, `Academic_Career`, `Technic_Level`, `Career`, `Email`, `Password`) "
					+ "VALUES ('" + sb.getName() + "', '" + sb.getId() + "', '" + sb.getSsn() + "', '" + sb.getGender()
					+ "', '" + sb.getPhone() + "', '" + sb.getAddr() + "', '" + sb.getA_career() + "', '"
					+ sb.getTech_level() + "', '" + sb.getCareer() + "', '" + sb.getEmail() + "', '" + sb.getPassword()
					+ "');";

			System.out.println("insert query? : " + query);

			result = stmt.executeUpdate(query);
			if (sb.getIsFreeLancer().isEmpty()) {
				System.out.println("일반 직원 속성 추가");
				query = "INSERT INTO `dbd2015`.`t_position` (`Department_Identifier`, `User_Identifier`, `Position_Name`) VALUES ('0', '"
						+ sb.getId() + "', '0');";
				result2 = stmt.executeUpdate(query);

			} else if (sb.getIsFreeLancer().equals("Common")) {
				System.out.println("일반 개발자 속성 추가");

				query = "INSERT INTO `dbd2015`.`t_position` (`Department_Identifier`, `User_Identifier`, `Position_Name`) VALUES ('0', '"
						+ sb.getId() + "', '0');";
				result2 = stmt.executeUpdate(query);

				if (result2 == 1) {

					ArrayList ll = sb.getLanguage_list();
					ArrayList lll = sb.getLanguage_level_list();
					for (int i = 0; i <= ll.size(); i++) {
						query = "INSERT INTO `dbd2015`.`t_programming_technical_level` (`Language`, `Language_Level`, `User_Identifier`) VALUES ('"
								+ ll.get(i) + "', '" + lll.get(i) + "', '" + sb.getId() + "');";

						System.out.println(" 프로그래밍 언어 추가 : " + query);
						if (stmt.executeUpdate(query) == 1) {
							result2 = 0;
							System.out.println("언어 추가 실패");
							break;
						}
					}
				}

			} else if (sb.getIsFreeLancer().equals("FreeLancer")) {

				System.out.println("프리랜서 기본 속성 추가");
				query = "INSERT INTO `dbd2015`.`t_position` (`Department_Identifier`, `User_Identifier`, `Position_Name`) VALUES ('00', '"
						+ sb.getId() + "', '99');";
				result2 = stmt.executeUpdate(query);

				if (result2 == 1) {

					ArrayList ll = sb.getLanguage_list();
					ArrayList lll = sb.getLanguage_level_list();
					for (int i = 0; i <= ll.size(); i++) {
						query = "INSERT INTO `dbd2015`.`t_programming_technical_level` (`Language`, `Language_Level`, `User_Identifier`) VALUES ('"
								+ ll.get(i) + "', '" + lll.get(i) + "', '" + sb.getId() + "');";

						System.out.println(" 프로그래밍 언어 추가 : " + query);
						if (stmt.executeUpdate(query) == 1) {
							result2 = 0;
							System.out.println("언어 추가 실패");
							break;
						}
					}
				}
			}

			if (result == 1 && result2 == 1) {

				System.out.println("insert 쿼리 성공");

				Uinfo.setMySignupBean(sb);
				Uinfo.setErrorCode(222);

			} else {
				System.out.println("쿼리 실패");
				Uinfo.setErrorCode(200);

			}

			stmt.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
			System.out.println("잘못된 값이 들어 왔습니다.");
			Uinfo.setErrorCode(201);
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

		return sb;
	}
}
