package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.QnADAO;
import com.model.QnADTO;

@WebServlet("/QnAModifyServiceCon")
public class QnAModifyServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		int num = Integer.parseInt(request.getParameter("num"));
		String username = request.getParameter("q_username");
		String password = request.getParameter("q_password");
		String title = request.getParameter("q_title");
		String content = request.getParameter("q_content");
		int idx;

		QnADAO dao = new QnADAO();
		QnADTO dto = new QnADTO();
		boolean ch = dao.checkPW(num, password);
		
		if (ch == true) {
			dao.modifyQuestions(title, content, num);
			
			System.out.println("���� �����Ǿ����ϴ�.");
		} else {
			System.out.println("��й�ȣ�� Ʋ�Ƚ��ϴ�.");
		}
		response.sendRedirect("QnAView.jsp?idx=" + num + "&pg=<%=pg%>");
	}

}
