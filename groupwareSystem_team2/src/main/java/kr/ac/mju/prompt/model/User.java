package kr.ac.mju.prompt.model;

public class User {
	private String id;
	private String name;
	private String password;
	private String category;

	public User() {

	}

	public User(String id, String name, String password, String category) {
		this.id = id;
		this.name = name;
		this.password = password;
		this.category = category;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}


}
