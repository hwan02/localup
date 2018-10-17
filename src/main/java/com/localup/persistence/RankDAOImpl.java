package com.localup.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.localup.domain.BoardVO;

@Repository
public class RankDAOImpl implements RankDAO{
	//(XML문서 내의) sql문 호출
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<BoardVO> categoryRank1() throws Exception {
		return sqlSession.selectList("rank.categoryRank1");
	}

	@Override
	public List<BoardVO> categoryRank2() throws Exception {
		return sqlSession.selectList("rank.categoryRank2");
	}

	@Override
	public List<BoardVO> categoryRank3() throws Exception {
		return sqlSession.selectList("rank.categoryRank3");
	}

	@Override
	public List<BoardVO> categoryRank4() throws Exception {
		return sqlSession.selectList("rank.categoryRank4");
	}

	@Override
	public List<BoardVO> categoryRank5() throws Exception {
		return sqlSession.selectList("rank.categoryRank5");
	}
	
}

