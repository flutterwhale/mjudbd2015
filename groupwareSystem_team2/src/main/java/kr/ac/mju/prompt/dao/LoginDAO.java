package kr.ac.mju.prompt.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import kr.ac.mju.prompt.model.User;

import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO {

	public User login(String ID, String PW)  {

		// TODO Auto-generated method stub
		System.out.println(" login DAO :" + ID + "  " + PW);
		
		Statement stmt = null;
		Connection conn = null;
		ResultSet rs = null,rs2 = null;
		ArrayList al = new ArrayList();
		boolean loginsuccess = false;
		try {

			Class.forName("com.mysql.jdbc.Driver");
				conn= DriverManager.getConnection(
					"jdbc:mysql://117.123.66.137:8089/dbd2015", "park",
					"pjw49064215"); 

			

				stmt = conn.createStatement();
	
			
			String query = "SELECT * FROM dbd2015.t_user where User_Identifier ='"+ ID+"' ;";
			
			
			rs =  stmt.executeQuery(query);
				
				  
				if (rs.next()) {
					
					//결과 값이 있으면 ID가 존재하는 것.
					
					String rID = rs.getString("User_Identifier");
					System.out.println("-> "+ rID+" 아이디가 존재 합니다.");
					query = "select * from " + "dbd2015.t_user"+ " where User_Identifier = '"+ rID+"' and Password = '"+ PW+"' ;";
					rs2 =  stmt.executeQuery(query);
					 
					
					rs.close();
					if(rs2.next()){
					
					loginsuccess=true;
					al.clear();
					System.out.println( " 두번째 쿼리 결과"+rs2.getString("User_Identifier") +" " +rs2.getString("Password"));
					
					
					al.add(rs2.getString("User_Identifier"));
					al.add(rs2.getString("Password"));
					al.add(rs2.getString("Name"));

					rs2.close();
					}else{
						//pw가 없음.
						System.out.println("PW가 일치 하지 않습니다.");
						
						System.out.println("로그인 실패");
						rs2.close();
					}
					
					stmt.close();
					conn.close();
				} else {// Id가 없음.

					
					
					
				loginsuccess = false;
				System.out.println("아이디가 존재하지 않습니다.");
				System.out.println("로그인 실패");
				rs.close();
				stmt.close();
				conn.close();
				
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				
				if(rs2 != null){
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

		
		if(loginsuccess){
		User user = new User();

		user.setId(al.get(0).toString());
		user.setPassword(al.get(1).toString());
		user.setName(al.get(2).toString());
		
		if(al.get(3).equals("S")){
			user.setCategory("학생");
			
		}else if(al.get(3).equals("A")){
			user.setCategory("관리자");
		}else if (al.get(3).equals("T")){
			user.setCategory("교수");
		}
		

			return user;
		
		}else{
			
			User user = new User();
			return user;
			
		}

	}
	public User signup(String name, String id, String cat, String pw){
		
		System.out.println("회원 가입");
		System.out.println(name+"  id : "+ id + " " +pw + " cat : " +cat);
		Statement stmt = null;
		Connection conn = null;
		ResultSet rs = null;
		int result =0;
		
		User myUser = new User(id,name,pw,cat);
		try {

			Class.forName("com.mysql.jdbc.Driver");
			 conn = DriverManager.getConnection(
					"jdbc:mysql://117.123.66.137:8089/dbd2015", "park",
					"pjw49064215"); 

			//String query = "select * from " + "lms.tlecture";
			
	
			stmt = conn.createStatement();
			
			String query = "INSERT INTO `dbd2015`.`t_user` (`User_Identifier`,  `Password`,`Name`) VALUES ( '"+id+"','"+pw+"','"+ name+ "','"+ cat+"');";
			
			result =stmt.executeUpdate(query);
			if(result==1){
				
				System.out.println("쿼리 성공");
				
				
			}else{
				System.out.println("쿼리 실패");
			}
			 
				
			
			
				stmt.close();
				conn.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
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
		 
		
		return myUser;
		
	}

}
