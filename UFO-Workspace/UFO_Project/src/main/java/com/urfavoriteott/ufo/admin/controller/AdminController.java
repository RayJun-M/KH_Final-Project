package com.urfavoriteott.urfavoriteott.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.urfavoriteott.urfavoriteott.admin.model.service.AdminService;
import com.urfavoriteott.urfavoriteott.common.model.vo.PageInfo;
import com.urfavoriteott.urfavoriteott.common.template.Pagination;
import com.urfavoriteott.urfavoriteott.member.model.vo.Member;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminsService;
	
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
		
		int listCount = adminsService.selectListCount();
		int pageLimit = 10;
		int boardLimit = 10;
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Member> list = adminsService.selectList(pi);
		
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
		
		int searchCount = adminsService.selectSearchCount(map);
		int pageLimit = 10;
		int boardLimit = 10;
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Member> list = adminsService.selectSearchList(map, pi);
		
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
	public String updatePwd(int userNo, Model model, HttpSession session) {
		
		int result = adminsService.updatePwd(userNo);
		
		if(result > 0) {
			
			// session.setAttribute("alertMsg", "비밀번호 초기화 성공");
			return "redirect:/admin_list.me";
		} else {
			
			model.addAttribute("errorMsg", "비밀번호 초기화 실패");
			return "common/errorPage";
		}
	}
	
	/**
	 * 관리자 - 회원 탈퇴 처리용 메소드 - 작성자 : 장희연
	 * @param userNo : 탈퇴 처리할 회원의 회원번호
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("admin_delete.me")
	public String deleteMember(int userNo, Model model, HttpSession session) {
		
		int result = adminsService.deleteMember(userNo);
		
		if(result > 0) {
			
			// session.setAttribute("alertMsg", "회원 탈퇴 처리 성공");
			return "redirect:/admin_list.me";
		} else {
			
			model.addAttribute("errorMsg", "회원 탈퇴 처리 실패");
			return "common/errorPage";
		}
	}
}
