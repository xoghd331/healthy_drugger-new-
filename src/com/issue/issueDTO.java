package com.issue;

public class issueDTO {
	
	private int idx;
	private String title;
	private String user_id;
	private String up_date;
	private String content;
	private String available;
	private String issueImg;
	
	public issueDTO(int idx, String title, String user_id, String up_date, String content, String available,
			String issueImg) {
		super();
		this.idx = idx;
		this.title = title;
		this.user_id = user_id;
		this.up_date = up_date;
		this.content = content;
		this.available = available;
		this.issueImg = issueImg;
	}
	
	public issueDTO(String title, String user_id, String content, String issueImg) {
		super();
		this.title = title;
		this.user_id = user_id;
		this.content = content;
		this.issueImg = issueImg;
	}


	public int getIdx() {
		return idx;
	}
	public String getTitle() {
		return title;
	}
	public String getUser_id() {
		return user_id;
	}
	public String getUp_date() {
		return up_date;
	}
	public String getContent() {
		return content;
	}
	public String getAvailable() {
		return available;
	}
	public String getIssueImg() {
		return issueImg;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public void setUp_date(String up_date) {
		this.up_date = up_date;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setAvailable(String available) {
		this.available = available;
	}
	public void setIssueImg(String issueImg) {
		this.issueImg = issueImg;
	}
	
	
	


}
