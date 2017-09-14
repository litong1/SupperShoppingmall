package com.ll.mall.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Goods implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int goodsId;
	private int userId;
	private String bigtype;
	private String smalltype;
	private String goodsTitle;
	private String goodsNo;
	private String goodsMaterial;
	private String goodsBrand;
	private String goodsStyle;
	private String goodsScene;
	private String goodsSeason;
	private String goodsTarget;
	private Date goodsComedate;
	private List<String> picPaths;
	private List<String> selectColor ;
	private List<String> colorName ;
	
	private List<String> colorRemarks ;
	private List<String> sizeCheck ;
	private double pspecPrice;
	private int pspecNum;
	private int totalNum;
	private int salenum;
	private int lovenum; 
	public int getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(int goodsId) {
		this.goodsId = goodsId;
	}
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getBigtype() {
		return bigtype;
	}
	public void setBigtype(String bigtype) {
		this.bigtype = bigtype;
	}
	public String getSmalltype() {
		return smalltype;
	}
	public void setSmalltype(String smalltype) {
		this.smalltype = smalltype;
	}
	public String getGoodsTitle() {
		return goodsTitle;
	}
	public void setGoodsTitle(String goodsTitle) {
		this.goodsTitle = goodsTitle;
	}
	public String getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(String goodsNo) {
		this.goodsNo = goodsNo;
	}
	public String getGoodsMaterial() {
		return goodsMaterial;
	}
	public void setGoodsMaterial(String goodsMaterial) {
		this.goodsMaterial = goodsMaterial;
	}
	public String getGoodsBrand() {
		return goodsBrand;
	}
	public void setGoodsBrand(String goodsBrand) {
		this.goodsBrand = goodsBrand;
	}
	public String getGoodsStyle() {
		return goodsStyle;
	}
	public void setGoodsStyle(String goodsStyle) {
		this.goodsStyle = goodsStyle;
	}
	public String getGoodsScene() {
		return goodsScene;
	}
	public void setGoodsScene(String goodsScene) {
		this.goodsScene = goodsScene;
	}
	public String getGoodsSeason() {
		return goodsSeason;
	}
	public void setGoodsSeason(String goodsSeason) {
		this.goodsSeason = goodsSeason;
	}
	public String getGoodsTarget() {
		return goodsTarget;
	}
	public void setGoodsTarget(String goodsTarget) {
		this.goodsTarget = goodsTarget;
	}
	public Date getGoodsComedate() {
		return goodsComedate;
	}
	public void setGoodsComedate(Date goodsComedate) {
		this.goodsComedate = goodsComedate;
	}
	
	
	public List<String> getPicPaths() {
		return picPaths;
	}
	public void setPicPaths(List<String> picPaths) {
		this.picPaths = picPaths;
	}
	public List<String> getSelectColor() {
		return selectColor;
	}
	public void setSelectColor(List<String> selectColor) {
		this.selectColor = selectColor;
	}
	public List<String> getColorName() {
		return colorName;
	}
	public void setColorName(List<String> colorName) {
		this.colorName = colorName;
	}
	public List<String> getColorRemarks() {
		return colorRemarks;
	}
	public void setColorRemarks(List<String> colorRemarks) {
		this.colorRemarks = colorRemarks;
	}
	public List<String> getSizeCheck() {
		return sizeCheck;
	}
	public void setSizeCheck(List<String> sizeCheck) {
		this.sizeCheck = sizeCheck;
	}
	public double getPspecPrice() {
		return pspecPrice;
	}
	public void setPspecPrice(double pspecPrice) {
		this.pspecPrice = pspecPrice;
	}
	public int getPspecNum() {
		return pspecNum;
	}
	public void setPspecNum(int pspecNum) {
		this.pspecNum = pspecNum;
	}
	public int getTotalNum() {
		return totalNum;
	}
	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}
	public int getSalenum() {
		return salenum;
	}
	public void setSalenum(int salenum) {
		this.salenum = salenum;
	}
	public int getLovenum() {
		return lovenum;
	}
	public void setLovenum(int lovenum) {
		this.lovenum = lovenum;
	}
	
	
}
