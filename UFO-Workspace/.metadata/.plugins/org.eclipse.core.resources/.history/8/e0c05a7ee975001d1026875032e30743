package com.urfavoriteott.ufo.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.urfavoriteott.ufo.common.model.vo.PageInfo;
import com.urfavoriteott.ufo.contents.model.vo.Review;

public interface AdminService {
	
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