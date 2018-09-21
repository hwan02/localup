package com.localup.service;

import java.util.List;

import com.localup.domain.BoardVO;
import com.localup.domain.Location;

public interface MainService {
	public List<BoardVO> listBoard(Location loc);
}
