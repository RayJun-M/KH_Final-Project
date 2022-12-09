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
     * @param imp_uid: 결제고유번호 - 검증과정에 필요
     * @param merchant_uid: DB에 저장할 주문번호
     * @return
     */
    @ResponseBody
	@RequestMapping(value = "insert.pay", produces = "application/json; charset=utf-8")
	public String insertPay(@RequestBody Payment payment) {
		
    	System.out.println(payment);
    	
    	int result = paymentService.insertPay(payment);
    	String str = "";
    	
    	if(result > 0 ) { // 성공
    		str = "ok";
    	} else {
    		str = "failed";
    	}
		return str;
	}
	
	@RequestMapping("regInsert.pay")
	public String insertRegPay() {
		
		return "";
	}
	
}