package com.ll.mall.web;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
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

import com.ll.mall.service.GoodsService;
import com.ll.mall.service.ShopService;
import com.ll.mall.vo.Goods;
import com.ll.mall.vo.Shop;
import com.ll.mall.vo.User;

/**
 * Servlet implementation class ShopServlet
 */
@WebServlet("/shop")
public class ShopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	private static final String UPLOAD_DIRECTORY = "images/shoplogo";

	// 上传配置
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB
	ShopService ssv = new ShopService();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopServlet() {
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
		if("query".equals(type)){
			query(request,response);
		}else if("comp".equals(type)){
			comp(request,response);
		}else if("uploadlogo".equals(type)){
			uploadlogo(request,response);
		}else if("delete".equals(type)){
			delete(request,response);
		}else if(type==null){
			shop(request,response);
		}
		
	}
	
	/**
	 * 下架商品
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws  
	 * @throws ServletException 
	 */
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		GoodsService  gsv = new GoodsService();
		String goodsid = request.getParameter("goodsid");
		if(gsv.deleteShopGoods(Integer.parseInt(goodsid))){
			request.getRequestDispatcher("/jsp/seller/inSale.jsp").forward(request, response);
		}
		
	}

	/**
	 * 查询店铺信息
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void query(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Shop shop = ssv.queryShopByid(user.getUserid());
		request.setAttribute("shop", shop);
		request.getRequestDispatcher("/jsp/seller/shopInfoSet.jsp").forward(request, response);
	}
	
	/**
	 * 补全店铺信息
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	private void comp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String shopname = request.getParameter("shopname");
		String shopaddress = request.getParameter("shopaddress");
		String shopintro = request.getParameter("shopintro");
		System.out.println(userid);
		if(userid != null) {
			Shop shop = new Shop();
			shop.setShopid(Integer.parseInt(userid));
			shop.setShopname(shopname);
			shop.setShopaddress(shopaddress);
			shop.setShopintro(shopintro);
			Shop s = ssv.compShopInfo(shop);
			if(s != null){
				request.getRequestDispatcher("/shop?type=query").forward(request, response);
			}
		}
		
	}
	
	private void uploadlogo(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String path = getLogoPath(request, response);
		System.out.println("path"+path);
		boolean flag = ssv.compShopLogo(path, user.getUserid());
		if(flag){
			request.getRequestDispatcher("/shop?type=query").forward(request, response);
		}
		
	}
	private void shop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
			request.getRequestDispatcher("/jsp/seller/shop.jsp").forward(request, response);
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private String getLogoPath(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String path = "";
		// 检测是否为多媒体上传
		if (!ServletFileUpload.isMultipartContent(request)) {
		    // 如果不是则停止
		    PrintWriter writer = response.getWriter();
		    writer.println("Error: 表单必须包含 enctype=multipart/form-data");
		    writer.flush();
		    return null;
		}
  	 
		// 配置上传参数
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
		factory.setSizeThreshold(MEMORY_THRESHOLD);
		// 设置临时存储目录
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
  	 
		ServletFileUpload upload = new ServletFileUpload(factory);
		 
		// 设置最大文件上传值
		upload.setFileSizeMax(MAX_FILE_SIZE);
		 
		// 设置最大请求值 (包含文件和表单数据)
		upload.setSizeMax(MAX_REQUEST_SIZE);
		
		// 中文处理
		upload.setHeaderEncoding("UTF-8"); 

		// 构造临时路径来存储上传的文件
		// 这个路径相对当前应用的目录
		String uploadPath = getServletContext().getRealPath("./") + UPLOAD_DIRECTORY;
		//System.out.println(uploadPath);
		//String uploadPath = UPLOAD_DIRECTORY;
		// 如果目录不存在则创建
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
		    uploadDir.mkdir();
		}
		try {
		    // 解析请求的内容提取文件数据
		    @SuppressWarnings("unchecked")
		    List<FileItem> formItems = upload.parseRequest(request);
		    //System.out.println("size" + formItems.size());
		    if (formItems != null && formItems.size() > 0) {
		        // 迭代表单数据
		    	 
		        for (FileItem item : formItems) {
		            // 处理不在表单中的字段
		        	
		            if (!item.isFormField()) {
		            	System.out.println(444);
		                String fileName = new File(item.getName()).getName();
		                String filePath = uploadPath + File.separator + fileName;		            
		                File storeFile = new File(filePath);
		                // 在控制台输出文件的上传路径
		                //System.out.println("filepath："+ filePath);
		                //System.out.println(storeFile.getAbsolutePath());
		                // 保存文件到硬盘
		                item.write(storeFile);
		                String filePath_ = filePath.replace(getServletContext().getRealPath("./"), "");
		                //System.out.println(filePath_);
		                path=filePath_;
		                
		            }
		        }
		    }
		} catch (Exception ex) {
			
		    request.setAttribute("message",
		            "错误信息: " + ex.getMessage());	
		}
		return path;
	}
	

}
