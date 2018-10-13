package com.localup.persistence;

import java.util.List;

import com.localup.domain.BoardVO;

public interface BoardDAO {
	
	//게시글 입력
	public void insertBoard(BoardVO boardVO) throws Exception;
	
	//특정 게시글 상세페이지
	public BoardVO readBoard(int board_no) throws Exception;
	
	//특정 게시글 수정
	public void updateBoard(BoardVO boardVO) throws Exception;
	
	//특정 게시글 삭제
	public void deleteBoard(int board_no) throws Exception;
	
	//특정 게시글 조회수 카운트
	public void updateViewCnt(int board_no) throws Exception;
	
	//좋아요 수 업데이트
	public void upLike(int board_no) throws Exception;
	public void minusLike(int board_no) throws Exception;
	
	//좋아요 총 수
	public int countLike(int board_no) throws Exception;

	//특정 아이디가 쓴 전체 게시글 조회 : 작성자 rys
	public List<BoardVO> readIdBoard(String member_email) throws Exception;
	
}
