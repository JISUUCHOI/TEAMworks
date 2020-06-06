package com.kh.teamworks.mail.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamworks.mail.model.dao.MailDao;
import com.kh.teamworks.mail.model.vo.MailInfo;

@Service("emService")
public class MailServiceImpl implements MailService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MailDao emDao;
	
	@Override
	public MailInfo selectMailInfo(String empId) {
		return emDao.selectMailInfo(sqlSession, empId);
	}

}
