package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.BoardDAO;
import com.model.BoardDTO;

@WebServlet("/WriteServiceCon2")
public class WriteServiceCon2 extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");

		String username = request.getParameter("b_username");
		String password = request.getParameter("b_password");
		String title = request.getParameter("b_title");
		String content = request.getParameter("b_content");
		
		System.out.println(username);
		System.out.println(password);
		System.out.println(title);
		System.out.println(content);
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO(username, password, title, content);
		
		int cnt = dao.insertWrite(dto);
		
		if (cnt > 0) {
			System.out.println("글 작성 성공");
		} else {
			System.out.println("글 작성 실패");
		}
		
		response.sendRedirect("Community/List2.jsp");
	}

}
