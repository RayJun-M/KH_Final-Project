package com.urfavoriteott.ufo.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.urfavoriteott.ufo.admin.model.service.AdminService;
import com.urfavoriteott.ufo.common.model.vo.PageInfo;
import com.urfavoriteott.ufo.common.template.Pagination;
import com.urfavoriteott.ufo.contents.model.vo.Review;
import com.urfavoriteott.ufo.member.model.vo.Member;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@RequestMapping("admin_stat.st")
	public String statistics() {
		
		return "admin/adminStatisticsView";
	}
	
	/**
	 * 관리자 - 회원 리스트 조회용 메소드 - 작성자 : 장희연
	 * @param currentPage : 요청한 페이지번호
	 * @param model
	 * @return
	 */
	@RequestMapping("admin_list.me")
	public String selectList(@RequestParam(value="cpage", defaultValue="1")int currentPage, Model model) {
		
		int listCount = adminService.selectListCount();
		int pageLimit = 10;
		int boardLimit = 10;
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Member> list = adminService.selectList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "admin/adminMemberListView";
	}
	
	/**
	 * 관리자 - 회원 검색 조회용 메소드 - 작성자 : 장희연
	 * @param currentPage : 요청한 페이지번호
	 * @param keyword : 검색조건(아이디, 닉네임)
	 * @param searchword : 검색어
	 * @param model
	 * @return
	 */
	@RequestMapping("admin_search.me")
	public String selectSearchList(@RequestParam(value="cpage", defaultValue="1")int currentPage, String keyword, String searchword, Model model) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("searchword", searchword);
		
		int searchCount = adminService.selectSearchCount(map);
		int pageLimit = 10;
		int boardLimit = 10;
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Member> list = adminService.selectSearchList(map, pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchword", searchword);
		
		return "admin/adminMemberListView";
	}
	
	/**
	 * 관리자 - 비밀번호 초기화용 메소드 - 작성자 : 장희연
	 * @param userNo : 비밀번호를 초기화할 회원의 회원번호
	 * @param model 
	 * @param session
	 * @return
	 */
	
	@RequestMapping("admin_updatePwd.me")
	public String updatePwd(int userNo) {
		
		int result = adminService.updatePwd(userNo);
		
		return (result > 0) ? "success" : "fail";
	}
	
	/**
	 * 관리자 - 회원 탈퇴 처리용 메소드 - 작성자 : 장희연
	 * @param userNo : 탈퇴 처리할 회원의 회원번호
	 * @param model
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping("admin_delete.me")
	public String deleteMember(int userNo, Model model, HttpSession session) {
		
		int result = adminService.deleteMember(userNo);
		
		return (result > 0) ? "success" : "fail";
	}
	
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