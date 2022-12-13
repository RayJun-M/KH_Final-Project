package com.urfavoriteott.ufo.member.model.service;

import com.urfavoriteott.ufo.member.model.vo.Member;


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
	 * 아이디 중복 체크용 메소드 - 작성자 : 동민
	 * @param checkId : 중복체크할 사용자의 아이디
	 * @return
	 */
	int idCheck(String checkId);
	
	/**
	 * 비밀번호 재설정 메소드 - 작성자 : 동민
	 * @param m : 비밀번호 재설정할 사용자 정보
	 * @return
	 */
	int passwordUpdate(Member m);
	
	/**
	 * 사용자 - 닉네임 중복체크용 메소드 - 작성자 : 장희연
	 * @param checkNickname : 중복체크할 사용자의 닉네임
	 * @return
	 */
	int nicknameCheck(String checkNickname);
	
	/**
	 * 사용자 - 회원 정보 수정용 메소드 - 작성자 : 장희연
	 * @param m : 사용자의 수정할 회원 정보(아이디, 회원번호, 프로필, 닉네임)
	 * @return
	 */
	int updateMember(Member m);
	
	/**
	 * 사용자 - 회원 탈퇴 처리용 메소드 - 작성자 : 장희연
	 * @param userNo : 로그인한 사용자(탈퇴할 회원)의 회원 번호
	 * @return
	 */
	int deleteMember(int userNo);
	
	/**
	 * 카카오 간편로그인 메소드 - 작성자 : 동민
	 * @param authorize_code
	 * @return
	 */
	String getAccessToken(String authorize_code);
	
	/**
	 * 카카오 간편로그인 메소드2 - 작성자 : 동민
	 * @param access_Token
	 * @return
	 */
	Member getUserInfo(String access_Token);
}
