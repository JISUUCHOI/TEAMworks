package com.kh.teamworks.mail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamworks.common.model.vo.PageInfo;
import com.kh.teamworks.mail.model.dao.MailDao;
import com.kh.teamworks.mail.model.vo.MailDTO;
import com.kh.teamworks.mail.model.vo.MailInfo;

@Service("emService")
public class MailServiceImpl implements MailService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MailDao emDao;

	@Override
	public int selectInboxListCount(String empId) {
		return emDao.selectInboxListCount(sqlSession, empId);
	}

	@Override
	public ArrayList<MailDTO> selectInboxList(PageInfo pi, String empId) {
		return emDao.selectInboxList(sqlSession, pi, empId);
	}
	
	
}
