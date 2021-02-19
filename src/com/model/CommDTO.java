package com.model;

public class CommDTO {
	
	private int b_num;
	private int c_num;
	private String c_username;
	private String c_password;
	private String c_content;
	private String c_date;
	private int c_like;
	
	public CommDTO() {
		
	}
	
	public CommDTO(int b_num, int c_num, String c_username, String c_password, String c_content, String c_date, int c_like) {
		this.b_num = b_num;
		this.c_num = c_num;
		this.c_username = c_username;
		this.c_password = c_password;
		this.c_content = c_content;
		this.c_date = c_date;
		this.c_like = c_like;
	}
	
	public CommDTO(int c_num, String c_username, String c_password, String c_content, String c_date, int c_like) {
		this.c_num = c_num;
		this.c_username = c_username;
		this.c_password = c_password;
		this.c_content = c_content;
		this.c_date = c_date;
		this.c_like = c_like;
	}
	
	public CommDTO(int b_num, String c_username, String c_password, String c_content) {
		this.b_num = b_num;
		this.c_username = c_username;
		this.c_password = c_password;
		this.c_content = c_content;
	}
	
	public CommDTO(int b_num, int c_num, String c_username, String c_content, String c_date, int c_like, String c_password) {
		this.b_num = b_num;
		this.c_num = c_num;
		this.c_username = c_username;
		this.c_content = c_content;
		this.c_date = c_date;
		this.c_like = c_like;
		this.c_password = c_password;
	}

	public int getB_num() {
		return b_num;
	}

	public int getC_num() {
		return c_num;
	}

	public String getC_username() {
		return c_username;
	}

	public String getC_password() {
		return c_password;
	}

	public String getC_content() {
		return c_content;
	}

	public String getC_date() {
		return c_date;
	}

	public int getC_like() {
		return c_like;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public void setC_num(int c_num) {
		this.c_num = c_num;
	}

	public void setC_username(String c_username) {
		this.c_username = c_username;
	}

	public void setC_password(String c_password) {
		this.c_password = c_password;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

	public void setC_date(String c_date) {
		this.c_date = c_date;
	}

	public void setC_like(int c_like) {
		this.c_like = c_like;
	}
}
