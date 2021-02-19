package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.reQnADAO;
import com.model.reQnADTO;

@WebServlet("/ReQnADeleteServiceCon")
public class ReQnADeleteServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		String username = request.getParameter("username");
		int qnum = Integer.parseInt(request.getParameter("qnum"));
		int rqnum = Integer.parseInt(request.getParameter("rqnum"));
		String title = request.getParameter("title");
		String password = request.getParameter("password");

		reQnADAO dao = new reQnADAO();
		reQnADTO dto = new reQnADTO();
		boolean ch = dao.checkPW(rqnum, password);
		
		if (ch == true) {
			dao.deleteReQuestions(rqnum);
			
			System.out.println("글이 삭제되었습니다.");
		} else {
			System.out.println("비밀번호가 틀렸습니다.");
		}
		response.sendRedirect("Community/QnAView.jsp?idx=" + qnum + "&pg=<%=pg%>");
	}

}
