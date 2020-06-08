package com.kh.teamworks.mail.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.teamworks.common.model.vo.PageInfo;
import com.kh.teamworks.mail.model.vo.MailDTO;

@Repository("emDao")
public class MailDao {

	public int selectInboxListCount(SqlSession sqlSession, String empId) {
		return sqlSession.selectOne("mailMapper.selectInboxListCount", empId);
	}
	
	public ArrayList<MailDTO> selectInboxList(SqlSession sqlSession, PageInfo pi, String empId){
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mailMapper.selectInboxList", empId, rowBounds);
	}
}
