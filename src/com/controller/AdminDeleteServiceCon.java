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

@WebServlet("/AdminDeleteServiceCon")
public class AdminDeleteServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter script = response.getWriter();

		String username = request.getParameter("username");
		int num = Integer.parseInt(request.getParameter("num"));
		String title = request.getParameter("title");
		String password = request.getParameter("password");

		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		
		dao.deleteWrite(num);
		
		script.println("<script>");
		script.println("alert('게시물이 삭제되었습니다')");
		script.println("location.href='Community/List3.jsp'");
		script.println("</script>");
		
//		response.sendRedirect("Community/List3.jsp");
	}

}
