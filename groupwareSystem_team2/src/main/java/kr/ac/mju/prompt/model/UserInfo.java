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
			this.msg = "�α��� ����! ȯ���մϴ�!";
			break;
		case 99:
			this.msg = "�α��� ����!";
			break;
		case 121:
			this.msg = "PW ����ġ!";
			break;
		case 122:
			this.msg = "ID ���� ���� ����!";
			break;

	
		}
		
		
		
		
	}

	public String getMsg() {

		
		
		
		return msg;
	}


}
