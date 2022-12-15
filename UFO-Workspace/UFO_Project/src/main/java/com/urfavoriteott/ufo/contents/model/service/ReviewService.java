package com.urfavoriteott.ufo.contents.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.urfavoriteott.ufo.common.model.vo.PageInfo;
import com.urfavoriteott.ufo.contents.model.vo.Review;

public interface ReviewService {
	
	/**
	 * 콘텐츠 화면에서 별점/코멘트 탭을 클릭했을 때 뜨는 창에서 해당 콘텐츠의 코멘트 개수를 알려 주는 메소드 - 작성자: 수빈
	 * 콘텐츠 화면에서 별점/코멘트 더보기를 클릭했을 때 페이징바(select)- 작성자: 수빈 (재활용)
	 * @param contentsId
	 * @return
	 */
	int selectCommentListCount(int contentsId);
	
	/**
	 * 콘텐츠 화면에서 별점/코멘트 탭을 클릭했을 때 뜨는 창 - 작성자: 수빈
	 * @param contentsNo : tvId 또는 movieId
	 * @return
	 */
	ArrayList<Review> selectCommentList(int contentsId);
	
	/**
	 * 콘텐츠 화면에서 별점/코멘트 더보기를 클릭했을 때 뜨는 창 - 작성자: 수빈
	 * @param contentsId
	 * @return
	 */
	ArrayList<Review> selectCommentListAll(int contentsId, PageInfo pi);
	
	/**
	 * 콘텐츠 화면 별점/코멘트 탭에서 신고를 눌렀을 때 사용할 메소드 - 작성자: 수빈
	 * @param reportReason
	 * @param form_loginUserNo
	 * @param contentsId
	 * @param form_commentUserNo
	 * @param form_reviewNo
	 * @return
	 */
	int reportComment(HashMap map);

}