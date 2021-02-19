package com.issue;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.user.UserDTO;

public class issueDAO {

	int cnt = 0;
	PreparedStatement psmt =null;
	Connection conn = null;
	ResultSet rs = null;
	issueDTO dto = null;
	
	public void conn() {
		try {
			// class ã�� : ��Ŭ���� - DB ���̿� ��θ� ����� �ִ� ����
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// DB�� ���� �� �� �ִ� �ּҿ� ���̵�, ��й�ȣ
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbid = "hr";
			String dbpw = "hr";
			
			// DB���� �� �� �ִ� ī��Ű
			conn = DriverManager.getConnection(url, dbpw, dbid);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if(rs != null) {
				rs.close();
			}
			if(psmt != null) {
				psmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
	}
	// �ۼ� ����
	public String getDate() {
		try {
			conn();
			
			String sql = "select now()";
			
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				return rs.getNString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // �����ͺ��̽� ����
	}
	
	//�۾���
	public int write(issueDTO dto) {
		try {
			conn();
			
			String sql = "insert into issue(idx,title,user_id,up_date,content,available,issueimg) values(issue_seq.NEXTVAL,?,?,SYSDATE,?,?,?)";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getUser_id());
			psmt.setString(3, dto.getContent());
			psmt.setInt(4, 1);	//���� ��ȿ ��ȣ
			psmt.setString(5, dto.getIssueImg());
			
			System.out.println(dto.getTitle());
			System.out.println(dto.getUser_id());
			System.out.println(dto.getContent());
			System.out.println(dto.getIssueImg());
			
			return psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}
	
	//�Խñ� ����
	public issueDTO getIssueDTO(int idx) {
		try {
			conn();
			
			String sql = "select * from issue where idx = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, idx);
			
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				dto.setIdx(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setUser_id(rs.getString(3));
				dto.setUp_date(rs.getString(4));
				dto.setContent(rs.getString(5));
				dto.setAvailable(rs.getString(6));
				
				return dto;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
public ArrayList<issueDTO> selectIssue(){
		
		ArrayList<issueDTO> list = new ArrayList<issueDTO>();
		
		try {
			conn();
			
			String sql = "select * from issue order by idx desc";
			
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				int idx = rs.getInt("idx");
				String title = rs.getString("title");
				String user_id = rs.getString("user_id");
				String up_date = rs.getString("up_date");
				String content = rs.getString("content");
				String available = rs.getString("available");
				String issueimg = rs.getString("issueimg");
				
				dto = new issueDTO(idx, title, user_id, up_date, content, available, issueimg);
				list.add(dto);
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		finally {
			close();
		}
		return list;
	}
	
	//�� ����
	public int update(issueDTO dto) {
		try {
			conn();
			
			String sql = "update issue set title=?, content=?, where idx=?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setInt(3, dto.getIdx());
			
			cnt = psmt.executeUpdate();
			
		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	//�� ����
	public int delete(issueDTO dto) {
		try {
			conn();
			
			String sql = "delete";
			
			psmt = conn.prepareStatement(sql);
			

			
			cnt = psmt.executeUpdate();
			
		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
}
