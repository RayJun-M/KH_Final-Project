package com.urfavoriteott.urfavoriteott.review.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.urfavoriteott.urfavoriteott.common.model.vo.PageInfo;
import com.urfavoriteott.urfavoriteott.review.model.vo.Review;

@Repository
public class ReviewDao {
	
	public int selectAdminCommentListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("reviewMapper.selectAdminCommentListCount");
	}
	
	public ArrayList<Review> selectAdminCommentList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() -1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("reviewMapper.selectAdminCommentList", null, rowBounds);
	}

}
