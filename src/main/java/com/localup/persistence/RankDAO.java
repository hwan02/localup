package com.localup.persistence;

import java.util.List;

import com.localup.domain.BoardVO;

public interface RankDAO {
	
	//게시글 타입별 랭킹 조회(좋아요 순)
	public List<BoardVO> categoryRank1() throws Exception;
	public List<BoardVO> categoryRank2() throws Exception;
	public List<BoardVO> categoryRank3() throws Exception;
	public List<BoardVO> categoryRank4() throws Exception;
	public List<BoardVO> categoryRank5() throws Exception;
	
}
