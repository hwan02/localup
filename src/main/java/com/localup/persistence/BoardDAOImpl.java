package com.localup.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.localup.domain.BoardVO;
import com.localup.domain.LikeBtVO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	//(XML문서 내의) sql문 호출
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void insertBoard(BoardVO boardVO) throws Exception { //게시글 작성
		System.out.println("insertVO>>>"+boardVO);
		sqlSession.insert("board.insertBoard",boardVO);
	}

	@Override
	public BoardVO readBoard(int board_no) throws Exception { //게시글 상세페이지
		System.out.println("board_no>>"+board_no);
		return sqlSession.selectOne("board.readBoard",board_no);
	}
	
	@Override
	public void upLike(int board_no) throws Exception {
		//게시판 테이블(board DB) 좋아요 수 업데이트
		sqlSession.update("board.upLike",board_no);
	}

	@Override
	public BoardVO countLike(int board_no) throws Exception {
		//좋아요 총 갯수 파악
		return sqlSession.selectOne("board.countLike", board_no);
	}
	
	//좋아요 버튼
	@Override
	public void addLikeBt(LikeBtVO likeBtVO) throws Exception {
		//좋아요 버튼 누르기 (좋아요를 이미 누른 회원은 로그인시 좋아요버튼이 눌러져있음)
		sqlSession.insert("board.addLikeBt",likeBtVO);
	}

}

