package com.urfavoriteott.ufo.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.urfavoriteott.ufo.community.model.service.CommunityService;

@Controller
public class CommunityController {

    @Autowired
    private CommunityService communityService;
}