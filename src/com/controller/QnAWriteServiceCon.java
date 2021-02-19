package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.QnADAO;
import com.model.QnADTO;

@WebServlet("/QnAWriteServiceCon")
public class QnAWriteServiceCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");

		String username = request.getParameter("q_username");
		String password = request.getParameter("q_password");
		String title = request.getParameter("q_title");
		String content = request.getParameter("q_content");
		
		QnADAO dao = new QnADAO();
		QnADTO dto = new QnADTO(username, password, title, content);
		
		int cnt = dao.insertQuestions(dto);
		
		if (cnt > 0) {
			System.out.println("�� �ۼ� ����");
		} else {
			System.out.println("�� �ۼ� ����");
		}
		
		response.sendRedirect("Community/QnAList.jsp");
	}

}
