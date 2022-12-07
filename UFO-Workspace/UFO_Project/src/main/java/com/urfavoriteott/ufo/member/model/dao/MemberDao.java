package com.urfavoriteott.urfavoriteott.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import com.urfavoriteott.urfavoriteott.common.model.vo.PageInfo;
import com.urfavoriteott.urfavoriteott.member.model.vo.Member;

@Component
public class MemberDao {

	/**
	 * 로그인용 메소드 - 작성자 : 동민
	 * @param sqlSession
	 * @param m : 로그인할 사용자의 계정
	 * @return
	 */
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.loginMember", m);
		
	}
	
	public int nicknameCheck(SqlSessionTemplate sqlSession, String checkNickname) {
		
		return sqlSession.selectOne("memberMapper.nicknameCheck", checkNickname);
	}
	
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.updateMember", m);
	}
	
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
}
