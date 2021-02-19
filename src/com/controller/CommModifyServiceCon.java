package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.CommDAO;
import com.model.CommDTO;

@WebServlet("/CommModifyServiceCon")
public class CommModifyServiceCon extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		int num = Integer.parseInt(request.getParameter("num"));
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String content = request.getParameter("content");
		
		CommDAO dao = new CommDAO();
		CommDTO dto = new CommDTO();
		boolean ch = dao.checkPW(num, password);
		
		if (ch == true) {
			dao.modifyComm(content, num);
			
			System.out.println("����� �����Ǿ����ϴ�.");
		} else {
			System.out.println("��й�ȣ�� Ʋ�Ƚ��ϴ�.");
		}
		response.sendRedirect("Community/List2.jsp");
	}

}
