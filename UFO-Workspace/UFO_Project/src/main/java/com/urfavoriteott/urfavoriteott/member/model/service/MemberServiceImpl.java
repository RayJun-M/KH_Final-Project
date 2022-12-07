package com.urfavoriteott.urfavoriteott.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.urfavoriteott.urfavoriteott.member.model.dao.MemberDao;
import com.urfavoriteott.urfavoriteott.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	// SqlSessionTemplate 변수 선언
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// MemberDao 객체 생성 선언문
	@Autowired
	private MemberDao memberDao;

	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		
		return memberDao.insertMember(sqlSession, m);
		
	}

	@Override
	public int nickNameCheck(String checkNickname) {
		
		return memberDao.nickNameCheck(sqlSession, checkNickname);
		
	}

	@Override
	public int passWordUpdate(String updatePassword) {
		return 0;
	}
	
	
	
}
