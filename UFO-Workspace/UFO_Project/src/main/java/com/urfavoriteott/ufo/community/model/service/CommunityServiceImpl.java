package com.urfavoriteott.ufo.community.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.urfavoriteott.ufo.common.model.vo.PageInfo;
import com.urfavoriteott.ufo.community.model.dao.CommunityDao;
import com.urfavoriteott.ufo.community.model.vo.Community;

@Service
public class CommunityServiceImpl implements CommunityService {

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Autowired
    private CommunityDao communityDao;

	@Override
	public int selectCommunityListCount() {
		return communityDao.selectCommunityListCount(sqlSession);
	}

	@Override
	public ArrayList<Community> selectCommunityList(PageInfo pi) {
		return communityDao.selectCommunityList(sqlSession, pi);
	}

	@Override
	public int insertCommunity(Community c) {
		return communityDao.insertCommunity(sqlSession, c);
	}

	@Override
	public int communityIncreaseCount(int comNo) {
		return communityDao.communityIncreaseCount(sqlSession, comNo);
	}

	@Override
	public Community selectCommunity(int comNo) {
		return communityDao.selectCommunity(sqlSession, comNo);
	}
}