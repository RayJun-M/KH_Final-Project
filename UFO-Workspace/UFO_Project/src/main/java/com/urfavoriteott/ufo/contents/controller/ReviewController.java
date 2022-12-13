package com.urfavoriteott.ufo.contents.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.urfavoriteott.ufo.common.model.vo.PageInfo;
import com.urfavoriteott.ufo.common.template.Pagination;
import com.urfavoriteott.ufo.contents.model.service.ReviewService;
import com.urfavoriteott.ufo.contents.model.vo.Review;

@Controller
public class ReviewController {

    @Autowired
    private ReviewService reviewService;
    
    /**
     * 콘텐츠 화면에서 별점/코멘트 탭을 클릭했을 때 뜨는 창 - 작성자: 수빈
     * @return
     */
    @RequestMapping(value="commentList.co")
    public String selectCommentList(@RequestParam(value="contentsId", defaultValue="1427") int contentsId, String loginUserNo, Model model) {
    	
    	System.out.println(loginUserNo);
    	
    	int listCount = reviewService.selectCommentListCount(contentsId);
    	
    	ArrayList<Review> list = reviewService.selectCommentList(contentsId);
    	
    	// System.out.println(listCount);
    	// System.out.println(list);
    	
    	model.addAttribute("listCount", listCount);
    	model.addAttribute("list", list);
    	
    	return "contents/commentListView";
    }
    
    /**
     * 콘텐츠 화면에서 별점/코멘트 더보기를 클릭했을 때 뜨는 창 - 작성자: 수빈
     * @param contentsId
     * @param model
     * @return
     */
    @RequestMapping(value="commentListAll.co")
    public String selectCommentListAll(@RequestParam(value="cpage", defaultValue="1") int currentPage, @RequestParam(value="contentsId", defaultValue="1427") int contentsId, Model model) {
    	
    	int searchCount = reviewService.selectCommentListCount(contentsId);
		
		int pageLimit = 10;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, pageLimit, boardLimit);
		
    	ArrayList<Review> list = reviewService.selectCommentListAll(contentsId, pi);
    	
    	model.addAttribute("pi", pi);
    	model.addAttribute("list", list);
    	
    	return "contents/commentAll";
    }
    
    /**
     * 콘텐츠 화면 별점/코멘트 탭에서 신고를 눌렀을 때 사용할 메소드 - 작성자: 수빈
     * @param reportReason
     * @return
     */
    @ResponseBody
    @RequestMapping(value="reportComment.co", produces="text/html; charset=UTF-8")
    public String reportComment(String reportReason, String form_loginUserNo, @RequestParam(value="contentsId", defaultValue="1427") int contentsId, String form_commentUserNo, String form_reviewNo, Model model) {
    	
    	// System.out.println("reportReason: " + reportReason);
    	// System.out.println("loginUserNo: " + form_loginUserNo);
    	// System.out.println("contentsId:" + contentsId);
    	// System.out.println("commentUserNo: " + form_commentUserNo);
    	// System.out.println("reviewNo: " + form_reviewNo);
    	
    	String contentId = Integer.toString(contentsId);
    	
    	HashMap<String, String> map = new HashMap<>();
    	map.put("reportReason", reportReason);
    	map.put("form_loginUserNo", form_loginUserNo);
    	map.put("contentId", contentId);
    	map.put("form_commentUserNo", form_commentUserNo);
    	map.put("form_reviewNo", form_reviewNo);

    	int resultNum = reviewService.reportComment(map);
    	
    	if(resultNum > 0) {
	    	
	    	return "<script>"
	    		 + "alert('성공적으로 신고 접수되었습니다.');"
	    		 + "location.href='commentList.co';"
	    		 + "</script>";
	    	
    	} else {
    		
    		return "<script>"
   	    		 + "alert('신고 접수에 실패하였습니다. 잠시 후 다시 시도해 주세요.');"
   	    		 + "location.href='commentList.co';"
   	    		 + "</script>";
    		
    	}
    }
}