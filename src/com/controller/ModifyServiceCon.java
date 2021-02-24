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

@WebServlet("/ModifyServiceCon")
public class ModifyServiceCon extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter script = response.getWriter();
		
		int num = Integer.parseInt(request.getParameter("num"));
		String username = request.getParameter("b_username");
		String password = request.getParameter("b_password");
		String title = request.getParameter("b_title");
		String content = request.getParameter("b_content");
		int idx;
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = new BoardDTO();
		boolean ch = dao.checkPW(num, password);
		
		if (ch == true) {
			dao.modifyWrite(title, content, num);
			
			script.println("<script>");
			script.println("alert('게시물이 수정되었습니다')");
			script.println("location.href='Community/NewView.jsp?idx=" + num + "&pg=<%=pg%>'");
			script.println("</script>");
		} else {
			script.println("<script>");
			script.println("alert('비밀번호를 다시 입력해주십시오')");
			script.println("location.href='Community/NewView.jsp?idx=" + num + "&pg=<%=pg%>'");
			script.println("</script>");
		}
//		response.sendRedirect("Community/NewView.jsp?idx=" + num + "&pg=<%=pg%>");
	}

}
