package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.BoardDAO;
import com.model.BoardDTO;

@WebServlet("/DeleteServiceCon")
public class DeleteServiceCon extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		int num = Integer.parseInt(request.getParameter("num"));
		String password = request.getParameter("password");
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		boolean ch = dao.checkPW(num, password);
		
		if (ch == true) {
			dao.deleteWrite(num);
			
			System.out.println("���� �����Ǿ����ϴ�.");
		} else {
			System.out.println("��й�ȣ�� Ʋ�Ƚ��ϴ�.");
		}
		response.sendRedirect("Community/List2.jsp");
	}
	

}
