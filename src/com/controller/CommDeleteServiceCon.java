package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.CommDAO;
import com.model.CommDTO;

@WebServlet("/CommDeleteServiceCon")
public class CommDeleteServiceCon extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter script = response.getWriter();
		
		int cnum = Integer.parseInt(request.getParameter("Cnum"));
		int bnum = Integer.parseInt(request.getParameter("Bnum"));
		String password = request.getParameter("c_password");
		int idx;
		
		CommDAO dao = new CommDAO();
		CommDTO dto = new CommDTO();
		boolean ch = dao.checkPW(cnum, password);
		
		if (ch == true) {
			dao.deleteComm(cnum);
			
			script.println("<script>");
			script.println("alert('댓글이 삭제되었습니다')");
			script.println("location.href='Community/NewView.jsp?idx=" + bnum + "&pg=<%=pg%>'");
			script.println("</script>");
		} else {
			script.println("<script>");
			script.println("alert('비밀번호를 다시 입력해주십시오')");
			script.println("history.back()");
			script.println("</script>");
		}
	}

}
