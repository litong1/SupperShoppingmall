package com.ll.mall.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ll.core.utils.StringUtil;
import com.ll.mall.dao.CartDao;
import com.ll.mall.dao.GoodsDao;
import com.ll.mall.dao.LoveDao;
import com.ll.mall.vo.Cart;
import com.ll.mall.vo.Goods;
import com.ll.mall.vo.Shop;
import com.ll.mall.vo.User;

import net.sf.json.JSONObject;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    CartDao cdao = new CartDao(); 
    GoodsDao gdao = new GoodsDao();
    LoveDao ldao = new LoveDao(); 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
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
		//System.out.println("type: "+type);
		if("add".equals(type)){
			add(request,response);
		}else if("list".equals(type)){
			list(request,response);
		}else if("delete".equals(type)){
			delete(request,response);
		}else if("listjson".equals(type)){
			listjson(request,response);
		}else if("indexdelete".equals(type)){
			indexdelete(request,response);
		}else if("intolove".equals(type)){
			intolove(request,response);
		}
	}
	/**
	 * 移入收藏夹
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	private void intolove(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stubString goodsid = request.getParameter("goodsid");
		String goodsid = request.getParameter("goodsid");
		int goodsid_ = Integer.parseInt(goodsid);
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		int userid = user.getUserid();		
		Goods goods = gdao.queryById(goodsid_);		
		boolean isLove = ldao.queryLoveGoods(goodsid_,userid );
		PrintWriter pw = response.getWriter();
		if (isLove) {
			pw.println("你已经收藏了此商品...");			
		} else {
					
			boolean flag1 = ldao.insertLoveGoods(goods, userid);			
			boolean flag2 =gdao.inLovenum(goodsid_);
			boolean flag3 = cdao.deleteCart(user.getUserid(), goodsid_);
			if (flag1&&flag2&flag3) {								
				
				pw.print("收藏商品成功！");				
			}
		}
		pw.print("1秒后自动跳转上一页");		
		
		String str = "1;URL=/SuperShoppingmall/cart?type=list&userid="+user.getUserid();
		response.setHeader("Refresh",str);
		
	}

	private void indexdelete(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");	
		String goodsid = request.getParameter("goodsid");
		int goodsid_ = Integer.parseInt(goodsid);
		if(cdao.deleteCart(user.getUserid(), goodsid_)){
			request.getRequestDispatcher("/index").forward(request, response);
		}
		
	}

	private void listjson(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");		
		List<Cart> list = cdao.queryCartList(user.getUserid());
		PrintWriter out=response.getWriter();
        JSONObject json =new JSONObject();//定义一个json对象
		if(list != null){
			json.put("list", list);
			//System.out.println(json.toString());
		    out.write(json.toString());//将数据以json的格式输出到ajax的回调函数。
		}
		
	}

	/**
	 * 从购物车中删除
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String goodsid = request.getParameter("goodsid");
		int goodsid_ = Integer.parseInt(goodsid);
		boolean flag = cdao.deleteCart(user.getUserid(), goodsid_);
		if(flag){
			response.sendRedirect("/SuperShoppingmall/cart?type=list&userid="+user.getUserid());
		}
	}

	/**
	 * 购物车列表
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");	
		List<Cart> list = cdao.queryCartList(user.getUserid());
		if(list != null){
			System.out.println("111");
			request.setAttribute("list", list);	   
			request.getRequestDispatcher("/jsp/mall/cart.jsp").forward(request, response);
		}
	}

	private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String goodsid = request.getParameter("goodsid");
		int goodsid_ = Integer.parseInt(goodsid);
		String userid = request.getParameter("userid");
		int userid_ = Integer.parseInt(userid);
		String shopid = request.getParameter("shopid");
		int shopid_ = Integer.parseInt(shopid);
		String shopname = request.getParameter("shopname");
		Goods g = gdao.queryById(goodsid_);
		String goodsColor = request.getParameter("goodsColor");
		//System.out.println("color: "+goodsColor);
		String goodsSize = request.getParameter("goodsSize");
		String goodsNum = request.getParameter("goodsNum");
		int goodsNum_ = Integer.parseInt(goodsNum);
		
		double goodsTotalPrice_ = g.getPspecPrice()*goodsNum_;		
		//封装参数
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
		if(c!= null){
			request.setAttribute("cart", c);
			request.getRequestDispatcher("/jsp/mall/addCartSucceed.jsp").forward(request, response);
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
