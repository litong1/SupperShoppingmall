package com.ll.mall.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.ll.mall.dao.UserBaseInfo;
import com.ll.mall.vo.User;

@WebServlet("/base")
public class BaseInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String UPLOAD_DIRECTORY = "images/useravatar";

	// 上传配置
	private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3; // 3MB
	private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB
	UserBaseInfo userBaseInfo = new UserBaseInfo();
	public BaseInfoServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String type = request.getParameter("type");
		if(type==null){
			saveinfo(request,response);
		}else if("uploadavatar".equals(type)){
			uploadavatar(request,response);
		}
				
	}

	
	private void saveinfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String nickname = request.getParameter("nickname");
		String realname = request.getParameter("realname");
		int sex = Integer.parseInt(request.getParameter("_fm.b._0.g"));		
		String birthday = request.getParameter("birthday");
		String hometown = request.getParameter("hometown");
		
		User u = new User();
		
		u.setRealname(realname);
		u.setNickname(nickname);
		u.setUsername(username);
		u.setHometown(hometown);
		u.setSex(sex);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date d = sdf.parse(birthday);
			u.setBirthday(d);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		if (userBaseInfo.updateBaseInfo(u)) {
			request.getRequestDispatcher("/jsp/user/baseInfoSet.jsp?username=" + username).forward(request,response);
		} else {
			
		}
		
	}
	private void uploadavatar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String path = getLogoPath(request, response);
		System.out.println("path"+path);
		
		boolean flag = userBaseInfo.compUserAvatar(path, user.getUserid());
		if(flag){
			request.getRequestDispatcher("/jsp/user/baseInfoSet.jsp?username=" + user.getUsername()).forward(request, response);
		}
		
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
