package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.BoardDAO;


@WebServlet("/BoardDisLikeService")
public class BoardDisLikeService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter script = response.getWriter();
		
		int bno = Integer.parseInt(request.getParameter("b_num"));
		
		BoardDAO dao = new BoardDAO();
		
		int cnt = dao.update_disLike(bno);
		
		if(cnt>0) {
			
			int like=dao.select_Like(bno);
			
			System.out.println(like);
	
			script.println("<script>");
			script.println("alert('좋아요 취소')");
			script.println("</script>");
			
			script.print(like);
		}
	}

}
