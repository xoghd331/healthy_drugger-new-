package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.QnADAO;
import com.model.QnADTO;

@WebServlet("/QnADeleteServiceCon")
public class QnADeleteServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		String username = request.getParameter("q_username");
		int num = Integer.parseInt(request.getParameter("num"));
		String title = request.getParameter("q_title");
		String password = request.getParameter("q_password");

		QnADAO dao = new QnADAO();
		QnADTO dto = new QnADTO();
		boolean ch = dao.checkPW(num, password);
		
		if (ch == true) {
			dao.deleteQuestions(num);
			
			System.out.println("글이 삭제되었습니다.");
		} else {
			System.out.println("비밀번호가 틀렸습니다.");
		}
		response.sendRedirect("Community/QnAList.jsp");
	}

}
