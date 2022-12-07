package com.urfavoriteott.urfavoriteott.review.model.service;

import java.util.ArrayList;

import com.urfavoriteott.urfavoriteott.common.model.vo.PageInfo;
import com.urfavoriteott.urfavoriteott.review.model.vo.Review;

public interface ReviewService {

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
	 * 관리자 페이지 신고관리를 위한 페이징바 - 작성자: 수빈
	 * @param reviewNo : 코멘트 번호
	 * @return
	 */
	int selectReportedCommentListCount();
	
	/**
	 * 관리자 페이지에서 신 관리를 위해 모든 코멘트 조회 (select) - 작성자: 수빈
	 * @param reviewNo
	 * @return
	 */
	ArrayList<Review> selectReportedCommentList(int reviewNo);
	
	/**
	 * 컨텐츠 하단에 띄울 본인의 별점과 코멘트 및 최신 코멘트 3개 (select) - 작성자: 수빈
	 * @param reviewNo : 코멘트 번호
	 * @param movieId : 코멘트가 달린 컨텐츠
	 * @param tvId : 코멘트가 달린 컨텐츠
	 * @return
	 */
	ArrayList<Review> selectCommentList(int reviewNo, int movieId, int tvId);
	
	/**
	 * 컨텐츠에서 더보기 눌렀을 때 뜨는 해당 컨텐츠에 대한 전체 코멘트 (select) - 작성자: 수빈
	 * @param reviewNo : 코멘트 번호
	 * @param movieId : 코멘트가 달린 컨텐츠
	 * @param tvId : 코멘트가 달린 컨텐츠
	 * @return
	 */
	ArrayList<Review> selectCommentAll(int reviewNo, int movieId, int tvId);
	
	/**
	 * 마이페이지에서 나의 코멘트 조회 (select) - 작성자 : 수빈
	 * @param reviewNo : 코멘트 번호
	 * @param userNo : 유저 번호(로그인한 사용자와 일치 비교)
	 * @return
	 */
	ArrayList<Review> selectMyComment(int reviewNo, int userNo);
	
	/**
	 * 코멘트 작성 메소드 (insert) - 작성자: 수빈
	 * @param r : 사용자가 작성한 코멘트
	 * @return
	 */
	int insertReview(Review r);

	/**
	 * 코멘트 수정 메소드 (update) - 작성자: 수빈
	 * @param reviewNo : 수정할 코멘트의 번호
	 * @return
	 */
	int updateReview(int reviewNo);
	
	/**
	 * 코멘트 삭제 메소드 (update) - 작성자: 수빈
	 * @param reviewNo : 삭제할 코멘트의 번호
	 * @return
	 */
	int deleteReview(int reviewNo);
	
}