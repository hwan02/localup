package com.localup.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.localup.domain.BoardVO;
import com.localup.domain.LevelsVO;
import com.localup.domain.MemberVO;
import com.localup.domain.SubVO;

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
		//member_email = "localup@gmail.com";
		System.out.println("로그인상태 아이디>>>"+member_email);
		return sqlSession.selectOne("member.read",member_email);
	}

	//회원 탈퇴
	@Override
	public void delete(String member_email) throws Exception {
		sqlSession.delete("member.delete",member_email);
		
	}
	
	//나의 레벨 조회
	@Override
	public String myLevel(String member_email) throws Exception {
		//System.out.println("MemberDAO myLevel member_email>>>"+member_email);
		//System.out.println("MemberDAO SQL>>>"+sqlSession.selectOne("point.myLevel",member_email));
		return sqlSession.selectOne("point.myLevel",member_email);
	}

	//특정 아이디가 쓴 게시글 조회
	@Override
	public List<BoardVO> readIdBoard(String member_email) throws Exception {
		return sqlSession.selectList("member.readIdBoard",member_email);
	}
	
	//팔로우(구독)하기
	@Override
	public void insertSub(SubVO subVO) throws Exception {
		sqlSession.insert("member.insertSub",subVO);
	}

	//전체 회원정보 조회
//	@Override
//	public List<MemberVO> listAll() throws Exception {
//		return sqlSession.selectList("member.myUpdateCheck");
//	}
}
