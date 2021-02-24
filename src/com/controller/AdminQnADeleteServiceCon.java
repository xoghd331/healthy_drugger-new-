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


/**
 * Servlet implementation class AdminQnADeleteServiceCon
 */
@WebServlet("/AdminQnADeleteServiceCon")
public class AdminQnADeleteServiceCon extends HttpServlet {
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
		
		dao.deleteQuestions(num);
		
		script.println("<script>");
		script.println("alert('질문이 삭제되었습니다')");
		script.println("location.href='Community/QnAList.jsp'");
		script.println("</script>");
		
//		response.sendRedirect("Community/QnAList.jsp");
	}

}
