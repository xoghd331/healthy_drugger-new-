package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.CommDAO;

@WebServlet("/CommLikeService")
public class CommLikeService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bno = Integer.parseInt(request.getParameter("c_num"));
		
		CommDAO dao = new CommDAO();
		
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
