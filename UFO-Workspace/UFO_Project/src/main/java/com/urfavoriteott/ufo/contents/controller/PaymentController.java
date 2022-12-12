package com.urfavoriteott.ufo.contents.controller;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.urfavoriteott.ufo.contents.model.service.PaymentService;
import com.urfavoriteott.ufo.contents.model.vo.Payment;

@Controller
public class PaymentController {

    @Autowired
    private PaymentService paymentService;
    
    private IamportClient RESTAPI;
    
    public PaymentController() {
    	this.RESTAPI = new IamportClient("3817751562357623", "YJTkrsBfrE8koNNcoJLJqu8vcsqN6omgkYxW91ojs5newEjLVC7YR7Vt3A5L913mF0o26nHrkpLrZudV");
    }
    /**
     * 작성자: 성현
     * @return: 이용권 결제 페이지로 포워딩
     */
    @RequestMapping("payment.pay")
	public String paymentView() {

		return "contents/payment";
	}
    
    @ResponseBody
    @RequestMapping("verify.pay/{imp_uid}")
    public IamportResponse<com.siot.IamportRestClient.response.Payment> paymentByImpUid(
    																					@PathVariable(value= "imp_uid") String imp_uid,
    																					Model model,
    																					Locale locale,
    																					HttpSession httpSession) throws IamportResponseException, IOException {
    	
    	return RESTAPI.paymentByImpUid(imp_uid);
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