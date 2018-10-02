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
	public void BoardWrite(BoardVO boardVO) throws Exception {
		boardDAO.insertBoard(boardVO);
	}

	@Override
	public BoardVO BoarRead(int board_no) throws Exception {
		return boardDAO.readBoard(board_no);
	}
	
}

