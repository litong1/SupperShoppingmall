package com.ll.mall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ll.core.utils.DBUtil;
import com.ll.core.utils.StringUtil;
import com.ll.mall.vo.Goods;
import com.ll.mall.vo.Shop;
/**
 * 收藏商品
 * @author litong
 *
 */
public class LoveDao {

	private Connection conn = null;
	private PreparedStatement pst = null;
	private ResultSet rs = null;
	
	/**
	 * 添加收藏商品
	 * @param goods
	 * @param userid
	 * @return
	 */
	public boolean insertLoveGoods(Goods goods,int userid){
		conn = DBUtil.getConn();
		String sql = "insert into lovegoods (loveid,goodsid ,userid ,shopid,picPaths ,goodsTitle ,goodsPrice ) values(seq_lovegoodsid.nextval,?,?,?,?,?,?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, goods.getGoodsId());
			pst.setInt(2, userid);
			pst.setInt(3, goods.getUserId());
			pst.setString(4,  StringUtil.listToString(goods.getPicPaths()));
			pst.setString(5, goods.getGoodsTitle());
			pst.setDouble(6, goods.getPspecPrice());
			int row = pst.executeUpdate();
			if(row > 0){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeAll(conn, pst, rs);
		}
		
		return false;
		
	}
	public boolean queryLoveGoods(int goodsid,int userid){
		conn = DBUtil.getConn();
		String sql = "select * from lovegoods where goodsid = ? and userid = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, goodsid);	
			pst.setInt(2, userid);	
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
	 * 查询收藏夹内的商品
	 * @param userid
	 * @return
	 */
	public List<Goods> queryLoveGoodsList(int userid){
		List<Goods> list = new ArrayList<>();
		conn = DBUtil.getConn();
		String sql = "select * from lovegoods where userid = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, userid);		
			rs = pst.executeQuery();
			while(rs.next()){
				//封装参数
				Goods g = new Goods();
				g.setGoodsId(rs.getInt("goodsid"));
				g.setUserId(rs.getInt("shopid"));
				g.setGoodsTitle(rs.getString("goodsTitle"));				
				g.setPicPaths(StringUtil.stringToList(rs.getString("picPaths")));			
				g.setPspecPrice(rs.getDouble("goodsPrice"));
				//添加到集合里
				list.add(g);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			DBUtil.closeAll(conn, pst, rs);
		}
		
		return list;
	}
	/**
	 * 添加收藏店铺
	 * @param goods
	 * @param userid
	 * @return
	 */
	public boolean insertLoveshop(Shop shop,int userid){
		conn = DBUtil.getConn();
		String sql = "insert into loveshop (loveid,shopid ,userid ,shopname,mastername,shoplogo) values(seq_lovegoodsid.nextval,?,?,?,?,?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, shop.getShopid());
			pst.setInt(2, userid);
			pst.setString(3, shop.getShopname());
			pst.setString(4, shop.getMastername());
			pst.setString(5, shop.getShoplogo());
			int row = pst.executeUpdate();
			if(row > 0){
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
	 * 查询是否已经收藏
	 * @param goodsid
	 * @return
	 */
	public boolean queryLoveshop(int shopid,int userid){
		conn = DBUtil.getConn();
		String sql = "select * from loveshop where shopid = ? and userid = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, shopid);
			pst.setInt(2, userid);
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
	 * 查询收藏夹内的店铺
	 * @param userid
	 * @return
	 */
	public List<Shop> queryLoveShopList(int userid){
		List<Shop> list = new ArrayList<>();
		conn = DBUtil.getConn();
		String sql = "select * from loveshop where userid = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, userid);		
			rs = pst.executeQuery();
			while(rs.next()){
				//封装参数
				Shop s = new Shop();
				s.setShopid(rs.getInt("shopid"));
				s.setMastername(rs.getString("mastername"));
				s.setShopname(rs.getString("shopname"));
				s.setShoplogo(rs.getString("shoplogo"));				
				//添加到集合里
				list.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			DBUtil.closeAll(conn, pst, rs);
		}
		
		return list;
	}
	/**
	 * 取消收藏商品
	 * @param goodsid
	 * @param userid
	 * @return
	 */
	public boolean deleteLovegoods(int goodsid,int userid){
		conn = DBUtil.getConn();
		String sql = "delete from lovegoods where goodsid = ? and userid = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, goodsid);
			pst.setInt(2, userid);
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
	 * 取消收藏店铺
	 * @param goodsid
	 * @param userid
	 * @return
	 */
	public boolean deleteLoveshop(int shopid,int userid){
		conn = DBUtil.getConn();
		String sql = "delete from loveshop where shopid = ? and userid = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, shopid);
			pst.setInt(2, userid);
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
}
