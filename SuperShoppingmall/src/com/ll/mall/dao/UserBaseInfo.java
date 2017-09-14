package com.ll.mall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

import com.ll.core.utils.DBUtil;
import com.ll.mall.vo.User;

public class UserBaseInfo {

	private Connection conn = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;

	public User getInfo(String username) {
		conn = DBUtil.getConn();
		String sql = "select nickename, realname, birthday, hometown, avatar, sex from malluser where username = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		User u = new User();
		try {
			while (rs.next()) {
				u.setUsername(username);
				u.setNickname(rs.getString(1));
				u.setRealname(rs.getString(2));
				u.setBirthday(rs.getDate(3));
				u.setHometown(rs.getString(4));
				u.setAvatar(rs.getString(5));
				u.setSex(rs.getInt(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return u;
	}

	public boolean updateBaseInfo(User u) {

		conn = DBUtil.getConn();
		String sql = "update malluser set nickename=?,realname=?,sex=?,birthday=?, hometown=? where username = ?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u.getNickname());
			pstmt.setString(2, u.getRealname());
			pstmt.setInt(3, u.getSex());
			java.sql.Date date = new java.sql.Date(u.getBirthday().getTime());
			pstmt.setDate(4, date);
			pstmt.setString(5, u.getHometown());
			pstmt.setString(6, u.getUsername());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result != 0;
	}
	/**
	 * 上传头像
	 * @return
	 */
	public boolean compUserAvatar(String path,int userid){
		conn = DBUtil.getConn();
		String sql = "update malluser set avatar=? where userid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, path);
			pstmt.setInt(2, userid);
			int row = pstmt.executeUpdate();
			if(row > 0){
				return true;
			}
		} catch (SQLException e) {		
			e.printStackTrace();
			return false;
		}finally {
			DBUtil.closeAll(conn,pstmt, rs);
		}
		return false;	
	}
}
