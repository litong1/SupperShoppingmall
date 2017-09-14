package com.ll.mall.web;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ll.core.utils.DateUtil;
import com.ll.mall.dao.CartDao;
import com.ll.mall.dao.OrderDao;
import com.ll.mall.vo.Cart;
import com.ll.mall.vo.Order;
import com.ll.mall.vo.User;

/**
 * Servlet implementation class SubmitOrder
 */
@WebServlet("/submitOrder")
public class SubmitOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    CartDao cdao = new CartDao();
    OrderDao odao = new OrderDao();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitOrderServlet() {
	super();
	// TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	// 设置编码
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=utf-8");
	String type = request.getParameter("type");
	if ("single".equals(type)) {
	    single(request, response);
	} else if ("cart".equals(type)) {
	    cart(request, response);
	}
    }

    private void single(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	HttpSession session = request.getSession();
	User user = (User) session.getAttribute("user");
	int userid_ = user.getUserid();

	String address = request.getParameter("address");

	String cartid = request.getParameter("cartid");
	int cartid_ = Integer.parseInt(cartid);

	String goodsNum = request.getParameter("goodsNum");
	int goodsNum_ = Integer.parseInt(goodsNum);

	String goodsTotalPrice = request.getParameter("goodsTotalPrice");
	double goodsTotalPrice_ = Double.parseDouble(goodsTotalPrice);

	Cart c = cdao.queryCartById(userid_, cartid_);
	c.setGoodsNum(goodsNum_);
	c.setGoodsTotalPrice(goodsTotalPrice_);
	Cart newC = cdao.insertCart(c);
	Order order = new Order();
	order.setUserid(userid_);
	order.setOrderContent(newC.getCartid());
	Date d = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String now = sdf.format(d);
	System.out.println(now);
	order.setOrderDate(now);
	order.setOrderState("待支付");
	order.setAddressContent(address);
	Order order_ = odao.addOrder(order);
	if (order_ != null) {
	    request.getRequestDispatcher("/orderList").forward(request, response);
	}
    }

    private void cart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	HttpSession session = request.getSession();
	User user = (User) session.getAttribute("user");
	int userid_ = user.getUserid();
	
	String address[] = request.getParameterValues("address");
	System.out.println("address"+address[1]);
	String[] cartid = request.getParameterValues("cartid");
	String[] goodsNum = request.getParameterValues("goodsNum");
	String[] goodsTotalPrice = request.getParameterValues("goodsTotalPrice");
	
	List<Order> list = new ArrayList<>();
	for (int i = 0; i < cartid.length; i++) {
	    int id = Integer.parseInt(cartid[i]);
	    int num = Integer.parseInt(goodsNum[i]);
	    double total = Double.parseDouble(goodsTotalPrice[i]);	  
	    cdao.updateCartByGoodsNum(userid_, id, num,total);
	    Order order = new Order();
	    order.setUserid(userid_);
	    order.setOrderContent(id);
	    Date d = new Date();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    String now = sdf.format(d);
	    order.setOrderDate(now);
	    order.setOrderState("待支付");
	    order.setAddressContent(address[i]);
	    odao.addOrder(order);
	    list.add(order);
	}
	System.out.println("size"+list.size());
	request.setAttribute("orderlist", list);
	System.out.println(list.toString());
	request.getRequestDispatcher("/orderList").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {

	doGet(request, response);
    }

}
