package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.BoardDAO;
import com.model.BoardDTO;

@WebServlet("/DeleteServiceCon")
public class DeleteServiceCon extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter script = response.getWriter();
		
		String username = request.getParameter("b_username");
		int num = Integer.parseInt(request.getParameter("num"));
		String password = request.getParameter("b_password");

		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		boolean ch = dao.checkPW(num, password);
		
		if (ch == true) {
			dao.deleteWrite(num);
			
			script.println("<script>");
			script.println("alert('�Խù��� �����Ǿ����ϴ�')");
			script.println("location.href='Community/List3.jsp'");
			script.println("</script>");
		} else {
			script.println("<script>");
			script.println("alert('��й�ȣ�� �ٽ� �Է����ֽʽÿ�')");
			script.println("history.back()");
			script.println("</script>");
		}
//		response.sendRedirect("Community/List3.jsp");
	}
	

}
