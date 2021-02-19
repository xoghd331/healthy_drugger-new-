package com.model;

public class reQnADTO {
	
	private int q_num;
	private int rq_num;
	private String rq_username;
	private String rq_password;
	private String rq_title;
	private String rq_content;
	private String rq_date;
	private int rq_like;
	
	public reQnADTO() {
		
	}

	public reQnADTO(int q_num, int rq_num, String rq_username, String rq_password, String rq_title, String rq_content, String rq_date, int rq_like) {
		this.q_num = q_num;
		this.rq_num = rq_num;
		this.rq_username = rq_username;
		this.rq_password = rq_password;
		this.rq_title = rq_title;
		this.rq_content = rq_content;
		this.rq_date = rq_date;
		this.rq_like = rq_like;
	}
	
	public reQnADTO(int rq_num, String rq_title, String rq_username, String rq_content, String rq_date, int rq_like) {
		this.rq_num = rq_num;
		this.rq_title = rq_title;
		this.rq_username = rq_username;
		this.rq_content = rq_content;
		this.rq_date = rq_date;
		this.rq_like = rq_like;
	}
	
	public reQnADTO(int q_num, String rq_title, String rq_username, String rq_content, String rq_password) {
		this.q_num = q_num;
		this.rq_title = rq_title;
		this.rq_username = rq_username;
		this.rq_content = rq_content;
		this.rq_password = rq_password;
	}
	

	public int getQ_num() {
		return q_num;
	}

	public int getRQ_num() {
		return rq_num;
	}

	public String getRQ_username() {
		return rq_username;
	}

	public String getRQ_password() {
		return rq_password;
	}

	public String getRQ_title() {
		return rq_title;
	}

	public String getRQ_content() {
		return rq_content;
	}

	public String getRQ_date() {
		return rq_date;
	}

	public int getRQ_like() {
		return rq_like;
	}

	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}

	public void setRQ_num(int rq_num) {
		this.rq_num = rq_num;
	}

	public void setRQ_username(String rq_username) {
		this.rq_username = rq_username;
	}

	public void setRQ_password(String rq_password) {
		this.rq_password = rq_password;
	}

	public void setRQ_title(String rq_title) {
		this.rq_title = rq_title;
	}

	public void setRQ_content(String rq_content) {
		this.rq_content = rq_content;
	}

	public void setRQ_date(String rq_date) {
		this.rq_date = rq_date;
	}

	public void setRQ_like(int rq_like) {
		this.rq_like = rq_like;
	}
}
