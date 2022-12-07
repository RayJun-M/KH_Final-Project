package com.urfavoriteott.urfavoriteott.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.urfavoriteott.urfavoriteott.common.model.vo.PageInfo;
import com.urfavoriteott.urfavoriteott.common.template.Pagination;
import com.urfavoriteott.urfavoriteott.notice.model.service.NoticeService;
import com.urfavoriteott.urfavoriteott.notice.model.vo.Notice;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	/**
	 * 공지사항 리스트 조회 메소드 - 작성자 : 동민
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@RequestMapping("noticeList.no")
	public String selectNoticeList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = noticeService.selectNoticeListCount();
		
		int pageLimit = 10;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Notice> list = noticeService.selectNoticeList(pi);
		
	    model.addAttribute("pi", pi);
	    model.addAttribute("list", list);
	    
	    return "notice/noticeListView";
		
	}
	
	// @RequestMapping("noticeEnrollForm.no") 
	
	

}
