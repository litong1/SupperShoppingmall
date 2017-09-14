package com.ll.mall.vo;

public class AccountInfo {
	
	public int qid;
	public int userid;
	public String answer;
	public int score;
	public int signDays;
	public int isQuestion;
	
	public void setQid(int qid) {
		this.qid = qid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getSignDays() {
		return signDays;
	}

	public void setSignDays(int signDays) {
		this.signDays = signDays;
	}

	public int getIsQuestion() {
		return isQuestion;
	}

	public void setIsQuestion(int isQuestion) {
		this.isQuestion = isQuestion;
	}

	public AccountInfo() {

	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public int getQid() {
		return qid;
	}

	public int getUserid() {
		return userid;
	}

	
}
