package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter script = response.getWriter();
		
		String username = request.getParameter("q_username");
		int num = Integer.parseInt(request.getParameter("num"));
		String title = request.getParameter("q_title");
		String password = request.getParameter("q_password");

		QnADAO dao = new QnADAO();
		QnADTO dto = new QnADTO();
		boolean ch = dao.checkPW(num, password);
		
		if (ch == true) {
			dao.deleteQuestions(num);
			
			script.println("<script>");
			script.println("alert('������ �����Ǿ����ϴ�')");
			script.println("location.href='Community/QnAList.jsp'");
			script.println("</script>");
		} else {
			script.println("<script>");
			script.println("alert('��й�ȣ�� �ٽ� �Է����ֽʽÿ�')");
			script.println("history.back()");
			script.println("</script>");
		}
//		response.sendRedirect("Community/QnAList.jsp");
	}

}
