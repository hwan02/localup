package com.localup.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.localup.domain.Criteria;
import com.localup.domain.ReplyVO;
import com.localup.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Inject
	private ReplyDAO replyDAO;
	
	@Override
	public void addReply(ReplyVO replyVO) throws Exception {
		replyDAO.insertReply(replyVO); //댓글 추가
	}

	@Override
	public List<ReplyVO> listReply(int board_no) throws Exception {
		return replyDAO.selectReply(board_no);
	}

	@Override
	public void modifyReply(ReplyVO replyVO) throws Exception {
		replyDAO.updateReply(replyVO);
	}

	@Override
	public void removeReply(int reply_no) throws Exception {
		replyDAO.deleteReply(reply_no);
	}

	@Override
	public List<ReplyVO> listReplyPage(int board_no, Criteria cri) throws Exception {
		return replyDAO.listPage(board_no, cri);
	}

	@Override
	public int count(int board_no) throws Exception {
		return replyDAO.count(board_no);
	}

}
