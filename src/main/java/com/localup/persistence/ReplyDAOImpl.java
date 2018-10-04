package com.localup.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
		return sqlSession.selectList("reply.listReply",board_no);
	}
	
}
