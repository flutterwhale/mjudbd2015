package kr.ac.mju.prompt.model;

public class UserBean {
	private String msg = "";
	private int code;
	private int id;
	private String name;
	private String password;
	private int di;
	private int permission;
	private int position_Name;
	private String cat;

	public UserBean() {

	} // 생성자. 파라미터 없음.

	public UserBean(int id, String name, String pw) {
		// TODO Auto-generated constructor stub
		this.id = id;
		this.name = name;
		this.password = pw;

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

	public String getCat() {
		return cat;
	}

	public void setCat(String cat) {
		this.cat = cat;
	}

}
