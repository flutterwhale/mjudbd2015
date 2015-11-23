package kr.ac.mju.prompt.model;

public class signupBean {
	private String msg = ""; 
	private int code;
	private int id;
	private String name;
	private String password;
	private int di;
	private int permission;
	private int position_Name;
	
	public signupBean(){
		
	}
	
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getDi() {
		return di;
	}
	public void setDi(int di) {
		this.di = di;
	}
	public int getPermission() {
		return permission;
	}
	public void setPermission(int permission) {
		this.permission = permission;
	}
	public int getPosition_Name() {
		return position_Name;
	}
	public void setPosition_Name(int position_Name) {
		this.position_Name = position_Name;
	}
	
	
	
}
