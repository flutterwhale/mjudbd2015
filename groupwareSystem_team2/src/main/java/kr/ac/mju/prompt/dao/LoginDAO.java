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

	public User login(String userID, String userPW)  {

		// TODO Auto-generated method stub
		System.out.println(" login DAO :" + userID + "  " + userPW);
		
		
		
		User User = new User();
		Statement stmt = null;
		Connection conn = null;
		ResultSet rs = null,rs2 = null;
		ArrayList al = new ArrayList();
		boolean loginsuccess = false;
		try {

			Class.forName("com.mysql.jdbc.Driver");
				conn= DriverManager.getConnection(
					"jdbc:mysql://117.123.66.137:8089/lms", "park",
					"wldnjs7862"); 

			

				stmt = conn.createStatement();
	
			
			String query = "select * from " + "lms.tuser"+ " where userID ='"+ userID+"' ;";
			
			
			rs =  stmt.executeQuery(query);
				
				  
				if (rs.next()) {
					
					//결과 값이 있으면 ID가 존재하는 것.
					
					String rID = rs.getString("userID");
					System.out.println("-> "+ rID+" 아이디가 존재 합니다.");
					query = "select * from " + "lms.tuser"+ " where userID = '"+ rID+"' and userPW = '"+ userPW+"' ;";
					rs2 =  stmt.executeQuery(query);
					 
					
					rs.close();
					if(rs2.next()){
					
					loginsuccess=true;
					al.clear();
					System.out.println( " 두번째 쿼리 결과"+rs2.getString("userID") +" " +rs2.getString("userPW"));
					
					
					al.add(rs2.getString("userID"));
					al.add(rs2.getString("userPW"));
					al.add(rs2.getString("userName"));
					al.add(rs2.getString("userCat"));

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
		

			return User;
		
		}else{
			
			return User;
			
		}

	}
	public User Usersignup(String name, String id, String cat, String pw){
		
		User User = null ;
		System.out.println("회원 가입");
		System.out.println(name+"  id : "+ id + " " +pw + " cat : " +cat);
		Statement stmt = null;
		Connection conn = null;
		ResultSet rs = null;
		int result =0;
		
	
		try {

			Class.forName("com.mysql.jdbc.Driver");
			 conn = DriverManager.getConnection(
					"jdbc:mysql://117.123.66.137:8089/lms", "park",
					"wldnjs7862"); 

			//String query = "select * from " + "lms.tlecture";
			
	
			stmt = conn.createStatement();
			
			String query = "INSERT INTO `lms`.`tuser` (`userID`,  `userPW`,`userName`, `userCat`) VALUES ( '"+id+"','"+pw+"','"+ name+ "','"+ cat+"');";
			
			result =stmt.executeUpdate(query);
			if(result==1){
				
				System.out.println("쿼리 성공");
				User = new User(id,name,pw,cat);
				
			}else{
				User = new User(id,name,pw,cat);
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
		 
		return User;
		
	}

}
