package com.localup.persistence;

import com.localup.domain.BoardVO;
import com.localup.domain.LikeBtVO;

public interface BoardDAO {
	
	//게시글 입력
	public void insertBoard(BoardVO boardVO) throws Exception;
	
	//게시글 상세페이지
	public BoardVO readBoard(int board_no) throws Exception;
	
	//좋아요 수 업데이트
	public void upLike(int board_no) throws Exception;
	
	//좋아요 총 수
	public BoardVO countLike(int board_no) throws Exception;
	
	//좋아요 버튼 누르기
	public void addLikeBt(LikeBtVO likeBtVO) throws Exception;
	
	//좋아요 눌렀는지 확인
	//public BoardVO checkLike() throws Exception;
	
}
