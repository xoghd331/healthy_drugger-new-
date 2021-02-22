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
import com.model.reQnADAO;
import com.model.reQnADTO;

/**
 * Servlet implementation class ReQnAModifyServiceCon
 */
@WebServlet("/ReQnAModifyServiceCon")
public class ReQnAModifyServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter script = response.getWriter();

		int qnum = Integer.parseInt(request.getParameter("qnum"));
		int rqnum = Integer.parseInt(request.getParameter("rqnum"));
		String username = request.getParameter("rq_username");
		String password = request.getParameter("rq_password");
		String title = request.getParameter("rq_title");
		String content = request.getParameter("rq_content");
		int idx;

		reQnADAO dao = new reQnADAO();
		reQnADTO dto = new reQnADTO();
		boolean ch = dao.checkPW(rqnum, password);
		
		if (ch == true) {
			dao.modifyReQuestions(content, rqnum);
			
			script.println("<script>");
			script.println("alert('답글 수정 성공')");
			script.println("location.href='Community/QnAView.jsp?idx=" + qnum + "&pg=<%=pg%>'");
			script.println("</script>");		}
		else {
			script.println("<script>");
			script.println("alert('글쓰기에 실패했습니다')");
			script.println("history.back()");
			script.println("</script>");
		}
//		response.sendRedirect("Community/QnAView.jsp?idx=" + qnum + "&pg=<%=pg%>");
	}

}
