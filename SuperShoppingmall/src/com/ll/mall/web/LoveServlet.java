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

import com.ll.mall.dao.GoodsDao;
import com.ll.mall.dao.LoveDao;
import com.ll.mall.dao.ShopDao;
import com.ll.mall.vo.Goods;
import com.ll.mall.vo.Shop;
import com.ll.mall.vo.User;

/**
 * Servlet implementation class LoveServlet
 */
@WebServlet("/love")
public class LoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    LoveDao ldao = new LoveDao(); 
    GoodsDao gdao = new GoodsDao();
    ShopDao sdao = new ShopDao();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoveServlet() {
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
		}else if("goodslist".equals(type)){
			goodslist(request,response);
		}else if("shoplist".equals(type)){
			shoplist(request,response);
		}else if("deletegoods".equals(type)){
			deletegoods(request,response);
		}else if("deleteshop".equals(type)){
			deleteshop(request,response);
		}
		
	}


	/**
	 * 取消收藏商品
	 * @throws IOException 
	 */
	private void deletegoods(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String goodsid = request.getParameter("goodsid");
		int goodsid_ = Integer.parseInt(goodsid);
		User user = getUser(request);
		int userid = user.getUserid();	
		boolean flag1 = ldao.deleteLovegoods(goodsid_, userid);
		boolean flag2 =gdao.deLovenum(goodsid_);
		if(flag1&&flag2){
			PrintWriter pw = response.getWriter();		
			pw.println("已从收藏夹中删除此商品...");	
			pw.print("2秒后自动跳转上一页");		
			response.setHeader("Refresh","2;URL=/SuperShoppingmall/love?type=goodslist");
		}
		
		
	}

	/**
	 * 取消收藏店铺
	 * @throws IOException 
	 */
	private void deleteshop(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String shopid = request.getParameter("shopid");
		int shopid_ = Integer.parseInt(shopid);
		User user = getUser(request);
		int userid = user.getUserid();	

		if(ldao.deleteLoveshop(shopid_, userid)){
			PrintWriter pw = response.getWriter();		
			pw.println("已从收藏夹中删除此店铺...");	
			pw.print("2秒后自动跳转上一页");		
			response.setHeader("Refresh","2;URL=/SuperShoppingmall/love?type=shoplist");
		}
		
	}

	private void goods(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		String goodsid = request.getParameter("goodsid");
		int goodsid_ = Integer.parseInt(goodsid);
		User user = getUser(request);
		int userid = user.getUserid();		
		Goods goods = gdao.queryById(goodsid_);		
		boolean isLove = ldao.queryLoveGoods(goodsid_,userid );
		PrintWriter pw = response.getWriter();
		if (isLove) {
			pw.println("你已经收藏了此商品...");			
		} else {
					
			boolean flag1 = ldao.insertLoveGoods(goods, userid);			
			boolean flag2 =gdao.inLovenum(goodsid_);
			if (flag1&&flag2) {								
				
				pw.print("收藏商品成功！");				
			}
		}
		pw.print("2秒后自动跳转上一页");		
		Shop shop = sdao.queryShopByid(goods.getUserId());
		String str = "2;URL=/SuperShoppingmall/item?gid="+goodsid+"&shopid="+shop.getShopid();
		response.setHeader("Refresh",str);

	}

	private void shop(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		String shopid = request.getParameter("shopid");
		int shopid_ = Integer.parseInt(shopid);
		User user = getUser(request);
		int userid = user.getUserid();
		Shop shop = sdao.queryShopByid(shopid_);		
		boolean isLove = ldao.queryLoveshop(shopid_,userid);
		PrintWriter pw = response.getWriter();
		if (isLove) {
			pw.println("你已经收藏了此店铺...");			
		} else {
							
			boolean flag1 = ldao.insertLoveshop(shop, userid);					
			if (flag1) {											
				pw.print("收藏店铺成功！");				
			}
		}
		pw.print("2秒后自动跳转上一页");		
		String str = "2;URL=/SuperShoppingmall/shop?shopid="+shopid;
		response.setHeader("Refresh",str);

	}
	private void goodslist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = getUser(request);
		List<Goods> list = ldao.queryLoveGoodsList(user.getUserid());
		request.setAttribute("goodslist", list);
		request.getRequestDispatcher("/jsp/user/lovegoods.jsp").forward(request, response);
	}

	private void shoplist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = getUser(request);
		List<Shop> list = ldao.queryLoveShopList(user.getUserid());
		request.setAttribute("shoplist", list);
		request.getRequestDispatcher("/jsp/user/loveshop.jsp").forward(request, response);
		
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	/**
	 * 得到当前User对象
	 * @param request
	 * @return
	 */
	private User getUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		return user;
	}
}
