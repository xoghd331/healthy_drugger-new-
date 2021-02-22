package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.BoardDAO;

@WebServlet("/BoardLikeService")
public class BoardLikeService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bno = Integer.parseInt(request.getParameter("b_num"));
		
		BoardDAO dao = new BoardDAO();
		
		int cnt = dao.update_Like(bno);
		
		if(cnt>0) {
			int like=dao.select_Like(bno);
			
			System.out.println(like);
	
			response.setContentType("text/html; charset=euc-kr");
			
			PrintWriter out = response.getWriter();
			out.print(like);
		}
	}

}
