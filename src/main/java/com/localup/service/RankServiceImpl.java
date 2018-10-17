package com.localup.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.localup.domain.BoardVO;
import com.localup.persistence.BoardDAO;
import com.localup.persistence.RankDAO;

@Service
public class RankServiceImpl implements RankService{
	//DAO호출
	
	@Inject
	private RankDAO rankDAO;

	@Override
	public List<BoardVO> rankCategory1() throws Exception {
		return rankDAO.categoryRank1();
	}

	@Override
	public List<BoardVO> rankCategory2() throws Exception {
		return rankDAO.categoryRank2();
	}

	@Override
	public List<BoardVO> rankCategory3() throws Exception {
		return rankDAO.categoryRank3();
	}

	@Override
	public List<BoardVO> rankCategory4() throws Exception {
		return rankDAO.categoryRank4();
	}

	@Override
	public List<BoardVO> rankCategory5() throws Exception {
		return rankDAO.categoryRank5();
	}
	
}

