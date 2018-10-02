package com.localup.persistence;

import java.util.List;

import com.localup.domain.BoardVO;
import com.localup.domain.Location;

public interface MainDAO {
	public List<BoardVO> listBoard(Location loc,String board_type);
}
