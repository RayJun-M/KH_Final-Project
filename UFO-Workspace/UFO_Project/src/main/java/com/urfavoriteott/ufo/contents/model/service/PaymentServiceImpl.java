package com.urfavoriteott.ufo.contents.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.urfavoriteott.ufo.contents.model.dao.PaymentDao;
import com.urfavoriteott.ufo.contents.model.vo.Payment;

@Service
public class PaymentServiceImpl implements PaymentService {

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Autowired
    private PaymentDao paymentDao;

	@Override
	public int insertPay(Payment payment) {
		
		int result = paymentDao.insertPay(sqlSession, payment);
		
		return result;
	}

	@Override
	public int insertReg(Payment payment) {
		
		int result = paymentDao.insertReg(sqlSession, payment);
		
		return result;
	}
}