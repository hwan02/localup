package com.localup.domain;

public class LikeBtVO {
	private int likebt_ch; // 좋아요 버튼 체크 상태 -- 0 or 1
	private int board_no; // 게시글 번호
	private int member_email; // 좋아요를 누른 회원 메일

	public LikeBtVO() {
		// TODO Auto-generated constructor stub
	}

	public LikeBtVO(int likebt_ch, int board_no, int member_email) {
		super();
		this.likebt_ch = likebt_ch;
		this.board_no = board_no;
		this.member_email = member_email;
	}

	public int getLikebt_ch() {
		return likebt_ch;
	}

	public void setLikebt_ch(int likebt_ch) {
		this.likebt_ch = likebt_ch;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public int getMember_email() {
		return member_email;
	}

	public void setMember_email(int member_email) {
		this.member_email = member_email;
	}

	@Override
	public String toString() {
		return "LikeBtVO [likebt_ch=" + likebt_ch + ", board_no=" + board_no + ", member_email=" + member_email + "]";
	}

}
