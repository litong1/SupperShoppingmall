package com.ll.mall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ll.core.utils.DBUtil;
import com.ll.core.utils.StringUtil;
import com.ll.mall.vo.Cart;

public class CartDao {
    private Connection conn = null;
    private PreparedStatement pst = null;
    private ResultSet rs = null;

    public Cart insertCart(Cart cart) {
	conn = DBUtil.getConn();
	String sql = "insert into cartinfo (cartid,goodsid,userid,shopid,shopname,picPaths,";
	sql = sql + "goodsTitle,goodsPrice,goodsColor,goodsSize,goodsNum,goodsTotalPrice)";
	sql = sql + "values(seq_cartid.nextval,?,?,?,?,?,?,?,?,?,?,?)";
	String sql2 = "select seq_cartid.currval from dual";
	try {

	    pst = conn.prepareStatement(sql);
	    pst.setInt(1, cart.getGoodsid());
	    pst.setInt(2, cart.getUserid());
	    pst.setInt(3, cart.getShopid());
	    pst.setString(4, cart.getShopname());
	    pst.setString(5, StringUtil.listToString(cart.getPicPaths()));
	    pst.setString(6, cart.getGoodsTitle());
	    pst.setDouble(7, cart.getGoodsPrice());
	    pst.setString(8, cart.getGoodsColor());
	    pst.setString(9, cart.getGoodsSize());
	    pst.setInt(10, cart.getGoodsNum());
	    pst.setDouble(11, cart.getGoodsTotalPrice());

	    int row = pst.executeUpdate();
	    if (row > 0) {
		pst = conn.prepareStatement(sql2);
		rs = pst.executeQuery();
		if (rs.next()) {
		    cart.setCartid(rs.getInt(1));
		    return cart;
		}
		return cart;
	    }
	} catch (SQLException e) {
	    e.printStackTrace();
	    return null;
	} finally {
	    DBUtil.closeAll(conn, pst, rs);
	}
	return null;
    }

    /**
     * 查询当前用户的购物车
     * 
     * @param userid
     * @return
     */
    public List<Cart> queryCartList(int userid) {
	List<Cart> list = new ArrayList<>();
	conn = DBUtil.getConn();
	String sql = "select * from cartinfo where userid = ?";
	try {
	    pst = conn.prepareStatement(sql);
	    pst.setInt(1, userid);
	    rs = pst.executeQuery();
	    while (rs.next()) {
		Cart c = newCart();
		list.add(c);
	    }
	    return list;
	} catch (SQLException e) {
	    e.printStackTrace();
	    return null;
	} finally {
	    DBUtil.closeAll(conn, pst, rs);
	}
    }

    /**
     * 根据id查询购物车记录
     * 
     * @param userid
     * @return
     */
    public Cart queryCartById(int userid, int cartid) {

	conn = DBUtil.getConn();
	String sql = "select * from cartinfo where userid = ? and cartid = ?";
	try {
	    pst = conn.prepareStatement(sql);
	    pst.setInt(1, userid);
	    pst.setInt(2, cartid);
	    rs = pst.executeQuery();
	    if (rs.next()) {
		// 封装参数
		Cart c = newCart();
		return c;
	    }

	} catch (SQLException e) {
	    e.printStackTrace();
	    return null;
	} finally {
	    DBUtil.closeAll(conn, pst, rs);
	}
	return null;
    }

    private Cart newCart() throws SQLException {
	Cart c = new Cart();
	c.setCartid(rs.getInt("cartid"));
	c.setGoodsid(rs.getInt("goodsid"));
	c.setUserid(rs.getInt("userid"));
	c.setShopid(rs.getInt("shopid"));
	c.setShopname(rs.getString("shopname"));
	c.setPicPaths(StringUtil.stringToList(rs.getString("picPaths")));
	c.setGoodsTitle(rs.getString("goodsTitle"));
	c.setGoodsPrice(rs.getDouble("goodsPrice"));
	c.setGoodsColor(rs.getString("goodsColor"));
	c.setGoodsSize(rs.getString("goodsSize"));
	c.setGoodsNum(rs.getInt("goodsNum"));
	c.setGoodsTotalPrice(rs.getDouble("goodsTotalPrice"));
	return c;
    }

    /**
     * 从购物车中删除
     * 
     * @param cartid
     * @return
     */
    public boolean deleteCart(int userid, int goodsid) {
	conn = DBUtil.getConn();
	String sql = "delete from cartinfo where userid = ? and goodsid = ?";
	try {
	    pst = conn.prepareStatement(sql);
	    pst.setInt(1, userid);
	    pst.setInt(2, goodsid);
	    int row = pst.executeUpdate();
	    if (row > 0) {
		return true;
	    }
	} catch (SQLException e) {

	    e.printStackTrace();
	} finally {
	    DBUtil.closeAll(conn, pst, rs);
	}
	return false;

    }

    public boolean updateCartByGoodsNum(int userid, int cartid, int goodsNum,double goodsTotalPrice) {
	conn = DBUtil.getConn();
	String sql = "update  cartinfo set goodsNum = ?,goodsTotalPrice = ? where userid = ? and cartid = ?";
	try {
	    pst = conn.prepareStatement(sql);
	    pst.setInt(1, goodsNum);
	    pst.setDouble(2, goodsTotalPrice);
	    pst.setInt(3, userid);
	    pst.setInt(4, cartid);
	    int rs = pst.executeUpdate();
	    if (rs > 0) {
		return true;
	    }
	} catch (SQLException e) {
	    e.printStackTrace();
	    return false;
	} finally {
	    DBUtil.closeAll(conn, pst, rs);
	}
	return false;

    }

}
