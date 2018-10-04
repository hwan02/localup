package com.localup.persistence;

import java.util.List;

import com.localup.domain.ReplyVO;

public interface ReplyDAO {
	
	public void insertReply(ReplyVO replyVO) throws Exception;
	
	public List<ReplyVO> selectReply(int board_no) throws Exception;
	
}
