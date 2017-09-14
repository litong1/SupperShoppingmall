package com.ll.core.utils;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ResourceBundle;
/**
 * 工具类
 * @author litong
 *
 */
public class DBUtil {

	//读取properties文件,文件路径：包名+文件名 （不能带扩展名）
		private static ResourceBundle rs=ResourceBundle.getBundle("com/ll/core/utils/jdbc");
		
		//驱动字符串
		private static String driverName="oracle.jdbc.driver.OracleDriver";
		//连接字符串
		private static String url="jdbc:oracle:thin:@localhost:1521:orcl1";
		//用户名
		private static String user="scott";
		//密码
		private static String password="tiger";
		
		static{
			//从配置文件读取参数
			driverName=rs.getString("driverName");
			url=rs.getString("url");
			user=rs.getString("user");
			password=rs.getString("password");
			
			
			//加载驱动
			try {
				Class.forName(driverName);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}
		
		/**
		 * 获取数据库连接
		 * @param url  连接字符串
		 * @param user  用户名
		 * @param password 密码
		 * @return 如果连接上，返回Connection对象;否则返回null。
		 */
		public static Connection getConn(String url,String user,String password){
			Connection con=null;
			try {
				con=DriverManager.getConnection(url, user, password);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return con;
		}
		
		/**
		 * 使用默认的连接字符串、用户名、密码获取数据库连接
		 * @return 如果连接上，返回Connection对象;否则返回null。
		 */
		public static Connection getConn(){
			return getConn(url,user,password);
		}
	public static void closeAll(Connection conn,Statement st,ResultSet rs){
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(st!=null){
			try {
				st.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
	}
	public static void main(String[] args) {
		Connection conn = getConn();
		System.out.println("连接成功");
		closeAll(conn, null, null);
		conn = getConn();
		System.out.println("连接成功"+conn);
		conn = getConn();
		System.out.println("连接成功"+conn);
	    

	}
}
