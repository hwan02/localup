package com.localup.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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

}
