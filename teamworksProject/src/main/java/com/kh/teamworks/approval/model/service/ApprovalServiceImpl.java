package com.kh.teamworks.approval.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamworks.approval.model.dao.ApprovalDao;
import com.kh.teamworks.approval.model.vo.Document;

@Service("aService")
public class ApprovalServiceImpl implements ApprovalService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ApprovalDao aDao;
	

	@Override
	public int insertProof(Document d) {
		return aDao.insertProof(sqlSession, d);
	}
}

