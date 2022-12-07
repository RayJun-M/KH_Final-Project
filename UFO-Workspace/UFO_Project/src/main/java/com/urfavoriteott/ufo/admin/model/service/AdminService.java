package com.urfavoriteott.ufo.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.urfavoriteott.ufo.common.model.vo.PageInfo;
import com.urfavoriteott.ufo.contents.model.vo.Review;
import com.urfavoriteott.ufo.member.model.vo.Member;

public interface AdminService {
	
	/**
	 * 관리자 - 회원 리스트 조회용 메소드 - 작성자 : 장희연
	 * 전체 회원 수 조회
	 * @return
	 */
	int selectListCount();
	/**
	 * 관리자 - 회원 리스트 조회용 메소드 - 작성자 : 장희연
	 * 회원 리스트 조회
	 * @param pi : 페이징 처리를 위한 페이지 정보
	 * @return
	 */
	ArrayList<Member> selectList(PageInfo pi);

	/**
	 * 관리자 - 회원 검색 조회용 메소드 - 작성자 : 장희연
	 * 검색 조건에 부합하는 회원 수 조회
	 * @param map : keyword(아이디, 닉네임), searchword(검색어)가 담긴 HashMap
	 * @return
	 */
	int selectSearchCount(HashMap<String, String> map);
	
	/**
	 * 관리자 - 회원 검색 조회용 메소드 - 작성자 : 장희연
	 * 검색된 회원 리스트 조회
	 * @param map : keyword(아이디, 닉네임), searchword(검색어)가 담긴 HashMap
	 * @param pi : 페이징 처리를 위한 페이지 정보
	 * @return
	 */
	ArrayList<Member> selectSearchList(HashMap<String, String> map, PageInfo pi);
	
	/**
	 * 관리자 - 비밀번호 초기화용 메소드 - 작성자 : 장희연
	 * @param userNo : 비밀번호를 초기화할 회원의 회원번호
	 * @return
	 */
	int updatePwd(int userNo);
	
	/**
	 * 관리자 - 회원 탈퇴 처리용 메소드 - 작성자 : 장희연
	 * @param userNo : 탈퇴 처리할 회원의 회원번호
	 * @return
	 */
	int deleteMember(int userNo);
	
	/**
	 * 관리자 페이지 코멘트 관리를 위한 페이징바 - 작성자: 수빈
	 * @param reviewNo : 코멘트 번호
	 * @return
	 */
	int selectAdminCommentListCount();
	
	/**
	 * 관리자 페이지에서 코멘트 관리를 위해 모든 코멘트 조회 (select) - 작성자: 수빈
	 * @param reviewNo : 코멘트 번호
	 * @return
	 */
	ArrayList<Review> selectAdminCommentList(PageInfo pi);
	
	/**
	 * 관리자 페이지 코멘트 관리에서 검색을 위한 페이징바(select) - 작성자: 수빈
	 * @return
	 */
	int searchAdminCommentListCount(HashMap map);
	
	
	/**
	 * 관리자 페이지 코멘트 관리에서 검색된 코멘트 조회 (select) - 작성자: 수빈
	 * @return
	 */
	ArrayList<Review> searchAdminCommentList(HashMap map, PageInfo pi);

}