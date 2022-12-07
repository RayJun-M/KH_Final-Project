package com.urfavoriteott.urfavoriteott.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.urfavoriteott.urfavoriteott.member.model.vo.Member;

@Repository
/**
 * 회원 서비스 DAO
 * @author user1
 *
 */
public class MemberDao {
	
	/**
	 * 로그인용 메소드 - 작성자 : 동민
	 * @param sqlSession
	 * @param m : 로그인할 사용자의 계정
	 * @return
	 */
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.loginMember", m);
		
	}
	
	/**
	 * 회원가입용 메소드 - 작성자 : 동민
	 * @param sqlSession
	 * @param m : 회원가입할 사용자의 계정
	 * @return
	 */
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	/**
	 * 닉네임 중복체크용 메소드 - 작성자 : 동민
	 * @param sqlSession
	 * @param checkNickname : 중복체크할 사용자의 닉네임
	 * @return
	 */
	public int nickNameCheck(SqlSessionTemplate sqlSession, String checkNickname) {
		
		return sqlSession.selectOne("memberMapper.nickNameCheck", checkNickname);
		
	}

}
