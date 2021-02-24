package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.reQnADAO;
import com.model.reQnADTO;

@WebServlet("/AdminReQnADeleteServiceCon")
public class AdminReQnADeleteServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter script = response.getWriter();

		String username = request.getParameter("rq_username");
		int qnum = Integer.parseInt(request.getParameter("qnum"));
		int rqnum = Integer.parseInt(request.getParameter("rqnum"));
		String title = request.getParameter("rq_title");
		String password = request.getParameter("rq_password");

		reQnADAO dao = new reQnADAO();
		reQnADTO dto = new reQnADTO();
		
		dao.deleteReQuestions(rqnum);
			
		script.println("<script>");
		script.println("alert('����� �����Ǿ����ϴ�')");
		script.println("location.href='Community/NewQnAView.jsp?idx=" + qnum + "&pg=<%=pg%>'");
		script.println("</script>");
		
//		response.sendRedirect("Community/QnAView.jsp?idx=" + qnum + "&pg=<%=pg%>");
	}
}
