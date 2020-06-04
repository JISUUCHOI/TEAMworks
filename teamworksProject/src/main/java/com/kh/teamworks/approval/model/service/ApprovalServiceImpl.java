package com.kh.teamworks.approval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamworks.approval.model.dao.ApprovalDao;
import com.kh.teamworks.approval.model.vo.ApproveSearchCondition;
import com.kh.teamworks.approval.model.vo.Document;
import com.kh.teamworks.employee.model.vo.Employee;

@Service("aService")
public class ApprovalServiceImpl implements ApprovalService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ApprovalDao aDao;
	
	// 1_1. 문서 작성 전, 화면에 보여 줄 기본 사원정보(사원명, 소속부서명) select
	@Override
	public Employee selectEmpInfo(String empId) {
		return aDao.selectEmpInfo(sqlSession, empId);
	}

	// 1_2. 참조자 조직도 부서 select용
	@Override
	public ArrayList<Employee> selectDeptName() {
		return aDao.selectDeptName(sqlSession);
	}

	// 1_3. 참조자 조직도 사원 select용
	@Override
	public ArrayList<Employee> selectOrgChart() {
		return aDao.selectOrgChart(sqlSession);
	}

	// 2. 결재선/참조자 사원 검색 select
	@Override
	public ArrayList<Employee> selectEmpSch(ApproveSearchCondition sc) {
		return aDao.selectEmpSch(sqlSession, sc);
	}

	// 제증명 insert
	@Override
	public int insertProof(Document d) {
		return aDao.insertProof(sqlSession, d);
	}
	
	// 기안서 insert
	@Override
	public int insertDraft(Document d) {
		return aDao.insertDraft(sqlSession, d);
	}
	

}

