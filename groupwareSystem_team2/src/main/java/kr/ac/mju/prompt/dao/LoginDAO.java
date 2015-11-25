package kr.ac.mju.prompt.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import kr.ac.mju.prompt.model.UserBean;
import kr.ac.mju.prompt.model.UserInfo;
import kr.ac.mju.prompt.model.signupBean;

@Repository
public class LoginDAO {

	public UserInfo login(int id, String PW) {
		// TODO Auto-generated method stub
		System.out.println(" login DAO :input " + id + " / " + PW);
		UserInfo Uinfo = new UserInfo();
		Statement stmt = null;
		Connection conn = null;
		ResultSet rs = null, rs2 = null;
		boolean loginsuccess = false;
		UserBean user = new UserBean();
		//UserBean b = new UserBean();

		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();

			String query = "SELECT * FROM dbd2015.t_user where User_Identifier ='" + id + "' ;";
			
			rs = stmt.executeQuery(query);

			if (rs.next()) {

				int rID = rs.getInt("User_Identifier");
				System.out.println("loginDAO.login: -> " + rID + " 아이디가 존재 합니다.");
				String query2 = "SELECT * FROM dbd2015.t_user join dbd2015.t_position on t_user.User_Identifier = t_position.User_Identifier  join  dbd2015.t_department on t_department.Department_Identifier = t_position.Department_Identifier  WHERE t_user.User_Identifier = '"
						+ rID + "' and t_user.Password = '" + PW + "' ;";

				System.out.println("loginDAO : 쿼리 >" + query2);
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
					System.out.println("loginDAO :  두번째 쿼리 결과" + gID + " pw " + gpw + " name " + gname + " permission "
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
					System.out.println("loginDAO : PW가 일치 하지 않습니다.");
					System.out.println("loginDAO : PW불일치로 로그인 실패");
					Uinfo.setErrorCode(121);
					user.setMsg("121");
				}
			} else {// id 가 없음

				loginsuccess = false;
				System.out.println("loginDAO : 아이디가 존재하지 않습니다.");
				System.out.println("loginDAO : ID 없음으로  로그인 실패");
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

			

			System.out.println("loginDAO : 로그인 성공 ");
			Uinfo.setMyUser(user);
			Uinfo.setErrorCode(0);
			user.setMsg("0");
			return Uinfo;

		} else {
			System.out.println("loginDAO : 로그인 실패 ");

			Uinfo.setMyUser(user);
			// Uinfo.setErrorCode(99);//실패 코드
			return Uinfo;

		}

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

			String query = "INSERT INTO `dbd2015`.`t_user` (`Name`,`User_Identifier`, `SocialSecurtyNum`, `Gender`, `Phone_Number`, `Address`, `Academic_Career`, `Technic_Level`, `Career`, `Email`, `Password`, `cat`) "
					+ "VALUES ('" + sb.getName() + "', '" + sb.getId() + "', '" + sb.getSsn() + "', '" + sb.getGender()
					+ "', '" + sb.getPhone() + "', '" + sb.getAddr() + "', '" + sb.getA_career() + "', '"
					+ sb.getTech_level() + "', '" + sb.getCareer() + "', '" + sb.getEmail() + "', '" + sb.getPassword()+"','"+ sb.getIsFreeLancer()
					+ "');";

			System.out.println("insert query? : " + query);
			result = stmt.executeUpdate(query);
			System.out.println("insert result? " + result);
			if (result == 1) {
				System.out.println("insert 2 :" + sb.getIsFreeLancer());
				if (sb.getIsFreeLancer()==null) {
					System.out.println("일반 직원 속성 추가");
					query = "INSERT INTO `dbd2015`.`t_position` (`Department_Identifier`, `User_Identifier`, `Position_Name`) VALUES ('0', '"
							+ sb.getId() + "', '0');";
					result2 = stmt.executeUpdate(query);
					System.out.println("insert result2? " + result2);
				}else if (sb.getIsFreeLancer().equals("common") == true) {
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

				}else 	if (sb.getIsFreeLancer().equals("FreeLancer") == true) {

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

	public signupBean showMember(String id, UserInfo userInfo) {

		System.out.println(" login DAO.showMember: 개인 정보 확인 id " + id + ":  cat :" + userInfo.getMyUser().getCat());
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

				member.setTech_level(Integer.parseInt(rs.getString("Technic_Level")));
				// 별도 쿼리 필요
				// member.setLanguage_list(language_list);
				// member.setLanguage_level_list(language_level_list);

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

	public ArrayList<signupBean> getDepartUser(String di) {
		// TODO Auto-generated method stub
		/* 해당 부서 직원 리스트 */
		ArrayList<signupBean> sb_list = new ArrayList<signupBean>();
		PreparedStatement pstmt = null;
		Connection conn = null;
		ResultSet rs = null;

		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park",
					"pjw49064215");

			String query = "SELECT LectureID,LectureName,Hackjeom,currentNum,LimitNum, semester FROM lms.tlecture WHERE LteacherID=?;";
			conn = connection;
			pstmt = (PreparedStatement) conn.prepareStatement(query);

			pstmt.setString(1, di);
			rs = pstmt.executeQuery();

			System.out.println("부서 아이디 " + di);
			sb_list.clear();

			while (rs.next()) {

				System.out.println(rs.getString("LectureName") + " " + rs.getString("LectureID"));
				signupBean sb = new signupBean();
				/*
				 * lecture.setLectureID(rs.getInt("LectureID"));
				 * lecture.setLectureName(rs.getString("LectureName"));
				 * lecture.setSemester(rs.getString("semester"));
				 * lecture.setHackjeom(rs.getInt("Hackjeom"));
				 * lecture.setCurNum(rs.getInt("currentNum"));
				 * lecture.setLimitNum(rs.getInt("LimitNum"));
				 */

				sb_list.add(sb);

			}

			rs.close();
			pstmt.close();
			conn.close();

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

		return sb_list;

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
