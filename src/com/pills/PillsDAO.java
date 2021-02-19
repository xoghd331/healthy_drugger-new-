package com.pills;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.user.UserDTO;

public class PillsDAO {
	
	int cnt = 0;
	PreparedStatement psmt =null;
	Connection conn = null;
	ResultSet rs = null;
	UserDTO info = null;
	
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
	
	public int inPutPills(PillsDTO dto) {
		
		try {
			conn();
			
			String sql = "insert into pills values(?,?,?,?,?,?,?,?)";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getBrand());
			psmt.setString(3, dto.getGender());
			psmt.setString(4, dto.getAge());
			psmt.setString(5, dto.getIngre());
			psmt.setString(6, dto.getEffic());
			psmt.setString(7, dto.getPrice());
			psmt.setString(8, dto.getNote());
			
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
	
	public int deletePills(PillsDTO dto) {
		
		try {
			conn();
			
			String sql = "delete from pills where name = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getName());
			
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
}
