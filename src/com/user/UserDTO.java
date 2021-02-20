package com.user;

public class UserDTO {
	
	private String id;
	private String pw;
	private String tel;
	private String license;
	private String name;
	
	public UserDTO(String id, String pw, String tel, String license, String name) {
		super();
		this.id = id;
		this.pw = pw;
		this.tel = tel;
		this.license = license;
		this.name = name;
	}

	public UserDTO(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}

	public String getId() {
		return id;
	}

	public String getPw() {
		return pw;
	}

	public String getTel() {
		return tel;
	}

	public String getLicense() {
		return license;
	}

	public String getName() {
		return name;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	public void setName(String name) {
		this.name = name;
	}
}

