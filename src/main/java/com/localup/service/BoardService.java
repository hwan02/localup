package com.localup.service;

import com.localup.domain.BoardVO;
import com.localup.domain.LikeBtVO;

public interface BoardService {
	
	//게시글 
	public void BoardWrite(BoardVO boardVO) throws Exception;
	public BoardVO BoarRead(int board_no) throws Exception;
	
	//좋아요 버튼
	//좋아요 수 업데이트
	public void LikeUp(int board_no) throws Exception;
	//좋아요 수 카운트
	public void LikeCount(int board_no) throws Exception; 
	//좋아요 버튼 누르기
	public void LikeAdd(LikeBtVO likeBtVO) throws Exception;
		
}
