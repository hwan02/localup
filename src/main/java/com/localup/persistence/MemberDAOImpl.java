package com.localup.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.localup.domain.MemberVO;



//작성자 : rys
@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Inject
	SqlSession sqlSession;
	
	//회원정보 업데이트
	@Override
	public void update(MemberVO memberUpdateVO) throws Exception {
		System.out.println("member 수정VO : " + memberUpdateVO); //DB 수정 잘 되는지 확인 TEST
		sqlSession.update("member.myUpdate",memberUpdateVO);	
	}

	//특정값 조회
	@Override
	public MemberVO read(String member_email) throws Exception {
		member_email = "localup@gmail.com";
		System.out.println("로그인상태 아이디>>>"+member_email);
		return sqlSession.selectOne("member.read",member_email);
	}

	//회원 탈퇴
	@Override
	public void delete(String member_email) throws Exception {
		sqlSession.delete("member.delete",member_email);
		
	}

	//전체 회원정보 조회
//	@Override
//	public List<MemberVO> listAll() throws Exception {
//		return sqlSession.selectList("member.myUpdateCheck");
//	}
}
