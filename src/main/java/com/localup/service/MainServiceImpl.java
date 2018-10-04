package com.localup.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.localup.domain.BoardVO;
import com.localup.domain.Location;
import com.localup.persistence.MainDAO;
@Service
public class MainServiceImpl implements MainService{
	@Inject
	private MainDAO mainDAO;
	@Override
	public List<BoardVO> listBoard(Location loc,String board_type) {
		return mainDAO.listBoard(loc,board_type);
	}
	@Override
	public List<BoardVO> listBoardAll() {
		return mainDAO.listBoardAll();
	}

}
