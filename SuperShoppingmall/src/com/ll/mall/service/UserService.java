package com.ll.mall.service;

import com.ll.mall.dao.UserDao;
import com.ll.mall.vo.User;

/**
 * 服务类
 * @author litong
 *
 */
public class UserService {

	private UserDao dao;
	public UserService() {
		dao = new UserDao();
	}
	/**
	 * 注册用户
	 * @param user
	 * @return
	 */
	public User register(User user){
		return dao.addUser(user);				
	}
	
	/**
	 * 登录
	 * @param name
	 * @param pwd
	 * @return
	 */
	public User login(String name,String pwd){
		return dao.selectBynamepw(name, pwd);
	}
	
	/**
	 * 判断用户名是否已经被注册过
	 * @param name
	 * @return
	 */
	public boolean havaRegistered(String name){
		return dao.haveRegistered(name);
	}
	
	/**
	 * 修改用户角色为卖家
	 * @param userid
	 * @return
	 */
	public boolean modifyRole(int userid){
		return dao.modifyRole(userid);
	}
	/**
	 * 根据用户名查询用户信息
	 * @param username
	 * @return
	 */
	public User queryUserByName(String username){
		return dao.queryUserByName(username);
	}
}
