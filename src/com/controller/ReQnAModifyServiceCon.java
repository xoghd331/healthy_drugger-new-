package com.controller;

import java.io.IOException;
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
		request.setCharacterEncoding("EUC-KR");
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
			
			System.out.println("글이 수정되었습니다.");
		} else {
			System.out.println("비밀번호가 틀렸습니다.");
		}
		response.sendRedirect("Community/QnAView.jsp?idx=" + qnum + "&pg=<%=pg%>");
	}

}
