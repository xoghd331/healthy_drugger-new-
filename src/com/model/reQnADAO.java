package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class reQnADAO {
		
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	private int cnt = 0;
	private reQnADTO info;
	
	public void conn() {
		try {
			// Classã�� : ��Ŭ������ DB ���̿��� ��θ� ������ִ� ����
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// DB�� �α��� �� ���̵�, �н�����, url�� ����
			String dbid = "hr";
			String dbpw = "hr";
			String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
			// Connection ��ü�� ����ؼ� DB�� ���� : DB���� �� �� �ִ� ī��Ű
			conn = DriverManager.getConnection(dburl, dbid, dbpw);
		} catch (ClassNotFoundException e) {
			e.printStackTrace(); // �����޼��� ���
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
	
	public int reQnACount(int num) {
		
		try {
			conn();
			
			String sql = "SELECT COUNT(*) FROM rqna WHERE q_num = ?";

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
	
	public int insertReQuestions(reQnADTO dto) {
		
		try {
			conn();
			
			String sql = "INSERT INTO rqna VALUES (?, num_rqna.nextval, ?, ?, ?, ?, sysdate, 0)";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, dto.getQ_num());
			psmt.setString(2, dto.getRQ_username());
			psmt.setString(3, dto.getRQ_password());
			psmt.setString(4, dto.getRQ_title());
			psmt.setString(5, dto.getRQ_content());
			
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	public ArrayList<reQnADTO> selectReQuestions(int num) {
		
		ArrayList<reQnADTO> list = new ArrayList<reQnADTO>();
		
		try {
			conn();
			
			String sql = "SELECT rq_num, rq_title, rq_username, rq_content, rq_date, rq_like FROM rqna WHERE q_num = ? ORDER BY q_num ASC";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				int rq_num = rs.getInt(1);
				String rq_title = rs.getString(2);
				String rq_username = rs.getString(3);
				String rq_content = rs.getString(4);
				String rq_date = rs.getString(5);
				int rq_like = rs.getInt(6);
				
				info = new reQnADTO(rq_num, rq_title, rq_username, rq_content, rq_date, rq_like);
				list.add(info);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public reQnADTO viewReQuestions(int rqnum) {
		
		reQnADTO dto = new reQnADTO();
		
		try {
			conn();
			
			String sql = "SELECT rq_num, rq_title, rq_username, rq_date, rq_content, q_like FROM rqna WHERE rq_num = ?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, rqnum);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				dto.setRQ_num(rs.getInt(1));
				dto.setRQ_title(rs.getString(2));
				dto.setRQ_username(rs.getString(3));
				dto.setRQ_date(rs.getString(4));
				dto.setRQ_content(rs.getString(5));
				dto.setRQ_like(rs.getInt(6));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}
	
	public reQnADTO getReQuestions(int ridx) {
		
		reQnADTO dto = new reQnADTO();
		
		try {
			conn();
			
			String sql = "SELECT * FROM rqna WHERE rq_num = ?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, ridx);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				dto.setQ_num(rs.getInt(1));
				dto.setRQ_num(rs.getInt(2));
				dto.setRQ_username(rs.getString(3));
				dto.setRQ_password(rs.getString(4));
				dto.setRQ_title(rs.getString(5));
				dto.setRQ_content(rs.getString(6));
				dto.setRQ_date(rs.getString(7));
				dto.setRQ_like(rs.getInt(8));
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
			
			String sql = "SELECT rq_num FROM rqna where rq_num = ? and rq_password = ?";
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
	
	public void modifyReQuestions(String content, int ridx) {
		
		try {
			conn();
			
			String sql = "UPDATE rqna SET rq_content = ? WHERE rq_num = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, content);
			psmt.setInt(2, ridx);
			
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public void deleteReQuestions(int idx) {
		
		try {
			conn();
			
			String sql = "DELETE FROM rqna WHERE rq_num = ?";
			
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
