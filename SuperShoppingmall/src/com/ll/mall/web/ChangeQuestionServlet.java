package com.ll.mall.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ll.mall.dao.Account;

@WebServlet("/changeQuestionServlet")
public class ChangeQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ChangeQuestionServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String username = request.getParameter("username");
		String q1 = request.getParameter("question1").trim();
		String q2 = request.getParameter("question2").trim();
		String q3 = request.getParameter("question3").trim();
		
		Account account = new Account();
		account.changeQuestions(username, new String[] {q1, q2, q3});

		request.getRequestDispatcher("/jsp/user/account_security.jsp?username=" + username).forward(request,response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
