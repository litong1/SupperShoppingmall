package com.ll.core.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtilsMy {
	static Connection conn = null;

	public static Connection getConnection() {

		String url = "jdbc:mysql://172.22.30.91/Shopping?useUnicode=true&characterEncoding=UTF-8&user=root1&password=root1";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("加载驱动失败，找不到驱动");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("获取连接失败");
		}
		return conn;
	}
	public static void main(String[] args) {
		getConnection();
		System.out.println("ok");
	}
}
