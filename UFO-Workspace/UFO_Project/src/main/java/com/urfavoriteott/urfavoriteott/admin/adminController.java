package com.urfavoriteott.urfavoriteott.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class adminController {
	
	@RequestMapping("adminView.ad")
	public String adminView () {
		
		return "admin/adminView";
	}
	
	@RequestMapping("adminPayment.pay")
	public String adminPaymentView() {
		
		return "admin/adminPayment";
	}
}