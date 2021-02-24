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

@WebServlet("/QnAWriteServiceCon")
public class QnAWriteServiceCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String username = request.getParameter("q_username");
		String password = request.getParameter("q_password");
		String title = request.getParameter("q_title");
		String content = request.getParameter("q_content");
		
		QnADAO dao = new QnADAO();
		QnADTO dto = new QnADTO(username, password, title, content);
		
		int cnt = dao.insertQuestions(dto);
		
		if (cnt > 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('질문 성공')");
			script.println("location.href='Community/QnAList.jsp'");
			script.println("</script>");
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('게시물 작성에 실패했습니다')");
			script.println("history.back()");
			script.println("</script>");
		}
		
//		response.sendRedirect("QnAList.jsp");
	}

}
