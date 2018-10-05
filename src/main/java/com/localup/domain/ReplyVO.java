package com.localup.domain;

import java.util.Date;

public class ReplyVO {
	private int reply_no;
	private String reply_cont;
	private Date reply_date;
	private int reply_upno;
	private int board_no;
	private double reply_star;
	private String member_email;

	public int getReply_no() {
		return reply_no;
	}

	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}

	public String getReply_cont() {
		return reply_cont;
	}

	public void setReply_cont(String reply_cont) {
		this.reply_cont = reply_cont;
	}

	public Date getReply_date() {
		return reply_date;
	}

	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}

	public int getReply_upno() {
		return reply_upno;
	}

	public void setReply_upno(int reply_upno) {
		this.reply_upno = reply_upno;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public double getReply_star() {
		return reply_star;
	}

	public void setReply_star(double reply_star) {
		this.reply_star = reply_star;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	@Override
	public String toString() {
		return "ReplyVO [reply_no=" + reply_no + ", reply_cont=" + reply_cont + ", reply_date=" + reply_date
				+ ", reply_upno=" + reply_upno + ", board_no=" + board_no + ", reply_star=" + reply_star
				+ ", member_email=" + member_email + "]";
	}

}