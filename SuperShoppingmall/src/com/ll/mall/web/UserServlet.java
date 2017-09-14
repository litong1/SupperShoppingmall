package com.ll.mall.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ll.core.utils.DateUtil;
import com.ll.mall.service.ShopService;
import com.ll.mall.service.UserService;
import com.ll.mall.vo.Shop;
import com.ll.mall.vo.User;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/user")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService usv = new UserService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 设置编码格式
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF_8");
		response.setContentType("text/html;charset=utf-8");

		// 判断是注册还是登录
		String type = request.getParameter("type");
		System.out.println("type" + type);
		if ("reg".equals(type)) {
			reg(request, response);
		} else if ("login".equals(type)) {
			login(request, response);
		} else if ("logout".equals(type)) {
			// 退出
			request.getSession().invalidate();
			// 跳转至登录页面
			response.sendRedirect("jsp/mall/index.jsp");
		}else if("modifyrole".equals(type)){
			modifyrole(request, response);
		}
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User user = usv.login(username, password);
		System.out.println(user==null);
		if(username == "" || username == null){
			request.setAttribute("msgn", "请输入用户名！");
			request.getRequestDispatcher("/jsp/regandlog/login.jsp").forward(request, response);
		}else if(password == "" || password == null) {
			request.setAttribute("msgp", "请输入密码！");
			request.getRequestDispatcher("/jsp/regandlog/login.jsp").forward(request, response);
		}else if(user != null){
			
			HttpSession session = request.getSession();
        	//System.out.println(user.getRole());
			session.setAttribute("user", user);
    		// 转发   		
			request.getRequestDispatcher("/index").forward(request, response);
		}else if(user == null){
			request.setAttribute("msgrs", "用户密码不匹配，请重新输入");
			
			request.getRequestDispatcher("/jsp/regandlog/login.jsp").forward(request, response);
		}
	}

	private void reg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String regname = request.getParameter("regname");
		System.out.println(regname);
		String pwd = request.getParameter("pwd");
		String pwdRepeat = request.getParameter("pwdRepeat");
		if (regname == "" || regname == null) {
			request.setAttribute("msgn", "请输入用户名！");
			request.getRequestDispatcher("/jsp/regandlog/register.jsp").forward(request, response);
		} else if (regname.length() < 4) {
			request.setAttribute("msgn", "长度只能在4-20个字符之间");
			request.getRequestDispatcher("/jsp/regandlog/register.jsp").forward(request, response);
		} else if (regname.matches("[0-9]+")) {
			request.setAttribute("msgn", "用户名不能是纯数字");
			request.getRequestDispatcher("/jsp/regandlog/register.jsp").forward(request, response);
		} else if (pwd == "" || pwd == null) {
			request.setAttribute("msgp", "请输入密码！");
			request.getRequestDispatcher("/jsp/regandlog/register.jsp").forward(request, response);
		} else if (pwd.length() < 6) {
			request.setAttribute("msgp", "长度只能在6-20个字符之间");
			request.getRequestDispatcher("/jsp/regandlog/register.jsp").forward(request, response);
		} else if (pwd.matches("[0-9]+")) {
			request.setAttribute("msgn", "密码不能是纯数字");
			request.getRequestDispatcher("/jsp/regandlog/register.jsp").forward(request, response);
		} else if (pwdRepeat == "" || pwdRepeat == null) {
			request.setAttribute("msgr", "请再次输入密码");
			request.getRequestDispatcher("/jsp/regandlog/register.jsp").forward(request, response);
		} else if (!pwdRepeat.equals(pwd)) {
			request.setAttribute("msgr", "两次输入密码不一致");
			request.getRequestDispatcher("/jsp/regandlog/register.jsp").forward(request, response);
		}else if(usv.havaRegistered(regname)){
			request.setAttribute("msgr", "用户名已被注册");
			request.getRequestDispatcher("/jsp/regandlog/register.jsp").forward(request, response);
		} else {
			User user = new User();
			user.setUsername(regname);
			user.setPassword(pwd);
			User u = usv.register(user);
			if(u!=null){
			    System.out.println(getServletContext().getRealPath("./"));
			request.getRequestDispatcher("/jsp/regandlog/login.jsp").forward(request, response);
			}
		}
		
	}
	/**
	 * 修改用户角色
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void modifyrole(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String username = request.getParameter("username");
		ShopService ssv = new ShopService();
		if(userid != null){
			int userid_ = Integer.parseInt(userid);
			boolean flag = usv.modifyRole(userid_);
			if(flag){
				Shop shop = new Shop();
				shop.setShopid(userid_);
				shop.setMastername(username);
				Date dt=new Date();
				SimpleDateFormat matter1=new SimpleDateFormat("yyyy-MM-dd");
				String sdt= matter1.format(dt);
				Date date = DateUtil.stringToDate(sdt);
				shop.setShopbt(date);
				System.out.println(date);
				Shop sh = ssv.addShop(shop);
				if(sh != null){
				request.getRequestDispatcher("/index").forward(request, response);
				}
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
