package com.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class idCheck
 */
@WebServlet("/idCheck")
public class idCheck extends HttpServlet {
    
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		PrintWriter out = response.getWriter();

		String id = request.getParameter("user_id");
		
		UserDAO dao = new UserDAO();
		
		if (dao.idCheck(id)) {
			System.out.println("false");
		}else {
			System.out.println("true");
			out.println("OK");
			out.flush();
		}
	}

}
