package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class BoardDAO {
	
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	private int cnt = 0;
	private BoardDTO info;

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

	public int count() {
		
		try {
			conn();
			
			String sql = "SELECT COUNT(*) FROM board";
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
	
	public int insertWrite(BoardDTO dto) {
		
		try {
			conn();
			
			String sql = "INSERT INTO board VALUES (num_board.nextval, ?, ?, ?, ?, sysdate, 0, 0)";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dto.getB_username());
			psmt.setString(2, dto.getB_password());
			psmt.setString(3, dto.getB_title());
			psmt.setString(4, dto.getB_content());
			
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	public ArrayList<BoardDTO> selectWrite() {
		
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		try {
			conn();
			
			String sql = "SELECT b_num, b_title, b_username, b_date, b_like, b_view FROM board ORDER BY b_num DESC";
			
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
				
				info = new BoardDTO(num, title, username, yea, like, view, dayNew);
				list.add(info);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public BoardDTO viewWrite(int num) {
		
		BoardDTO dto = new BoardDTO();
		
		try {
			conn();
			
			String sql = "SELECT b_num, b_title, b_username, b_view, b_date, b_content, b_like FROM board WHERE b_num = ?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				dto.setB_num(rs.getInt(1));
				dto.setB_title(rs.getString(2));
				dto.setB_username(rs.getString(3));
				dto.setB_view(rs.getInt(4));
				dto.setB_date(rs.getString(5));
				dto.setB_content(rs.getString(6));
				dto.setB_like(rs.getInt(7));
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
			
			String sql = "UPDATE board SET b_view = b_view+1 WHERE b_num = ?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);
			psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
	
	public ArrayList<BoardDTO> searchTitle(String in_search) {
		
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		try {
			conn();
			
			String sql = "SELECT b_num, b_title, b_username, b_date, b_like, b_view FROM board WHERE b_title LIKE ? ORDER BY b_num DESC";
			
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
				
				info = new BoardDTO(num, title, username, yea, like, view, dayNew);
				list.add(info);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public ArrayList<BoardDTO> searchContent(String in_search) {
		
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		try {
			conn();
			
			String sql = "SELECT b_num, b_title, b_username, b_date, b_like, b_view FROM board WHERE DBMS_LOB.INSTR(b_content, '" + in_search + "') > 0 ORDER BY b_num DESC";
			
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
				
				info = new BoardDTO(num, title, username, yea, like, view, dayNew);
				list.add(info);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public ArrayList<BoardDTO> searchWrite(String in_search) {
		
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		
		try {
			conn();
			
			String sql = "SELECT b_num, b_title, b_username, b_date, b_like, b_view FROM board WHERE b_username LIKE ? ORDER BY b_num DESC";
			
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
				
				info = new BoardDTO(num, title, username, yea, like, view, dayNew);
				list.add(info);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public BoardDTO getBoard(int idx) {
		
		BoardDTO dto = new BoardDTO();
		
		try {
			conn();
			
			String sql = "SELECT * FROM board WHERE b_num = ?";
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, idx);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				dto.setB_num(rs.getInt(1));
				dto.setB_username(rs.getString(2));
				dto.setB_password(rs.getString(3));
				dto.setB_title(rs.getString(4));
				dto.setB_content(rs.getString(5));
				dto.setB_date(rs.getString(6));
				dto.setB_view(rs.getInt(7));
				dto.setB_like(rs.getInt(8));
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
			
			String sql = "SELECT b_num FROM board where b_num = ? and b_password = ?";
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
	
	public void modifyWrite(String title, String content, int idx) {
		
		try {
			conn();
			
			String sql = "UPDATE board SET b_title = ?, b_content = ? WHERE b_num = ?";
			
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
	
	public void deleteWrite(int idx) {
		
		try {
			conn();
			
			String sql = "DELETE FROM board WHERE b_num = ?";
			
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
