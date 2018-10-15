package com.localup.persistence;

import java.util.List;

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
	public void insertBoard(BoardVO boardVO) throws Exception { //게시글 작성
		System.out.println("insertVO>>>"+boardVO);
		sqlSession.insert("board.insertBoard",boardVO);
	}

	@Override
	public BoardVO readBoard(int board_no) throws Exception { //특정 게시글 상세페이지
		System.out.println("board_no>>"+board_no);
		return sqlSession.selectOne("board.readBoard",board_no);
	}
	
	@Override
	public void updateBoard(BoardVO boardVO) throws Exception { //특정 게시글 수정
		sqlSession.update("board.updateBoard",boardVO);
	}

	@Override
	public void deleteBoard(int board_no) throws Exception { //특정 게시글 삭제
		sqlSession.delete("board.deleteBoard",board_no);
	}
	
	@Override
	public void updateViewCnt(int board_no) throws Exception {
		sqlSession.update("board.updateViewCnt",board_no);
	}
	
	@Override
	public void upLike(int board_no) throws Exception {
		//게시판 테이블(board DB) 좋아요 수 업데이트
		sqlSession.update("board.upLike",board_no);
	}
	
	@Override
	public void minusLike(int board_no) throws Exception {
		sqlSession.update("board.minusLike",board_no);
	}

	@Override
	public int countLike(int board_no) throws Exception {
		//좋아요 총 갯수 파악
		return sqlSession.selectOne("board.countLike", board_no);
	}
	
	//특정 아이디가 쓴 전체 게시글 조회 : 작성자 rys
	@Override
	public List<BoardVO> readIdBoard(String member_email) throws Exception {
		return sqlSession.selectList("member.readIdBoard",member_email);
	}
}

