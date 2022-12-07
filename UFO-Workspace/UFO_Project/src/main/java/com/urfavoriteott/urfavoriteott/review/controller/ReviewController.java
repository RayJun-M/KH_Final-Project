package com.urfavoriteott.urfavoriteott.review.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.urfavoriteott.urfavoriteott.common.model.vo.PageInfo;
import com.urfavoriteott.urfavoriteott.common.template.Pagination;
import com.urfavoriteott.urfavoriteott.review.model.service.ReviewService;
import com.urfavoriteott.urfavoriteott.review.model.vo.Review;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	/**
	 * 관리자 페이지 코멘트 관리에서 사용할 페이징 바 - 작성자 : 수빈
	 * @param currentPage
	 * @return
	 */
	@RequestMapping(value="commentList.ad")
	public String selectAdminCommentList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = reviewService.selectAdminCommentListCount();
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Review> list = reviewService.selectAdminCommentList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		System.out.println(list);
		
		return "admin/adminCommentView";
	}

}
