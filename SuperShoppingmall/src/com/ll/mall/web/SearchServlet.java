package com.ll.mall.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ll.mall.service.GoodsService;
import com.ll.mall.service.ShopService;
import com.ll.mall.vo.Goods;
import com.ll.mall.vo.Shop;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/search")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    GoodsService gsv = new GoodsService();  
    ShopService ssv = new ShopService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
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
		if("goods".equals(type)){
			goods(request,response);
		}else if("shop".equals(type)){
			shop(request,response);
		}
	}

	private void goods(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String order = request.getParameter("order");
		String keyword = request.getParameter("kw");
		String minPrice = request.getParameter("min");
		String maxPrice = request.getParameter("max");
		System.out.println(order);
		List<Goods> goodslist = gsv.queryMallByOrder(order, keyword, minPrice, maxPrice);
		request.setAttribute("goodslist", goodslist);

		String str = "";

		if (order == null) {
			str = "综合";
		} else if (order.equals("total")) {
			str = "综合";
		} else if (order.equals("date")) {
			str = "新品";
		} else if (order.equals("salenum")) {
			str = "销量";
		} else if (order.equals("price")) {
			str = "价格";
		} else if (order.equals("lovenum")) {
			str = "收藏";
		}
		request.setAttribute("order", str);
		request.setAttribute("min", minPrice);
		request.setAttribute("max", maxPrice);
		request.setAttribute("kw", keyword);
		request.getRequestDispatcher("/jsp/mall/searchGoods.jsp").forward(request, response);
		
		
	}

	private void shop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String keyword = request.getParameter("kw");
		List<Shop> list = ssv.queryMallListBykw(keyword);
 		if(list != null){
			request.setAttribute("shoplist", list);
			request.setAttribute("keyword", keyword);
			request.getRequestDispatcher("/jsp/mall/searchShop.jsp").forward(request, response);;
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
