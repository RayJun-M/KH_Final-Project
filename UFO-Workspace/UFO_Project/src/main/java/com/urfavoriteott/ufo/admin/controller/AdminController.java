package com.urfavoriteott.ufo.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.urfavoriteott.ufo.admin.model.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
}