package com.urfavoriteott.urfavoriteott.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.urfavoriteott.urfavoriteott.common.model.vo.PageInfo;
import com.urfavoriteott.urfavoriteott.notice.model.vo.Notice;

@Repository
public class NoticeDao {

	/**
	 * 게시글의 총 갯수 구하는 메소드 - 작성자 : 동민
	 * @param sqlSession
	 * @return
	 */
	public int selectNoticeListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("noticeMapper.selectNoticeListCount");
		
	}
	
	/**
	 * 공지사항 리스트 조회 메소드(관리자 + 회원) - 작성자 : 동민
	 * @param sqlSession
	 * @param pi
	 * @return
	 */
	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
      
		RowBounds rowBounds = new RowBounds(offset, limit);		
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
		
	}
	
}
