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

		int q_num = Integer.parseInt(request.getParameter("q_num"));
		String q_title = request.getParameter("q_title");
		String rq_username = request.getParameter("rq_username");
		String rq_password = request.getParameter("rq_password");
		String rq_content = request.getParameter("rq_content");
		
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		reQnADAO dao =  new reQnADAO();
		reQnADTO dto = new reQnADTO(q_num, q_title + "에 대한 " + rq_username + "님의 답변", rq_username, rq_content, rq_password);
		
		int cnt = dao.insertReQuestions(dto);
		
		if (cnt > 0) {
			System.out.println("답글작성 성공");
		} else {
			System.out.println("답글작성 실패");
		}
		
		out.print("답글 작성 완료");
	}

}
