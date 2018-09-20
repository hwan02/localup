package com.localup.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.localup.domain.MemberUpdateVO;
import com.localup.persistence.MemberUpdateDAO;

@Service
public class MemberUpdateServiceImpl implements MemberUpdateService{
	
	@Inject
	MemberUpdateDAO memberUpdateDAO;
	
	//회원정보 업데이트
	@Override
	public void update(MemberUpdateVO memberUpdateVO) throws Exception {
		memberUpdateDAO.update(memberUpdateVO);	
	}

	//회원정보 조회
	@Override
	public List<MemberUpdateVO> listAll() throws Exception {
		return  memberUpdateDAO.listAll();
	}

}
