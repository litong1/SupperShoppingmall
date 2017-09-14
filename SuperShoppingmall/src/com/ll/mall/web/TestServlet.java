package com.ll.mall.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ll.mall.dao.Account;
import com.ll.mall.service.UserService;
import com.ll.mall.vo.User;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/test")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Account dao = new Account();
	UserService usv = new UserService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 设置编码
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String type = request.getParameter("type");
		
		if("test".equals(type)){
			test(request,response);
		}else if("forget".equals(type)){
			forget(request,response);
		}
		
	}

	private void test(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		User user = usv.queryUserByName(username);
		String an1 = dao.testPassword(1, user.getUserid());
		String an2 = dao.testPassword(2, user.getUserid());
		String an3 = dao.testPassword(3, user.getUserid());
		
		String in1 = request.getParameter("input1");
		String in2 = request.getParameter("input2");
		String in3 = request.getParameter("input3");
		
		if(an1.equals(in1)&&an2.equals(in2)&&an3.equals(in3)){
			
			request.getRequestDispatcher("/jsp/user/change_pwd.jsp").forward(request, response);
		}else{
			request.setAttribute("error", "你答案输错了。");
			request.getRequestDispatcher("/jsp/user/testQuestion.jsp").forward(request, response);
			
		}
		
	}

	private void forget(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		
		boolean flag = usv.havaRegistered(username);
		if(!flag){
			request.setAttribute("forget", "你尚未注册。");
		}else{
			User user = usv.queryUserByName(username);
			if(user.getIsquestion()==0){
				request.setAttribute("forget", "你尚未设置密保。");
			}else if(user.getIsquestion()==1){
				request.setAttribute("username", username);
				request.getRequestDispatcher("/jsp/user/testQuestion.jsp").forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
