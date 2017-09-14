package com.ll.mall.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ll.mall.service.GoodsService;
import com.ll.mall.service.ShopService;
import com.ll.mall.vo.Goods;
import com.ll.mall.vo.Shop;
import com.ll.mall.vo.User;

/**
 * Servlet implementation class SellerServlet
 */
@WebServlet("/seller")
public class SellerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    GoodsService gsv = new GoodsService(); 
    ShopService ssv = new ShopService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellerServlet() {
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
		
		String shopid = request.getParameter("shopid");		
		String order = request.getParameter("order");
		String keyword = request.getParameter("kw");
		String minPrice = request.getParameter("min");
		String maxPrice = request.getParameter("max");
		if(shopid != null){
			int shopid_ = Integer.parseInt(shopid);
			Shop s = ssv.queryShopByid(shopid_);
			request.setAttribute("shop", s);
			List<Goods> topSalenum = ssv.queryShopByOrder(shopid_, "salenum",null,null,null);
			request.setAttribute("topSalenum", topSalenum);
			List<Goods> topLovenum = ssv.queryShopByOrder(shopid_, "lovenum",null,null,null);
			request.setAttribute("topLovenum", topLovenum);
			List<Goods> goodsList = ssv.queryShopByOrder(shopid_, order,keyword,minPrice,maxPrice);
			request.setAttribute("goodsList", goodsList);
			
			String str = "";
			
			if(order==null){
				str = "综合";
			}else if (order.equals("total")){
				str = "综合";
			}else if (order.equals("date")){
				str = "新品";
			}else if(order.equals("salenum")){
				str = "销量";
			}else if (order.equals("price")){
				str = "价格";
			}else if (order.equals("lovenum")){
				str = "收藏";
			}
			request.setAttribute("order", str);
			request.setAttribute("min", minPrice);
			request.setAttribute("max", maxPrice);
			request.setAttribute("kw", keyword);
			request.getRequestDispatcher("/jsp/seller/inSale.jsp").forward(request, response);
		}
	}

	private void insale(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		List<Goods> list = gsv.queryInSaleList(user.getUserid());
		Shop s = ssv.queryShopByid(user.getUserid());
		
		if(list!=null&&s!=null){
			request.setAttribute("shop", s);
			request.setAttribute("salelist", list);
			request.getRequestDispatcher("/jsp/seller/inSale.jsp").forward(request, response);
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
