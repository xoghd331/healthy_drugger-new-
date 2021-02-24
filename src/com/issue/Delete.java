package com.issue;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.issue.issueDAO;

@WebServlet("/delete")
public class Delete extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("[Delete]");
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		System.out.println("삭제할 글 번호 : " + idx);
		
		issueDAO dao = new issueDAO();
		
		int cnt = dao.delete(idx);
		
		if (cnt > 0) {
			System.out.println("글 삭제 성공");
		} else {
			System.out.println("글 삭제 실패");
		}
		response.sendRedirect("issue.jsp");
	}

}
