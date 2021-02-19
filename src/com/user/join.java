package com.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/join")
public class join extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String license = request.getParameter("license");

		System.out.println("[Join] email : "+id);
		System.out.println("[Join] pw : "+pw);
		System.out.println("[Join] tel : "+tel);
		System.out.println("[Join] addr : "+license);
		
		UserDAO dao = new UserDAO();
		UserDTO dto = new UserDTO(id, pw, tel, license);

		int cnt = dao.join(dto);

		if (cnt > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			System.out.println("회원가입 성공!");
			response.sendRedirect("login-join/login.jsp");
		}else {
			System.out.println("회원가입 실패!");
			response.sendRedirect("login-join/join.jsp");
		}
	}

}
