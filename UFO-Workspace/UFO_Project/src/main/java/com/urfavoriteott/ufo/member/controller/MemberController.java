package com.urfavoriteott.ufo.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;

import com.urfavoriteott.ufo.member.model.service.MemberService;

@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;

    // 비밀번호 암호화를 위한 변수
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
}