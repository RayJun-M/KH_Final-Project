package com.urfavoriteott.urfavoriteott.member.model.service;

import com.urfavoriteott.urfavoriteott.member.model.vo.Member;

/**
 * 회원 서비스 인터페이스
 * @author user1
 *
 */
public interface MemberService {

	/**
	 * 로그인용 메소드 - 작성자 : 동민
	 * @param m : 로그인할 사용자의 계정
	 * @return
	 */
	Member loginMember(Member m);
	
	/**
	 * 회원가입용 메소드 - 작성자 : 동민
	 * @param m : 회원가입할 사용자의 계정
	 * @return
	 */
	int insertMember(Member m);
	
	/**
	 * 닉네임 중복체크용 메소드 - 작성자 : 동민
	 * @param checknickName : 중복체크할 사용자의 닉네임
	 * @return
	 */
	int nickNameCheck(String checkNickname);
	
	/**
	 * 비밀번호 재설정용 메소드 - 작성자 : 동민
	 * @param updatePassword : 비밀번호 재설정할 비밀번호 
	 * @return
	 */
	int passWordUpdate(String updatePassword);
	
	
	
	
}
