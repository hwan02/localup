package com.localup.domain;

public class LevelsVO {
	private int levels_level; // 회원레벨
	private String levels_name; // 레벨명
	private int levels_point; // 누적경험치
	private int levels_like; // 좋아요기준
	private int levels_board; // 게시글 수

	public LevelsVO() {
		// TODO Auto-generated constructor stub
	}

	public LevelsVO(int levels_level, String levels_name, int levels_point, int levels_like, int levels_board) {
		super();
		this.levels_level = levels_level;
		this.levels_name = levels_name;
		this.levels_point = levels_point;
		this.levels_like = levels_like;
		this.levels_board = levels_board;
	}

	public int getLevels_level() {
		return levels_level;
	}

	public void setLevels_level(int levels_level) {
		this.levels_level = levels_level;
	}

	public String getLevels_name() {
		return levels_name;
	}

	public void setLevels_name(String levels_name) {
		this.levels_name = levels_name;
	}

	public int getLevels_point() {
		return levels_point;
	}

	public void setLevels_point(int levels_point) {
		this.levels_point = levels_point;
	}

	public int getLevels_like() {
		return levels_like;
	}

	public void setLevels_like(int levels_like) {
		this.levels_like = levels_like;
	}

	public int getLevels_board() {
		return levels_board;
	}

	public void setLevels_board(int levels_board) {
		this.levels_board = levels_board;
	}

	@Override
	public String toString() {
		return "LevelsVO [levels_level=" + levels_level + ", levels_name=" + levels_name + ", levels_point="
				+ levels_point + ", levels_like=" + levels_like + ", levels_board=" + levels_board + "]";
	}

}
