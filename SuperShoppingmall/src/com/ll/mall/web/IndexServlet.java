package com.ll.mall.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ll.mall.service.GoodsService;
import com.ll.mall.vo.Goods;

/**
 * Servlet implementation class IndexServlet
 */
@WebServlet("/index")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GoodsService gsv = new GoodsService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 设置编码
		//System.out.println("index");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		
		//男装
		List<Goods> listman = gsv.queryMallListByBigType("男装");
		request.setAttribute("listman", listman);
		//System.out.println("listman: "+listman);
		//男鞋	
		List<Goods> listmshoes = gsv.queryMallListByBigType("流行男鞋");
		request.setAttribute("listmshoes", listmshoes);
		//女装		
		List<Goods> listwoman = gsv.queryMallListByBigType("女装/女士精品");
		request.setAttribute("listwoman", listwoman);
		
		//女鞋		
		List<Goods> listwshoes = gsv.queryMallListByBigType("女鞋");
		request.setAttribute("listwshoes", listwshoes);
		//内衣	
		List<Goods> listunder = gsv.queryMallListByBigType("内衣");
		request.setAttribute("listunder", listunder);
		//皮带/帽子/围巾
		List<Goods> listorna = gsv.queryMallListByBigType("皮带/帽子/围巾");
		request.setAttribute("listorna", listorna);
		forword(request, response);
	}

	private void forword(HttpServletRequest request, HttpServletResponse response) {
	
			try {
				request.getRequestDispatcher("/jsp/mall/index.jsp").forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
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
