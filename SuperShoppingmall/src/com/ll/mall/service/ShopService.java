package com.ll.mall.service;


import java.util.List;

import com.ll.mall.dao.ShopDao;
import com.ll.mall.vo.Goods;
import com.ll.mall.vo.Shop;

public class ShopService {

	private ShopDao dao;

	public ShopService() {
		dao = new ShopDao();
	}
	
	/**
	 * 添加店铺
	 * @param shop
	 * @return
	 */
	public Shop addShop(Shop shop){
		return dao.addShop(shop);
	}
	/**
	 * 补全店铺信息
	 * @return
	 */
	public Shop compShopInfo(Shop shop){
		return dao.compShopInfo(shop);
	}
	/**
	 * 上传店铺logo
	 * @return
	 */
	public boolean compShopLogo(String path,int userid){
		return dao.compShopLogo(path, userid);
	}
	/**
	 * 查询店铺相关信息
	 * @param userid
	 * @return
	 */
	public Shop queryShopByid(int shopid){
		return dao.queryShopByid(shopid);
	}
	/**
	 * 店铺内商品排序
	 * @param shopid
	 * @param order
	 * @return
	 */
	public List<Goods> queryShopByOrder(int shopid ,String order,String keyword,String minPrice,String maxPrice){
		return dao.queryShopByOrder(shopid, order, keyword, minPrice, maxPrice);
	}
	/**
	 * 搜索店铺关键字
	 * @param keyword
	 * @return
	 */
	public List<Shop> queryMallListBykw(String keyword){
		return dao.queryMallListBykw(keyword);
	}
}
