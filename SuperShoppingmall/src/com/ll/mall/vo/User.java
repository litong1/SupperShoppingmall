package com.ll.mall.vo;

import java.io.Serializable;
import java.util.Date;
/**
 * 用户类
 * @author litong
 *
 */
public class User implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int userid;
	private String username;
	private String nickname;
	private String realname;
	private String password;
	private String role;
	private int sex;
	//头像地址
	private String avatar;
	private Date birthday;
	private String hometown;
	//地址
	private int score;
	private int signdays;
	private int isquestion;
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getHometown() {
		return hometown;
	}
	public void setHometown(String hometown) {
		this.hometown = hometown;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	
	public int getSigndays() {
		return signdays;
	}
	public void setSigndays(int signdays) {
		this.signdays = signdays;
	}
	public int getIsquestion() {
		return isquestion;
	}
	public void setIsquestion(int isquestion) {
		this.isquestion = isquestion;
	}
	
	
}
