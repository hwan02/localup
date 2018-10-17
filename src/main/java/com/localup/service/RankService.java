package com.localup.service;

import java.util.List;

import com.localup.domain.BoardVO;
import com.localup.domain.ReplyVO;

public interface RankService {
	
	//랭킹 조회
	List<BoardVO> rankCategory1() throws Exception; 
	List<BoardVO> rankCategory2() throws Exception; 
	List<BoardVO> rankCategory3() throws Exception; 
	List<BoardVO> rankCategory4() throws Exception; 
	List<BoardVO> rankCategory5() throws Exception; 
	
}
