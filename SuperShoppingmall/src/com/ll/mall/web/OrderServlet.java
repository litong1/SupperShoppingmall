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

import com.ll.mall.dao.CartDao;
import com.ll.mall.dao.DeliverAddress;
import com.ll.mall.dao.GoodsDao;
import com.ll.mall.dao.OrderDao;
import com.ll.mall.vo.Address;
import com.ll.mall.vo.Cart;
import com.ll.mall.vo.Goods;
import com.ll.mall.vo.Order;
import com.ll.mall.vo.User;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/order")
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    CartDao cdao = new CartDao();
    GoodsDao gdao = new GoodsDao();
    OrderDao odao = new OrderDao();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
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
	if ("rightbuy".equals(type)) {
	    rightbuyPage(request, response);
	} else if ("cartbuy".equals(type)) {
	    cartbuy(request, response);
	}

    }

    private void cartbuy(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	// TODO Auto-generated method stub
	HttpSession session = request.getSession();
	User user = (User) session.getAttribute("user");
	int userid_ = user.getUserid();

	String[] orderContents = request.getParameterValues("orderContent");
	List<Integer> cartid = new ArrayList<>();
	List<Integer> goodsNum = new ArrayList<>();
	List<Cart> list = new ArrayList<>();	
	for (String str : orderContents) {
	    
	    String[] con = str.split("/");
	    
	    int id = Integer.parseInt(con[0]);
	    int num = Integer.parseInt(con[1]);
	    cartid.add(id);
	    goodsNum.add(num);

	}

	for (int i = 0; i < cartid.size(); i++) {
	    Cart c = cdao.queryCartById(userid_, cartid.get(i));
	    double goodsTotalPrice = c.getGoodsPrice()*goodsNum.get(i);
	    cdao.updateCartByGoodsNum(userid_, cartid.get(i), goodsNum.get(i),goodsTotalPrice);
	    c = cdao.queryCartById(userid_, cartid.get(i));
	    list.add(c);
	}
	DeliverAddress adao = new DeliverAddress();
	List<Address> address = adao.getDeliverAddress(user.getUsername());
	request.setAttribute("address", address);
	request.setAttribute("cartlist", list);
	request.getRequestDispatcher("/jsp/mall/cartbuy.jsp").forward(request, response);
    }

    private void rightbuyPage(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	String goodsid = request.getParameter("goodsid");
	int goodsid_ = Integer.parseInt(goodsid);
	HttpSession session = request.getSession();
	User user = (User) session.getAttribute("user");
	int userid_ = user.getUserid();
	String shopid = request.getParameter("shopid");
	int shopid_ = Integer.parseInt(shopid);
	String shopname = request.getParameter("shopname");
	System.out.println("shopname:" + shopname);
	Goods g = gdao.queryById(goodsid_);
	String goodsColor = request.getParameter("goodsColor");
	System.out.println("color: " + goodsColor);
	String goodsSize = request.getParameter("goodsSize");
	String goodsNum = request.getParameter("goodsNum");
	int goodsNum_ = Integer.parseInt(goodsNum);

	double goodsTotalPrice_ = g.getPspecPrice() * goodsNum_;
	// 封装参数
	Cart cart = new Cart();
	cart.setGoodsid(goodsid_);
	cart.setUserid(userid_);
	cart.setShopid(shopid_);
	cart.setShopname(shopname);
	cart.setPicPaths(g.getPicPaths());
	cart.setGoodsTitle(g.getGoodsTitle());
	cart.setGoodsPrice(g.getPspecPrice());
	cart.setGoodsColor(goodsColor);
	cart.setGoodsSize(goodsSize);
	cart.setGoodsNum(goodsNum_);
	cart.setGoodsTotalPrice(goodsTotalPrice_);
	Cart c = cdao.insertCart(cart);
	if (c != null) {
	    DeliverAddress adao = new DeliverAddress();
	    List<Address> address = adao.getDeliverAddress(user.getUsername());
	    request.setAttribute("address", address);
	    request.setAttribute("item", c);
	    request.getRequestDispatcher("/jsp/mall/buynow.jsp").forward(request, response);
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
