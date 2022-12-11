package com.urfavoriteott.ufo.contents.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.urfavoriteott.ufo.contents.model.service.PaymentService;
import com.urfavoriteott.ufo.contents.model.vo.Payment;

@Controller
public class PaymentController {

    @Autowired
    private PaymentService paymentService;
    
    /**
     * 작성자: 성현
     * @return: 이용권 결제 페이지로 포워딩
     */
    @RequestMapping("payment.pay")
	public String paymentView() {

		return "contents/payment";
	}

    /**
     * 작성자: 성현
     * @param payment
     * @return : 성공 / 실패 여부 리턴
     */
    @ResponseBody
	@RequestMapping(value = "insert.pay", produces = "text/html; charset=utf-8")
	public String insertPay(Payment payment) {
    	
    	int result = paymentService.insertPay(payment);
    	
    	String str = "";
    	
    	if(result > 0 ) { // 성공
    		str = "ok";
    	} else {
    		str = "failed";
    	}
		return str;
	}
	
	@RequestMapping(value="regInsert.pay", produces="text/html; charset=utf-8")
	public String insertRegPay() {
		
		return "";
	}
}