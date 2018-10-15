package com.localup.service;

import java.util.List;

import com.localup.domain.BoardVO;

public interface BoardService {
	
	//게시글 
	public void boardWrite(BoardVO boardVO) throws Exception; //입력
	public BoardVO boarRead(int board_no) throws Exception; //읽기
	public void boardUpdate(BoardVO boardVO) throws Exception; //수정
	public void boardDelete(int board_no) throws Exception; //삭제
	
	//좋아요 버튼
	//좋아요 수 업데이트
	public void likeUp(int board_no) throws Exception;
	public void likeMinus(int board_no) throws Exception;
	
	//좋아요 수 카운트
	public int likeCount(int board_no) throws Exception;
	
	//특정 아이디가 쓴 전체 게시글 조회 : 작성자 rys
	List<BoardVO> readIdBoard(String member_email) throws Exception; 
	
}
