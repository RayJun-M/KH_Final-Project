package com.urfavoriteott.ufo.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.urfavoriteott.ufo.admin.model.dao.AdminDao;
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
    
    @Override
	public int selectListCount() {
		
		return adminDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Member> selectList(PageInfo pi) {
		
		return adminDao.selectList(sqlSession, pi);
	}

	@Override
	public int selectSearchCount(HashMap<String, String> map) {
		
		return adminDao.selectSearchCount(sqlSession, map);
	}

	@Override
	public ArrayList<Member> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		
		return adminDao.selectSearchList(sqlSession, map, pi);
	}

	@Override
	public int updatePwd(int userNo) {
		
		return adminDao.updatePwd(sqlSession, userNo);
	}

	@Override
	public int deleteMember(int userNo) {
		
		return adminDao.deleteMember(sqlSession, userNo);
	}
	
	@Override
	public ArrayList<Sales> selectSalesPerMonthOnce() {
		
		return adminDao.selectSalesPerMonthOnce(sqlSession);
	}

	@Override
	public ArrayList<Sales> selectSalesPerMonthSub() {
		
		return adminDao.selectSalesPerMonthSub(sqlSession);
	}
	
	@Override
	public ArrayList<Sales> selectSalesPerMonth() {
		
		return adminDao.selectSalesPerMonth(sqlSession);
	}
	
	@Override
	public ArrayList<Sales> selectSalesPerYearOnce() {
		
		return adminDao.selectSalesPerYearOnce(sqlSession);
	}

	@Override
	public ArrayList<Sales> selectSalesPerYearSub() {
		
		return adminDao.selectSalesPerYearSub(sqlSession);
	}

	@Override
	public ArrayList<Sales> selectSalesPerYear() {
		
		return adminDao.selectSalesPerYear(sqlSession);
	}
	
	@Override
	public ArrayList<Integer> selectViewsTV(String genre) {
		
		return adminDao.selectViewsTV(sqlSession, genre);
	}
	
	@Override
	public ArrayList<Integer> selectViewsMovie(String genre) {
		
		return adminDao.selectViewsMovie(sqlSession, genre);
	}

	/**
	 * 관리자 페이지 코멘트 관리를 위한 페이징바 - 작성자: 수빈
	 * @param reviewNo : 코멘트 번호
	 * @return
	 */
	@Override
	public int selectAdminCommentListCount() {
		return adminDao.selectAdminCommentListCount(sqlSession);
	}

	/**
	 * 관리자 페이지에서 코멘트 관리를 위해 모든 코멘트 조회 (select) - 작성자: 수빈
	 * @param reviewNo : 코멘트 번호
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
}