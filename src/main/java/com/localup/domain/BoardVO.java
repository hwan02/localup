package com.localup.domain;

import java.util.Date;

public class BoardVO {
	private int board_no;
	private String member_email;
	private String board_type;
	private String board_title;
	private String board_cont;
	private String board_img;
	private String board_view;
	private String board_like;
	private Date board_date;
	private String board_rec;
	private double board_alti;
	private double board_long;
	private int board_max;

	public BoardVO() {
		// TODO Auto-generated constructor stub
	}

	public BoardVO(int board_no, String member_email, String board_type, String board_title, String board_cont,
			String board_img, String board_view, String board_like, Date board_date, String board_rec,
			double board_alti, double board_long, int board_max) {
		super();
		this.board_no = board_no;
		this.member_email = member_email;
		this.board_type = board_type;
		this.board_title = board_title;
		this.board_cont = board_cont;
		this.board_img = board_img;
		this.board_view = board_view;
		this.board_like = board_like;
		this.board_date = board_date;
		this.board_rec = board_rec;
		this.board_alti = board_alti;
		this.board_long = board_long;
		this.board_max = board_max;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getBoard_type() {
		return board_type;
	}

	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_cont() {
		return board_cont;
	}

	public void setBoard_cont(String board_cont) {
		this.board_cont = board_cont;
	}

	public String getBoard_img() {
		return board_img;
	}

	public void setBoard_img(String board_img) {
		this.board_img = board_img;
	}

	public String getBoard_view() {
		return board_view;
	}

	public void setBoard_view(String board_view) {
		this.board_view = board_view;
	}

	public String getBoard_like() {
		return board_like;
	}

	public void setBoard_like(String board_like) {
		this.board_like = board_like;
	}

	public Date getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}

	public String getBoard_rec() {
		return board_rec;
	}

	public void setBoard_rec(String board_rec) {
		this.board_rec = board_rec;
	}
	
	public double getBoard_alti() {
		return board_alti;
	}

	public void setBoard_alti(double board_alti) {
		this.board_alti = board_alti;
	}

	public double getBoard_long() {
		return board_long;
	}

	public void setBoard_long(double board_long) {
		this.board_long = board_long;
	}

	public int getBoard_max() {
		return board_max;
	}

	public void setBoard_max(int board_max) {
		this.board_max = board_max;
	}

	@Override
	public String toString() {
		return "BoardVO [board_no=" + board_no + ", member_email=" + member_email + ", board_type=" + board_type
				+ ", board_title=" + board_title + ", board_cont=" + board_cont + ", board_img=" + board_img
				+ ", board_view=" + board_view + ", board_like=" + board_like + ", board_date=" + board_date
				+ ", board_rec=" + board_rec + ", board_alti=" + board_alti + ", board_long=" + board_long
				+ ", board_max=" + board_max + "]";
	}
	
}
