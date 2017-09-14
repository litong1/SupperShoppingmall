            package com.ll.mall.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ll.core.utils.DBUtil;
import com.ll.core.utils.DateUtil;
import com.ll.mall.vo.Goods;
import com.ll.mall.vo.Shop;
/**
 * 店铺dao类
 * @author litong
 *
 */
public class ShopDao {
	private Connection conn = null;
	private PreparedStatement pst = null;
	private ResultSet rs = null;
	
	/**                     
	 * 添加店铺
	 * @param shop
	 * @return
	 */
	public Shop addShop(Shop shop){
		conn = DBUtil.getConn();
		String sql = "insert into shopinfo(shopid,mastername,shopbt) values(?,?,?)";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, shop.getShopid());
			pst.setString(2, shop.getMastername());
			pst.setDate(3, DateUtil.dateSwitch(shop.getShopbt()));
			int row = pst.executeUpdate();
			if(row > 0){
				return shop;
			}
		} catch (SQLException e) {			
			e.printStackTrace();
			return null;
		}finally {
			DBUtil.closeAll(conn, pst, rs);
		}		
		return null;	
	}
	/**
	 * 补全店铺信息
	 * @return
	 */
	public Shop compShopInfo(Shop shop){
		conn = DBUtil.getConn();
		String sql = "update shopinfo set shopname = ? , shopintro = ? , shopaddress = ? where shopid = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, shop.getShopname());
			pst.setString(2, shop.getShopintro());
			pst.setString(3, shop.getShopaddress());
			pst.setInt(4, shop.getShopid());
			int row = pst.executeUpdate();
			System.out.println(row);
			if(row > 0){
				System.out.println(shop.getShopname());
				return shop;
			}
		} catch (SQLException e) {		
			e.printStackTrace();
			return null;
		}finally {
			DBUtil.closeAll(conn, pst, rs);
		}
		return null;	
	}
	/**
	 * 上传店铺logo
	 * @return
	 */
	public boolean compShopLogo(String path,int userid){
		conn = DBUtil.getConn();
		String sql = "update shopinfo set shoplogo=? where shopid = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, path);
			pst.setInt(2, userid);
			int row = pst.executeUpdate();
			if(row > 0){
				return true;
			}
		} catch (SQLException e) {		
			e.printStackTrace();
			return false;
		}finally {
			DBUtil.closeAll(conn, pst, rs);
		}
		return false;	
	}
	/**
	 * 查询店铺相关信息
	 * @param userid
	 * @return
	 */
	public Shop queryShopByid(int shopid){
		conn = DBUtil.getConn();
		String sql = "select * from shopinfo where shopid = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, shopid);
			rs = pst.executeQuery();
			if(rs.next()){
				Shop s = new Shop();
				s.setShopid(shopid);
				s.setMastername(rs.getString("mastername"));
				s.setShopname(rs.getString("shopname"));
				s.setShoplogo(rs.getString("shoplogo"));
				s.setShopintro(rs.getString("shopintro"));
				s.setShopaddress(rs.getString("shopaddress"));
				long t = rs.getDate("shopbt").getTime();			
				s.setShopbt(new java.util.Date(t));
				s.setGoodsnum(rs.getInt("goodsnum"));
				s.setFavorcomment(rs.getDouble("favorcomment"));
				s.setDescscore(rs.getDouble("descscore"));
				s.setLogscore(rs.getDouble("logscore"));
				s.setServscore(rs.getDouble("servscore"));
				return s;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			DBUtil.closeAll(conn, pst, rs);
		}
		return null;
		
	}
	/**
	 * 店铺内商品排序
	 * @param shopid
	 * @param order
	 * @return
	 */
	public List<Goods> queryShopByOrder(int shopid ,String order,String keyword,String minPrice,String maxPrice){
		List<Goods> list = new ArrayList<>();
		conn = DBUtil.getConn();
		StringBuffer sql= new StringBuffer();
		boolean kwflag = false;
		boolean minflag = false;
		boolean maxflag = false;
		if(keyword==null||keyword.equals("")){
			kwflag=true;
		}else{
			kwflag=false;
		}
		if(minPrice==null||minPrice.equals("")){
			minflag=true;
		}else{
			minflag=false;
		}
		if(maxPrice==null||maxPrice.equals("")){
			maxflag=true;
		}else{
			maxflag=false;
		}
		try {
			// 0 0 0
			if(kwflag&&minflag&&maxflag){
				sql.append("select * from mallGoodsInfo where userId=? ");
				GoodsDao.sqlContent(order, sql);
				pst = conn.prepareStatement(sql.toString());
				pst.setInt(1, shopid);
				//0 0 1
			}else if(kwflag&&minflag&&!maxflag){
				sql.append("select * from mallGoodsInfo where userId=? and pspecPrice < ?");
				GoodsDao.sqlContent(order, sql);
				pst = conn.prepareStatement(sql.toString());
				pst.setInt(1, shopid);
				pst.setDouble(2, Double.parseDouble(maxPrice));
				// 0 1 0
			}else if(kwflag&&!minflag&&maxflag){
				sql.append("select * from mallGoodsInfo where userId=? and pspecPrice > ?");
				GoodsDao.sqlContent(order, sql);
				pst = conn.prepareStatement(sql.toString());
				pst.setInt(1, shopid);
				pst.setDouble(2, Double.parseDouble(minPrice));
				// 0 1 1 
			}else if(kwflag&&!minflag&&!maxflag){
				sql.append("select * from mallGoodsInfo where userId=? and pspecPrice > ? and pspecPrice < ?");
				GoodsDao.sqlContent(order, sql);
				pst = conn.prepareStatement(sql.toString());
				pst.setInt(1, shopid);
				pst.setDouble(2, Double.parseDouble(minPrice));
				pst.setDouble(3, Double.parseDouble(maxPrice));
				//1 0 0
			}else if(!kwflag&&minflag&&maxflag){
				sql.append("select * from mallGoodsInfo where  goodsTitle like '%");
				sql.append(keyword);
				sql.append( "%' and userId=?");
				GoodsDao.sqlContent(order, sql);
				pst = conn.prepareStatement(sql.toString());
				pst.setInt(1, shopid);
				//1 0 1
			}else if(!kwflag&&minflag&&!maxflag){
				sql.append("select * from mallGoodsInfo where userId=? and goodsTitle like '%");
				sql.append(keyword);
				sql.append( "%' and  pspecPrice < ?");
				GoodsDao.sqlContent(order, sql);
				pst = conn.prepareStatement(sql.toString());
				pst.setInt(1, shopid);
				pst.setDouble(2, Double.parseDouble(maxPrice));
				// 1 1 0
			}else if(!kwflag&&!minflag&&maxflag){
				sql.append("select * from mallGoodsInfo where userId=? and goodsTitle like '%");
				sql.append(keyword);
				sql.append( "%' and pspecPrice > ? ");
				GoodsDao.sqlContent(order, sql);
				pst = conn.prepareStatement(sql.toString());
				pst.setInt(1, shopid);
				pst.setDouble(2, Double.parseDouble(minPrice));
				// 1 1 1 
			}else if(!kwflag&&!minflag&&!maxflag){
				sql.append("select * from mallGoodsInfo where userId=? and goodsTitle like '%");
				sql.append(keyword);
				sql.append( "%' and pspecPrice > ? and pspecPrice < ?");
				GoodsDao.sqlContent(order, sql);
				pst = conn.prepareStatement(sql.toString());
				pst.setInt(1, shopid);
				pst.setDouble(2, Double.parseDouble(minPrice));
				pst.setDouble(3, Double.parseDouble(maxPrice));
			}
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				// 封装参数
				Goods g = GoodsDao.packageAttr(rs);				
				// 添加到集合里
				list.add(g);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			DBUtil.closeAll(conn, pst, rs);
		}
		return list;		
	}
	/**
	 * 搜索店铺关键字
	 * @param keyword
	 * @return
	 */
	public List<Shop> queryMallListBykw(String keyword){
		List<Shop> list = new ArrayList<>();
		conn = DBUtil.getConn();
		StringBuffer sql= new StringBuffer();
		sql.append("select * from shopinfo where  shopname like '%");
		sql.append(keyword);
		sql.append( "%'");
		try {
			pst = conn.prepareStatement(sql.toString());			
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				// 封装参数
				Shop s = new Shop();
				s.setShopid(rs.getInt("shopid"));
				s.setMastername(rs.getString("mastername"));
				s.setShopname(rs.getString("shopname"));
				s.setShoplogo(rs.getString("shoplogo"));
				s.setShopintro(rs.getString("shopintro"));
				s.setShopaddress(rs.getString("shopaddress"));
				long t = rs.getDate("shopbt").getTime();			
				s.setShopbt(new java.util.Date(t));
				s.setGoodsnum(rs.getInt("goodsnum"));
				s.setFavorcomment(rs.getDouble("favorcomment"));
				s.setDescscore(rs.getDouble("descscore"));
				s.setLogscore(rs.getDouble("logscore"));
				s.setServscore(rs.getDouble("servscore"));
				// 添加到集合里
				list.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			DBUtil.closeAll(conn, pst, rs);
		}
		return list;
	}
	
}
