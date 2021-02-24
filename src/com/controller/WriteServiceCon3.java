package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.BoardDAO;
import com.model.BoardDTO;

@WebServlet("/WriteServiceCon3")
public class WriteServiceCon3 extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter script = response.getWriter();

		String username = request.getParameter("b_username");
		String password = request.getParameter("b_password");
		String title = request.getParameter("b_title");
		String content = request.getParameter("b_content");
		
		System.out.println(content);
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO(username, password, title, content);
		
		int cnt = dao.insertWrite(dto);
		
		if (cnt > 0) {
			script.println("<script>");
			script.println("alert('글쓰기 성공')");
			script.println("location.href='Community/List3.jsp'");
			script.println("</script>");
		} else {
			script.println("<script>");
			script.println("alert('글쓰기에 실패했습니다')");
			script.println("history.back()");
			script.println("</script>");
		}
		
//		response.sendRedirect("Community/List3.jsp");
	}

}
