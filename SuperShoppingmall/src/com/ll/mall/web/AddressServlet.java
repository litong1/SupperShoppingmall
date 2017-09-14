package com.ll.mall.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ll.mall.dao.DeliverAddress;
import com.ll.mall.vo.Address;

@WebServlet("/AddressServlet")
public class AddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddressServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String username = request.getParameter("username");
		String location = request.getParameter("location");
		String detailedaddress = request.getParameter("detailedaddress");
		int postalcode = Integer.parseInt(request.getParameter("postalcode"));
		String consigneename = request.getParameter("consigneename");
		String tel = request.getParameter("tel");
		String isdefault = request.getParameter("isdefault");
		Address a = new Address();
		a.setLocation(location);
		a.setConsigneeName(consigneename);
		a.setDetailAddress(detailedaddress);
		a.setPostalCode(postalcode);
		a.setTel(tel);
		a.setIsDefault("on".equals(isdefault) ? 1 : 0);
		DeliverAddress deliverAddress = new DeliverAddress();
		if (deliverAddress.saveAddress(username, a)) {
			request.getRequestDispatcher("/jsp/user/deliver_address.jsp?username=" + username).forward(request,response);
		} else {
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
