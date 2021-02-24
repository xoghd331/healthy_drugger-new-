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
			// class 찾기 : 이클립스 - DB 사이에 통로를 만들어 주는 역할
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// DB의 문을 열 수 있는 주소와 아이디, 비밀번호
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbid = "hr";
			String dbpw = "hr";
			
			// DB문을 열 수 있는 카드키
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
	// 작성 일자
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
		return ""; // 데이터베이스 오류
	}
	
	//글쓰기
	public int write(issueDTO dto) {
		try {
			conn();
			
			String sql = "insert into issue(idx,title,user_id,up_date,content,available,issueimg) values(issue_seq.NEXTVAL,?,?,SYSDATE,?,?,?)";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getUser_id());
			psmt.setString(3, dto.getContent());
			psmt.setInt(4, 1);	//글의 유효 번호
			psmt.setString(5, dto.getIssueImg());
			
			System.out.println(dto.getTitle());
			System.out.println(dto.getUser_id());
			System.out.println(dto.getContent());
			System.out.println(dto.getIssueImg());
			
			return psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	//게시글 보기
	public issueDTO getIssueDTO(int idx) {
		try {
			conn();
			
			String sql = "select * from issue where idx = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, idx);
			
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				dto = new issueDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7));
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
	
	//글 수정
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
	
	//글 삭제
	public int delete(int idx) {
		try {
			conn();
			
			String sql = "delete from issue where idx = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, idx);
			
			cnt = psmt.executeUpdate();
			
		} catch(SQLException e){
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
}
