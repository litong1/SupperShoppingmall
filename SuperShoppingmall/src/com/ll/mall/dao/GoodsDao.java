package com.ll.mall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ll.core.utils.DBUtil;
import com.ll.core.utils.DateUtil;
import com.ll.core.utils.StringUtil;
import com.ll.mall.vo.Goods;

/**
 * 商品dao类
 * 
 * @author litong
 *
 */
public class GoodsDao {

	private Connection conn = null;
	private PreparedStatement pst = null;
	private ResultSet rs = null;

	public Goods addGoods(Goods goods) {
		conn = DBUtil.getConn();
		String sql = "insert into mallgoodsinfo (goodsId,userId,bigtype,smalltype,goodsTitle,";
		sql = sql + "goodsNo,goodsMaterial,goodsBrand,goodsStyle,goodsScene,goodsSeason,goodsTarget,";
		sql = sql + "goodsComedate,selectColor,colorName,colorRemarks,sizeCheck,pspecPrice,pspecNum,totalNum";
		sql = sql + ") values(seq_goodsid.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		String sql2 = "select seq_goodsid.currval from dual";
		try {
			pst = conn.prepareStatement(sql);
			int userId = goods.getUserId();
			String bigtype = goods.getBigtype();
			String smalltype = goods.getSmalltype();
			String goodsTitle = goods.getGoodsTitle();
			String goodsNo = goods.getGoodsNo();
			String goodsMaterial = goods.getGoodsMaterial();
			String goodsBrand = goods.getGoodsBrand();
			String goodsStyle = goods.getGoodsStyle();
			String goodsScene = goods.getGoodsScene();
			String goodsSeason = goods.getGoodsSeason();
			String goodsTarget = goods.getGoodsTarget();
			Date goodsComedate = goods.getGoodsComedate();
			List<String> selectColor = goods.getSelectColor();
			List<String> colorName = goods.getColorName();
			List<String> colorMarks = goods.getColorRemarks();
			List<String> sizeCheck = goods.getSizeCheck();
			double pspecPrice = goods.getPspecPrice();
			int pspecNum = goods.getPspecNum();
			int totalNum = goods.getTotalNum();
			pst.setInt(1, userId);
			pst.setString(2, bigtype);
			pst.setString(3, smalltype);
			pst.setString(4, goodsTitle);
			pst.setString(5, goodsNo);
			pst.setString(6, goodsMaterial);
			pst.setString(7, goodsBrand);
			pst.setString(8, goodsStyle);
			pst.setString(9, goodsScene);
			pst.setString(10, goodsSeason);
			pst.setString(11, goodsTarget);
			pst.setDate(12, DateUtil.dateSwitch(goodsComedate));
			pst.setString(13, StringUtil.listToString(selectColor));
			pst.setString(14, StringUtil.listToString(colorName));
			pst.setString(15, StringUtil.listToString(colorMarks));
			pst.setString(16, StringUtil.listToString(sizeCheck));
			pst.setDouble(17, pspecPrice);
			pst.setInt(18, pspecNum);
			pst.setInt(19, totalNum);

			int row = pst.executeUpdate();
			if (row > 0) {
				pst = conn.prepareStatement(sql2);
				rs = pst.executeQuery();
				if (rs.next()) {
					goods.setGoodsId(rs.getInt(1));
					return goods;
				}
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
	 * 添加图片
	 * 
	 * @param path
	 * @param id
	 * @return
	 */
	public boolean addPic(List<String> path, int id) {
		conn = DBUtil.getConn();
		String sql = "update mallGoodsInfo set picPaths = ? where goodsId = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, StringUtil.listToString(path));
			pst.setInt(2, id);
			int row = pst.executeUpdate();
			if (row > 0) {
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
	/**
	 * 修改商品价格
	 * @param price
	 * @param goodsId
	 * @return
	 */
	public boolean updatePrice(double price, int goodsId) {
		conn = DBUtil.getConn();
		String sql = "update mallGoodsInfo set goodsPrice = ? where goodsId = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setDouble(1, price);
			pst.setInt(2, goodsId);
			int row = pst.executeUpdate();
			if (row > 0) {
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

	/**
	 * 查询商城所有的商品
	 * 
	 * @return
	 */
	public List<Goods> queryMallList() {
		List<Goods> list = new ArrayList<>();
		conn = DBUtil.getConn();
		String sql = "select * from mallGoodsInfo";
		try {
			pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {																									
				Goods g = packageAttr(rs);
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
	 * 查询店铺内所有商品
	 * 
	 * @param userid
	 * @return
	 */
	public List<Goods> queryShopList(int shopid) {
		List<Goods> list = new ArrayList<>();
		conn = DBUtil.getConn();
		String sql = "select * from mallGoodsInfo where userId = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, shopid);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				// 封装参数
				Goods g = new Goods();
				g.setGoodsId(rs.getInt("goodsId"));
				g.setUserId(rs.getInt("userid"));
				g.setBigtype(rs.getString("bigtype"));
				g.setSmalltype(rs.getString("smalltype"));
				g.setGoodsTitle(rs.getString("goodsTitle"));				
				g.setPicPaths(StringUtil.stringToList(rs.getString("picPaths")));			
				g.setPspecPrice(rs.getDouble("pspecPrice"));
				g.setSalenum(rs.getInt("salenum"));
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
	 * 根据商品id查询商品信息
	 * 
	 * @param goodsId
	 * @return
	 */
	public Goods queryById(int goodsId) {
		conn = DBUtil.getConn();
		String sql = "select * from mallGoodsInfo where goodsId = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, goodsId);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				// 封装参数
				Goods g = new Goods();
				g.setGoodsId(rs.getInt("goodsId"));
				g.setUserId(rs.getInt("userId"));
				g.setBigtype(rs.getString("bigtype"));
				g.setSmalltype(rs.getString("smalltype"));
				g.setGoodsTitle(rs.getString("goodsTitle"));				
				g.setPicPaths(StringUtil.stringToList(rs.getString("picPaths")));											
				g.setGoodsNo(rs.getString("goodsNo"));
				g.setGoodsMaterial(rs.getString("goodsMaterial"));
				g.setGoodsBrand(rs.getString("goodsBrand"));
				g.setGoodsStyle(rs.getString("goodsStyle"));
				g.setGoodsScene(rs.getString("goodsScene"));
				g.setGoodsSeason(rs.getString("goodsSeason"));
				g.setGoodsTarget(rs.getString("goodsTarget"));
				g.setGoodsComedate(rs.getDate("goodsComedate"));				
				g.setSelectColor(StringUtil.stringToList(rs.getString("selectColor")));
				g.setColorName(StringUtil.stringToList(rs.getString("colorName")));
				g.setSizeCheck(StringUtil.stringToList(rs.getString("sizeCheck")));	
				g.setPspecPrice(rs.getDouble("pspecPrice"));
				g.setSalenum(rs.getInt("salenum"));		
				g.setTotalNum(rs.getInt("totalNum"));
				g.setSalenum(rs.getInt("salenum"));
				g.setLovenum(rs.getInt("lovenum"));
				return g;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			DBUtil.closeAll(conn, pst, rs);
		}
		return null;

	}

	public List<Goods> queryMallListByBigType(String bigtype) {
		List<Goods> list = new ArrayList<>();
		conn = DBUtil.getConn();
		String sql = "select * from mallGoodsInfo where bigtype=? ";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, bigtype);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				// 封装参数
				Goods g = packageAttr(rs);				
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
	 * 新品 大类型排序
	 * @return
	 */
	public List<Goods> queryMallListByOrder(String bigtype,String order) {
		List<Goods> list = new ArrayList<>();
		conn = DBUtil.getConn();
		StringBuffer sql= new StringBuffer();
		sql.append("select * from mallGoodsInfo where bigtype=? ");
		sqlContent(order, sql);
		try {
			pst = conn.prepareStatement(sql.toString());
			pst.setString(1, bigtype);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				// 封装参数
				Goods g = packageAttr(rs);				
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
	 * 新品 小类型排序
	 * @return
	 */
	public List<Goods> queryMallListByOrder(String bigtype,String smalltype,String order) {
		List<Goods> list = new ArrayList<>();
		conn = DBUtil.getConn();
		StringBuffer sql= new StringBuffer();
		sql.append("select * from mallGoodsInfo where bigtype=? and smalltype = ?");
		sqlContent(order, sql);
		
		try {
			pst = conn.prepareStatement(sql.toString());
			pst.setString(1, bigtype);
			pst.setString(2, smalltype);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				// 封装参数
				Goods g = packageAttr(rs);
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
	 * 最小价格 大类型
	 * @param bigtype
	 * @param smalltype
	 * @return
	 */
	public List<Goods> queryMallListByMinPrice(String bigtype ,double price,String order) {
		
		List<Goods> list = new ArrayList<>();
		conn = DBUtil.getConn();
		
		StringBuffer sql= new StringBuffer();
		sql.append("select * from mallGoodsInfo where bigtype=? and pspecPrice > ?");
		sqlContent(order, sql);
		try {
			pst = conn.prepareStatement(sql.toString());
			pst.setString(1, bigtype);			
			pst.setDouble(2, price);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				// 封装参数
				Goods g = packageAttr(rs);
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
	 * 最大价格 大类型
	 * @param bigtype
	 * @param smalltype
	 * @return
	 */
	public List<Goods> queryMallListByMaxPrice(String bigtype ,double price,String order) {
		List<Goods> list = new ArrayList<>();
		conn = DBUtil.getConn();
		StringBuffer sql= new StringBuffer();
		sql.append("select * from mallGoodsInfo where bigtype=? and pspecPrice < ?");
		sqlContent(order, sql);
		try {
			pst = conn.prepareStatement(sql.toString());
			pst.setString(1, bigtype);			
			pst.setDouble(2, price);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				// 封装参数
				Goods g = packageAttr(rs);
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
	 * 最小价格排序 小类型
	 * @param bigtype
	 * @param smalltype
	 * @return
	 */
	public List<Goods> queryMallListByMinPrice(String bigtype,String smalltype ,double price,String order) {
		List<Goods> list = new ArrayList<>();
		conn = DBUtil.getConn();
		StringBuffer sql= new StringBuffer();
		sql.append("select * from mallGoodsInfo where bigtype=? and smalltype = ? and pspecPrice > ?");
		sqlContent(order, sql);
		try {
			pst = conn.prepareStatement(sql.toString());
			pst.setString(1, bigtype);
			pst.setString(2, smalltype);
			pst.setDouble(3, price);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				// 封装参数
				Goods g = packageAttr(rs);
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
	 * 最小价格 小类型
	 * @param bigtype
	 * @param smalltype
	 * @return
	 */
	public List<Goods> queryMallListByMaxPrice(String bigtype,String smalltype ,double price,String order) {
		List<Goods> list = new ArrayList<>();
		conn = DBUtil.getConn();
		StringBuffer sql= new StringBuffer();
		sql.append("select * from mallGoodsInfo where bigtype=? and smalltype = ? and pspecPrice < ?");
		sqlContent(order, sql);
		try {
			pst = conn.prepareStatement(sql.toString());
			pst.setString(1, bigtype);
			pst.setString(2, smalltype);
			pst.setDouble(3, price);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				// 封装参数
				Goods g = packageAttr(rs);
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
	 * 筛选价格 大类型
	 * @param bigtype
	 * @param smalltype
	 * @return
	 */
	public List<Goods> queryMallListByMinMaxPrice(String bigtype,double minPrice,double maxPrice,String order) {
		List<Goods> list = new ArrayList<>();
		conn = DBUtil.getConn();
		StringBuffer sql= new StringBuffer();
		sql.append("select * from mallGoodsInfo where bigtype=?  and pspecPrice > ? and pspecPrice < ?");
		sqlContent(order, sql);
		try {
			pst = conn.prepareStatement(sql.toString());
			pst.setString(1, bigtype);			
			pst.setDouble(2, minPrice);
			pst.setDouble(3, maxPrice);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				//封装参数
				Goods g = packageAttr(rs);
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
	 * 筛选价格 小类型
	 * @param bigtype
	 * @param smalltype
	 * @return
	 */
	public List<Goods> queryMallListByMinMaxPrice(String bigtype,String smalltype ,double minPrice,double maxPrice,String order) {
		List<Goods> list = new ArrayList<>();
		conn = DBUtil.getConn();
		StringBuffer sql= new StringBuffer();
		sql.append("select * from mallGoodsInfo where bigtype=? and smalltype = ? and pspecPrice > ? and pspecPrice < ?");
		sqlContent(order, sql);
		try {
			pst = conn.prepareStatement(sql.toString());
			pst.setString(1, bigtype);
			pst.setString(2, smalltype);
			pst.setDouble(3, minPrice);
			pst.setDouble(4, maxPrice);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				// 封装参数
				Goods g = packageAttr(rs);
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
	 * 下架店铺内的商品
	 * 
	 * @param goodId
	 * @return
	 */
	public boolean deleteShopGoods(int goodsId) {
		conn = DBUtil.getConn();
		String sql = "delete from mallGoodsInfo where goodsId = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, goodsId);
			int row = pst.executeUpdate();
			if (row > 0) {
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
	
	public boolean inLovenum(int goodsid){
		conn = DBUtil.getConn();
		String sql = "update  mallGoodsInfo set lovenum = lovenum + 1　where goodsId = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, goodsid);
			int row = pst.executeUpdate();
			if (row > 0) {
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
	public boolean deLovenum(int goodsid){
		conn = DBUtil.getConn();
		String sql = "update  mallGoodsInfo set lovenum = lovenum - 1　where goodsId = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, goodsid);
			int row = pst.executeUpdate();
			if (row > 0) {
				System.out.println();
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
	/**
	 * 查看正在出售的宝贝
	 * @param shopid
	 * @return
	 */
	public List<Goods> queryInSaleList(int shopid){
		List<Goods> list = new ArrayList<>();
		conn = DBUtil.getConn();
		String sql = "select * from mallGoodsInfo where userId = ? ";
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, shopid);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				// 封装参数
				Goods g = packageAttr(rs);
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
	 * 搜索商品关键字
	 * @param keyword
	 * @return
	 */
	public List<Goods> queryMallListBykw(String keyword){
		List<Goods> list = new ArrayList<>();
		conn = DBUtil.getConn();
		StringBuffer sql= new StringBuffer();
		sql.append("select * from mallGoodsInfo where  goodsTitle like '%");
		sql.append(keyword);
		sql.append( "%'");
		try {
			pst = conn.prepareStatement(sql.toString());			
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				// 封装参数
				Goods g = packageAttr(rs);
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
	 * 商城内商品排序
	 * @param shopid
	 * @param order
	 * @return
	 */
	public List<Goods> queryMallByOrder(String order,String keyword,String minPrice,String maxPrice){
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
				sql.append("select * from mallGoodsInfo ");
				sqlContent(order, sql);
				pst = conn.prepareStatement(sql.toString());
				//0 0 1
			}else if(kwflag&&minflag&&!maxflag){
				sql.append("select * from mallGoodsInfo where pspecPrice < ?");
				sqlContent(order, sql);
				pst = conn.prepareStatement(sql.toString());
				pst.setDouble(1, Double.parseDouble(maxPrice));
				// 0 1 0
			}else if(kwflag&&!minflag&&maxflag){
				sql.append("select * from mallGoodsInfo where pspecPrice > ?");
				sqlContent(order, sql);
				pst = conn.prepareStatement(sql.toString());
				pst.setDouble(1, Double.parseDouble(minPrice));
				// 0 1 1 
			}else if(kwflag&&!minflag&&!maxflag){
				sql.append("select * from mallGoodsInfo where pspecPrice > ? and pspecPrice < ?");
				sqlContent(order, sql);
				pst = conn.prepareStatement(sql.toString());
				pst.setDouble(1, Double.parseDouble(minPrice));
				pst.setDouble(2, Double.parseDouble(maxPrice));
				//1 0 0
			}else if(!kwflag&&minflag&&maxflag){
				sql.append("select * from mallGoodsInfo where  goodsTitle like '%");
				sql.append(keyword);
				sql.append( "%'");
				sqlContent(order, sql);
				pst = conn.prepareStatement(sql.toString());
				System.out.println(sql.toString());
				//1 0 1
			}else if(!kwflag&&minflag&&!maxflag){
				sql.append("select * from mallGoodsInfo where goodsTitle like '%");
				sql.append(keyword);
				sql.append( "%' and  pspecPrice < ?");
				sqlContent(order, sql);
				pst = conn.prepareStatement(sql.toString());
				pst.setDouble(1, Double.parseDouble(maxPrice));
				// 1 1 0
			}else if(!kwflag&&!minflag&&maxflag){
				sql.append("select * from mallGoodsInfo where goodsTitle like '%");
				sql.append(keyword);
				sql.append( "%' and pspecPrice > ? ");
				sqlContent(order, sql);
				pst = conn.prepareStatement(sql.toString());
				pst.setDouble(1, Double.parseDouble(minPrice));
				// 1 1 1 
			}else if(!kwflag&&!minflag&&!maxflag){
				sql.append("select * from mallGoodsInfo where goodsTitle like '%");
				sql.append(keyword);
				sql.append( "%' and pspecPrice > ? and pspecPrice < ?");
				sqlContent(order, sql);
				pst = conn.prepareStatement(sql.toString());
				pst.setDouble(1, Double.parseDouble(minPrice));
				pst.setDouble(2, Double.parseDouble(maxPrice));
			}
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				// 封装参数
				Goods g = packageAttr(rs);				
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
	 * 封装参数
	 * @param rs
	 * @return
	 * @throws SQLException
	 */
	public static Goods packageAttr(ResultSet rs) throws SQLException {
		Goods g = new Goods();
		g.setGoodsId(rs.getInt("goodsId"));
		g.setUserId(rs.getInt("userId"));
		g.setBigtype(rs.getString("bigtype"));
		g.setSmalltype(rs.getString("smalltype"));
		g.setGoodsTitle(rs.getString("goodsTitle"));				
		g.setPicPaths(StringUtil.stringToList(rs.getString("picPaths")));			
		g.setPspecPrice(rs.getDouble("pspecPrice"));
		g.setSalenum(rs.getInt("salenum"));
		g.setLovenum(rs.getInt("lovenum"));
		return g;
	}
	
	/**
	 * 根据不同的排序组成不同的sql语句
	 * @param order
	 * @param sql
	 */
	public static void sqlContent(String order, StringBuffer sql) {
		if ("total".equals(order)||order==null) {
			sql.append("order by salenum desc,goodsComedate desc,pspecPrice asc");
		}else if ("date".equals(order)) {
			sql.append("order by goodsComedate desc");
		} else if ("salenum".equals(order)) {
			sql.append("order by salenum desc");
		} else if ("price".equals(order)) {
			sql.append("order by pspecPrice asc");
		}else if ("lovenum".equals(order)) {
			sql.append("order by lovenum desc");
		}
	}
	
	
	
}
