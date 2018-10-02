package com.localup.domain;

public class ReplyVO {
	private int reply_no;
	private String reply_cont;
	private String reply_date;
	private String reply_upno;
	private String board_no;
	private String reply_star;
	private String member_email;
	
	public ReplyVO() {
		// TODO Auto-generated constructor stub
	}

	public ReplyVO(int reply_no, String reply_cont, String reply_date, String reply_upno, String board_no,
			String reply_star, String member_email) {
		super();
		this.reply_no = reply_no;
		this.reply_cont = reply_cont;
		this.reply_date = reply_date;
		this.reply_upno = reply_upno;
		this.board_no = board_no;
		this.reply_star = reply_star;
		this.member_email = member_email;
	}

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

	public String getReply_date() {
		return reply_date;
	}

	public void setReply_date(String reply_date) {
		this.reply_date = reply_date;
	}

	public String getReply_upno() {
		return reply_upno;
	}

	public void setReply_upno(String reply_upno) {
		this.reply_upno = reply_upno;
	}

	public String getBoard_no() {
		return board_no;
	}

	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}

	public String getReply_star() {
		return reply_star;
	}

	public void setReply_star(String reply_star) {
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
