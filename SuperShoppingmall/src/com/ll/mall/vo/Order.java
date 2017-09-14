package com.ll.mall.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Order implements Serializable{

	private int orderid;
	private int userid;
	private int orderContent;
	
	//订单商品信息
	private int goodsid;
	private int shopid;
	private String shopname;
	private List<String> picPaths;
	private String goodsTitle;
	private double goodsPrice;
	private String goodsColor;
	private String goodsSize;
	private int goodsNum;
	private double goodsTotalPrice;
	
	private String orderState;
	private String orderDate;
	private String addressContent;
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getOrderContent() {
		return orderContent;
	}
	public void setOrderContent(int orderContent) {
		this.orderContent = orderContent;
	}
	
	
	public int getGoodsid() {
	    return goodsid;
	}
	public void setGoodsid(int goodsid) {
	    this.goodsid = goodsid;
	}
	public int getShopid() {
	    return shopid;
	}
	public void setShopid(int shopid) {
	    this.shopid = shopid;
	}
	public String getShopname() {
	    return shopname;
	}
	public void setShopname(String shopname) {
	    this.shopname = shopname;
	}
	public List<String> getPicPaths() {
	    return picPaths;
	}
	public void setPicPaths(List<String> picPaths) {
	    this.picPaths = picPaths;
	}
	public String getGoodsTitle() {
	    return goodsTitle;
	}
	public void setGoodsTitle(String goodsTitle) {
	    this.goodsTitle = goodsTitle;
	}
	public double getGoodsPrice() {
	    return goodsPrice;
	}
	public void setGoodsPrice(double goodsPrice) {
	    this.goodsPrice = goodsPrice;
	}
	public String getGoodsColor() {
	    return goodsColor;
	}
	public void setGoodsColor(String goodsColor) {
	    this.goodsColor = goodsColor;
	}
	public String getGoodsSize() {
	    return goodsSize;
	}
	public void setGoodsSize(String goodsSize) {
	    this.goodsSize = goodsSize;
	}
	public int getGoodsNum() {
	    return goodsNum;
	}
	public void setGoodsNum(int goodsNum) {
	    this.goodsNum = goodsNum;
	}
	public double getGoodsTotalPrice() {
	    return goodsTotalPrice;
	}
	public void setGoodsTotalPrice(double goodsTotalPrice) {
	    this.goodsTotalPrice = goodsTotalPrice;
	}
	public String getOrderState() {
		return orderState;
	}
	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getAddressContent() {
	    return addressContent;
	}
	public void setAddressContent(String addressContent) {
	    this.addressContent = addressContent;
	}
	
	
}
