package com.model;

public class UserDTO {
	
	private String id;
	private String pw;
	private String tel;
	private String license;
	
	public UserDTO(String id, String pw, String tel, String license) {
		this.id = id;
		this.pw = pw;
		this.tel = tel;
		this.license = license;
	}
	
	public UserDTO(String id, String pw) {
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
	
	
	
}

