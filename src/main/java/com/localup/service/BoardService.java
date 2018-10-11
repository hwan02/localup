package com.localup.service;

import com.localup.domain.BoardVO;

public interface BoardService {
	
	//게시글 
	public void boardWrite(BoardVO boardVO) throws Exception;
	public BoardVO boarRead(int board_no) throws Exception;
	
	//좋아요 버튼
	//좋아요 수 업데이트
	public void likeUp(int board_no) throws Exception;
	//좋아요 수 카운트
	public int likeCount(int board_no) throws Exception; 
	
}
