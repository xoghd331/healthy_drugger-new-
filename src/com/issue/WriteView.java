package com.issue;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/WriteView")
public class WriteView extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		issueDAO dao = new issueDAO();
		HttpSession session = request.getSession();
		
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		String user_id = null;
		
		if(session.getAttribute("user_id") != null){
			user_id = (String)session.getAttribute("user_id");
		}
		
		// idx를 초기화 시키고
		// 'idx'라는 데이터가 넘어온 것이 존재한다면 캐스팅을 하여 변수에 담는다
		int idx = 0;
		
		if(request.getParameter("idx") != null){
			idx = Integer.parseInt(request.getParameter("idx"));
		}
		
		// 만약 넘어온 데이터가 없다면
		if(idx == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다')");
			script.println("location.href='issue_view.jsp'");
			script.println("</script");
		}
		
		// 유효한 글이라면 구체적인 정보를 'dto'라는 인스턴스에 담는다
		issueDTO dto = dao.getIssueDTO(idx);
		request.setAttribute("dto", dto);
		String title = dto.getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
		dto.setTitle(title);
		String content = dto.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
		dto.setContent(content);
		RequestDispatcher rd = request.getRequestDispatcher("/issue_view.jsp");
		rd.forward(request, response);
	
	}

}
