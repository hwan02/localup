package com.localup.service;

import com.localup.domain.BoardVO;

public interface BoardService {
	public void BoardWrite(BoardVO boardVO) throws Exception;
	public BoardVO BoarRead(int board_no) throws Exception;
	
	//사용정보페이지 작성자 : rys
	
}
