package com.urfavoriteott.ufo.contents.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.urfavoriteott.ufo.contents.model.service.ReviewService;

@Controller
public class ReviewController {

    @Autowired
    private ReviewService reviewService;
    
    @RequestMapping("commentList.co")
    public String selectReviewList() {
    	
    	return "contents/reviewListView";
    }
}