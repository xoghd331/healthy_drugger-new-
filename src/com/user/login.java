package com.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class login extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
	
		System.out.println("[Login] id : "+id);
		System.out.println("[Login] pw : "+pw);
		
		UserDAO dao = new UserDAO();
		UserDTO dto = new UserDTO(id, pw);
		
		UserDTO info = dao.login(dto);
		System.out.println(info);
		
		if (info != null) {
			System.out.println("로그인 성공");
			
			HttpSession session = request.getSession();
			session.setAttribute("info", info);
		} else {
			System.out.println("로그인 실패");
		}
		response.sendRedirect("main.jsp");
	}

}
