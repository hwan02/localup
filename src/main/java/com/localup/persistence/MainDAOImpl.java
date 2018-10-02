package com.localup.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.localup.domain.BoardVO;
import com.localup.domain.Location;
@Repository
public class MainDAOImpl implements MainDAO{
	@Inject
	private SqlSession sqlSession;
	@Override
	public List<BoardVO> listBoard(Location loc,String board_type) {
		Map<String, String> map = new HashMap<>();
		map.put("south", loc.getSouth());
		map.put("north", loc.getNorth());
		map.put("east", loc.getEast());
		map.put("west", loc.getWest());
		map.put("board_type", board_type);
		return sqlSession.selectList("main.listBoard", map);
	}

}
