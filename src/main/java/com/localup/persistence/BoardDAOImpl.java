package com.localup.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.localup.domain.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	//(XML문서 내의) sql문 호출
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void insertBoard(BoardVO boardVO) throws Exception {
		System.out.println("insertVO>>>"+boardVO);
		sqlSession.insert("board.insertBoard",boardVO);
	}

	@Override
	public BoardVO readBoard(int board_no) throws Exception {
		System.out.println("board_no>>"+board_no);
		return sqlSession.selectOne("board.readBoard",board_no);
	}
	
}

