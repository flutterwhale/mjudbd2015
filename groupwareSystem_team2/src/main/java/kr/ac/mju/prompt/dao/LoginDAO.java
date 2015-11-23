package kr.ac.mju.prompt.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import kr.ac.mju.prompt.model.UserBean;
import kr.ac.mju.prompt.model.UserInfo;
import kr.ac.mju.prompt.model.signupBean;

import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO {

	public UserInfo login(int id, String PW) {
		// TODO Auto-generated method stub
		System.out.println(" login DAO :input " + id + " / " + PW);
		UserInfo Uinfo = new UserInfo();
		Statement stmt = null;
		Connection conn = null;
		ResultSet rs = null, rs2 = null;
		ArrayList al = new ArrayList();
		boolean loginsuccess = false;
		
		UserBean b =new UserBean();
		
		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");
			stmt = conn.createStatement();

			String query = "SELECT * FROM dbd2015.t_user where User_Identifier ='" + id + "' ;";

			rs = stmt.executeQuery(query);

			if (rs.next()) {

				int rID = rs.getInt("User_Identifier");
				System.out.println("loginDAO : -> " + rID + " 아이디가 존재 합니다.");
				String query2 = "SELECT * FROM dbd2015.t_user join dbd2015.t_position on t_user.User_Identifier = t_position.User_Identifier  join  dbd2015.t_department on t_department.Department_Identifier = t_position.Department_Identifier  WHERE t_user.User_Identifier = '"+ rID + "' and t_user.Password = '" + PW + "' ;";
				
				
				//SELECT * FROM dbd2015.t_user join dbd2015.t_position on t_user.User_Identifier = t_position.User_Identifier  join  dbd2015.t_department on t_department.Department_Identifier = t_position.Department_Identifier  where t_user.User_Identifier='60102339' and t_user.Password = '1234';
				
				System.out.println("loginDAO : 쿼리 >" + query2);
				rs2 = stmt.executeQuery(query2);

				if (rs2.first()) {

					int gID = rs2.getInt("User_Identifier");
					String gpw = rs2.getString("Password");
					String gname = rs2.getString("Name");
					int gdepart = rs2.getInt("Department_Identifier"); // 부서  code
					int gpermission = rs2.getInt("Permission") ; // 권한 구분 !!
					int gposition = rs2.getInt("Position_Name") ; // 직급 !!!!
					System.out.println("loginDAO :  두번째 쿼리 결과" + gID + " pw " + gpw + " name " + gname + " permission "+gpermission+" Department code / name " + gdepart + " Position "+ gposition   );
					loginsuccess = true;
					
					
					al.clear();
					al.add(rs2.getInt("User_Identifier"));
					b.setId(gID);
					al.add(rs2.getString("Password"));
					b.setPassword(gpw);
					al.add(rs2.getString("Name"));
					b.setName(gname);
					al.add(rs2.getInt("Department_Identifier"));
					b.setDi(gdepart);
					al.add(rs2.getInt("Permission"));
					b.setPermission(gpermission);
					al.add(rs2.getInt("Position_Name"));
					b.setPosition_Name(gposition);
					
					
					rs2.close();
				} else { // pw가 없음.
					System.out.println("loginDAO : PW가 일치 하지 않습니다.");
					System.out.println("loginDAO : PW불일치로 로그인 실패");
					Uinfo.setErrorCode(121);
					b.setMsg("121");
					rs2.close();
				}
				rs.close();
				stmt.close();
				conn.close();
			} else {// id 가 없음

				loginsuccess = false;
				System.out.println("loginDAO : 아이디가 존재하지 않습니다.");
				System.out.println("loginDAO : ID 없음으로  로그인 실패");
				Uinfo.setErrorCode(122);
				b.setMsg("122");
				rs.close();
				stmt.close();
				conn.close();
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
		UserBean user = new UserBean();

		if (loginsuccess) {

			user.setId((Integer) al.get(0));
			user.setPassword(al.get(1).toString());
			user.setName(al.get(2).toString());
			user.setDi((Integer)al.get(3));
			user.setPermission((Integer)al.get(4));
			user.setPosition_Name((Integer)al.get(5));


			System.out.println("loginDAO : 로그인 성공 ");
			Uinfo.setMyUser(user);
			Uinfo.setErrorCode(0);
			b.setMsg("0");
			return Uinfo;

		} else {
			System.out.println("loginDAO : 로그인 실패 ");

			Uinfo.setMyUser(user);
			//Uinfo.setErrorCode(99);//실패 코드 
			return Uinfo;

		}

	}

	public UserInfo signup(signupBean sb) {

		System.out.println("회원 가입 ");
		UserInfo Uinfo = new UserInfo();
		Statement stmt = null;
		Connection conn = null;
		ResultSet rs = null;
		int result = 0;

		
		System.out.println();
		
		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://117.123.66.137:8089/dbd2015", "park", "pjw49064215");

			// String query = "select * from " + "lms.tlecture";

			stmt = conn.createStatement();

//			String query = "INSERT INTO `dbd2015`.`t_user` (`User_Identifier`,`Password`,`Name`) VALUES ( '" + id
//					+ "','" + pw + "','" + name + "','" +  "');";
//
//			result = stmt.executeUpdate(query);


			if (result == 1) {

				System.out.println("쿼리 성공");
				//UserBean myUser = new UserBean(id, name, pw);
			//	Uinfo.setMyUser(myUser);
				Uinfo.setErrorCode(222);

			} else {
				System.out.println("쿼리 실패");
				//UserBean myUser = new UserBean(id, name, pw);
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

		return Uinfo;

	}

}
