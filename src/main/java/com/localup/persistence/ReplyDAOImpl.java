package com.localup.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.localup.domain.Criteria;
import com.localup.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
	@Inject
	private SqlSession sqlSession; //sql호출
	
	@Override
	public void insertReply(ReplyVO replyVO) throws Exception {
		sqlSession.insert("reply.insertReply",replyVO);
	}
	
	@Override
	public List<ReplyVO> selectReply(int board_no) throws Exception {
		return sqlSession.selectList("reply.selectReply",board_no);
	}

	@Override
	public void updateReply(ReplyVO replyVO) throws Exception {
		sqlSession.update("reply.updateReply",replyVO);
	}

	@Override
	public void deleteReply(int reply_no) throws Exception {
		sqlSession.delete("reply.deleteReply",reply_no);
	}
	
	//특정 게시물(글번호)에 대한 (페이징된,부분)댓글
	@Override
	public List<ReplyVO> listPage(int board_no, Criteria cri) throws Exception {
		RowBounds bounds = new RowBounds(cri.getPageStart(),cri.getPerPageNum());
											//	0				10 : 1페이지
											//	10				10 : 2페이지
											//	20				10 : 3페이지
		return sqlSession.selectList("reply.selectReply", board_no, bounds);
	}
	
	//특정 게시물에 대한 총 댓글 수
	@Override
	public int count(int board_no) throws Exception {
		return sqlSession.selectOne("reply.count",board_no);
	}

	@Override
	public int getBno(int reply_no) throws Exception {
		return sqlSession.selectOne("reply.getBno",reply_no);
	}
	
}
