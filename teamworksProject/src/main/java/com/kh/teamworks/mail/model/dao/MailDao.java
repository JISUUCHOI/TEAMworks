package com.kh.teamworks.mail.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.teamworks.mail.model.vo.MailInfo;

@Repository("emDao")
public class MailDao {

	public MailInfo selectMailInfo(SqlSession sqlSession, String empId) {
		return sqlSession.selectOne("mailMapper.selectMailInfo", empId);
	}
}
