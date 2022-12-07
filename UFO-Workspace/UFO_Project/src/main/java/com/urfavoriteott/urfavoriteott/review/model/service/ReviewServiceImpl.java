package com.urfavoriteott.urfavoriteott.review.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.urfavoriteott.urfavoriteott.common.model.vo.PageInfo;
import com.urfavoriteott.urfavoriteott.review.model.dao.ReviewDao;
import com.urfavoriteott.urfavoriteott.review.model.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectAdminCommentListCount() {
		return reviewDao.selectAdminCommentListCount(sqlSession);
	}

	@Override
	public ArrayList<Review> selectAdminCommentList(PageInfo pi) {
		return reviewDao.selectAdminCommentList(sqlSession, pi);
	}

	@Override
	public int selectReportedCommentListCount() {
		return 0;
	}

	@Override
	public ArrayList<Review> selectReportedCommentList(int reviewNo) {
		return null;
	}

	@Override
	public ArrayList<Review> selectCommentList(int reviewNo, int movieId, int tvId) {
		return null;
	}

	@Override
	public ArrayList<Review> selectCommentAll(int reviewNo, int movieId, int tvId) {
		return null;
	}

	@Override
	public ArrayList<Review> selectMyComment(int reviewNo, int userNo) {
		return null;
	}

	@Override
	public int insertReview(Review r) {
		return 0;
	}

	@Override
	public int updateReview(int reviewNo) {
		return 0;
	}

	@Override
	public int deleteReview(int reviewNo) {
		return 0;
	}

}
