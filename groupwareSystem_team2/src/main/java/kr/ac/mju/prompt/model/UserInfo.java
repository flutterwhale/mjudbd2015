package kr.ac.mju.prompt.model;

public class UserInfo {

	private UserBean myUser;
	private int Code;
	private String msg;

	public UserInfo() {

	}

	public UserBean getMyUser() {
		return myUser;
	}

	public void setMyUser(UserBean myUser) {
		this.myUser = myUser;
	}

	public int getErrorCode() {
		return Code;
	}

	public void setErrorCode(int errorCode) {
		this.Code = errorCode;
		switch (errorCode) {
		case 0:
			this.msg = "로그인 성공! 환영합니다!";
			break;
		case 99:
			this.msg = "로그인 실패!";
			break;
		case 121:
			this.msg = "PW 불일치!";
			break;
		case 122:
			this.msg = "ID 존재 하지 않음!";
			break;

	
		}
		
		
		
		
	}

	public String getMsg() {

		
		
		
		return msg;
	}


}
