package com.urfavoriteott.ufo.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.urfavoriteott.ufo.admin.model.dao.AdminDao;
import com.urfavoriteott.ufo.admin.model.vo.Report;
import com.urfavoriteott.ufo.admin.model.vo.Sales;
import com.urfavoriteott.ufo.common.model.vo.PageInfo;
import com.urfavoriteott.ufo.contents.model.vo.Review;
import com.urfavoriteott.ufo.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Autowired
    private AdminDao adminDao;
    
    /**
	 * 관리자 - 회원 리스트 조회용 메소드 - 작성자 : 장희연
	 * 전체 회원 수 조회
	 * @return
	 */
    @Override
	public int selectListCount() {
		
		return adminDao.selectListCount(sqlSession);
	}

    /**
	 * 관리자 - 회원 리스트 조회용 메소드 - 작성자 : 장희연
	 * 회원 리스트 조회
	 * @param pi : 페이징 처리를 위한 페이지 정보
	 * @return
	 */
	@Override
	public ArrayList<Member> selectList(PageInfo pi) {
		
		return adminDao.selectList(sqlSession, pi);
	}

	/**
	 * 관리자 - 회원 검색 조회용 메소드 - 작성자 : 장희연
	 * 검색 조건에 부합하는 회원 수 조회
	 * @param map : keyword(아이디, 닉네임), searchword(검색어)가 담긴 HashMap
	 * @return
	 */
	@Override
	public int selectSearchCount(HashMap<String, String> map) {
		
		return adminDao.selectSearchCount(sqlSession, map);
	}

	/**
	 * 관리자 - 회원 검색 조회용 메소드 - 작성자 : 장희연
	 * 검색된 회원 리스트 조회
	 * @param map : keyword(아이디, 닉네임), searchword(검색어)가 담긴 HashMap
	 * @param pi : 페이징 처리를 위한 페이지 정보
	 * @return
	 */
	@Override
	public ArrayList<Member> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		
		return adminDao.selectSearchList(sqlSession, map, pi);
	}

	/**
	 * 관리자 - 비밀번호 초기화용 메소드 - 작성자 : 장희연
	 * @param userNo : 비밀번호를 초기화할 회원의 회원번호
	 * @return
	 */
	@Override
	public int updatePwd(HashMap<String, Integer> map) {
		
		return adminDao.updatePwd(sqlSession, map);
	}

	/**
	 * 관리자 - 회원 탈퇴 처리용 메소드 - 작성자 : 장희연
	 * @param userNo : 탈퇴 처리할 회원의 회원번호
	 * @return
	 */
	@Override
	public int deleteMember(int userNo) {
		
		return adminDao.deleteMember(sqlSession, userNo);
	}
	
	/**
	 * 관리자 - 한달이용권 월별 매출 메소드 - 작성자 : 장희연
	 * @return
	 */
	@Override
	public ArrayList<Sales> selectSalesPerMonthOnce() {
		
		return adminDao.selectSalesPerMonthOnce(sqlSession);
	}

	/**
	 * 관리자 - 월간구독권 월별 매출 메소드 - 작성자 : 장희연
	 * @return
	 */
	@Override
	public ArrayList<Sales> selectSalesPerMonthSub() {
		
		return adminDao.selectSalesPerMonthSub(sqlSession);
	}
	
	/**
	 * 관리자 - 월별 매출 메소드 - 작성자 : 장희연
	 * @return
	 */
	@Override
	public ArrayList<Sales> selectSalesPerMonth() {
		
		return adminDao.selectSalesPerMonth(sqlSession);
	}
	
	/**
	 * 관리자 - 한달이용권 연도별 매출 메소드 - 작성자 : 장희연
	 * @return
	 */
	@Override
	public ArrayList<Sales> selectSalesPerYearOnce() {
		
		return adminDao.selectSalesPerYearOnce(sqlSession);
	}

	/**
	 * 관리자 - 월간구독권 연도별 매출 메소드 - 작성자 : 장희연
	 * @return
	 */
	@Override
	public ArrayList<Sales> selectSalesPerYearSub() {
		
		return adminDao.selectSalesPerYearSub(sqlSession);
	}

	/**
	 * 관리자 - 연도별 매출 메소드 - 작성자 : 장희연
	 * @return
	 */
	@Override
	public ArrayList<Sales> selectSalesPerYear() {
		
		return adminDao.selectSalesPerYear(sqlSession);
	}

	/**
	 * 관리자 - TV프로그램 장르별 시청수 메소드 - 작성자 : 장희연
	 * @param genre : TV프로그램 장르
	 * @return
	 */
	@Override
	public ArrayList<Integer> selectViewsTV(String genre) {
		
		return adminDao.selectViewsTV(sqlSession, genre);
	}

	/**
	 * 관리자 - 영화 장르별 시청수 메소드 - 작성자 : 장희연
	 * @param genre : 영화 장르
	 * @return
	 */
	@Override
	public ArrayList<Integer> selectViewsMovie(String genre) {
		
		return adminDao.selectViewsMovie(sqlSession, genre);
	}

	/**
	 * 관리자 페이지 코멘트 관리를 위한 페이징바 - 작성자: 수빈
	 * @return
	 */
	@Override
	public int selectAdminCommentListCount() {
		return adminDao.selectAdminCommentListCount(sqlSession);
	}

	/**
	 * 관리자 페이지에서 코멘트 관리를 위해 모든 코멘트 조회 (select) - 작성자: 수빈
	 * @return
	 */
	@Override
	public ArrayList<Review> selectAdminCommentList(PageInfo pi) {
		return adminDao.selectAdminCommentList(sqlSession, pi);
	}

	/**
	 * 관리자 페이지 코멘트 관리에서 검색을 위한 페이징바(select) - 작성자: 수빈
	 * @return
	 */
	@Override
	public int searchAdminCommentListCount(HashMap map) {
		return adminDao.searchAdminCommentListCount(sqlSession, map);
	}

	/**
	 * 관리자 페이지 코멘트 관리에서 검색된 코멘트 조회 (select) - 작성자: 수빈
	 * @return
	 */
	@Override
	public ArrayList<Review> searchAdminCommentList(HashMap map, PageInfo pi) {
		return adminDao.searchAdminCommentList(sqlSession, map, pi);
	}


	/**
	 * 관리자 페이지 코멘트 관리에서 선택된 코멘트 삭제 (update) - 작성자: 수빈
	 */
	@Override
	public int deleteAdminComment(int checkNum) {
		return adminDao.deleteAdminComment(sqlSession, checkNum);
	}

	/**
	 * 관리자 페이지 신고 관리를 위한 페이징바(select) - 작성자: 수빈
	 */
	@Override
	public int reportedCommentListCount() {
		return adminDao.reportedCommentListCount(sqlSession);
	}

	/**
	 * 관리자 페이지에서 신고 관리를 위해 신고된 모든 코멘트 조회 (select) - 작성자: 수빈
	 */
	@Override
	public ArrayList<Report> reportedCommentList(PageInfo pi) {
		return adminDao.reportedCommentList(sqlSession, pi);
	}
	
	/**
	 * 관리자 페이지 신고 관리에서 신고된 코멘트를 삭제(REPORT_STATUS='Y') 하는 메소드 - 작성자: 수빈
	 */
	@Override
	public int changeStatusReportedComment(int reportNo) {
		return adminDao.changeStatusReportedComment(sqlSession, reportNo);
	}

	/**
	 * 관리자 페이지 신고 관리에서 신고된 코멘트를 삭제(REVIEW_STATUS='N') 하는 메소드 - 작성자: 수빈
	 */
	@Override
	public int deleteReportedComment(int reviewNo) {
		return adminDao.deleteReportedComment(sqlSession, reviewNo);
	}

	/**
	 * 관리자 페이지 신고 관리에서 처리된 코멘트 보기 버튼 클릭 시 페이징바(select) - 작성자: 수빈
	 */
	@Override
	public int processedCommentListCount() {
		return adminDao.processedCommentListCount(sqlSession);
	}

	/**
	 * 관리자 페이지 신고 관리에서 처리된 코멘트 보기 버튼 클릭 시 신고 처리된 모든 코멘트 조회 (select) - 작성자: 수빈
	 */
	@Override
	public ArrayList<Report> processedCommentList(PageInfo pi) {
		return adminDao.processedCommentList(sqlSession, pi);
	}

	/**
	 * 관리자 페이지 신고 관리에서 신고된 코멘트를 되돌리는(REPORT_STATUS='N') 메소드 - 작성자: 수빈
	 */
	@Override
	public int resetStatusReportedComment(int reportNo) {
		return adminDao.resetStatusReportedComment(sqlSession, reportNo);
	}

	/**
	 * 관리자 페이지 신고 관리에서 신고된 코멘트를 삭제 상태를 되돌리는(REVIEW_STATUS='Y') 메소드 - 작성자: 수빈
	 */
	@Override
	public int resetReportedComment(int reviewNo) {
		return adminDao.resetReportedComment(sqlSession, reviewNo);
	}
}