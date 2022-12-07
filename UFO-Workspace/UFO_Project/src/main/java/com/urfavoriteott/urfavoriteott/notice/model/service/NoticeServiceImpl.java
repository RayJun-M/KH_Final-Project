package com.urfavoriteott.urfavoriteott.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.urfavoriteott.urfavoriteott.common.model.vo.PageInfo;
import com.urfavoriteott.urfavoriteott.notice.model.dao.NoticeDao;
import com.urfavoriteott.urfavoriteott.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectNoticeListCount() {
		
		return noticeDao.selectNoticeListCount(sqlSession);
		
	}

	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		
		return noticeDao.selectNoticeList(sqlSession, pi);
	}

	@Override
	public int NoticeIncreaseCount(int noticeNo) {
		return 0;
	}

	@Override
	public Notice selectNotice(int noticeNo) {
		return null;
	}

	@Override
	public int insertNotice(Notice n) {
		return 0;
	}

	@Override
	public int deleteNotice(int noticeNo) {
		return 0;
	}

	@Override
	public int updateNotice(int noticeNo) {
		return 0;
	}

}
