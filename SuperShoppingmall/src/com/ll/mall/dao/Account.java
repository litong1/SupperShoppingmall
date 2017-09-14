package com.ll.mall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ll.core.utils.DBUtil;
import com.ll.mall.vo.AccountInfo;

import oracle.jdbc.driver.DBConversion;

public class Account {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public List<AccountInfo> getAccountInfo(String username) {
		List<AccountInfo> list = new ArrayList<>();

		conn = DBUtil.getConn();
		int userid = 0;
		int score = 0;
		int signdays = 0;
		int isquestion = 0;
		String sql1 = "select userid,score,signdays,isquestion from malluser where username=?";
		String sql2 = "select qid,answer from questions where userid = ?";
		try {
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				userid = rs.getInt(1);
				score = rs.getInt(2);
				signdays = rs.getInt(3);
				isquestion = rs.getInt(4);
			}
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, userid);
			rs = pstmt.executeQuery();
			if (isquestion == 0) {//没有
				AccountInfo accountInfo = new AccountInfo();
				accountInfo.setScore(score);
				accountInfo.setSignDays(signdays);
				accountInfo.setIsQuestion(isquestion);
				accountInfo.setUserid(userid);
				list.add(accountInfo);
			} else {//有
				while (rs.next()) {
					AccountInfo accountInfo = new AccountInfo();
					accountInfo.setQid(rs.getInt(1));
					accountInfo.setAnswer(rs.getString(2));
					accountInfo.setScore(score);
					accountInfo.setSignDays(signdays);
					accountInfo.setIsQuestion(isquestion);
					accountInfo.setUserid(userid);
					list.add(accountInfo);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeAll(conn, pstmt, rs);
		}

		return list;
	}

	public boolean changePwd(String username, String password) {
		conn = DBUtil.getConn();
		String sql = "update malluser set password=? where username=?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, password);
			pstmt.setString(2, username);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeAll(conn, pstmt, rs);
		}
		
		return result != 0;
	}
	
	public void changeQuestions(String username, String[] answers) {
		conn = DBUtil.getConn();
		int userid = 0;
		String sql1 = "select userid from malluser where username=?";
		String sql2 = "delete questions where userid=?";
		String sql3 = "insert into questions values(1,?,?)";
		String sql4 = "insert into questions values(2,?,?)";
		String sql5 = "insert into questions values(3,?,?)";
		String sql6 = "update malluser set isquestion=? where username=?";
		try {
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				userid = rs.getInt(1);
			}
			// 删除
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, userid);
			pstmt.executeUpdate();
			// 添加
			pstmt = conn.prepareStatement(sql3);
			pstmt.setInt(1, userid);
			pstmt.setString(2, answers[0]);
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(sql4);
			pstmt.setInt(1, userid);
			pstmt.setString(2, answers[1]);
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(sql5);
			pstmt.setInt(1, userid);
			pstmt.setString(2, answers[2]);
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(sql6);
			pstmt.setInt(1, 1);
			pstmt.setString(2, username);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.closeAll(conn, pstmt, rs);
		}
		
	}
	
	/**
	 * 验证密保问题
	 * @param qid
	 * @param userid
	 * @return
	 */
	public String  testPassword(int qid,int userid){
		conn = DBUtil.getConn();
		String sql = "select answer from questions where qid = ? and userid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qid);
			pstmt.setInt(2, userid);
			rs = pstmt.executeQuery();
			if(rs.next()){
				return rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}finally {
			DBUtil.closeAll(conn, pstmt, rs);
		}	
		return null;
		
	}
}
