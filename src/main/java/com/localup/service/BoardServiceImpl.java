package com.localup.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.localup.domain.BoardVO;
import com.localup.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{
	//DAO호출
	
	@Inject
	private BoardDAO boardDAO;
	
	//게시글
	@Override
	public void boardWrite(BoardVO boardVO) throws Exception { //입력
		boardDAO.insertBoard(boardVO);
	}

	@Override
	public BoardVO boarRead(int board_no) throws Exception { //읽기
		boardDAO.updateViewCnt(board_no); //조회수 증가
		return boardDAO.readBoard(board_no);
	}
	
	@Override
	public void boardUpdate(BoardVO boardVO) throws Exception { //수정
		boardDAO.updateBoard(boardVO);
	}

	@Override
	public void boardDelete(int board_no) throws Exception { //삭제
		boardDAO.deleteBoard(board_no);
	}
	
	//------좋아요 버튼
	@Override
	public void likeUp(int board_no) throws Exception {
		boardDAO.upLike(board_no);
	}
	
	@Override
	public void likeMinus(int board_no) throws Exception {
		boardDAO.minusLike(board_no);
	}

	@Override
	public int likeCount(int board_no) throws Exception {
		return boardDAO.countLike(board_no);
	}
	
}

