package com.ll.mall.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.ll.mall.service.GoodsService;
import com.ll.mall.vo.Goods;



/**
 * Servlet implementation class LIstServlet
 */
@WebServlet("/list")
public class ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    GoodsService gsv = new GoodsService();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListServlet() {
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
		String type = "";
		List<Goods> list = new ArrayList<Goods>();
		  
		String[] m_clo = { "男装","衬衫", "风衣", "夹克", "棉裤", "毛呢大衣", "棉衣", "民族服装",
						"牛仔裤", "Polo衫", "皮裤", "皮衣", "T恤", "套装", "卫衣", "休闲裤",
						"西服", "西裤", "西服套装", "羽绒裤", "羽绒服", "针织衫/毛衣" };
		String[] m_sho = { "流行男鞋","低帮鞋", "帆布鞋","网鞋","高帮鞋", "凉鞋", "拖鞋","皮鞋","靴子", "雨鞋" };
		String[] w_clo = {"女装/女士精品", "半身裙", "背心吊带", "衬衫", "短外套", "大码女装", "风衣",
						"婚纱/旗袍/礼服", "裤子", "连衣裙", "蕾丝衫/雪纺衫", "马夹", "毛针织衫", "毛衣",
						"毛呢外套", "棉衣/棉服", "抹胸", "牛仔裤", "皮衣", "皮草", "T恤",
						"套装/学生制服/工作制服", "唐装/民族服装/舞台服装", "卫衣/绒衫", "西装", "羽绒服",
						"中老年女装" };
		String[] w_sho = {"女鞋", "低帮鞋", "帆布鞋","高帮鞋", "高跟鞋","凉鞋", "拖鞋", "靴子",
						"雨鞋" };
		String[] u_clo = {"内衣", "保暖上装", "保暖裤", "保暖套装", "插片/胸垫", "短袜/打底袜/丝袜/美腿袜",
						"吊带/背心/T恤", "肚兜", "吊袜带", "搭扣", "肩带", "抹胸", "内裤", "乳贴",
						"塑身上衣", "塑身美体裤", "塑身连体衣", "睡衣上装", "睡裤/家居裤", "睡裙", "睡袍",
						"文胸", "文胸套装" };
		String[] d_clo = {"皮带/帽子/围巾", "耳套", "婚纱礼服配件", "口袋巾", "领带夹", "帽子", "手套", "手帕",
						"围巾/丝巾/披肩", "袖扣", "鞋/皮带 配件", "腰带/皮带/腰链"};
		String bt = request.getParameter("bt");
		String st = request.getParameter("st");
		String order = request.getParameter("order");
		String min = request.getParameter("min");
		String max = request.getParameter("max");
		
		
					
		if (min == null && max == null) {
			if(st==null){
				type = bt;				
				list = gsv.queryMallListByOrder(bt,order);
			}else{
				type = st;
				list = gsv.queryMallListByOrder(bt,st,order);
			}
		} else if (min != null && max == null) {
			if (st == null) {
				double min_ = Double.parseDouble(min);
				type = bt;
				list = gsv.queryMallListByMinPrice(bt, min_,order);
			} else {
				double min_ = Double.parseDouble(min);
				type = st;
				list = gsv.queryMallListByMinPrice(bt, st, min_,order);
			}
		} else if (min == null && max != null) {
			if (st == null) {
				double max_ = Double.parseDouble(max);
				type = bt;
				list = gsv.queryMallListByMaxPrice(bt, max_,order);
			} else {
				double max_ = Double.parseDouble(max);
				type = st;
				list = gsv.queryMallListByMaxPrice(bt, st, max_,order);
			}
		} else {
			if (st == null) {
				double min_ = Double.parseDouble(min);
				double max_ = Double.parseDouble(max);
				type = bt;
				list = gsv.queryMallListByMinMaxPrice(bt, min_, max_,order);
			} else {
				double min_ = Double.parseDouble(min);
				double max_ = Double.parseDouble(max);
				type = st;
				list = gsv.queryMallListByMinMaxPrice(bt, st, min_, max_,order);
			}
		}

		request.setAttribute("name", type);
		request.setAttribute("bt", bt);
		request.setAttribute("st", st);
		request.setAttribute("type", list);	
		//System.out.println(list);
		request.setAttribute("min", min);
		request.setAttribute("max", max);
		String str = "";
		if(order.equals("total")){
			str = "综合";
		}else if (order.equals("date")){
			str = "新品";
		}else if(order.equals("salenum")){
			str = "销量";
		}else if (order.equals("price")){
			str = "价格";
		}
		request.setAttribute("order", str);
		if(isContained(bt, m_clo)&&isContained(type, m_clo)){
			 request.getRequestDispatcher("/jsp/list/mclo.jsp").forward(request, response);
		}else if(isContained(bt, m_sho)&&isContained(type, m_sho)){
			 request.getRequestDispatcher("/jsp/list/msho.jsp").forward(request, response);
		}else if(isContained(bt, w_clo)&&isContained(type, w_clo)){
			 request.getRequestDispatcher("/jsp/list/wclo.jsp").forward(request, response);
		}else if(isContained(bt, w_sho)&&isContained(type, w_sho)){
			 request.getRequestDispatcher("/jsp/list/wsho.jsp").forward(request, response);
		}else if(isContained(bt, u_clo)&&isContained(type, u_clo)){
			 request.getRequestDispatcher("/jsp/list/under.jsp").forward(request, response);
		}else if(isContained(bt, d_clo)&&isContained(type, d_clo)){
			 request.getRequestDispatcher("/jsp/list/orna.jsp").forward(request, response);
		}		
		JSONObject json = new JSONObject();
		
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	/**
	 * 判断字符串是否存在数组里
	 * @param str
	 * @param array
	 * @return
	 */
	public boolean isContained(String str ,String[] array){
		for (int i = 0; i < array.length; i++) {
			if(array[i].equals(str)){
				return true;
			}
		}
		return false;	
	}
}
