package com.localup.persistence;

import java.util.List;

import com.localup.domain.BoardVO;
import com.localup.domain.Location;

public interface MainDAO {
	public String locInfo(String email);
	public List<BoardVO> listBoard(Location loc,String board_type);
	public List<BoardVO> listBoardAll();
	public List<BoardVO> listCustom(String lat, String lng);
	public List<String> listName(String mainSearch);
}
