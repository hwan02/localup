package com.localup.persistence;

import com.localup.domain.BoardVO;

public interface BoardDAO {
	
	//게시글 입력
	public void insertBoard(BoardVO boardVO) throws Exception;
	
	//게시글 상세페이지
	public BoardVO readBoard(int board_no) throws Exception;
	
	//좋아요 수 업데이트
	public void upLike(int board_no) throws Exception;
	
	//좋아요 총 수
	public int countLike(int board_no) throws Exception;
	
}
