package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.CommDAO;
import com.model.CommDTO;

@WebServlet("/AdminCommDeleteServiceCon")
public class AdminCommDeleteServiceCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		int cnum = Integer.parseInt(request.getParameter("Cnum"));
		int bnum = Integer.parseInt(request.getParameter("Bnum"));
		String password = request.getParameter("password");
		int idx;
		
		CommDAO dao = new CommDAO();
		CommDTO dto = new CommDTO();
		
		dao.deleteComm(cnum);
			
		response.sendRedirect("View3.jsp?idx=" + bnum + "&pg=<%=pg%>");
	}

}
