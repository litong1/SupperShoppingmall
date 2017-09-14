package com.ll.mall.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.ll.core.utils.DateUtil;
import com.ll.core.utils.StringUtil;
import com.ll.mall.service.GoodsService;
import com.ll.mall.vo.Goods;
import com.ll.mall.vo.User;

/**
 * Servlet implementation class PublishServlet
 */
@WebServlet("/publish")
public class PublishServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private GoodsService gsv = new GoodsService();   
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PublishServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 设置编码格式
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF_8");
		response.setContentType("text/html;charset=utf-8");
		String type=request.getParameter("type");
		if("add".equals(type)){
			add(request,response);
		}
		
		
	}

	private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//获取商品参数
		//宝贝类别
		//大类别
		String bigtype = request.getParameter("bigtype");
		//小类别 
		String smalltype = request.getParameter("smalltype");
		//宝贝标题 
		String goodsTitle = request.getParameter("goodsTitle");
		//System.out.println("goodsTitle"+goodsTitle);
		//宝贝货号
		String goodsNo = request.getParameter("goodsNo");
		//宝贝材质
		String goodsMaterial = request.getParameter("goodsMaterial");
		//宝贝品牌
		String goodsBrand = request.getParameter("goodsBrand");
		//宝贝风格
		String goodsStyle = request.getParameter("goodsStyle");
		//适用场景
		String goodsScene = request.getParameter("goodsScene");
		//适用季节
		String goodsSeason = request.getParameter("goodsSeason");
		//适用对象
		String goodsTarget = request.getParameter("goodsTarget");
		//上市时间
		String goodsComedate = request.getParameter("goodsComedate");
				
		//宝贝颜色
		//颜色rgb
		String[] selectColor = request.getParameterValues("selectColor");
		//System.out.println(Arrays.toString(selectColor));
		//颜色名称
		String[] colorName = request.getParameterValues("colorName");
		//颜色备注
		String[] colorRemarks = request.getParameterValues("colorRemarks");
		//宝贝尺寸 
		String[] sizeCheck = request.getParameterValues("sizeCheck");
		
		//宝贝价格
		String pspecPrice = request.getParameter("pspecPrice");
		//宝贝数量
		String pspecNum = request.getParameter("pspecNum");
		//宝贝总数量
		String totalNum = request.getParameter("totalNum");
		
		//封装参数
		Goods g = new Goods();
		g.setBigtype(bigtype);
		g.setSmalltype(smalltype);
		g.setGoodsTitle(goodsTitle);
		g.setGoodsNo(goodsNo);
		g.setGoodsMaterial(goodsMaterial);
		g.setGoodsBrand(goodsBrand);
		g.setGoodsStyle(goodsStyle);
		g.setGoodsScene(goodsScene);
		g.setGoodsSeason(goodsSeason);
		g.setGoodsTarget(goodsTarget);
		g.setGoodsComedate(DateUtil.stringToDate(goodsComedate));
		
		
		g.setSelectColor(StringUtil.arrayToList(selectColor));
		
		g.setColorName(StringUtil.arrayToList(colorName));
		g.setColorRemarks(StringUtil.arrayToList(colorRemarks));
		g.setSizeCheck(StringUtil.arrayToList(sizeCheck));
		if(pspecPrice != null){
			g.setPspecPrice(Double.parseDouble(pspecPrice));
		}
		if(pspecNum != null){
			g.setPspecNum(Integer.parseInt(pspecNum));
		}
		if(totalNum != null){
			g.setTotalNum(Integer.parseInt(totalNum));
		}
		HttpSession session = request.getSession();
    	
		User user = (User) session.getAttribute("user");
		System.out.println(user.getUserid());
		g.setUserId(user.getUserid());
		Goods goods = gsv.addGoods(g);
		if(goods != null){
		
			request.setAttribute("goods", goods);
			request.getRequestDispatcher("/jsp/seller/publish_image.jsp").forward(request, response);
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
