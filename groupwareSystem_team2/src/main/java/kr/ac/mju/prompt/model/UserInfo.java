package kr.ac.mju.prompt.model;

import kr.ac.mju.prompt.model.User;

public class UserInfo {

	private User myUser;
	private int Code;

	public UserInfo() {

	}

	public User getMyUser() {
		return myUser;
	}

	public void setMyUser(User myUser) {
		this.myUser = myUser;
	}


	public int getErrorCode() {
		return Code;
	}

	public void setErrorCode(int errorCode) {
		this.Code = errorCode;
	}

}
