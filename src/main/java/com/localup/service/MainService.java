package com.localup.service;

import java.util.List;
import java.util.Map;

import com.localup.domain.BoardVO;
import com.localup.domain.Location;

public interface MainService {
	public List<BoardVO> listBoard(Location loc, String board_type);
	public List<BoardVO> listBoardAll();
	public List<BoardVO> listCustom(String lat, String lng);
}
