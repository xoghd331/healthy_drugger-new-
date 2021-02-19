package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class QnADAO {
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	private int cnt = 0;
	private QnADTO info;

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
	
	public int count() {
		
		try {
			conn();
			
			String sql = "SELECT COUNT(*) FROM qna";
			psmt = conn.prepareStatement(sql);
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
	
	public int insertQuestions(QnADTO dto) {
		
		try {
			conn();
			
			String sql = "INSERT INTO qna VALUES (num_qna.nextval, ?, ?, ?, ?, sysdate, 0, 0)";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getQ_username());
			psmt.setString(2, dto.getQ_password());
			psmt.setString(3, dto.getQ_title());
			psmt.setString(4, dto.getQ_content());
			
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	public ArrayList<QnADTO> selectQuestions() {
		
		ArrayList<QnADTO> list = new ArrayList<QnADTO>();
		
		try {
			conn();
			
			String sql = "SELECT q_num, q_title, q_username, q_date, q_like, q_view FROM qna ORDER BY q_num DESC";
			
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				boolean dayNew = false;
				
				int num = rs.getInt(1);
				String title = rs.getString(2);
				String username = rs.getString(3);
				
				Date today = new Date();
				SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
				String year = (String)simpleDate.format(today);
				String date = rs.getString(4);
				String yea = date.substring(0,10);
				if (year.equals(yea)) {
					dayNew = true;
				}
				
				int like = rs.getInt(5);
				int view = rs.getInt(6);
				
				info = new QnADTO(num, title, username, yea, like, view, dayNew);
				list.add(info);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public QnADTO viewQuestions(int num) {
		
		QnADTO dto = new QnADTO();
		
		try {
			conn();
			
			String sql = "SELECT q_num, q_title, q_username, q_view, q_date, q_content, q_like FROM qna WHERE q_num = ?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				dto.setQ_num(rs.getInt(1));
				dto.setQ_title(rs.getString(2));
				dto.setQ_username(rs.getString(3));
				dto.setQ_view(rs.getInt(4));
				dto.setQ_date(rs.getString(5));
				dto.setQ_content(rs.getString(6));
				dto.setQ_like(rs.getInt(7));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}
	
	public void updateViewCount(int num) {
		
		try {
			conn();
			
			String sql = "UPDATE qna SET q_view = q_view+1 WHERE q_num = ?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public ArrayList<QnADTO> searchQTitle(String in_search) {
		
		ArrayList<QnADTO> list = new ArrayList<QnADTO>();
		
		try {
			conn();
			
			String sql = "SELECT q_num, q_title, q_username, q_date, q_like, q_view FROM qna WHERE q_title LIKE ? ORDER BY q_num DESC";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, "%"+in_search+"%");
			
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				boolean dayNew = false;
				
				int num = rs.getInt(1);
				String title = rs.getString(2);
				String username = rs.getString(3);
				
				Date today = new Date();
				SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
				String year = (String)simpleDate.format(today);
				String date = rs.getString(4);
				String yea = date.substring(0,10);
				if (year.equals(yea)) {
					dayNew = true;
				}
				
				int like = rs.getInt(5);
				int view = rs.getInt(6);
				
				info = new QnADTO(num, title, username, yea, like, view, dayNew);
				list.add(info);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public ArrayList<QnADTO> searchQContent(String in_search) {
		
		ArrayList<QnADTO> list = new ArrayList<QnADTO>();
		
		try {
			conn();
			
			String sql = "SELECT q_num, q_title, q_username, q_date, q_like, q_view FROM qna WHERE DBMS_LOB.INSTR(q_content, '" + in_search + "') > 0 ORDER BY q_num DESC";
			
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				boolean dayNew = false;
				
				int num = rs.getInt(1);
				String title = rs.getString(2);
				String username = rs.getString(3);
				
				Date today = new Date();
				SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
				String year = (String)simpleDate.format(today);
				String date = rs.getString(4);
				String yea = date.substring(0,10);
				if (year.equals(yea)) {
					dayNew = true;
				}
				
				int like = rs.getInt(5);
				int view = rs.getInt(6);
				
				info = new QnADTO(num, title, username, yea, like, view, dayNew);
				list.add(info);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public ArrayList<QnADTO> searchQWrite(String in_search) {
		
		ArrayList<QnADTO> list = new ArrayList<QnADTO>();
		
		try {
			conn();
			
			String sql = "SELECT q_num, q_title, q_username, q_date, q_like, q_view FROM qna WHERE q_username LIKE ? ORDER BY q_num DESC";
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, "%" + in_search + "%");
			
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				boolean dayNew = false;
				
				int num = rs.getInt(1);
				String title = rs.getString(2);
				String username = rs.getString(3);
				
				Date today = new Date();
				SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
				String year = (String)simpleDate.format(today);
				String date = rs.getString(4);
				String yea = date.substring(0,10);
				if (year.equals(yea)) {
					dayNew = true;
				}
				
				int like = rs.getInt(5);
				int view = rs.getInt(6);
				
				info = new QnADTO(num, title, username, yea, like, view, dayNew);
				list.add(info);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public QnADTO getQuestions(int idx) {
		
		QnADTO dto = new QnADTO();
		
		try {
			conn();
			
			String sql = "SELECT * FROM qna WHERE q_num = ?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, idx);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				dto.setQ_num(rs.getInt(1));
				dto.setQ_username(rs.getString(2));
				dto.setQ_password(rs.getString(3));
				dto.setQ_title(rs.getString(4));
				dto.setQ_content(rs.getString(5));
				dto.setQ_date(rs.getString(6));
				dto.setQ_view(rs.getInt(7));
				dto.setQ_like(rs.getInt(8));
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
			
			String sql = "SELECT q_num FROM qna where q_num = ? and q_password = ?";
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
	
	public void modifyQuestions(String title, String content, int idx) {
		
		try {
			conn();
			
			String sql = "UPDATE qna SET q_title = ?, q_content = ? WHERE q_num = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setInt(3, idx);
			
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public void deleteQuestions(int idx) {
		
		try {
			conn();
			
			String sql = "DELETE FROM qna WHERE q_num = ?";
			
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
