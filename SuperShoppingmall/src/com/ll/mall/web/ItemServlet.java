package com.ll.mall.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ll.mall.service.GoodsService;
import com.ll.mall.service.ShopService;
import com.ll.mall.vo.Goods;
import com.ll.mall.vo.Shop;

import jdk.nashorn.internal.parser.JSONParser;

/**
 * Servlet implementation class ItemServlet
 */
@WebServlet("/item")
public class ItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GoodsService gsv = new GoodsService();
	ShopService ssv = new ShopService();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemServlet() {
        super();
        System.out.println();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 设置编码
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String gid = request.getParameter("gid");
		String shopid = request.getParameter("shopid");
		System.out.println("shopid:" + shopid);
		System.out.println();
		if(gid != null && shopid !=null){
		Goods g = gsv.queryById(Integer.parseInt(gid));	
		Shop s = ssv.queryShopByid(Integer.parseInt(shopid));
		request.setAttribute("goods", g);
		request.setAttribute("shop", s);
		request.getRequestDispatcher("/jsp/mall/item.jsp").forward(request, response);
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
