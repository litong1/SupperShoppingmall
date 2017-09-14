package com.ll.mall.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.ll.core.utils.DBUtil;
import com.ll.core.utils.DateUtil;
import com.ll.core.utils.StringUtil;
import com.ll.mall.vo.Order;

public class OrderDao {

	private Connection conn = null;
	private PreparedStatement pst = null;
	private ResultSet rs = null;
	
	public Order addOrder(Order order){
		conn = DBUtil.getConn();
		String sql = "insert into orderinfo (orderid,userid,orderContent,orderDate,orderState,addressContent)";
			   sql = sql+"values(seq_orderid.nextval,?,?,?,?,?)";
		String sql2 = "select seq_orderid.currval from dual";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, order.getUserid());
			pst.setInt(2, order.getOrderContent());	
			java.util.Date date = DateUtil.stringToDate(order.getOrderDate());
			long t = date.getTime();		
			pst.setDate(3, new Date(t));
			pst.setString(4, order.getOrderState());
			pst.setString(5, order.getAddressContent());
			int row = pst.executeUpdate();
			
			if(row > 0){
				pst = conn.prepareStatement(sql2);
				rs = pst.executeQuery();
				if (rs.next()) {
					order.setOrderid(rs.getInt(1));
					return order;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			DBUtil.closeAll(conn, pst, rs);
		}	   
		return null;
		
	}
	public List<Order> queryOrderListByUserid(int userid){
	    List<Order> list = new ArrayList<>();
	    conn = DBUtil.getConn();
	    String sql = "select * from orderinfo where userid = ?";
	    try {
		pst = conn.prepareStatement(sql);
		pst.setInt(1, userid);
		rs = pst.executeQuery();
		while(rs.next()){
		    Order o = new Order();
		    o.setOrderid(rs.getInt("orderid"));
		    o.setUserid(rs.getInt("userid"));
		    o.setOrderContent(rs.getInt("orderContent"));
		    Date date = rs.getDate("orderDate");
		    long t = date.getTime();
		    java.util.Date d = new java.util.Date(t);
		   
		    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		    String d2 = formatter.format(d);		   
		    o.setOrderDate(d2);	   
		    o.setOrderState(rs.getString("orderState"));
		    o.setAddressContent(rs.getString("addressContent"));
		    list.add(o);
		    
		}
		return list;
	    } catch (SQLException e) {
		
		e.printStackTrace();
	    }finally {
		DBUtil.closeAll(conn, pst, rs);
	}
	    
	    return null;
	    
	}
}
