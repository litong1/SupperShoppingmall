package com.ll.mall.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ll.mall.dao.CartDao;
import com.ll.mall.dao.OrderDao;
import com.ll.mall.vo.Cart;
import com.ll.mall.vo.Order;
import com.ll.mall.vo.User;

/**
 * Servlet implementation class OrderListServlet
 */
@WebServlet("/orderList")
public class OrderListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    OrderDao odao = new OrderDao();
    CartDao cdao = new CartDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderListServlet() {
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
	
	HttpSession session = request.getSession();
	User user = (User) session.getAttribute("user");
	int userid_ = user.getUserid();
	List<Order> list = odao.queryOrderListByUserid(userid_);
	
	if(list!=null){
	    System.out.println("ooo"+list.size());
		for (Order o : list) {
		    int cartid = o.getOrderContent();
		    Cart c = cdao.queryCartById(userid_, cartid);
		    System.out.println("id"+c.getGoodsid());
		    o.setGoodsid(c.getGoodsid());
		    o.setShopid(c.getShopid());
		    o.setShopname(c.getShopname());
		    o.setPicPaths(c.getPicPaths());
		    o.setGoodsTitle(c.getGoodsTitle());
		    o.setGoodsPrice(c.getGoodsPrice());
		    o.setGoodsColor(c.getGoodsColor());
		    o.setGoodsSize(c.getGoodsSize());
		    o.setGoodsNum(c.getGoodsNum());
		    o.setGoodsTotalPrice(c.getGoodsTotalPrice());
		}
		request.setAttribute("orderlist", list);
		request.getRequestDispatcher("/jsp/user/itemlist.jsp").forward(request, response);
	}else{
	    System.out.println("null");
	}
	
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
