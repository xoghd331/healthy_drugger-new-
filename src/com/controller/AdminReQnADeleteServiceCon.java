package com.controller;

import java.io.IOException;
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
		request.setCharacterEncoding("EUC-KR");
		String username = request.getParameter("rq_username");
		int qnum = Integer.parseInt(request.getParameter("qnum"));
		int rqnum = Integer.parseInt(request.getParameter("rqnum"));
		String title = request.getParameter("rq_title");
		String password = request.getParameter("rq_password");

		reQnADAO dao = new reQnADAO();
		reQnADTO dto = new reQnADTO();
		
		dao.deleteReQuestions(rqnum);
			
		response.sendRedirect("Community/QnAView.jsp?idx=" + qnum + "&pg=<%=pg%>");
	}
}
