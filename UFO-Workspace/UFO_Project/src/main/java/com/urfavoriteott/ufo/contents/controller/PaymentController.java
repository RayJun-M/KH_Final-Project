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
import com.siot.IamportRestClient.request.OnetimePaymentData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.urfavoriteott.ufo.contents.model.service.PaymentService;
import com.urfavoriteott.ufo.contents.model.vo.Payment;

@Controller
public class PaymentController {

    @Autowired
    private PaymentService paymentService;
    
    private IamportClient RESTAPI;
    
    public PaymentController() {
    	// REST API를 사용하기 위해 발급받은 REST KEY, SECRET KEY를 기본 생성자를 호출하며 아임포트 클라이언트 객체에 담음
    	this.RESTAPI = new IamportClient("3817751562357623", "YJTkrsBfrE8koNNcoJLJqu8vcsqN6omgkYxW91ojs5newEjLVC7YR7Vt3A5L913mF0o26nHrkpLrZudV");
    }
    /**
     * 작성자: 성현 / 이용권 결제 페이지로 이동하는 메소드
     * @return
     */
    @RequestMapping("payment.pay")
	public String paymentView() {

		return "contents/payment";
	}
    
    /**
     * 작성자: 성현 / 이용권 결제 후 아임포트 서버에 저장된 결제정보 불러오는 메소드 
     * @param imp_uid: 사용자가 결제에 성공했을 때 발급받는 결제번호
     * @param model 
     * @param locale
     * @param httpSession
     * @return
     * @throws IamportResponseException
     * @throws IOException
     */
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
     * 작성자: 성현 / 아임포트 서버에 저장된 데이터와 이용권 결제시에 받아온 데이터가 일치할 경우 DB에 INSERT하는 메소드
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
    @ResponseBody
    @RequestMapping(value="regRequest.pay", produces="application/json; charset=utf-8")
    public IamportResponse<Payment> regRequest()
}