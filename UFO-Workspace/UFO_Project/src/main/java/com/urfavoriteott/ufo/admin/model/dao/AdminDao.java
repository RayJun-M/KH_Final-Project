package com.urfavoriteott.ufo.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.urfavoriteott.ufo.common.model.vo.PageInfo;
import com.urfavoriteott.ufo.contents.model.vo.Review;
import com.urfavoriteott.ufo.member.model.vo.Member;

@Repository
public class AdminDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("memberMapper.selectListCount");
	}
	
	public ArrayList<Member> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectList", null, rowBounds);
	}
	
	public int selectSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.selectOne("memberMapper.selectSearchCount", map);
	}
	
	public ArrayList<Member> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectSearchList", map, rowBounds);
	}
	
	public int updatePwd(SqlSessionTemplate sqlSession, int userNo) {

		return sqlSession.update("memberMapper.updatePwd", userNo);
	}
	
	public int deleteMember(SqlSessionTemplate sqlSession, int userNo) {
	
		return sqlSession.update("memberMapper.deleteMember", userNo);
	}
	
	/**
	 * 관리자 페이지 코멘트 관리를 위한 페이징바 - 작성자: 수빈
	 * @param sqlSession
	 * @return
	 */
	public int selectAdminCommentListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectAdminCommentListCount");
	}
	
	/**
	 * 관리자 페이지에서 코멘트 관리를 위해 모든 코멘트 조회 (select) - 작성자: 수빈
	 * @param sqlSession
	 * @param pi
	 * @return
	 */
	public ArrayList<Review> selectAdminCommentList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() -1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectAdminCommentList", null, rowBounds);
	}

	/**
	 * 관리자 페이지 코멘트 관리에서 검색을 위한 페이징바(select) - 작성자: 수빈
	 * @param sqlSession
	 * @param map
	 * @return
	 */
	public int searchAdminCommentListCount(SqlSessionTemplate sqlSession, HashMap map) {
		
		return sqlSession.selectOne("adminMapper.searchAdminCommentListCount", map);
	}

	/**
	 * 관리자 페이지 코멘트 관리에서 검색된 코멘트 조회 (select) - 작성자: 수빈
	 * @param sqlSession
	 * @param map
	 * @param pi
	 * @return
	 */
	public ArrayList<Review> searchAdminCommentList(SqlSessionTemplate sqlSession, HashMap map, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() -1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.searchAdminCommentList", map, rowBounds);
	}

}