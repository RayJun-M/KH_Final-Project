package com.urfavoriteott.ufo.cs.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.urfavoriteott.ufo.cs.model.dao.NoticeDao;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Autowired
    private NoticeDao noticeDao;
}