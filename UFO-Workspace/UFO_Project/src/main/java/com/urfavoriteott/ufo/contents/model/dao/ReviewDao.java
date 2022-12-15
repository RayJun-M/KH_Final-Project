package com.urfavoriteott.ufo.contents.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.urfavoriteott.ufo.common.model.vo.PageInfo;
import com.urfavoriteott.ufo.contents.model.vo.Review;

@Repository
public class ReviewDao {
	
	/**
	 * 콘텐츠 화면에서 별점/코멘트 탭을 클릭했을 때 뜨는 창에서 해당 콘텐츠의 코멘트 개수를 알려 주는 메소드 - 작성자: 수빈
	 * 콘텐츠 화면에서 별점/코멘트 더보기를 클릭했을 때 페이징바(select)- 작성자: 수빈 (재활용)
	 * @param sqlSession
	 * @param contentsId
	 * @return
	 */
	public int selectCommentListCount(SqlSessionTemplate sqlSession, int contentsId) {
		return sqlSession.selectOne("reviewMapper.selectCommentListCount", contentsId);
	}
	
	/**
	 * 콘텐츠 화면에서 별점/코멘트 탭을 클릭했을 때 뜨는 창 - 작성자: 수빈
	 * @param sqlSession
	 * @param contentsId
	 * @return
	 */
	public ArrayList<Review> selectCommentList(SqlSessionTemplate sqlSession, int contentsId) {
		return (ArrayList)sqlSession.selectList("reviewMapper.selectCommentList", contentsId);
	}
	
	/**
	 * 콘텐츠 화면에서 별점/코멘트 더보기를 클릭했을 때 뜨는 창 - 작성자: 수빈
	 * @param sqlSession
	 * @param contentsId
	 * @return
	 */
	public ArrayList<Review> selectCommentListAll(SqlSessionTemplate sqlSession, int contentsId, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() -1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("reviewMapper.selectCommentListAll", contentsId, rowBounds);
	}
	
	/**
	 * 콘텐츠 화면 별점/코멘트 탭에서 신고를 눌렀을 때 사용할 메소드 - 작성자: 수빈
	 * @param sqlSession
	 * @param map
	 * @return
	 */
	public int reportComment(SqlSessionTemplate sqlSession, HashMap map) {
		
		return sqlSession.update("reviewMapper.reportComment", map);
		
	}

}