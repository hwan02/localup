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
public class MainDAOImpl implements MainDAO {
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<BoardVO> listBoard(Location loc, String board_type) {
		Map<String, String> map = new HashMap<>();
		map.put("south", loc.getSouth());
		map.put("north", loc.getNorth());
		map.put("east", loc.getEast());
		map.put("west", loc.getWest());
		map.put("board_type", board_type);
		return sqlSession.selectList("main.listBoard", map);
	}

	@Override
	public List<BoardVO> listBoardAll() {

		return sqlSession.selectList("main.listBoardAll");
	}

	@Override
	public List<BoardVO> listCustom(String lat, String lng) {
		Map<String, String> map = new HashMap<>();
		map.put("lng", lng);
		map.put("lat", lat);
		return sqlSession.selectList("main.listCustom", map);
	}

	@Override
	public String locInfo(String email) {
		System.out.println("MainDAO, locInfo="+email);
		return sqlSession.selectOne("main.locInfo", email);
	}

	@Override
	public List<String> listName(String mainSearch) {
		String search = "%"+mainSearch+"%";
		System.out.println("MainDAO, listName="+search);
		//System.out.println("search="+search);
		return sqlSession.selectList("main.listName", search);
	}
}
