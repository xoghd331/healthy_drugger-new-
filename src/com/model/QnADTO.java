package com.model;

public class QnADTO {
	private int q_num;
	private String q_username;
	private String q_password;
	private String q_title;
	private String q_content;
	private String q_date;
	private int q_view;
	private int q_like;
	private boolean dayNew;
	
	public QnADTO() {
		
	}
	
	public QnADTO(int q_num, String q_username, String q_password, String q_title, String q_content, String q_date, int q_view, int q_like, boolean dayNew) {
		this.q_num = q_num;
		this.q_username = q_username;
		this.q_password = q_password;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_date = q_date;
		this.q_view = q_view;
		this.q_like = q_like;
		this.dayNew = dayNew;
	}
	
	public QnADTO(int q_num, String q_username, String q_password, String q_title, String q_content, String q_date, int q_view, int q_like) {
		this.q_num = q_num;
		this.q_username = q_username;
		this.q_password = q_password;
		this.q_title = q_title;
		this.q_content = q_content;
		this.q_date = q_date;
		this.q_view = q_view;
		this.q_like = q_like;
	}
	
	public QnADTO(int q_num, String q_title, String q_username, String q_date, int q_like, int q_view, boolean dayNew) {
		this.q_num = q_num;
		this.q_title = q_title;
		this.q_username = q_username;
		this.q_date = q_date;
		this.q_like = q_like;
		this.q_view = q_view;
		this.dayNew = dayNew;
	}
	
	public QnADTO(String q_username, String q_password, String q_title,  String q_content) {
		this.q_username = q_username;
		this.q_password = q_password;
		this.q_title = q_title;
		this.q_content = q_content;
	}

	public int getQ_num() {
		return q_num;
	}

	public String getQ_username() {
		return q_username;
	}

	public String getQ_password() {
		return q_password;
	}

	public String getQ_title() {
		return q_title;
	}

	public String getQ_content() {
		return q_content;
	}

	public String getQ_date() {
		return q_date;
	}

	public int getQ_view() {
		return q_view;
	}

	public int getQ_like() {
		return q_like;
	}
	
	public boolean isDayNew() {
		return dayNew;
	}

	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}

	public void setQ_username(String q_username) {
		this.q_username = q_username;
	}

	public void setQ_password(String q_password) {
		this.q_password = q_password;
	}

	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}

	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}

	public void setQ_date(String q_date) {
		this.q_date = q_date;
	}

	public void setQ_view(int q_view) {
		this.q_view = q_view;
	}

	public void setQ_like(int q_like) {
		this.q_like = q_like;
	}

	public void setDayNew(boolean dayNew) {
		this.dayNew = dayNew;
	}
}
