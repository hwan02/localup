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
	
	@Override
	public void boardWrite(BoardVO boardVO) throws Exception {
		boardDAO.insertBoard(boardVO);
	}

	@Override
	public BoardVO boarRead(int board_no) throws Exception {
		return boardDAO.readBoard(board_no);
	}

	//------좋아요 버튼
	@Override
	public void likeUp(int board_no) throws Exception {
		boardDAO.upLike(board_no);
	}

	@Override
	public int likeCount(int board_no) throws Exception {
		return boardDAO.countLike(board_no);
	}
	
}

