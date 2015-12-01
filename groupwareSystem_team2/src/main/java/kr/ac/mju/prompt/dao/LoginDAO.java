package kr.ac.mju.prompt.dao;

import java.sql.Connection;
import java.sql.DriverManager;
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
import kr.ac.mju.prompt.model.signupBean;

@Repository
public class LoginDAO {
	@Autowired
	private static final Logger logger = LoggerFactory.getLogger(LoginDAO.class);

	
	// 로그인 처리
	public UserInfo login(int id, String PW) {
		// TODO Auto-generated method stub
		logger.info("=============로그인 처리=============");
		logger.info(" login DAO :input " + id + " / " + PW);
		UserInfo Uinfo = new UserInfo();
		Statement stmt = null;
		Connection conn = null;
		ResultSet rs = null, rs2 = null;
		boolean loginsuccess = false;
		UserBean user = new UserBean();
		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();

			String query = "SELECT * FROM dbd2015.t_user where User_Identifier ='" + id + "' ;";

			rs = stmt.executeQuery(query);

			if (rs.next()) {

				int rID = rs.getInt("User_Identifier");
				logger.info(rID + " 아이디가 존재 합니다.");
				String query2 = "SELECT * FROM dbd2015.t_user join dbd2015.t_position on t_user.User_Identifier = t_position.User_Identifier  join  dbd2015.t_department on t_department.Department_Identifier = t_position.Department_Identifier  WHERE t_user.User_Identifier = '"
						+ rID + "' and t_user.Password = '" + PW + "' ;";

				logger.info("쿼리 >" + query2);
				rs2 = stmt.executeQuery(query2);

				if (rs2.first()) {

					int gID = rs2.getInt("User_Identifier");
					String gpw = rs2.getString("Password");
					String gname = rs2.getString("Name");
					int gdepart = rs2.getInt("Department_Identifier"); // 부서
																		// code
					int gpermission = rs2.getInt("Permission"); // 권한 구분 !!
					int gposition = rs2.getInt("Position_Name"); // 직급 !!!!
					String cat = rs2.getString("cat");
					logger.info("loginDAO :  두번째 쿼리 결과" + gID + " pw " + gpw + " name " + gname + " permission "
							+ gpermission + " Department code / name " + gdepart + " Position " + gposition);
					loginsuccess = true;

					user.setId(gID);
					user.setPassword(gpw);
					user.setName(gname);
					user.setDi(gdepart);
					user.setPermission(gpermission);
					user.setPosition_Name(gposition);
					user.setCat(cat);

				} else { // pw가 없음.
					logger.info("loginDAO : PW가 일치 하지 않습니다.");
					logger.info("loginDAO : PW불일치로 로그인 실패");
					Uinfo.setErrorCode(121);
					user.setMsg("121");
				}
			} else {// id 가 없음

				loginsuccess = false;
				logger.info("loginDAO : 아이디가 존재하지 않습니다.");
				logger.info("loginDAO : ID 없음으로  로그인 실패");
				Uinfo.setErrorCode(122);
				user.setMsg("122");
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

		if (loginsuccess) {
			logger.info("loginDAO : 로그인 성공 ");
			Uinfo.setMyUser(user);
			Uinfo.setErrorCode(0);
			user.setMsg("0");
			return Uinfo;

		} else {
			logger.info("loginDAO : 로그인 실패 ");

			Uinfo.setMyUser(user);
			// =- Uinfo.setErrorCode(99);//실패 코드
			return Uinfo;
		}
	}

	// 회원 가입 처리
	public UserInfo signup(signupBean sb) {
		logger.info("=============직원 등록 처리=============");
		UserInfo Uinfo = new UserInfo();
		Statement stmt = null;
		Connection conn = null;
		ResultSet rs = null;
		int result, result2 = 0;

		System.out.println("직원 등록. name " + sb.getName() + " IsFreeLancer : " + sb.getIsFreeLancer());

		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();

			System.out.println("프리랜서? " + sb.getIsFreeLancer());

			String query = "INSERT INTO `dbd2015`.`t_user` (`Name`,`User_Identifier`, `SocialSecurtyNum`, `Gender`, `Phone_Number`, `Address`, `Academic_Career`, `Technic_Level`, `Career`, `Email`, `Password`, `cat`) "
					+ "VALUES ('" + sb.getName() + "', '" + sb.getId() + "', '" + sb.getSsn() + "', '" + sb.getGender()
					+ "', '" + sb.getPhone() + "', '" + sb.getAddr() + "', '" + sb.getA_career() + "', '"
					+ sb.getTech_level() + "', '" + sb.getCareer() + "', '" + sb.getEmail() + "', '" + sb.getPassword()
					+ "','" + sb.getIsFreeLancer() + "');";

			System.out.println("insert query? : " + query);
			result = stmt.executeUpdate(query);
			System.out.println("insert result? " + result);
			if (result == 1) {
				System.out.println("insert 2 :" + sb.getIsFreeLancer());
				if (sb.getIsFreeLancer() == null) {
					System.out.println("일반 직원 속성 추가");
					query = "INSERT INTO `dbd2015`.`t_position` (`Department_Identifier`, `User_Identifier`, `Position_Name`) VALUES ('0', '"
							+ sb.getId() + "', '0');";
					result2 = stmt.executeUpdate(query);
					System.out.println("insert result2? " + result2);
				} else if (sb.getIsFreeLancer().equals("common") == true) {
					System.out.println("일반 개발자 속성 추가");

					query = "INSERT INTO `dbd2015`.`t_position` (`Department_Identifier`, `User_Identifier`, `Position_Name`) VALUES ('0', '"
							+ sb.getId() + "', '0');";
					result2 = stmt.executeUpdate(query);
					System.out.println("insert result2? " + result2);
					if (result2 == 1) {
						System.out.println("1차 쿼리 성공");
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

				} else if (sb.getIsFreeLancer().equals("FreeLancer") == true) {

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

	// ID 중복 체크 처리
	public String checkID(String id) {
		logger.info("=============id 중복 확인 처리=============");
		System.out.println("input id :" + id);
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

	// 개인 정보 조회 처리 signupBean
	public signupBean showMember(String id) {
		logger.info("=============개인 정보 조회 처리=============");
		System.out.println(" login DAO.showMember: 개인 정보 확인 id " + id);
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

			System.out.println("loginDAO.showMember : 쿼리 > " + query1);
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
				if (rs.getInt("Permission") >= 11 && rs.getInt("Permission") <= 14) {
					member.setTech_level(Integer.parseInt(rs.getString("Technic_Level")));

					String query2 = "SELECT * FROM dbd2015.t_programming_technical_level WHERE User_Identifier = '" + id
							+ "' ;";

					System.out.println("loginDAO.showMember : 쿼리 > " + query2);
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
		return member;
	}

	
	// 개인 정보 수정 처리
	public signupBean editMember(signupBean sb) {
		logger.info("=============개인 정보 수정 처리=============");
		UserInfo Uinfo = new UserInfo();
		Statement stmt = null;
		Connection conn = null;
		ResultSet rs = null;
		int result, result2 = 0;

		System.out.println("가입. name " + sb.getName() + " IsFreeLancer : " + sb.getIsFreeLancer());

		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();

			System.out.println("프리랜서? " + sb.getIsFreeLancer());

			String query = "UPDATE dbd2015.t_user SET " + "Phone_Number=" + "'" + sb.getPhone() + "'" + ", "
					+ "Address=" + "'" + sb.getAddr() + "'" + ", " + "Academic_Career=" + "'" + sb.getA_career() + "'"
					+ ", " + "Technic_Level=" + "'" + sb.getTech_level() + "'" + ", " + "Career=" + "'" + sb.getCareer()
					+ "'" + ", " + "Career_File=" + "'" + "./none" + "' ," + "Email=" + "'" + sb.getEmail() + "'" + ", "
					+ "Password=" + "'" + sb.getPassword() + "'" + " WHERE `User_Identifier`=" + "'" + sb.getId()
					+ "';";

			System.out.println("insert query? : " + query);

			result = stmt.executeUpdate(query);

			//int depart_id = searchDepart(Integer.toString(sb.getId()));

			/*
			 * if (depart_id == 17 || depart_id == 99) {
			 * 
			 * ArrayList ll = sb.getLanguage_list(); ArrayList lll =
			 * sb.getLanguage_level_list(); for (int i = 0; i <= ll.size(); i++)
			 * { query =
			 * "INSERT INTO dbd2015.t_programming_technical_level (Language, Language_Level, User_Identifier) VALUES ('"
			 * + ll.get(i) + "', '" + lll.get(i) + "', '" + sb.getId() + "');";
			 * 
			 * System.out.println(" 프로그래밍 언어 추가 : " + query); if
			 * (stmt.executeUpdate(query) == 1) { result2 = 0;
			 * System.out.println("언어 추가 실패"); break; }else{ result2 = 1; } }
			 * }else{ result2 = 1; }
			 */
			result2 = 1;
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

	// 언어 삭제 
	public void deleteLanguage(String id) {
		logger.info("=============언어 삭제=============");
		Statement stmt = null;
		Connection conn = null;
		ResultSet rs = null;
		int result = 0;

		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();

			String query = "DELETE * FROM t_programming_technical_level WHERE User_Identifier=" + "'" + id + "';";

			System.out.println("insert query? : " + query);

			result = stmt.executeUpdate(query);

			if (result == 1) {
				System.out.println("delete 쿼리 성공");
			} else {
				System.out.println("쿼리 실패");
			}

			stmt.close();
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
			System.out.println("잘못된 값이 들어 왔습니다.");
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

	}

	// 개인의 부서 정보 조회 처리 
	public int searchDepart(String id) {
		logger.info("=============개인 정보 수정 처리=============");
		int result = 0;
		Statement stmt = null;
		Connection conn = null;
		ResultSet rs = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();
			String query = "SELECT * FROM t_position WHERE User_Identifier='" + id + "';";
			System.out.println("insert query? : " + query);

			rs = stmt.executeQuery(query);

			if (rs.next()) {
				int rID = rs.getInt("Department_Identifier");
				result = rID;
			} else {
				result = 0;
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
}
