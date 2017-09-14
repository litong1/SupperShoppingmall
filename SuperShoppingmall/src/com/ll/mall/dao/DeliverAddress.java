package com.ll.mall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ll.core.utils.DBUtil;
import com.ll.mall.vo.Address;

public class DeliverAddress {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public List<Address> getDeliverAddress(String username) {
		List<Address> list = new ArrayList<>();
		conn = DBUtil.getConn();
		String sql = "select location,detailedaddress,postalcode,consigneename,tel,isdefault from malluser,malladdress where username=? and malluser.userid=malladdress.userid";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Address a = new Address();
				a.setLocation(rs.getString(1));
				a.setDetailAddress(rs.getString(2));
				a.setPostalCode(Integer.parseInt(rs.getString(3).trim()));
				a.setConsigneeName(rs.getString(4));
				a.setTel(rs.getString(5));
				a.setIsDefault(rs.getInt(6));
				list.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean saveAddress(String username, Address address) {
		
		conn = DBUtil.getConn();
		int userid = 0;
		int result = 0;
		String sql1 = "select userid from malluser where username = ?";
		String sql2 = "insert into malladdress(userid,location,detailedaddress,postalcode,consigneename,tel,isdefault) values(?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				userid = rs.getInt(1);
			}
			
			System.out.println(username);
			System.out.println(userid);
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, userid);
			pstmt.setString(2, address.getLocation());
			pstmt.setString(3, address.getDetailAddress());
			pstmt.setInt(4, address.getPostalCode());
			pstmt.setString(5, address.getConsigneeName());
			pstmt.setString(6, address.getTel());
			pstmt.setInt(7, address.getIsDefault());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result != 0;
	}
	
}
