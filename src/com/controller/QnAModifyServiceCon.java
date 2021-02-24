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

@WebServlet("/QnAModifyServiceCon")
public class QnAModifyServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter script = response.getWriter();

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
			
			script.println("<script>");
			script.println("alert('질문 수정 성공')");
			script.println("location.href='Community/NewQnAView.jsp?idx=" + num + "&pg=<%=pg%>'");
			script.println("</script>");
		} else {
			script.println("<script>");
			script.println("alert('글쓰기에 실패했습니다')");
			script.println("history.back()");
			script.println("</script>");
		}
	}

}
