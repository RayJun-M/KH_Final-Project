package com.urfavoriteott.ufo.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.urfavoriteott.ufo.admin.model.service.AdminService;
import com.urfavoriteott.ufo.common.model.vo.PageInfo;
import com.urfavoriteott.ufo.common.template.Pagination;
import com.urfavoriteott.ufo.contents.model.vo.Review;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	/**
	 * 관리자 페이지 코멘트 관리에서 사용할 페이징 바, 기본 접속 시 전체 코멘트 조회 - 작성자 : 수빈
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@RequestMapping(value="commentList.ad")
	public String selectAdminCommentList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = adminService.selectAdminCommentListCount();
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Review> list = adminService.selectAdminCommentList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "admin/adminCommentView";
	}
	
	/**
	 * 관리자 페이지 코멘트 관리에서 검색 시 사용할 페이징 바, 검색 시 키워드에 해당하는 코멘트를 조회 - 작성자 : 수빈
	 * @param currentPage
	 * @param condition
	 * @param keyword
	 * @param model
	 * @return
	 */
	@RequestMapping(value="searchComment.ad")
	public String searchAdminCommentList(@RequestParam(value="cpage", defaultValue="1") int currentPage, String condition, String keyword, Model model) {
		
		// System.out.println("condition: " + condition);
		// System.out.println("keyword: " + keyword);
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int searchCount = adminService.searchAdminCommentListCount(map);
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Review> searchList = adminService.searchAdminCommentList(map, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("searchList", searchList);
		
		 // 검색한 조건과 검색어 유지를 위해 다시 jsp로 보내 줌
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return "admin/adminCommentView";
		
	}
}