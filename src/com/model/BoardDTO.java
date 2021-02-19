package com.model;

public class BoardDTO {
	private int b_num;
	private String b_username;
	private String b_password;
	private String b_title;
	private String b_content;
	private String b_date;
	private int b_like;
	private int b_view;
	private boolean dayNew;
	
	public BoardDTO() {
		
	}
	
	public BoardDTO(int b_num, String b_username, String b_password, String b_title, String b_content, String b_date, int b_like, int b_view, boolean dayNew) {
		this.b_num = b_num;
		this.b_username = b_username;
		this.b_password = b_password;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_date = b_date;
		this.b_like = b_like;
		this.b_view = b_view;
		this.dayNew = dayNew;
	}
	
	public BoardDTO(String b_username, String b_password, String b_title, String b_content) {
		this.b_username = b_username;
		this.b_password = b_password;
		this.b_title = b_title;
		this.b_content = b_content;
	}
	
	public BoardDTO(String b_password, String b_title, String b_content) {
		this.b_password = b_password;
		this.b_title = b_title;
		this.b_content = b_content;
	}
	
	public BoardDTO(int b_num, String b_title, String b_username, String b_date, int b_like, int b_view, boolean dayNew) {
		this.b_num = b_num;
		this.b_title = b_title;
		this.b_username = b_username;
		this.b_date = b_date;
		this.b_like = b_like;
		this.b_view = b_view;
		this.dayNew = dayNew;
	}
	
	public int getB_num() {
		return b_num;
	}
	
	public String getB_username() {
		return b_username;
	}
	
	public String getB_password() {
		return b_password;
	}
	
	public String getB_title() {
		return b_title;
	}
	
	public String getB_content() {
		return b_content;
	}
	
	public String getB_date() {
		return b_date;
	}
	
	public int getB_like() {
		return b_like;
	}
	
	public int getB_view() {
		return b_view;
	}

	public boolean isDayNew() {
		return dayNew;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	
	public void setB_username(String b_username) {
		this.b_username = b_username;
	}
	
	public void setB_password(String b_password) {
		this.b_password = b_password;
	}
	
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
	
	public void setB_like(int b_like) {
		this.b_like = b_like;
	}
	
	public void setB_view(int b_view) {
		this.b_view = b_view;
	}

	public void setDayNew(boolean dayNew) {
		this.dayNew = dayNew;
	}

}
