package com.urfavoriteott.urfavoriteott.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.urfavoriteott.urfavoriteott.admin.model.dao.AdminDao;
import com.urfavoriteott.urfavoriteott.common.model.vo.PageInfo;
import com.urfavoriteott.urfavoriteott.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminDao adminDao;
	
	@Override
	public int selectListCount() {
		
		return adminDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Member> selectList(PageInfo pi) {
		
		return adminDao.selectList(sqlSession, pi);
	}

	@Override
	public int selectSearchCount(HashMap<String, String> map) {
		
		return adminDao.selectSearchCount(sqlSession, map);
	}

	@Override
	public ArrayList<Member> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		
		return adminDao.selectSearchList(sqlSession, map, pi);
	}

	@Override
	public int updatePwd(int userNo) {
		
		return adminDao.updatePwd(sqlSession, userNo);
	}

	@Override
	public int deleteMember(int userNo) {
		
		return adminDao.deleteMember(sqlSession, userNo);
	}
}
