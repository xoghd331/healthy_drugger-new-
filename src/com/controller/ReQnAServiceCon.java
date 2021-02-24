package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.reQnADAO;
import com.model.reQnADTO;

@WebServlet("/ReQnAServiceCon")
public class ReQnAServiceCon extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter script = response.getWriter();

		int q_num = Integer.parseInt(request.getParameter("q_num"));
		String q_title = request.getParameter("q_title");
		String rq_username = request.getParameter("rq_username");
		String rq_password = request.getParameter("rq_password");
		String rq_content = request.getParameter("rq_content");
		
		reQnADAO dao =  new reQnADAO();
		reQnADTO dto = new reQnADTO(q_num, q_title + "에 대한 " + rq_username + "님의 답변", rq_username, rq_content, rq_password);
		
		int cnt = dao.insertReQuestions(dto);
		
		if (cnt > 0) {
			script.print("답글이 작성되었습니다");

		} else {
			script.print("답글 작성에 실패했습니다");

		}
		
	}

}
