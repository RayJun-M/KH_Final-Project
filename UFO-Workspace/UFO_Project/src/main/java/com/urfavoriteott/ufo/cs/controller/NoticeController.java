package com.urfavoriteott.ufo.cs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.urfavoriteott.ufo.cs.model.service.NoticeService;

@Controller
public class NoticeController {

    @Autowired
    private NoticeService noticeService;
}