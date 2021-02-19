package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.CommDAO;
import com.model.CommDTO;

@WebServlet("/CommModifyServiceCon")
public class CommModifyServiceCon extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		int cnum = Integer.parseInt(request.getParameter("Cnum"));
		int bnum = Integer.parseInt(request.getParameter("Bnum"));
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String content = request.getParameter("content");
		
		CommDAO dao = new CommDAO();
		CommDTO dto = new CommDTO();
		boolean ch = dao.checkPW(cnum, password);
		
		if (ch == true) {
			dao.modifyComm(content, cnum);
			
			System.out.println("댓글이 수정되었습니다.");
		} else {
			System.out.println("비밀번호가 틀렸습니다.");
		}
		response.sendRedirect("Community/View3.jsp?idx=" + bnum + "&pg=<%=pg%>");
	}

}
