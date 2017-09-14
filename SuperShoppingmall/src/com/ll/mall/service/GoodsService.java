package com.ll.mall.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ll.core.utils.DBUtil;
import com.ll.mall.dao.GoodsDao;
import com.ll.mall.vo.Goods;

public class GoodsService {

	private GoodsDao dao;

	public GoodsService() {
		dao = new GoodsDao();
	}

	/**
	 * 添加商品
	 * 
	 * @param goods
	 * @return
	 */
	public Goods addGoods(Goods goods) {
		return dao.addGoods(goods);

	}

	/**
	 * 添加商品图片
	 * 
	 * @param path
	 * @param id
	 * @return
	 */
	public boolean addPic(List<String> path, int id) {
		return dao.addPic(path, id);
	}

	/**
	 * 查询商城所有的商品
	 * 
	 * @return
	 */
	public List<Goods> queryMallList() {

		return dao.queryMallList();

	}

	/**
	 * 查询店铺内所有商品
	 * 
	 * @param userid
	 * @return
	 */
	public List<Goods> queryShopList(int userId) {

		return dao.queryShopList(userId);

	}

	/**
	 * 根据商品id查询商品信息
	 * 
	 * @param goodsId
	 * @return
	 */
	public Goods queryById(int goodsId) {

		return dao.queryById(goodsId);

	}
	
	/**
	 * 下架店铺内的商品
	 * 
	 * @param goodId
	 * @return
	 */
	public boolean deleteShopGoods(int goodsId) {

		return dao.deleteShopGoods(goodsId);

	}
	/**
	 * 新品 大类型排序
	 * @return
	 */
	public List<Goods> queryMallListByOrder(String bigtype,String order) {
		return dao.queryMallListByOrder(bigtype,order);
	}
	/**
	 * 新品 大类型排序
	 * @return
	 */
	public List<Goods> queryMallListByOrder(String bigtype,String smalltype,String order) {
		return dao.queryMallListByOrder(bigtype,smalltype,order);
	}
	/**
	 * 最小价格 大类型
	 * @param bigtype
	 * @param smalltype
	 * @return
	 */
	public List<Goods> queryMallListByMinPrice(String bigtype ,double price,String order) {
		return dao.queryMallListByMinPrice(bigtype, price,order);
	}
	
	/**
	 * 最大价格 大类型
	 * @param bigtype
	 * @param smalltype
	 * @return
	 */
	public List<Goods> queryMallListByMaxPrice(String bigtype ,double price,String order) {
		return dao.queryMallListByMaxPrice(bigtype, price,order);
	}
	
	/**
	 * 最小价格排序 小类型
	 * @param bigtype
	 * @param smalltype
	 * @return
	 */
	public List<Goods> queryMallListByMinPrice(String bigtype,String smalltype ,double price,String order) {
		return dao.queryMallListByMinPrice(bigtype, smalltype, price,order);
	}
	
	/**
	 * 最小价格 小类型
	 * @param bigtype
	 * @param smalltype
	 * @return
	 */
	public List<Goods> queryMallListByMaxPrice(String bigtype,String smalltype ,double price,String order) {
		return dao.queryMallListByMaxPrice(bigtype, smalltype, price,order);
	}
	
	/**
	 * 筛选价格 大类型
	 * @param bigtype
	 * @param smalltype
	 * @return
	 */
	public List<Goods> queryMallListByMinMaxPrice(String bigtype,double minPrice,double maxPrice,String order) {
		return dao.queryMallListByMinMaxPrice(bigtype, minPrice, maxPrice,order);
	}
	
	/**
	 * 筛选价格 小类型
	 * @param bigtype
	 * @param smalltype
	 * @return
	 */
	public List<Goods> queryMallListByMinMaxPrice(String bigtype,String smalltype ,double minPrice,double maxPrice,String order) {
		return dao.queryMallListByMinMaxPrice(bigtype,smalltype, minPrice, maxPrice,order);
	}

	public List<Goods> queryMallListByBigType(String bigtype) {
		
		return dao.queryMallListByBigType(bigtype);
	}
	/**
	 * 查看已售出的宝贝
	 * @param shopid
	 * @return
	 */
	public List<Goods> queryInSaleList(int shopid){
		return dao.queryInSaleList(shopid);
	}
	/**
	 * 搜索商品关键字
	 * @param keyword
	 * @return
	 */
	public List<Goods> queryMallListBykw(String keyword){
		return dao.queryMallListBykw(keyword);
	}
	/**
	 * 商城内商品排序
	 * @param shopid
	 * @param order
	 * @return
	 */
	public List<Goods> queryMallByOrder(String order,String keyword,String minPrice,String maxPrice){
		return dao.queryMallByOrder(order, keyword, minPrice, maxPrice);
	}
	
}
