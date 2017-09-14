package com.ll.mall.vo;
/**
 * 店铺实体类
 * @author litong
 *
 */

import java.io.Serializable;
import java.util.Date;

public class Shop implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int shopid ;
	private String mastername;
	private String shopname ;
	private String shoplogo;
	private String shopintro ;
	private String shopaddress ;
	private Date shopbt;
	private int goodsnum ;
	private double favorcomment; 
	private double descscore ;
	private double logscore ;
	private double servscore ;
	
	public int getShopid() {
		return shopid;
	}
	public void setShopid(int shopid) {
		this.shopid = shopid;
	}
	public String getMastername() {
		return mastername;
	}
	public void setMastername(String mastername) {
		this.mastername = mastername;
	}
	public String getShopname() {
		return shopname;
	}
	public void setShopname(String shopname) {
		this.shopname = shopname;
	}
	public String getShoplogo() {
		return shoplogo;
	}
	public void setShoplogo(String shoplogo) {
		this.shoplogo = shoplogo;
	}
	public String getShopintro() {
		return shopintro;
	}
	public void setShopintro(String shopintro) {
		this.shopintro = shopintro;
	}
	public String getShopaddress() {
		return shopaddress;
	}
	public void setShopaddress(String shopaddress) {
		this.shopaddress = shopaddress;
	}
	public Date getShopbt() {
		return shopbt;
	}
	public void setShopbt(Date shopbt) {
		this.shopbt = shopbt;
	}
	public int getGoodsnum() {
		return goodsnum;
	}
	public void setGoodsnum(int goodsnum) {
		this.goodsnum = goodsnum;
	}
	public double getFavorcomment() {
		return favorcomment;
	}
	public void setFavorcomment(double favorcomment) {
		this.favorcomment = favorcomment;
	}
	public double getDescscore() {
		return descscore;
	}
	public void setDescscore(double descscore) {
		this.descscore = descscore;
	}
	public double getLogscore() {
		return logscore;
	}
	public void setLogscore(double logscore) {
		this.logscore = logscore;
	}
	public double getServscore() {
		return servscore;
	}
	public void setServscore(double servscore) {
		this.servscore = servscore;
	}
	
	
}
