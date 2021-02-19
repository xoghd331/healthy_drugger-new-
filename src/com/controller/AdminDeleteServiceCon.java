package com.controller;

import java.io.IOException;
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
		request.setCharacterEncoding("EUC-KR");
		String username = request.getParameter("username");
		int num = Integer.parseInt(request.getParameter("num"));
		String title = request.getParameter("title");
		String password = request.getParameter("password");

		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		
		dao.deleteWrite(num);
		
		response.sendRedirect("List3.jsp");
	}

}
