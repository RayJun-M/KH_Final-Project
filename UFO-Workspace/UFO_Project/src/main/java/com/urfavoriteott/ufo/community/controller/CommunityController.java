package com.urfavoriteott.ufo.community.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.urfavoriteott.ufo.common.model.vo.PageInfo;
import com.urfavoriteott.ufo.common.template.Pagination;
import com.urfavoriteott.ufo.community.model.service.CommunityService;
import com.urfavoriteott.ufo.community.model.vo.Community;
import com.urfavoriteott.ufo.cs.model.vo.Notice;

@Controller
public class CommunityController {

    @Autowired
    private CommunityService communityService;
    
    /**
	 * 커뮤니티 리스트 조회 메소드 - 작성자 : 황혜진
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@RequestMapping("communityList.co")
	public String selectCommunityList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = communityService.selectCommunityListCount();
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Community> list = communityService.selectCommunityList(pi);
		
	    model.addAttribute("pi", pi);
	    model.addAttribute("list", list);
	    
	    return "community/communityListView";
	}
	
	/**
	 * 커뮤니티 게시글 등록 페이지 이동 메소드 - 작성자 : 황혜진
	 * @return
	 */
	 @RequestMapping("communityEnrollForm.co")
	 public String communityEnrollForm() {
		 
		 return "community/communityEnrollForm";
	 }
	 
	 /**
	  * 공지사항 게시글 등록 메소드 - 작성자 : 황혜진
	  * @param n : 등록할 공지사항 게시물
	  * @param session
	  * @param mv
	  * @return
	  */
	 @RequestMapping("communityEnroll.co")
	 public ModelAndView insertCommunity(Community c, HttpSession session, ModelAndView mv) {
	 
		 int result = communityService.insertCommunity(c);
		 
		 if(result > 0) { // 성공
			 
			 session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			 
			 mv.setViewName("redirect:/communityList.co");
			 
		 }
		 else {
			 
			 mv.addObject("errorMsg", "공지사항 게시글 작성 실패").setViewName("common/errorPage");
		 }
	 
		 return mv;
		 
	 }
	 
	 /**
	  * 커뮤니티 상세조회 메소드 - 작성자 : 황혜진
	  * @param cno : 상세조회할 커뮤니티 게시물
	  * @param mv
	  * @return
	  */
	 @RequestMapping("communityDetail.co")
	 public ModelAndView selectCommunity(int cno, ModelAndView mv) {
		 
		 int result = communityService.communityIncreaseCount(cno);
	
		 
		 if(result > 0) { // 조회수 증가 성공시
			 
			 Community c = communityService.selectCommunity(cno);
			 
			 mv.addObject("c", c).setViewName("community/communityDetailView");
		 }
		 
		 else { // 실패
			 
			 mv.addObject("errorMsg", "공지사항 상세조회 실패").setViewName("common/errorPage");
			 
		 }
		 
		 return mv;
		 
	 }
}