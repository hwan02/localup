package com.localup.persistence;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.localup.domain.MemberVO;

@Repository
public class MemberDAOImpl_sign implements MemberDAO_sign{
	
	@Inject
	SqlSession sqlSession;
	
	//회원정보 등록
	@Override
	public void insert(MemberVO memberVO) throws Exception {
		sqlSession.insert("member.insert",memberVO);	
	}

	//이메일 인증 성공
	@Override
	public int update_state(String member_email, int member_state) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		map.put("member_state", member_state);
		map.put("member_email", member_email);		
		return sqlSession.update("member.update_state", map);
	}
	
	//로그인
	@Override
	public boolean signin(String member_email, String member_pw) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		map.put("member_email", member_email);
		map.put("member_pw", member_pw);
		return (int)sqlSession.selectOne("member.signin", map) > 0 ? true : false;
	}

	//이메일 찾기
	@Override
	public String findEmail(String member_name, String member_tel) throws Exception {
		HashMap<String, Object> map = new HashMap<>();
		map.put("member_name", member_name);
		map.put("member_tel", member_tel);
		return (String)sqlSession.selectOne("member.findEmail", map);
	}
}
