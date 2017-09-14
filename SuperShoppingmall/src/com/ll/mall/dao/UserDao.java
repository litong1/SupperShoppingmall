package com.ll.mall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ll.core.utils.DBUtil;
import com.ll.mall.vo.User;

/**
 * 数据库管理类
 * @author litong
 *
 */
public class UserDao {

	private Connection conn = null;
	private PreparedStatement pst = null;
	private ResultSet rs = null;
	
	/**
	 * 添加新用户（注册）
	 * @param user
	 * @return
	 */
	public User addUser(User user) {		
		conn = DBUtil.getConn();
		String sql = "insert into malluser (userid,username,password) values(seq_userid.nextval,?,?)";
		String sql2 = "select seq_userid.currval from dual";
		try {
			pst = conn.prepareStatement(sql);
			String username = user.getUsername();
			System.out.println("name"+username);
			pst.setString(1,username);
			pst.setString(2,user.getPassword());
			
			int row = pst.executeUpdate();
			if(row > 0){
				pst = conn.prepareStatement(sql2);
				rs = pst.executeQuery();
				if (rs.next()) {
					user.setUserid(rs.getInt(1));
					return user;
				}
			}
		} catch (SQLException e) {
			System.out.println("exception");
			e.printStackTrace();
		}finally {
			DBUtil.closeAll(conn, pst, rs);
		}
		return null;
		
	}
	/**
	 * 登录
	 * @param name
	 * @param pwd
	 * @return
	 */
	public User selectBynamepw(String name,String pwd){
		conn = DBUtil.getConn();
		String sql = "select * from malluser where username = ? and password = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, name);
			pst.setString(2, pwd);
			rs = pst.executeQuery();
			if(rs.next()){
				User user = new User();
				user.setUserid(rs.getInt("userid"));
				user.setUsername(rs.getString("username"));
				user.setAvatar(rs.getString("avatar"));
				user.setRole(rs.getString("role"));
				return user;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeAll(conn, pst, rs);
		}
		return null;	
	}
	/**
	 * 是否被注册过
	 * @return
	 */
	public boolean haveRegistered(String name){
		conn = DBUtil.getConn();
		String sql = "select * from malluser where username = ? ";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, name);
			rs = pst.executeQuery();
			if(rs.next()){		
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeAll(conn, pst, rs);
		}
		return false;	
	}
	/**
	 * 修改用户角色为卖家
	 * @param userid
	 * @return
	 */
	public boolean modifyRole(int userid){
		
		conn = DBUtil.getConn();
		String sql = "update malluser set role='卖家' where userid=?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, userid);
			int rs = pst.executeUpdate();
			if(rs > 0){		
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeAll(conn, pst, rs);
		}
		return false;
		
	}
	/**
	 * 根据用户名查询用户信息
	 * @param username
	 * @return
	 */
	public User queryUserByName(String username){
		
		conn = DBUtil.getConn();
		String sql = "select * from malluser where username=?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			rs = pst.executeQuery();
			if(rs.next()){		
				User u = new User();
				u.setUserid(rs.getInt("userid"));
				u.setUsername(rs.getString("username"));
				u.setIsquestion(rs.getInt("isquestion"));
				return u;
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			DBUtil.closeAll(conn, pst, rs);
		}
		return null;
		
	}
}
