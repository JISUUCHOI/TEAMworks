package com.kh.teamworks.approval.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.teamworks.approval.model.vo.ApproveSearchCondition;
import com.kh.teamworks.approval.model.vo.Document;
import com.kh.teamworks.employee.model.vo.Employee;

@Repository("aDao")
public class ApprovalDao {
	
	// 1_1. 문서 작성 전, 화면에 보여 줄 기본 사원정보(사원명, 소속부서명) select
	public Employee selectEmpInfo(SqlSessionTemplate sqlSession, String empId) {
		return sqlSession.selectOne("documentMapper.selectEmpInfo", empId);
	}
	
	// 1_2. 참조자 조직도 부서 select용
	public ArrayList<Employee> selectDeptName(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("documentMapper.selectDeptName");
	}
	
	// 1_3. 참조자 조직도 사원 select용
	public ArrayList<Employee> selectOrgChart(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("documentMapper.selectOrgChart");
	}

	// 2. 결재선/참조자 사원 검색 select
	public ArrayList<Employee> selectEmpSch(SqlSessionTemplate sqlSession, ApproveSearchCondition sc) {
		return (ArrayList)sqlSession.selectList("documentMapper.selectEmpSch", sc);
	}

	// 제증명신청서 insert
	public int insertProof(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.insert("documentMapper.insertProof", d);
	}
	
	// 기안서 insert
	public int insertDraft(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.insert("documentMapper.insertDraft", d);
	}

}
