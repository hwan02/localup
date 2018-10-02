package com.localup.persistence;

import com.localup.domain.BoardVO;

public interface BoardDAO {
	public void insertBoard(BoardVO boardVO) throws Exception;
	public BoardVO readBoard(int board_no) throws Exception;
}
