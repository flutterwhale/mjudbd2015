package kr.ac.mju.prompt.model;

public class User {
	private int id;
	private String name;
	private String password;

	private int Department_Identifier;
	private int Permission;
	private int Position_Name;
	
	public User() {

	}

	public User(int userID, String name, String password, String category) {
		this.id = userID;
		this.name = name;
		this.password = password;
	}
	public User(int userID, String name, String password) {
		this.id = userID;
		this.name = name;
		this.password = password;
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

	public int getDI() {
		return Department_Identifier;
	}

	public void setDI(int department_Identifier) {
		Department_Identifier = department_Identifier;
	}

	public int getPermission() {
		return Permission;
	}

	public void setPermission(int permission) {
		Permission = permission;
	}

	public int getPosition_Name() {
		return Position_Name;
	}

	public void setPosition_Name(int position_Name) {
		Position_Name = position_Name;
	}




}
