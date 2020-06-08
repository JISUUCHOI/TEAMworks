package com.kh.teamworks.mail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamworks.common.model.vo.PageInfo;
import com.kh.teamworks.mail.model.dao.MailDao;
import com.kh.teamworks.mail.model.vo.MailDTO;
import com.kh.teamworks.mail.model.vo.MailInfo;
import com.kh.teamworks.mail.model.vo.SearchMailCondition;

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

	@Override
	public int searchReadListCount(SearchMailCondition sc) {
		return emDao.searchReadListCount(sqlSession, sc);
	}

	@Override
	public ArrayList<MailDTO> searchReadList(SearchMailCondition sc, PageInfo pi) {
		return emDao.searchReadList(sqlSession, sc, pi);
	}

	@Override
	public int searchKeyListCount(SearchMailCondition sc) {
		return emDao.searchKeyListCount(sqlSession, sc);
	}

	@Override
	public ArrayList<MailDTO> searchKeyList(SearchMailCondition sc, PageInfo pi) {
		return emDao.searchKeyList(sqlSession, sc, pi);
	}

	@Override
	public int searchListCount(SearchMailCondition sc) {
		return emDao.searchListCount(sqlSession, sc);
	}

	@Override
	public ArrayList<MailDTO> searchList(SearchMailCondition sc, PageInfo pi) {
		return emDao.searchList(sqlSession, sc, pi);
	}
	
	
}
