package com.localup.service;

import java.util.List;

import com.localup.domain.ReplyVO;

public interface ReplyService {
	
	public void addReply(ReplyVO replyVO) throws Exception;
	
	public List<ReplyVO> listReply(int board_no) throws Exception;
}
