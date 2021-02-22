package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDAO {
	
	int cnt = 0;
	PreparedStatement psmt =null;
	Connection conn = null;
	ResultSet rs = null;
	UserDTO info = null;
	
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
	
	public int join(UserDTO dto) {
		
		// 1. lib 폴더에 jar 넣어주기

		// 2. 동적 로딩방식
		try {
			conn();
			
			String sql = "insert into user_info values(?,?,?,?)";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getTel());
			psmt.setString(4, dto.getLicense());
			
			cnt = psmt.executeUpdate();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally {
			close();
		}
		return cnt;
	}
	
	public UserDTO login(UserDTO dto) {
		try {
			conn();
			
			String sql = "select * from user_info where id = ? and pw = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String tel = rs.getString("tel");
				String license = rs.getString("license");
				
				info = new UserDTO(id, pw, tel, license);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally {
			close();
		}
		return info;
	}
	
	public int update(UserDTO dto) {
		try {
			conn();
			
			String sql = "update user_info set pw=?, tel=?, license=? where id=?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getPw());
			psmt.setString(2, dto.getTel());
			psmt.setString(3, dto.getLicense());
			psmt.setString(4, dto.getId());
			
			cnt = psmt.executeUpdate();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		finally {
			close();
		}
		return cnt;
	}
	
	public ArrayList<UserDTO> selectUser(){
		
		ArrayList<UserDTO> list = new ArrayList<UserDTO>();
		
		try {
			conn();
			
			String sql = "select * from user_info";
			
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String tel = rs.getString("tel");
				String license = rs.getString("license");
				
				info = new UserDTO(id, pw, tel, license);
				list.add(info);
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
	
	public boolean idCheck(String id) {
		
		boolean check = false;
		
		try {
			conn();
			
			String sql = "select * from user_info where id = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				check = true;
			}
			else {
				check = false;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally {
			close();
		}
		return check;
	}
	
//	public UserDTO getUser(int idx) {
//		
//		UserDTO dto = new UserDTO();
//		
//		try {
//			conn();
//			
//			String sql = "SELECT * FROM user_info WHERW  = ?";
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//	}
}
