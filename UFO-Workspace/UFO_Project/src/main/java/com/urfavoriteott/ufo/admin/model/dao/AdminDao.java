package com.urfavoriteott.ufo.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.urfavoriteott.ufo.admin.model.vo.Sales;
import com.urfavoriteott.ufo.common.model.vo.PageInfo;
import com.urfavoriteott.ufo.contents.model.vo.Review;
import com.urfavoriteott.ufo.member.model.vo.Member;

@Repository
public class AdminDao {
	
	/**
	 * 관리자 - 회원 리스트 조회용 메소드 - 작성자 : 장희연
	 * 전체 회원 수 조회
	 * @param sqlSession
	 * @return
	 */
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("memberMapper.selectListCount");
	}
	
	/**
	 * 관리자 - 회원 리스트 조회용 메소드 - 작성자 : 장희연
	 * 회원 리스트 조회
	 * @param sqlSession
	 * @param pi
	 * @return
	 */
	public ArrayList<Member> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectList", null, rowBounds);
	}
	
	/**
	 * 관리자 - 회원 검색 조회용 메소드 - 작성자 : 장희연
	 * 검색 조건에 부합하는 회원 수 조회
	 * @param sqlSession
	 * @param map
	 * @return
	 */
	public int selectSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.selectOne("memberMapper.selectSearchCount", map);
	}
	
	/**
	 * 관리자 - 회원 검색 조회용 메소드 - 작성자 : 장희연
	 * 검색된 회원 리스트 조회
	 * @param sqlSession
	 * @param map
	 * @param pi
	 * @return
	 */
	public ArrayList<Member> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectSearchList", map, rowBounds);
	}
	
	/**
	 * 관리자 - 비밀번호 초기화용 메소드 - 작성자 : 장희연
	 * @param sqlSession
	 * @param userNo
	 * @return
	 */
	public int updatePwd(SqlSessionTemplate sqlSession, int userNo) {

		return sqlSession.update("memberMapper.updatePwd", userNo);
	}
	
	/**
	 * 관리자 - 회원 탈퇴 처리용 메소드 - 작성자 : 장희연
	 * @param sqlSession
	 * @param userNo
	 * @return
	 */
	public int deleteMember(SqlSessionTemplate sqlSession, int userNo) {
	
		return sqlSession.update("memberMapper.deleteMember", userNo);
	}
	
	/**
	 * 관리자 - 한달이용권 월별 매출 메소드 - 작성자 : 장희연
	 * @param sqlSession
	 * @return
	 */
	public ArrayList<Sales> selectSalesPerMonthOnce(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectSalesPerMonthOnce");
	}
	
	/**
	 * 관리자 - 월간구독권 월별 매출 메소드 - 작성자 : 장희연
	 * @param sqlSession
	 * @return
	 */
	public ArrayList<Sales> selectSalesPerMonthSub(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectSalesPerMonthSub");
	}
	
	/**
	 * 관리자 - 월별 매출 메소드 - 작성자 : 장희연
	 * @param sqlSession
	 * @return
	 */
	public ArrayList<Sales> selectSalesPerMonth(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectSalesPerMonth");
	}
	
	/**
	 * 관리자 - 한달이용권 연도별 매출 메소드 - 작성자 : 장희연
	 * @param sqlSession
	 * @return
	 */
	public ArrayList<Sales> selectSalesPerYearOnce(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectSalesPerYearOnce");
	}
	
	/**
	 * 관리자 - 월간구독권 연도별 매출 메소드 - 작성자 : 장희연
	 * @param sqlSession
	 * @return
	 */
	public ArrayList<Sales> selectSalesPerYearSub(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectSalesPerYearSub");
	}
	
	/**
	 * 관리자 - 연도별 매출 메소드 - 작성자 : 장희연
	 * @param sqlSession
	 * @return
	 */
	public ArrayList<Sales> selectSalesPerYear(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectSalesPerYear");
	}
	
	public ArrayList<Integer> selectViewsTV(SqlSessionTemplate sqlSession, String genre) {
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectViewsTV", genre);
	}
	
	public ArrayList<Integer> selectViewsMovie(SqlSessionTemplate sqlSession, String genre) {
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectViewsMovie", genre);
	}
	
	/**
	 * 관리자 페이지 코멘트 관리를 위한 페이징바 - 작성자: 수빈
	 * @param sqlSession
	 * @return
	 */
	public int selectAdminCommentListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectAdminCommentListCount");
	}
	
	/**
	 * 관리자 페이지에서 코멘트 관리를 위해 모든 코멘트 조회 (select) - 작성자: 수빈
	 * @param sqlSession
	 * @param pi
	 * @return
	 */
	public ArrayList<Review> selectAdminCommentList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() -1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectAdminCommentList", null, rowBounds);
	}

	/**
	 * 관리자 페이지 코멘트 관리에서 검색을 위한 페이징바(select) - 작성자: 수빈
	 * @param sqlSession
	 * @param map
	 * @return
	 */
	public int searchAdminCommentListCount(SqlSessionTemplate sqlSession, HashMap map) {
		
		return sqlSession.selectOne("adminMapper.searchAdminCommentListCount", map);
	}

	/**
	 * 관리자 페이지 코멘트 관리에서 검색된 코멘트 조회 (select) - 작성자: 수빈
	 * @param sqlSession
	 * @param map
	 * @param pi
	 * @return
	 */
	public ArrayList<Review> searchAdminCommentList(SqlSessionTemplate sqlSession, HashMap map, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() -1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.searchAdminCommentList", map, rowBounds);
	}

}