package com.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/update")
public class update extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("ȸ�� ���� ����");
		
		HttpSession session = request.getSession();
		
		UserDTO info = (UserDTO)session.getAttribute("info");
		
		request.setCharacterEncoding("euc-kr");
		
		String id = info.getId();
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String license = request.getParameter("license");
		
		System.out.println("[Update] email : "+id);
		System.out.println("[Update] pw : "+pw);
		System.out.println("[Update] tel : "+tel);
		System.out.println("[Update] license : "+license);
		
		UserDAO dao = new UserDAO();
		UserDTO updateInfo = new UserDTO(id, pw, tel, license);
		
		int cnt = dao.update(updateInfo);
		
		if(cnt > 0) {
			System.out.println("���� ����");
			
			session.setAttribute("info", updateInfo);
			
		}else {
			System.out.println("���� ����");
		}
		response.sendRedirect("main.jsp");
	}

}
