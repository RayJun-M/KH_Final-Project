package com.urfavoriteott.ufo.member.model.dao;

import java.util.HashMap;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import com.urfavoriteott.ufo.common.model.vo.PageInfo;
import com.urfavoriteott.ufo.contents.model.vo.Review;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;
import com.urfavoriteott.ufo.member.model.vo.Member;


@Component
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
	 * 아이디 중복체크용 메소드 - 작성자 : 동민
	 * @param sqlSession
	 * @param checkId : 중복체크할 사용자의 아이디
	 * @return
	 */
	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
		
	}
	
	/**
	 * 비밀번호 재설정 메소드 - 작성자 : 동민
	 * @param sqlSession
	 * @param m : 비밀번호 재설정할 사용자 정보
	 * @return
	 */
	public int passwordUpdate(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.passwordUpdate", m);
	}
  
  /**
	 * 카카오 간편로그인 정보 저장 메소드 - 작성자 : 동민
	 * @param sqlSession
	 * @param userInfo : 카카오 로그인 정보 저장할 데이터
	 */
	public void kakaoinsert(SqlSessionTemplate sqlSession, HashMap<String, Object> userInfo) {
		sqlSession.insert("memberMapper.kakaoInsert",userInfo);
	}

	/**
	 * 카카오 간편로그인 정보 확인 메소드 - 작성자 : 동민 
	 * @param sqlSession
	 * @param userInfo : 카카오 로그인 정보 확인할 데이터
	 * @return
	 */
	public Member findkakao(SqlSessionTemplate sqlSession, HashMap<String, Object> userInfo) {
		System.out.println("RN:"+userInfo.get("nickname"));
		System.out.println("RE:"+userInfo.get("email"));
		Member m = sqlSession.selectOne("memberMapper.findKakao", userInfo);
		System.out.println("m : " + m);
		return m;
		// return sqlSession.selectOne("memberMapper.findKakao", userInfo);
  }
	
	/**
	 * 네이버 간편로그인 정보 확인용 메소드 - 작성자 : 장희연
	 * @param sqlSession
	 * @param userId
	 * @return
	 */
	public Member findNaver(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.selectOne("memberMapper.findNaver", userId);
	}
	
	/**
	 * 네이버 간편로그인 정보 저장용 메소드 - 작성자 : 장희연
	 * @param m
	 * @return
	 */
	public int insertNaver(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("memberMapper.insertNaver", m);
	}
	
	/**
	 * 사용자 - 닉네임 중복체크용 메소드 - 작성자 : 장희연
	 * @param sqlSession
	 * @param checkNickname : 중복체크할 사용자의 닉네임
	 * @return
	 */
	public int nicknameCheck(SqlSessionTemplate sqlSession, String checkNickname) {
		
		return sqlSession.selectOne("memberMapper.nicknameCheck", checkNickname);
	}
	
	/**
	 * 사용자 - 회원 정보 수정용 메소드 - 작성자 : 장희연
	 * @param sqlSession
	 * @param m : 사용자의 수정할 회원 정보(아이디, 회원번호, 프로필, 닉네임)
	 * @return
	 */
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.updateMember", m);
	}
	
	/**
	 * 사용자 - 회원 탈퇴 처리용 메소드 - 작성자 : 장희연 
	 * @param sqlSession
	 * @param userNo : 로그인한 사용자(탈퇴할 회원)의 회원 번호
	 * @return
	 */
	public int deleteMember(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.update("memberMapper.deleteMember", userNo);
	}
	
  /**
	 * 마이 페이지 별점 및 코멘트 내역 조회를 위한 페이징바(select) - 작성자 : 수빈
	 * @param sqlSession
	 * @param loginUser
	 * @return
	 */
	public int selectMyCommentListCount(SqlSessionTemplate sqlSession, String loginUserNo) {
		
		return sqlSession.selectOne("memberMapper.selectMyCommentListCount", loginUserNo);
	}
	
	/**
	 * 마이 페이지 별점 및 코멘트 내역에서 코멘트 조회 (select) - 작성자 : 수빈
	 * @param sqlSession
	 * @param pi
	 * @param loginUser
	 * @return
	 */
	public ArrayList<Review> selectMyCommentList(SqlSessionTemplate sqlSession, PageInfo pi, String loginUserNo) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() -1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMyCommentList", loginUserNo, rowBounds);
	}
	
	/**
	 * 마이 페이지 별점 및 코멘트 내역에서 선택된 리뷰 삭제 메소드 - 작성자: 수빈
	 * @param sqlSession
	 * @param checkNum
	 * @return
	 */
	public int deleteMyComment(SqlSessionTemplate sqlSession, int checkNum) {
		return sqlSession.update("memberMapper.deleteMyComment", checkNum);
	}
}
