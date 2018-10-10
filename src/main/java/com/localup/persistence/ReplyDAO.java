package com.localup.persistence;

import java.util.List;

import com.localup.domain.Criteria;
import com.localup.domain.ReplyVO;

public interface ReplyDAO {
	
	public void insertReply(ReplyVO replyVO) throws Exception;
	
	public List<ReplyVO> selectReply(int board_no) throws Exception;
	
	public void updateReply(ReplyVO replyVO) throws Exception;
	
	public void deleteReply(int reply_no) throws Exception;
	
	public List<ReplyVO> listPage(int board_no, Criteria cri) throws Exception;
	public int count(int board_no) throws Exception;
	
	//게시물 번호 얻기
	public int getBno(int reply_no) throws Exception;

}
