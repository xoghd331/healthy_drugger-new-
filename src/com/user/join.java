package com.user;

import java.io.IOException;
import java.io.PrintWriter;

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
		
		PrintWriter out = response.getWriter();

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String license = request.getParameter("license");
		String name = request.getParameter("name");

		System.out.println("[Join] email : "+id);
		System.out.println("[Join] pw : "+pw);
		System.out.println("[Join] tel : "+tel);
		System.out.println("[Join] license : "+license);
		System.out.println("[Join] name : "+name);
		
		UserDAO dao = new UserDAO();
		UserDTO dto = new UserDTO(id, pw, tel, license, name);

		int cnt = dao.join(dto);
		
		if (dao.idCheck(id)) {
			out.println(id + "�� �̹� �����ϴ� ���̵� �Դϴ�.");
		}else {
			out.println(id + "�� ��� ������ ���̵� �Դϴ�.");
		}

		if (cnt > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			System.out.println("ȸ������ ����!");
			response.sendRedirect("login-join/login.jsp");
		}else {
			System.out.println("ȸ������ ����!");
			response.sendRedirect("login-join/join.jsp");
		}
	}

}
