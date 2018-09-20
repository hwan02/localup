package com.localup.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.localup.domain.MemberUpdateVO;

@Repository
public class MemberUpdateDAOImpl implements MemberUpdateDAO{
	
	@Inject
	SqlSession sqlSession;
	
	//회원정보 업데이트
	@Override
	public void update(MemberUpdateVO memberUpdateVO) throws Exception {
	    System.out.println("member 수정VO : " + memberUpdateVO);
		sqlSession.update("memberUpdate.mUpdate",memberUpdateVO);	
	}

	//회원정보 조회
	@Override
	public List<MemberUpdateVO> listAll() throws Exception {
		return sqlSession.selectList("memberUpdate.listAll");
	}

}
