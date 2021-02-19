package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CommDAO {
	
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	private int cnt = 0;
	private CommDTO info;
	
	public void conn() {
		try {
			// Class찾기 : 이클립스와 DB 사이에서 통로를 만들어주는 역할
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// DB에 로그인 할 아이디, 패스워드, url을 지정
			String dbid = "hr";
			String dbpw = "hr";
			String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
			// Connection 객체를 사용해서 DB에 연결 : DB문을 열 수 있는 카드키
			conn = DriverManager.getConnection(dburl, dbid, dbpw);
		} catch (ClassNotFoundException e) {
			e.printStackTrace(); // 오류메세지 출력
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int commCount(int num) {
		
		try {
			conn();
			
			String sql = "SELECT COUNT(*) FROM comm WHERE b_num = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	
	public int insertComm(CommDTO dto) {
		
		try {
			conn();
			
			String sql = "INSERT INTO comm VALUES (?, num_comm.nextval, ?, ?, ?, sysdate, 0)";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, dto.getB_num());
			psmt.setString(2, dto.getC_username());
			psmt.setString(3, dto.getC_password());
			psmt.setString(4, dto.getC_content());
			
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	public ArrayList<CommDTO> selectComm(int num) {
		
		ArrayList<CommDTO> list = new ArrayList<CommDTO>();
		
		try {
			conn();
			
			String sql = "SELECT c_num, c_username, c_password, c_content, c_date, c_like FROM comm WHERE b_num = ? ORDER BY c_num ASC";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				int c_num = rs.getInt(1);
				String c_username = rs.getString(2);
				String c_password = rs.getString(3);
				String c_content = rs.getString(4);
				String c_date = rs.getString(5);
				int c_like = rs.getInt(6);
				
				info = new CommDTO(c_num, c_username, c_password, c_content, c_date, c_like);
				list.add(info);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
//	public CommDTO viewComm(int idx) {
//		
//		CommDTO dto = new CommDTO();
//		
//		try {
//			conn();
//			
//			String sql = "SELECT c_num, c_username, c_date, c_content, c_like FROM comm WHERE b_num = ?";
//			
//			psmt = conn.prepareStatement(sql);
//			psmt.setInt(1, idx);
//			rs = psmt.executeQuery();
//			
//			if (rs.next()) {
//				dto.setC_num(rs.getInt(1));
//				dto.setC_username(rs.getString(2));
//				dto.setC_date(rs.getString(3));
//				dto.setC_content(rs.getString(4));
//				dto.setC_like(rs.getInt(5));
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//		return dto;
//	}
	
	public CommDTO getComm(int idx, int cidx) {
		
		CommDTO dto = new CommDTO();
		
		try {
			conn();
			
			String sql = "SELECT * FROM comm WHERE b_num = ? and c_num = ?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, idx);
			psmt.setInt(2, cidx);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				dto.setB_num(rs.getInt(1));
				dto.setC_num(rs.getInt(2));
				dto.setC_username(rs.getString(3));
				dto.setC_password(rs.getString(4));
				dto.setC_content(rs.getString(5));
				dto.setC_date(rs.getString(6));
				dto.setC_like(rs.getInt(7));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}
	
	public boolean checkPW (int idx, String password) {
		boolean ch = false;
		try {
			conn();
			
			String sql = "SELECT c_num FROM comm where c_num = ? and c_password = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, idx);
			psmt.setString(2, password);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				ch = true;
			} else {
				ch = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return ch;
	}
	
	public void modifyComm(String content, int idx) {
		
		try {
			conn();
			
			String sql = "UPDATE comm SET c_content = ? WHERE c_num = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, content);
			psmt.setInt(2, idx);
			
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public void deleteComm(int idx) {
		
		try {
			conn();
			
			String sql = "DELETE FROM comm WHERE c_num = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, idx);
			
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	
	
	

}
