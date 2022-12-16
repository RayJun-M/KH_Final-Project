package com.urfavoriteott.ufo.contents.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.urfavoriteott.ufo.contents.model.vo.Payment;

@Repository
public class PaymentDao {

    public int insertPay(SqlSessionTemplate sqlSession, Payment payment) {
		return sqlSession.insert("paymentMapper.insertPay", payment);
	}

	public int insertReg(SqlSessionTemplate sqlSession, Payment payment) {
		return sqlSession.insert("paymentMapper.insertReg", payment);
	}
}