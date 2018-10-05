package com.localup.service;

import java.util.List;

import com.localup.domain.Criteria;
import com.localup.domain.ReplyVO;

public interface ReplyService {
	
	public void addReply(ReplyVO replyVO) throws Exception;
	
	public List<ReplyVO> listReply(int board_no) throws Exception;
	
	public void modifyReply(ReplyVO replyVO) throws Exception;
	
	public void removeReply(int reply_no) throws Exception;
	
	public List<ReplyVO> listReplyPage(int board_no, Criteria cri) throws Exception;
	
	public int count(int board_no) throws Exception;
}
