package com.kh.teamworks.approval.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamworks.approval.model.dao.ReqApprovalDao;
import com.kh.teamworks.approval.model.vo.Document;

@Service("raService")
public class ReqApprovalServiceImpl implements ReqApprovalService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ReqApprovalDao raDao;
	
	@Override
	public int insertDocNo(String empId, String docDepartment) {
		return raDao.insertDocNo(sqlSession, empId, docDepartment);
	}

	@Override
	public Document selectDocNo() {
		return null;
	}

	

	
	
}
